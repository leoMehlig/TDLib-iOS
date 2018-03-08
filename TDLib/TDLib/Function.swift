public protocol TDFunction: Encodable {
    associatedtype T: FunctionResult
    var type: String { get }
}

public protocol FunctionResult: Decodable {
    static var type: String { get }
}

public struct Ok: FunctionResult {
    public static var type: String = "ok"
}

public struct SetTDLibParameters: TDFunction {
    public typealias T = Ok
    enum CodingKeys: String, CodingKey {
        case parameters = "parameters"
    }
    
    public let type: String = "setTdlibParameters"
    
    public let parameters: TDLibParameters
    
    public init(parameters: TDLibParameters) {
        self.parameters = parameters
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.parameters, forKey: .parameters)
    }
}

struct FunctionWrapper<F: TDFunction>: Encodable {
    enum CodingKeys: String, CodingKey {
        case type = "@type"
        case extra = "@extra"
    }

    let function: F
    let extra: String = UUID().uuidString

    public init(function: F) {
        self.function = function
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.function.type, forKey: .type)
        try container.encode(self.extra, forKey: .extra)
        try self.function.encode(to: encoder)
    }
}

public enum Function: Encodable {
    enum CodingKeys: String, CodingKey {
        case type = "@type"
        case encryptionKey = "encryption_key"
        case phoneNumber = "phone_number"
        case allowFlashCall = "allow_flash_call"
        case isCurrentPhoneNumber = "is_current_phone_number"
        case code
        case firstName = "first_name"
        case lastName = "last_name"
        case password
        case offsetOrder = "offset_order"
        case offsetChatId = "offset_chat_id"
        case limit
        case offset
        case maxId = "max_id"
    }
    
    case checkDatabaseEncryptionKey(encryptionKey: Data)
    case setAuthenticationPhoneNumber(phoneNumber: String, allowFlashCall: Bool, isCurrentPhoneNumber: Bool)
    case checkAuthenticationCode(code: String, firstName: String?, lastName: String?)
    case checkAuthenticationPassword(password: String)
    case getChats(offsetOrder: Int64, offsetChatId: Int64, limit: Int32)
    case getDialogs(offset: Int, maxId: Int, limit: Int)
    case getMe
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .checkDatabaseEncryptionKey(encryptionKey):
            try container.encode("checkDatabaseEncryptionKey", forKey: .type)
            try container.encode(encryptionKey, forKey: .encryptionKey)
        case let .setAuthenticationPhoneNumber(phoneNumber, allowFlashCall, isCurrentPhoneNumber):
            try container.encode("setAuthenticationPhoneNumber", forKey: .type)
            try container.encode(phoneNumber, forKey: .phoneNumber)
            try container.encode(allowFlashCall, forKey: .allowFlashCall)
            try container.encode(isCurrentPhoneNumber, forKey: .isCurrentPhoneNumber)
        case let .checkAuthenticationCode(code, firstName, lastName):
            try container.encode("checkAuthenticationCode", forKey: .type)
            try container.encode(code, forKey: .code)
            try container.encodeIfPresent(firstName, forKey: .firstName)
            try container.encodeIfPresent(lastName, forKey: .lastName)
        case let .checkAuthenticationPassword(password):
            try container.encode("checkAuthenticationPassword", forKey: .type)
            try container.encode(password, forKey: .password)
        case let .getChats(offsetOrder, offsetChatId, limit):
            try container.encode("getChats", forKey: .type)
            try container.encode(offsetOrder, forKey: .offsetOrder)
            try container.encode(offsetChatId, forKey: .offsetChatId)
            try container.encode(limit, forKey: .limit)
        case let .getDialogs(offset, maxId, limit):
            try container.encode("getDialogs", forKey: .type)
            try container.encode(offset, forKey: .offset)
            try container.encode(maxId, forKey: .maxId)
            try container.encode(limit, forKey: .limit)
        case .getMe:
            try container.encode("getMe", forKey: .type)
        }
    }
}
