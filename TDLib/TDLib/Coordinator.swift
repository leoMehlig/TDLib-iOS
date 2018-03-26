import PromiseKit

public class Coordinator {
    public let client: TDJsonClient
    let apiId: Int
    let apiHash: String
    let sendQueue = DispatchQueue(label: "tdlib_send", qos: .userInitiated)
    
    let functionStream = Stream<LoadingEvent<(Extra, Data)>>()
    let eventStream = Stream<LoadingFailableEvent<Update>>()
    public let authorizationState = Stream<LoadingEvent<AuthorizationState>>()
    public let connectionState = Stream<LoadingEvent<ConnectionState>>()
    
    private var runningFunctions: [String: Resolver<Data>] = [:]
    
    public init(client: TDJsonClient, apiId: Int, apiHash: String) {
        self.client = client
        self.apiId = apiId
        self.apiHash = apiHash
        self.client.stream.subscribeStrong(self) { strongSelf, event in
            switch event {
            case .pending:
                break
            case let .value(data):
                print("Received: \(String(data: data, encoding: .utf8))")
                if let extra = try? JSONDecoder.td.decode(Extra.self, from: data) {
                    print("Received extra: \(extra.extra) - \(extra.type)")
                    if let resolver = strongSelf.runningFunctions[extra.extra] {
                        strongSelf.runningFunctions[extra.extra] = nil
                        resolver.fulfill(data)
                    } else {
                        print("Unassigned function result: \(extra)")
                    }
                } else {
                    do {
                        let event = try JSONDecoder.td.decode(Update.self, from: data)
                        strongSelf.eventStream.current = .value(event)
                    } catch {
                        strongSelf.eventStream.current = .error(error)
                    }
                }
            case .error(_):
                break
            }

        }
//        self.functionStream.subscribeStrong(self, on: self.sendQueue) { (strongSelf, event) in
//            if let (extra, data) = event.value {
//                print("Func: Received extra: \(extra.extra) - \(extra.extra)")
//                if let resolver = strongSelf.runningFunctions[extra.extra] {
//                    strongSelf.runningFunctions[extra.extra] = nil
//                    resolver.fulfill(data)
//                } else {
////                    print("Unassigned function result: \(extra)")
//                }
//            }
//        }
        self.eventStream.subscribeStrong(self) { strongSelf, event in
            switch event {
            case .pending:
                print("Loading...")
            case let .value(update):
                switch update {
                case let .updateAuthorizationState(state):
                    strongSelf.authorizationState.current = .value(state)
                case let .connectionState(state):
                    strongSelf.connectionState.current = .value(state)
                }
            case .error(_):
                break
            }
        }
        self.authorizationState.subscribeStrong(self) { strongSelf, event in
            switch event.value {
            case .waitTdlibParameters?:
                _ = strongSelf.send(SetTDLibParameters(parameters: TDLibParameters(apiId: self.apiId,
                                                                                   apiHash: self.apiHash)))
            case .waitEncryptionKey(_)?:
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
    
    public func send<F: TDFunction>(_ function: F) -> Promise<F.T> {
        let (promise, resolver) = Promise<Data>.pending()
        self.sendQueue.async {
            let wrapper = FunctionWrapper(function: function)
            do {
                try self.client.send(wrapper)
            } catch {
                resolver.reject(error)
            }
            let extra = Extra(type: F.T.type, extra: wrapper.extra)
            self.runningFunctions[extra.extra] = resolver
            self.sendQueue.asyncAfter(deadline: .now() + .seconds(10)) {
                if let resolver = self.runningFunctions[extra.extra] {
                    resolver.reject(TDError.timeout(extra))
                }
            }
        }
        return promise.map(on: self.sendQueue) { data in
            do {
                return try JSONDecoder.td.decode(F.T.self, from: data)
            } catch {
                throw error
            }
        }
    }
}
