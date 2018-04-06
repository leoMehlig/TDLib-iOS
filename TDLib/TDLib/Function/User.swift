public struct GetUser: TDFunction {
    public typealias Result = User
    
    public let type: String = "getUser"
    
    public let userId: Int32
    
    public init(userId: Int32) {
        self.userId = userId
    }
}

public struct GetMe: TDFunction {
    public typealias Result = User
    
    public let type: String = "getMe"
    
    public init() { }
}


public struct User: FunctionResult {
    public static var type: String = "user"
    
    public let id: Int32
    public let firstName: String
    public let lastName: String
    public let username: String
    public let phoneNumber: String
//    let status: UserStatus
//    let profilePhoto: ProfilePhoto
//    let outgoingLink: LinkState
//    let incomingLink: LinkState
    public let isVerified: Bool
    public let restrictionReason: String
    public let haveAccess: Bool
//    let type: UserType
    public let languageCode: String
    
    public var displayName: String {
        if !self.username.isEmpty {
            return self.username
        } else if !self.firstName.isEmpty {
            return self.firstName + " " + self.lastName
        } else if !self.phoneNumber.isEmpty {
            return self.phoneNumber
        } else {
            return "Unknown User"
        }
    }
}
