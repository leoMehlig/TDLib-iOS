public enum AuthorizationState: TDEnum {
    case waitTdlibParameters
    case waitEncryptionKey(isEncrypted: Bool)
    case waitPhoneNumber
    case waitCode(isRegistered: Bool, codeInfo: CodeInfo)
    case waitPassword(passwordHint: String, hasRecoveryEmailAddress: Bool, recoveryEmailAddressPattern: String)
    case ready
    case loggingOut
    case closing
    case closed
}

public struct CodeInfo: Decodable {
    public let type: CodeType
    public let nextType: CodeType
    public let timeout: Int32
}

// sourcery: prefix = "authenticationCode"
public enum CodeType: TDEnum {
    case telegramMessage(length: Int32)
    case sms(length: Int32)
    case call(length: Int32)
    case flashCall(pattern: String)
}
