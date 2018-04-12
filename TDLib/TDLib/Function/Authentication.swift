public struct SetAuthenticationPhoneNumber: TDFunction {
    public typealias Result = Ok
    
    public let phoneNumber: String
    public let allowFlashCall: Bool
    public let isCurrentPhoneNumber: Bool
    
    public init(phoneNumber: String, allowFlashCall: Bool, isCurrentPhoneNumber: Bool) {
        self.phoneNumber = phoneNumber
        self.allowFlashCall = allowFlashCall
        self.isCurrentPhoneNumber = isCurrentPhoneNumber
    }
}

public struct CheckAuthenticationCode: TDFunction {
    public typealias Result = Ok
    
    public let code: String
    public let firstName: String?
    public let lastName: String?

    public init(code: String, firstName: String? = nil, lastName: String? = nil) {
        self.code = code
        self.firstName = firstName
        self.lastName = lastName
    }
}

public struct CheckAuthenticationPassword: TDFunction {
    public typealias Result = Ok
    
    public let password: String

    public init(password: String) {
        self.password = password
    }
}
