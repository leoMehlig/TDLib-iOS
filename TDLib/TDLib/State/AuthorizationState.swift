public enum AuthorizationState: Decodable {
    enum CodingKeys: String, CodingKey {
        case type = "@type"
        case isEncrypted
        case isRegistered
        case codeInfo
        case passwordHint
        case hasRecoveryEmailAddress
        case recoveryEmailAddressPattern
    }
    enum Error: Swift.Error {
        case unknownState(String)
    }
    
    case waitTdlibParameters
    case waitEncryptionKey(isEncrypted: Bool)
    case waitPhoneNumber
    case waitCode(isRegistered: Bool, codeInfo: CodeInfo)
    case waitPassword(passwordHint: String, hasRecoveryEmailAddress: Bool, recoveryEmailAddressPattern: String)
    case ready
    case loggingOut
    case closing
    case closed
    
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
        case "authorizationStateWaitCode":
            self = .waitCode(isRegistered: try container.decode(Bool.self, forKey: .isRegistered),
                             codeInfo: try container.decode(CodeInfo.self, forKey: .codeInfo))
        case "authorizationStateWaitPassword":
            self = .waitPassword(passwordHint: try container.decode(String.self, forKey: .passwordHint),
                                 hasRecoveryEmailAddress: try container.decode(Bool.self, forKey: .hasRecoveryEmailAddress),
                                 recoveryEmailAddressPattern: try container.decode(String.self, forKey: .recoveryEmailAddressPattern))
        case "authorizationStateReady":
            self = .ready
        case "authorizationStateLoggingOut":
            self = .loggingOut
        case "authorizationStateClosing":
            self = .closing
        case "authorizationStateClosed":
            self = .closed
        default:
            throw Error.unknownState(type)
        }
    }
}
extension AuthorizationState {
    public struct CodeInfo: Decodable {
        public enum CodeType: Decodable {
            enum CodingKeys: String, CodingKey {
                case type = "@type"
                case length
                case pattern
            }
            enum Error: Swift.Error {
                case unknownType(String)
            }
            case telegramMessage(length: Int32)
            case sms(length: Int32)
            case call(length: Int32)
            case flashCall(pattern: String)
            
            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                let type = try container.decode(String.self, forKey: .type)
                switch type {
                case "authenticationCodeTypeTelegramMessage":
                    let length = try container.decode(Int32.self, forKey: .length)
                    self = .telegramMessage(length: length)
                case "authenticationCodeTypeSms":
                    let length = try container.decode(Int32.self, forKey: .length)
                    self = .sms(length: length)
                case "authenticationCodeTypeCall":
                    let length = try container.decode(Int32.self, forKey: .length)
                    self = .call(length: length)
                case "authenticationCodeTypeFlashCall":
                    let pattern = try container.decode(String.self, forKey: .pattern)
                    self = .flashCall(pattern: pattern)
                default:
                    throw Error.unknownType(type)
                }
            }
        }
        
        enum CodingKeys: String, CodingKey {
            case type
            case nextType = "next_type"
            case timeout
        }
        
        public let type: CodeType
        public let nextType: CodeType
        public let timeout: Int32
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.type = try container.decode(CodeType.self, forKey: .type)
            self.nextType = try container.decode(CodeType.self, forKey: .nextType)
            self.timeout = try container.decode(Int32.self, forKey: .timeout)
        }
    }
}
