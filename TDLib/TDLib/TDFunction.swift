enum TDFunction: Encodable {
    enum CodingKeys: String, CodingKey {
        case type = "@type"
        case parameters = "parameters"
        case encryptionKey = "encryption_key"
        case phoneNumber = "phone_number"
        case allowFlashCall = "allow_flash_call"
        case isCurrentPhoneNumber = "is_current_phone_number"
    }
    
    case setTDLibParameters(parameters: TDLibParameters)
    case checkDatabaseEncryptionKey(encryptionKey: Data)
    case setAuthenticationPhoneNumber(phoneNumber: String, allowFlashCall: Bool, isCurrentPhoneNumber: Bool)
    case getMe
    
    func encode(to encoder: Encoder) throws {
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
        case .getMe:
            try container.encode("getMe", forKey: .type)
        }
    }
}
