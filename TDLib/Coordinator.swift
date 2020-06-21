import PromiseKit

/// The `Coordinator` handles update, functions, downloads and the authorization- and connection state.
public class Coordinator {
    /// A error indicating that something went wrong with a function request.
    enum TDError: Swift.Error {
        case error(Error)
        case timeout(Extra)
        case unkownFunctionResult(Data, Swift.Error)
    }

    /// The `TDJsonClient` instance.
    public private(set) var client: TDJsonClient

    let functionQueue = DispatchQueue(label: "tdlib_send", qos: .userInitiated)
    let updateQueue = DispatchQueue(label: "tdlib_update", qos: .utility)

    /// The stream of authorization stats.
    /// `waitTdlibParameters` and `waitEncryptionKey` are already handled by the `Coordinator` and should be ignored.
    public let authorizationState = Stream<LoadingEvent<AuthorizationState>>()

    /// The stream of the current connection state.
    public let connectionState = Stream<LoadingEvent<ConnectionState>>()

    /// The stream of all updates.
    /// - Note: TDLib handles `authorizationState`, `connectionState` and `file` updates.
    public let updateStream = Stream<Update?>()

    public let floodStream: FloodStream

    private let logPath: String

    private var fileStreams: [Int32: Stream<DownloadEvent<File>>] = [:]
    private var runningFunctions: [String: Resolver<Data>] = [:]

    /// Initalizes a new `Coordinator` instance.
    ///
    /// - Parameters:
    ///   - client: The `TDJsonClient` used for all communcation with `tdlib` (default is new `TDJsonClient`).
    ///   - parameters: The parameters used to configure `tdlib`.
    ///   - encryptionKey: The encryption key for the local database.
    public init(client: TDJsonClient = TDJsonClient(), parameters: TdlibParameters, encryptionKey: Data = Data(repeating: 123, count: 64)) {
        self.client = client
        self.logPath = (parameters.filesDirectory ?? "") + "/tdlogs.log"
        FileManager.default.createFile(atPath: self.logPath, contents: nil, attributes: [:])
        self.floodStream = FloodStream(logPath: self.logPath)

        self.setupClient()

        self.authorizationState.subscribeStrong(self) { strongSelf, event in
            switch event.value {
            case .waitTdlibParameters?:
                _ = strongSelf.send(SetTdlibParameters(parameters: parameters))
            case .waitEncryptionKey?:
                _ = strongSelf.send(CheckDatabaseEncryptionKey(encryptionKey: encryptionKey))
            case .ready?, .waitPassword?, .waitPhoneNumber?:
                self.client.isRunning = true
            case .closed?:
                self.client.close()
            default:
                break
            }
        }
    }

    /// Initalizes a new `Coordinator` instance.
    ///
    /// - Parameters:
    ///   - client: The `TDJsonClient` used for all communcation with `tdlib` (default is new `TDJsonClient`).
    ///   - apiId: The application identifier for Telegram API access, which can be obtained at https://my.telegram.org
    ///   - apiHash: The application identifier hash for Telegram API access, which can be obtained at https://my.telegram.org
    ///   - useTestDc: If set to true, the Telegram test environment will be used instead of the production environment
    ///   - encryptionKey: The encryption key for the local database.
    public convenience init(client: TDJsonClient = TDJsonClient(),
                            apiId: Int32,
                            apiHash: String,
                            useTestDc: Bool = false,
                            encryptionKey: Data = Data(repeating: 123, count: 64)) {
        guard let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
            fatalError("Can't get document director path")
        }
        self.init(client: client, parameters: TdlibParameters.create(useTestDc: useTestDc,
                                                                     databaseDirectory: path,
                                                                     filesDirectory: path,
                                                                     apiId: apiId,
                                                                     apiHash: apiHash))
    }

    public func recreateClient(_ client: TDJsonClient = TDJsonClient()) {
        self.client = client
        self.setupClient()
    }

    private func setupClient() {
        self.client.logPath = self.logPath
        self.client.stream.subscribeStrong(self) { strongSelf, data in
            guard let data = data else {
                return
            }
            strongSelf.process(data: data)
        }
    }

    private func process(data: Data) {
        //        print("Received: \(String(data: data, encoding: .utf8) ?? "nil")")
        if let extra = try? JSONDecoder.td.decode(Extra.self, from: data) {
            self.processFunction(with: extra, data: data)
        } else if let update = try? JSONDecoder.td.decode(Update.self, from: data) {
            self.process(update: update)
        }
    }

    private func processFunction(with extra: Extra, data: Data) {
        self.functionQueue.async(flags: .barrier) {
            //            print("Received extra: \(extra.extra) - \(extra.type)")
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
                //                print("Unassigned function result: \(extra)")
            }
        }
    }

    private func process(update: Update) {
        self.updateQueue.async(flags: .barrier) {
            self.updateStream.current = update
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
                ()
                //                print("Unhandled update: \(update)")
            }
        }
    }

    private func stream(forFile file: File) -> Stream<DownloadEvent<File>> {
        var stream: Stream<DownloadEvent<File>>! //swiftlint:disable:this implicitly_unwrapped_optional
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

    /// Downloads a new file.
    ///
    /// - Parameters:
    ///   - file: The file to download.
    ///   - priority: A priority between 0 and 32 (default 32).
    /// - Returns: A stream of the download events of the given file.
    public func download(file: File, priority: Int32 = 32) -> Stream<DownloadEvent<File>> {
        guard !file.local.isDownloadingCompleted else {
            let stream = Stream<DownloadEvent<File>>()
            stream.current = .completed(file)
            return stream
        }
        let stream = self.stream(forFile: file)
        if !file.local.isDownloadingActive {
            let download = DownloadFile(fileId: file.id, priority: 32, offset: 0, limit: 0, synchronous: false)
            self.send(download).cauterize()
        }
        return stream
    }

    /// Send the request to `tdlib`.
    ///
    /// - Parameter function: A `TDFunction`.
    /// - Returns: A promise of the result of the function.
    public func send<F: TDFunction>(_ function: F) -> Promise<F.Result> {
        if Thread.isMainThread {
            print("\(function) was called on the Main Thread")
        }
        let (promise, resolver) = Promise<Data>.pending()
        self.functionQueue.async {
            let wrapper = FunctionWrapper(function: function)
            do {
                try self.client.send(wrapper)
            } catch {
                resolver.reject(error)
            }
            let extra = Extra(type: F.Result.type, extra: wrapper.extra)
            self.runningFunctions[extra.extra] = resolver
        }
        return promise.map(on: self.functionQueue) { data in
            do {
                return try JSONDecoder.td.decode(F.Result.self, from: data)
            } catch {
                throw TDError.unkownFunctionResult(data, error)
            }
        }
    }
}
