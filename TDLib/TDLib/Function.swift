public enum Function: Encodable {
    enum CodingKeys: String, CodingKey {
        case type = "@type"
        case parameters = "parameters"
        case encryptionKey = "encryption_key"
        case phoneNumber = "phone_number"
        case allowFlashCall = "allow_flash_call"
        case isCurrentPhoneNumber = "is_current_phone_number"
        case code
        case firstName = "first_name"
        case lastName = "last_name"
        case password
    }
    
    case setTDLibParameters(parameters: TDLibParameters)
    case checkDatabaseEncryptionKey(encryptionKey: Data)
    case setAuthenticationPhoneNumber(phoneNumber: String, allowFlashCall: Bool, isCurrentPhoneNumber: Bool)
    case checkAuthenticationCode(code: String, firstName: String?, lastName: String?)
    case checkAuthenticationPassword(password: String)
    case getMe
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .setTDLibParameters(parameters):
            try container.encode("setTdlibParameters", forKey: .type)
            try container.encode(parameters, forKey: .parameters)
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
        case .getMe:
            try container.encode("getMe", forKey: .type)
        }
    }
}
