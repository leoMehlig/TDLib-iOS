public class Coordinator {
    let client: TDJsonClient
    
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
                    try strongSelf.client.send(Function.setTDLibParameters(parameters: TDLibParameters(apiID: 177033, apiHash: "d61e84baf1d5da953fdabd730b0b557f")))
                case .waitEncryptionKey(let isEncrypted)?:
                    let key = Data(repeating: 123, count: 64)
                    //                key.withUnsafeMutableBytes { bytes in
                    //                    SecRandomCopyBytes(kSecRandomDefault, 64, bytes)
                    //                }
                    try strongSelf.client.send(Function.checkDatabaseEncryptionKey(encryptionKey: key))
                case .waitPhoneNumber?:
                    try strongSelf.client.send(Function.setAuthenticationPhoneNumber(phoneNumber: "+4917682536512", allowFlashCall: false, isCurrentPhoneNumber: false))
                case nil:
                    break
                }
            } catch {
                print(error)
            }
        }
    }
}
