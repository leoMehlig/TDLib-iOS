public struct GetChats: TDFunction {
    public typealias T = Chats
    
    public let type: String = "getChats"
    
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
    public typealias T = Chat

    public let type: String = "getChat"
    
    public let chatId: Int
    
    public init(chatId: Int) {
        self.chatId = chatId
    }
}

public struct Chats: FunctionResult {
    public static var type: String = "chats"
    
    public let chatIds: [Int]
}

public struct Chat: FunctionResult {
    public enum ChatType {
        case `private`(user_id: Int32)
        case basicGroup(basic_group_id: Int32)
        case supergroup(supergroup_id: Int32, is_channel: Bool)
        case secret(secret_chat_id: Int32, user_id: Int32)
    }
    public static var type: String = "chat"
    
    public let id: Int
//    public let type: ChatType
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
