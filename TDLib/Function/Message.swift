extension GetChatHistory {
    public static func firstMessage(in chatId: Int64, fromMessageId id: Int53 = 2) -> GetChatHistory {
        return GetChatHistory(chatId: chatId, fromMessageId: id, offset: id == 2 ? -1 : -2, limit: 3, onlyLocal: false)
    }
}

extension MessageContent: CustomStringConvertible {
    public var description: String {
        switch self {
        case let .messageText(text, _):
            return text.text
        case let .messagePhoto(_, caption, _):
            return "Photo - " + caption.text
        default:
            return "not a text message"
        }
    }
}
