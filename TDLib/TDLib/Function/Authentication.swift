public struct SetAuthenticationPhoneNumber: TDFunction {
    public typealias T = Ok
    enum CodingKeys: String, CodingKey {
        case phoneNumber = "phone_number"
        case allowFlashCall = "allow_flash_call"
        case isCurrentPhoneNumber = "is_current_phone_number"
    }
    
    public let type: String = "setAuthenticationPhoneNumber"
    
    public let phoneNumber: String
    public let allowFlashCall: Bool
    public let isCurrentPhoneNumber: Bool
    
    public init(phoneNumber: String, allowFlashCall: Bool, isCurrentPhoneNumber: Bool) {
        self.phoneNumber = phoneNumber
        self.allowFlashCall = allowFlashCall
        self.isCurrentPhoneNumber = isCurrentPhoneNumber
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.phoneNumber, forKey: .phoneNumber)
        try container.encode(self.allowFlashCall, forKey: .allowFlashCall)
        try container.encode(self.isCurrentPhoneNumber, forKey: .isCurrentPhoneNumber)
    }
}

public struct CheckAuthenticationCode: TDFunction {
    public typealias T = Ok
    enum CodingKeys: String, CodingKey {
        case code
        case firstName = "first_name"
        case lastName = "last_name"
    }
    
    public let type: String = "checkAuthenticationCode"
    
    public let code: String
    public let firstName: String?
    public let lastName: String?

    public init(code: String, firstName: String? = nil, lastName: String? = nil) {
        self.code = code
        self.firstName = firstName
        self.lastName = lastName
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.code, forKey: .code)
        try container.encodeIfPresent(self.firstName, forKey: .firstName)
        try container.encodeIfPresent(self.lastName, forKey: .lastName)
    }
}

public struct CheckAuthenticationPassword: TDFunction {
    public typealias T = Ok
    
    public let type: String = "checkAuthenticationPassword"
    
    public let password: String

    public init(password: String) {
        self.password = password
    }
}
