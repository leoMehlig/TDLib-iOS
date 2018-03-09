public struct GetChatHistory: TDFunction {
    public typealias T = Messages
    
    public let type: String = "getChatHistory"
    
    public let chat_id: Int
    public let from_message_id: Int
    public let offset: Int32
    public let limit: Int32
    public let only_local: Bool

    public init(chat_id: Int, from_message_id: Int, offset: Int32, limit: Int32, only_local: Bool) {
        self.chat_id = chat_id
        self.from_message_id = from_message_id
        self.offset = offset
        self.limit = limit
        self.only_local = only_local
    }
}

public struct Messages: FunctionResult {
    public static var type: String = "messages"
    
    public let total_count: Int32
    public let messages: [Message]
}

public struct Message: FunctionResult {
    public static var type: String = "message"
    
    public let id: Int
    public let sender_user_id: Int32
    public let chat_id: Int
    //    public let sending_state:MessageSendingState
    public let is_outgoing: Bool
    public let can_be_edited: Bool
    public let can_be_forwarded: Bool
    public let can_be_deleted_only_for_self: Bool
    public let can_be_deleted_for_all_users: Bool
    public let is_channel_post: Bool
    public let contains_unread_mention: Bool
    public let date: Int32
    public let edit_date: Int32
    //    public let forward_info:MessageForwardInfo
    public let reply_to_message_id: Int
    public let ttl: Int32
    public let ttl_expires_in: Double
    public let via_bot_user_id: Int32
    public let author_signature: String
    public let views: Int32
    public let media_album_id: String
    public let content: MessageContent
    //    public let reply_markup:ReplyMarkup
}
public struct FormattedText: Decodable {
    public struct TextEntity: Decodable {
        public let offset: Int32
        public let length: Int32
        //        public let type: TextEntityType
    }
    public let text: String
    public let entities: [TextEntity]
}
public enum MessageContent: Decodable {
    enum CodingKeys: String, CodingKey {
        case type = "@type"
        case text
    }
    enum Error: Swift.Error {
        case unknownType(String)
    }
    
    case text(text: FormattedText)
    case other
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
        case "messageText":
            self = .text(text: try container.decode(FormattedText.self, forKey: .text))
        default:
            self = .other
        }
    }
    
//    case animation(animation: Animation, caption: FormattedText)
//    case audio(audio: Audio, caption: FormattedText)
//    case document(document: Document, caption: FormattedText)
//    case photo(photo: Photo, caption: FormattedText)
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
