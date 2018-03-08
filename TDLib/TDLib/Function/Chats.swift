public struct GetChats: TDFunction {
    public typealias T = Chats
    enum CodingKeys: String, CodingKey {
        case offsetOrder = "offset_order"
        case offsetChatId = "offset_chat_id"
        case limit
    }
    
    public let type: String = "getChats"
    
    public let offsetOrder: Int64
    public let offsetChatId: Int64
    public let limit: Int32

    public init(offsetOrder: Int64, offsetChatId: Int64, limit: Int32) {
        self.offsetOrder = offsetOrder
        self.offsetChatId = offsetChatId
        self.limit = limit
    }
}

public struct GetChat: TDFunction {
    public typealias T = Chat
    enum CodingKeys: String, CodingKey {
        case chatId = "chat_id"
    }
    
    public let type:  String = "getChat"
    
    public let chatId: Int
    
    public init(chatId: Int) {
        self.chatId = chatId
    }
}


public struct Chats: FunctionResult {
    public static var type:  String = "chats"
    
    enum CodingKeys:  String, CodingKey {
        case chatIds = "chat_ids"
    }
    
    public let chatIds: [Int]
}

public struct Chat: FunctionResult {
    public enum ChatType {
        case `private`(user_id: Int32)
        case basicGroup(basic_group_id: Int32)
        case supergroup(supergroup_id: Int32, is_channel: Bool)
        case secret(secret_chat_id: Int32, user_id: Int32)
    }
    public static var type:  String = "chat"
    
    //    enum CodingKeys: String, CodingKey {
    //    }
    
    public let id: Int
//    public let type: ChatType
    public let title: String
    //    public let photo: chatPhoto
    public let last_message: Message
    public let order: String
    public let is_pinned: Bool
    public let unread_count: Int32
    public let last_read_inbox_message_id: Int
    public let last_read_outbox_message_id: Int
    public let unread_mention_count: Int32
    //    public let notification_settings: notificationSettings
    public let reply_markup_message_id: Int
    //    public let draft_message: draftMessage
    public let client_data: String
}


