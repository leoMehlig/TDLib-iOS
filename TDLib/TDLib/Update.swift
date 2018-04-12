public enum Update: Decodable {
    enum CodingKeys: String, CodingKey {
        case type = "@type"
        case authorizationState
        case state
        case file
    }
    enum Error: Swift.Error {
        case unknownType(String)
    }
    
    case updateAuthorizationState(AuthorizationState)
    case connectionState(state: ConnectionState)
    case file(file: File)
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
        case "updateAuthorizationState":
            self = .updateAuthorizationState(try AuthorizationState(from: container.superDecoder(forKey: .authorizationState)))
        case "updateConnectionState":
            self = .connectionState(state: try ConnectionState(from: container.superDecoder(forKey: .state)))
        case "updateFile":
            self = .file(file: try container.decode(File.self, forKey: .file))
        default:
            throw Error.unknownType(type)
        }
    }
}
