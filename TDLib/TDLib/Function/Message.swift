extension GetChatHistory {
    public static func firstMessage(in chatId: Int64) -> GetChatHistory {
        return GetChatHistory(chatId: chatId, fromMessageId: 2, offset: -1, limit: 2, onlyLocal: false)
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
