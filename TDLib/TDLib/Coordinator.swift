import PromiseKit

public class Coordinator {
    public let client: TDJsonClient
    let apiId: Int
    let apiHash: String
    
    let functionStream = Stream<LoadingEvent<(Extra, Data)>>()
    let eventStream = Stream<LoadingFailableEvent<Update>>()
    public let authorizationState = Stream<LoadingEvent<AuthorizationState>>()
    public let connectionState = Stream<LoadingEvent<ConnectionState>>()
    
    var runningFunctions: [Extra: Resolver<Data>] = [:]

    public init(client: TDJsonClient, apiId: Int, apiHash: String) {
        self.client = client
        self.apiId = apiId
        self.apiHash = apiHash
        self.client.stream.subscribeStrong(self) { strongSelf, event in
            switch event {
            case .pending:
                break
            case let .value(data):
                let decoder = JSONDecoder()
                print("JSON:", String.init(data: data, encoding: .utf8)!)
                if let extra = try? decoder.decode(Extra.self, from: data) {
                    strongSelf.functionStream.current = .value((extra, data))
                } else {
                    do {
                        let event = try decoder.decode(Update.self, from: data)
                        print(event)
                        strongSelf.eventStream.current = .value(event)
                    } catch {
                        print(error, String(data: data, encoding: .utf8)!)
                        strongSelf.eventStream.current = .error(error)
                    }
                }
            case let .error(error):
                print(error)
            }
            
        }
        self.functionStream.subscribeStrong(self) { (strongSelf, event) in
            if let (extra, data) = event.value {
                if let resolver = strongSelf.runningFunctions[extra] {
                    strongSelf.runningFunctions[extra] = nil
                    resolver.fulfill(data)
                } else {
                    print("Unassigned function result: \(extra)")
                }
            }
        }
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
            case let .error(error):
                print(error)
            }
        }
        self.authorizationState.subscribeStrong(self) { strongSelf, event in
            do {
                switch event.value {
                case .waitTdlibParameters?:
                    strongSelf.send(SetTDLibParameters(parameters: TDLibParameters(apiId: strongSelf.apiId,
                                                                                   apiHash: strongSelf.apiHash)))
                case .waitEncryptionKey(let isEncrypted)?:
                    let key = Data(repeating: 123, count: 64)
                    //                key.withUnsafeMutableBytes { bytes in
                    //                    SecRandomCopyBytes(kSecRandomDefault, 64, bytes)
                    //                }
                    try strongSelf.send(CheckDatabaseEncryptionKey(encryptionKey: key))
                default:
                    break
                }
            } catch {
                print(error)
            }
        }
    }
    
    public func send<F: TDFunction>(_ function: F) -> Promise<F.T> {
        let (promise, resolver) = Promise<Data>.pending()
        let wrapper = FunctionWrapper(function: function)
        do {
            try self.client.send(wrapper)
        } catch {
            resolver.reject(error)
        }
        let extra = Extra(type: F.T.type, extra: wrapper.extra)
        self.runningFunctions[extra] = resolver
        return promise.map { data in
            return try JSONDecoder().decode(F.T.self, from: data)
        }
    }
}
