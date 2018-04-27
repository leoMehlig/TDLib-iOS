import PromiseKit

public class Coordinator {
    enum TDError: Swift.Error {
        case error(Error)
        case timeout(Extra)
        case unkownFunctionResult(Data, Swift.Error)
    }

    public let client: TDJsonClient

    let sendQueue = DispatchQueue(label: "tdlib_send", qos: .userInitiated)
    let updateQueue = DispatchQueue(label: "tdlib_update", qos: .utility)
    
    public let authorizationState = Stream<LoadingEvent<AuthorizationState>>()
    public let connectionState = Stream<LoadingEvent<ConnectionState>>()

    private var fileStreams: [Int32: Stream<DownloadEvent<File>>] = [:]
    private var runningFunctions: [String: Resolver<Data>] = [:]

    public init(client: TDJsonClient = TDJsonClient(), parameters: TdlibParameters) {
        self.client = client
        self.client.stream.subscribeStrong(self) { strongSelf, data in
            guard let data = data else {
                return
            }
            strongSelf.process(data: data)
        }

        self.authorizationState.subscribeStrong(self) { strongSelf, event in
            switch event.value {
            case .waitTdlibParameters?:
                _ = strongSelf.send(SetTdlibParameters(parameters: parameters))
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
    
    public convenience init(client: TDJsonClient = TDJsonClient(), apiId: Int32, apiHash: String, useTestDc: Bool = false) {
        guard let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
            fatalError("Can't get document director path")
        }
        self.init(client: client, parameters: TdlibParameters.create(useTestDc: useTestDc,
                                                                     databaseDirectory: path,
                                                                     filesDirectory: path,
                                                                     apiId: apiId,
                                                                     apiHash: apiHash))
    }

    private func process(data: Data) {
        print("Received: \(String(data: data, encoding: .utf8) ?? "nil")")
        if let extra = try? JSONDecoder.td.decode(Extra.self, from: data) {
            self.processFunction(with: extra, data: data)
        } else if let update = try? JSONDecoder.td.decode(Update.self, from: data) {
            self.process(update: update)
        }
    }

    private func processFunction(with extra: Extra, data: Data) {
        print("Received extra: \(extra.extra) - \(extra.type)")
        if let resolver = self.runningFunctions[extra.extra] {
            self.runningFunctions[extra.extra] = nil
            if extra.type == "error" {
                do {
                    let error = try JSONDecoder.td.decode(Error.self, from: data)
                    resolver.reject(error)
                } catch {
                    resolver.reject(TDError.unkownFunctionResult(data, error))
                }
            } else {
                resolver.fulfill(data)
            }
        } else {
            print("Unassigned function result: \(extra)")
        }
    }

    private func process(update: Update) {
        self.updateQueue.async(flags: .barrier) {
            switch update {
            case let .authorizationState(state):
                self.authorizationState.current = .value(state)
            case let .connectionState(state):
                self.connectionState.current = .value(state)
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
            default:
                print("Unhandled update: \(update)")
            }
        }
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
                throw TDError.unkownFunctionResult(data, error)
            }
        }
    }
}
