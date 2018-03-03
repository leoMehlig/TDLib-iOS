public enum Update: Decodable {
    enum CodingKeys: String, CodingKey {
        case type = "@type"
        case authorizationState = "authorization_state"
        case state
    }
    enum Error: Swift.Error {
        case unknownType(String)
    }
    
    case updateAuthorizationState(AuthorizationState)
    case connectionState(state: ConnectionState)

    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
        case "updateAuthorizationState":
            self = .updateAuthorizationState(try AuthorizationState(from: container.superDecoder(forKey: .authorizationState)))
        case "updateConnectionState":
            self = .connectionState(state: try ConnectionState(from: container.superDecoder(forKey: .state)))
        default:
            throw Error.unknownType(type)
        }
    }
}

