public enum AuthorizationState: Decodable {
    enum CodingKeys: String, CodingKey {
        case type = "@type"
        case isEncrypted = "is_encrypted"
    }
    enum Error: Swift.Error {
        case unknownState(String)
    }
    
    case waitTdlibParameters
    case waitEncryptionKey(isEncrypted: Bool)
    case waitPhoneNumber
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
        case "authorizationStateWaitTdlibParameters":
            self = .waitTdlibParameters
        case "authorizationStateWaitEncryptionKey":
            self = .waitEncryptionKey(isEncrypted: try container.decode(Bool.self, forKey: .isEncrypted))
        case "authorizationStateWaitPhoneNumber":
            self = .waitPhoneNumber
        default:
            throw Error.unknownState(type)
        }
    }
}

