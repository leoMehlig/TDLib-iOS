public class Coordinator {
    public let client: TDJsonClient
    let apiID: Int
    let apiHash: String
    public let authorizationState = Stream<LoadingEvent<AuthorizationState>>()
    public let connectionState = Stream<LoadingEvent<ConnectionState>>()

    public init(client: TDJsonClient) {
        self.client = client
        self.client.stream.subscribeStrong(self) { strongSelf, event in
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
                    try strongSelf.client.send(Function.setTDLibParameters(parameters: TDLibParameters(apiID: strongSelf.apiID,
                                                                                                       apiHash: strongSelf.apiHash)))
                case .waitEncryptionKey(let isEncrypted)?:
                    let key = Data(repeating: 123, count: 64)
                    //                key.withUnsafeMutableBytes { bytes in
                    //                    SecRandomCopyBytes(kSecRandomDefault, 64, bytes)
                    //                }
                    try strongSelf.client.send(Function.checkDatabaseEncryptionKey(encryptionKey: key))
                default:
                    break
                }
            } catch {
                print(error)
            }
        }
    }
}
