public struct GetChats: TDFunction {
    public typealias Result = Chats
    
    public let offsetOrder: Int64
    public let offsetChatId: Int64
    public let limit: Int32

    public init(offsetOrder: Int64 = Int64.max, offsetChatId: Int64 = 0, limit: Int32) {
        self.offsetOrder = offsetOrder
        self.offsetChatId = offsetChatId
        self.limit = limit
    }
}

public struct GetChat: TDFunction {
    public typealias Result = Chat
    
    public let chatId: Int
    
    public init(chatId: Int) {
        self.chatId = chatId
    }
}

public struct Chats: FunctionResult {
    public static var type: String = "chats"
    
    public let chatIds: [Int]
}

public enum ChatType: TDEnum {
    case `private`(userId: Int32)
    case basicGroup(basicGroupId: Int32)
    case supergroup(supergroupId: Int32, isChannel: Bool)
    case secret(secretChatId: Int32, userId: Int32)
}

public struct Chat: FunctionResult {
    
    enum CodingKeys: String, CodingKey {
        case id, title, lastMessage, order, isPinned, unreadCount
        case lastReadInboxMessageId, lastReadOutboxMessageId, unreadMentionCount, replyMarkupMessageId, clientData
        case chatType = "type"
    }
    public static var type: String = "chat"
    
    public let id: Int
    public let chatType: ChatType
    public let title: String
    //    public let photo: chatPhoto
    public let lastMessage: Message
    public let order: String
    public let isPinned: Bool
    public let unreadCount: Int32
    public let lastReadInboxMessageId: Int
    public let lastReadOutboxMessageId: Int
    public let unreadMentionCount: Int32
    //    public let notificationSettings: notificationSettings
    public let replyMarkupMessageId: Int
    //    public let draftMessage: draftMessage
    public let clientData: String
}
