public enum ConnectionState: String, Decodable {
    enum CodingKeys: String, CodingKey {
        case type = "@type"
        case isEncrypted
    }
    enum Error: Swift.Error {
        case unknownState(String)
    }
    
    case waitingForNetwork = "connectionStateWaitingForNetwork"
    case connectingToProxy = "connectionStateConnectingToProxy"
    case connecting = "connectionStateConnecting"
    case updating = "connectionStateUpdating"
    case ready = "connectionStateReady"
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        if let state = ConnectionState(rawValue: type) {
            self = state
        } else {
            throw Error.unknownState(type)
        }
    }
}
