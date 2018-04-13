public struct GetChatHistory: TDFunction {
    public typealias Result = Messages
    
    public let chatId: Int
    public let fromMessageId: Int
    public let offset: Int32
    public let limit: Int32
    public let onlyLocal: Bool

    public init(chatId: Int, fromMessageId: Int, offset: Int32, limit: Int32, onlyLocal: Bool) {
        self.chatId = chatId
        self.fromMessageId = fromMessageId
        self.offset = offset
        self.limit = limit
        self.onlyLocal = onlyLocal
    }
    
    public static func firstMessage(in chatId: Int) -> GetChatHistory {
        return GetChatHistory(chatId: chatId, fromMessageId: 2, offset: -1, limit: 2, onlyLocal: false)
    }
}

public struct GetChatMessageByDate: TDFunction {
    public typealias Result = Message
    
    public let chatId: Int
    public let date: Int32
    
    public init(chatId: Int, date: Date) {
        self.chatId = chatId
        self.date = Int32(date.timeIntervalSince1970)
    }
}

public struct GetMessage: TDFunction {
    public typealias Result = Message
    
    public let chatId: Int
    
    public init(chatId: Int) {
        self.chatId = chatId
    }
}

public struct Messages: FunctionResult, Equatable {   
    public let totalCount: Int32
    public let messages: [Message]
}

public struct Message: FunctionResult, Equatable {
    public let id: Int
    public let senderUserId: Int32
    public let chatId: Int
    //    public let sendingState:MessageSendingState
    public let isOutgoing: Bool
    public let canBeEdited: Bool
    public let canBeForwarded: Bool
    public let canBeDeletedOnlyForSelf: Bool
    public let canBeDeletedForAllUsers: Bool
    public let isChannelPost: Bool
    public let containsUnreadMention: Bool
    public let date: Int32
    public let editDate: Int32
    //    public let forwardInfo:MessageForwardInfo
    public let replyToMessageId: Int
    public let ttl: Int32
    public let ttlExpiresIn: Double
    public let viaBotUserId: Int32
    public let authorSignature: String
    public let views: Int32
    public let mediaAlbumId: String
    public let content: MessageContent
    //    public let replyMarkup:ReplyMarkup
}
public struct FormattedText: Decodable, Equatable {
    public struct TextEntity: Decodable, Equatable {
        public let offset: Int32
        public let length: Int32
        //        public let type: TextEntityType
    }
    public let text: String
    public let entities: [TextEntity]
}

public protocol TDEnum { }

// sourcery: prefix = "message", default = "other"
public enum MessageContent: TDEnum, Equatable, CustomStringConvertible {
    case text(text: FormattedText)
    case photo(photo: Photo, caption: FormattedText)
    case other

    public var description: String {
        switch self {
        case let .text(text):
            return text.text
        case let .photo(_, caption):
            return "Photo - " + caption.text
        case .other:
            return "not a text message"
        }
    }
    
    public static func == (lhs: MessageContent, rhs: MessageContent) -> Bool {
        switch (lhs, rhs) {
        case (.text(let lhs), .text(let rhs)):
            return lhs == rhs
        case (.photo(let lhsPhoto, let lhsCaption), .photo(let rhsPhoto, let rhsCaption)):
            return lhsPhoto == rhsPhoto && lhsCaption == rhsCaption
        case (.other, .other):
            return true
        default:
            return false
        }
    }
    
//    case animation(animation: Animation, caption: FormattedText)
//    case audio(audio: Audio, caption: FormattedText)
//    case document(document: Document, caption: FormattedText)
//    case sticker(sticker: Sticker)
//    case video(video: Video, caption: FormattedText)
//    case videoNote(video_note: VideoNote, is_viewed: Bool)
//    case voiceNote(voice_note: VoiceNote, caption: FormattedText, is_listened: Bool)
//    case location(location: Location, live_period: Int32)
//    case venue(venue: Venue)
//    case contact(contact: Contact)
//    case game(game: Game)
//    case invoice(title: String, description: String, photo: Photo)
//    case call(discard_reason: CallDiscardReason, duration: Int32)
//    case basicGroupChatCreate(title: String, member_user_ids: Vector<int32>)
//    case supergroupChatCreate(title: String)
//    case chatChangeTitle(title: String)
//    case chatChangePhoto(photo: Photo)
//    case chatAddMembers(member_user_ids: Vector<int32>)
//    case chatDeleteMember(user_id: Int32)
//    case chatUpgradeTo(supergroup_id: Int32)
//    case chatUpgradeFrom(title: String, basic_group_id: Int32)
//    case pinMessage(message_id: Int53)
//    case chatSetTtl(ttl: Int32)
//    case customServiceAction(text: String)
//    case gameScore(game_message_id: Int53, game_id: Int64, score: Int32)
//    case paymentSuccessful(invoice_message_id: Int53, currency: String, total_amount: Int53)
//    case paymentSuccessfulBot(invoice_message_id: Int53, currency: String, total_amount: Int53)
}
