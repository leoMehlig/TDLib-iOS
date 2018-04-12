public struct GetBasicGroupFullInfo: TDFunction {
    public typealias Result = BasicGroupFullInfo
    
    public let basicGroupId: Int32

    public init(basicGroupId: Int32) {
        self.basicGroupId = basicGroupId
    }
}

public struct BasicGroupFullInfo: FunctionResult {
    public let creatorUserId: Int32
    public let members: [ChatMember]
    public let inviteLink: String
}

public struct ChatMember: FunctionResult {
    public let userId: Int32
    public let inviterUserId: Int32
    public let joinedChatDate: Int32
//    public let status: ChatMemberStatus
//    public let botInfo: BotInfo
}
