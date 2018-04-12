import PromiseKit

public class Coordinator {
    public let client: TDJsonClient
    let apiId: Int
    let apiHash: String
    let sendQueue = DispatchQueue(label: "tdlib_send", qos: .userInitiated)
    let updateQueue = DispatchQueue(label: "tdlib_update", qos: .utility)
    
    public let authorizationState = Stream<LoadingEvent<AuthorizationState>>()
    public let connectionState = Stream<LoadingEvent<ConnectionState>>()

    private var fileStreams: [Int32: Stream<DownloadEvent<File>>] = [:]
    private var runningFunctions: [String: Resolver<Data>] = [:]
    
    public init(client: TDJsonClient, apiId: Int, apiHash: String) {
        self.client = client
        self.apiId = apiId
        self.apiHash = apiHash
        self.client.stream.subscribeStrong(self) { strongSelf, data in
            guard let data = data else {
                return
            }
            print("Received: \(String(data: data, encoding: .utf8) ?? "nil")")
            if let extra = try? JSONDecoder.td.decode(Extra.self, from: data) {
                print("Received extra: \(extra.extra) - \(extra.type)")
                if let resolver = strongSelf.runningFunctions[extra.extra] {
                    strongSelf.runningFunctions[extra.extra] = nil
                    resolver.fulfill(data)
                } else {
                    print("Unassigned function result: \(extra)")
                }
            } else if let update = try? JSONDecoder.td.decode(Update.self, from: data) {
                self.updateQueue.async(flags: .barrier) {
                    switch update {
                    case let .updateAuthorizationState(state):
                        strongSelf.authorizationState.current = .value(state)
                    case let .connectionState(state):
                        strongSelf.connectionState.current = .value(state)
                    case let .file(file):
                        let stream: Stream<DownloadEvent<File>>
                        if let existing = self.fileStreams[file.id] {
                            stream = existing
                        } else {
                            stream = Stream()
                            self.fileStreams[file.id] = stream
                        }
                        switch (file.local.isDownloadingCompleted, file.local.isDownloadingActive) {
                        case (true, _):
                            stream.current = .completed(file)
                            self.fileStreams[file.id] = nil
                        case (false, true):
                            stream.current = .loading(file)
                        case (false, false):
                            stream.current = .failled(file)
                        }
                    }
                }
            }
        }

        self.authorizationState.subscribeStrong(self) { strongSelf, event in
            switch event.value {
            case .waitTdlibParameters?:
                guard let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
                    fatalError("Can't get document director path")
                }
                _ = strongSelf.send(SetTdlibParameters(parameters: TDLibParameters(databaseDirectory: path,
                                                                                   filesDirectory: path,
                                                                                   apiId: self.apiId,
                                                                                   apiHash: self.apiHash)))
            case .waitEncryptionKey?:
                let key = Data(repeating: 123, count: 64)
                //                key.withUnsafeMutableBytes { bytes in
                //                    SecRandomCopyBytes(kSecRandomDefault, 64, bytes)
                //                }
                _ = strongSelf.send(CheckDatabaseEncryptionKey(encryptionKey: key))
            default:
                break
            }
        }
    }
    enum TDError: Error {
        case timeout(Extra)
    }
    
    public func stream(forFile file: File) -> Stream<DownloadEvent<File>> {
        var stream: Stream<DownloadEvent<File>>!
        self.updateQueue.sync {
            if let existing = self.fileStreams[file.id] {
                stream = existing
            } else {
                stream = Stream()
                self.fileStreams[file.id] = stream
            }
        }
        return stream
    }
    
    public func download(file: File, priority: Int32 = 32) -> Stream<DownloadEvent<File>> {
        guard !file.local.isDownloadingCompleted else {
            let stream = Stream<DownloadEvent<File>>()
            stream.current = .completed(file)
            return stream
        }
        let stream = self.stream(forFile: file)
        if !file.local.isDownloadingActive {
            self.send(DownloadFile(fileId: file.id, priority: 32)).cauterize()
        }
        return stream
    }
    
    public func send<F: TDFunction>(_ function: F) -> Promise<F.Result> {
        let (promise, resolver) = Promise<Data>.pending()
        self.sendQueue.async {
            let wrapper = FunctionWrapper(function: function)
            do {
                try self.client.send(wrapper)
            } catch {
                resolver.reject(error)
            }
            let extra = Extra(type: F.Result.type, extra: wrapper.extra)
            self.runningFunctions[extra.extra] = resolver
        }
        return promise.map(on: self.sendQueue) { data in
            do {
                return try JSONDecoder.td.decode(F.Result.self, from: data)
            } catch {
                throw error
            }
        }
    }
}
