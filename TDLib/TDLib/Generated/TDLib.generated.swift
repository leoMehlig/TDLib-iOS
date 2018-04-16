public typealias Int53 = Int64
public typealias Bytes = Data

public struct Error: Codable, FunctionResult {
	public let code: Int32
	public let message: String

	public init(code: Int32, message: String) {
		self.code = code
		self.message = message
	}
}

public struct Ok: Codable, FunctionResult {

	public init() {
	}
}

public struct TdlibParameters: Codable, FunctionResult {
	public let useTestDc: Bool
	public let databaseDirectory: String
	public let filesDirectory: String
	public let useFileDatabase: Bool
	public let useChatInfoDatabase: Bool
	public let useMessageDatabase: Bool
	public let useSecretChats: Bool
	public let apiId: Int32
	public let apiHash: String
	public let systemLanguageCode: String
	public let deviceModel: String
	public let systemVersion: String
	public let applicationVersion: String
	public let enableStorageOptimizer: Bool
	public let ignoreFileNames: Bool

	public init(useTestDc: Bool, databaseDirectory: String, filesDirectory: String, useFileDatabase: Bool, useChatInfoDatabase: Bool, useMessageDatabase: Bool, useSecretChats: Bool, apiId: Int32, apiHash: String, systemLanguageCode: String, deviceModel: String, systemVersion: String, applicationVersion: String, enableStorageOptimizer: Bool, ignoreFileNames: Bool) {
		self.useTestDc = useTestDc
		self.databaseDirectory = databaseDirectory
		self.filesDirectory = filesDirectory
		self.useFileDatabase = useFileDatabase
		self.useChatInfoDatabase = useChatInfoDatabase
		self.useMessageDatabase = useMessageDatabase
		self.useSecretChats = useSecretChats
		self.apiId = apiId
		self.apiHash = apiHash
		self.systemLanguageCode = systemLanguageCode
		self.deviceModel = deviceModel
		self.systemVersion = systemVersion
		self.applicationVersion = applicationVersion
		self.enableStorageOptimizer = enableStorageOptimizer
		self.ignoreFileNames = ignoreFileNames
	}
}

public indirect enum AuthenticationCodeType: FunctionResult, TDEnum {
	case telegramMessage(length: Int32)
	case sms(length: Int32)
	case call(length: Int32)
	case flashCall(pattern: String)
}

public struct AuthenticationCodeInfo: Codable, FunctionResult {
	public let phoneNumber: String
	public let type: AuthenticationCodeType
	public let nextType: AuthenticationCodeType?
	public let timeout: Int32

	public init(phoneNumber: String, type: AuthenticationCodeType, nextType: AuthenticationCodeType?, timeout: Int32) {
		self.phoneNumber = phoneNumber
		self.type = type
		self.nextType = nextType
		self.timeout = timeout
	}
}

public indirect enum AuthorizationState: FunctionResult, TDEnum {
	case waitTdlibParameters
	case waitEncryptionKey(isEncrypted: Bool)
	case waitPhoneNumber
	case waitCode(isRegistered: Bool, codeInfo: AuthenticationCodeInfo)
	case waitPassword(passwordHint: String, hasRecoveryEmailAddress: Bool, recoveryEmailAddressPattern: String)
	case ready
	case loggingOut
	case closing
	case closed
}

public struct PasswordState: Codable, FunctionResult {
	public let hasPassword: Bool
	public let passwordHint: String
	public let hasRecoveryEmailAddress: Bool
	public let unconfirmedRecoveryEmailAddressPattern: String

	public init(hasPassword: Bool, passwordHint: String, hasRecoveryEmailAddress: Bool, unconfirmedRecoveryEmailAddressPattern: String) {
		self.hasPassword = hasPassword
		self.passwordHint = passwordHint
		self.hasRecoveryEmailAddress = hasRecoveryEmailAddress
		self.unconfirmedRecoveryEmailAddressPattern = unconfirmedRecoveryEmailAddressPattern
	}
}

public struct PasswordRecoveryInfo: Codable, FunctionResult {
	public let recoveryEmailAddressPattern: String

	public init(recoveryEmailAddressPattern: String) {
		self.recoveryEmailAddressPattern = recoveryEmailAddressPattern
	}
}

public struct RecoveryEmailAddress: Codable, FunctionResult {
	public let recoveryEmailAddress: String

	public init(recoveryEmailAddress: String) {
		self.recoveryEmailAddress = recoveryEmailAddress
	}
}

public struct TemporaryPasswordState: Codable, FunctionResult {
	public let hasPassword: Bool
	public let validFor: Int32

	public init(hasPassword: Bool, validFor: Int32) {
		self.hasPassword = hasPassword
		self.validFor = validFor
	}
}

public struct LocalFile: Codable, FunctionResult {
	public let path: String
	public let canBeDownloaded: Bool
	public let canBeDeleted: Bool
	public let isDownloadingActive: Bool
	public let isDownloadingCompleted: Bool
	public let downloadedPrefixSize: Int32
	public let downloadedSize: Int32

	public init(path: String, canBeDownloaded: Bool, canBeDeleted: Bool, isDownloadingActive: Bool, isDownloadingCompleted: Bool, downloadedPrefixSize: Int32, downloadedSize: Int32) {
		self.path = path
		self.canBeDownloaded = canBeDownloaded
		self.canBeDeleted = canBeDeleted
		self.isDownloadingActive = isDownloadingActive
		self.isDownloadingCompleted = isDownloadingCompleted
		self.downloadedPrefixSize = downloadedPrefixSize
		self.downloadedSize = downloadedSize
	}
}

public struct RemoteFile: Codable, FunctionResult {
	public let id: String
	public let isUploadingActive: Bool
	public let isUploadingCompleted: Bool
	public let uploadedSize: Int32

	public init(id: String, isUploadingActive: Bool, isUploadingCompleted: Bool, uploadedSize: Int32) {
		self.id = id
		self.isUploadingActive = isUploadingActive
		self.isUploadingCompleted = isUploadingCompleted
		self.uploadedSize = uploadedSize
	}
}

public struct File: Codable, FunctionResult {
	public let id: Int32
	public let size: Int32
	public let expectedSize: Int32
	public let local: LocalFile
	public let remote: RemoteFile

	public init(id: Int32, size: Int32, expectedSize: Int32, local: LocalFile, remote: RemoteFile) {
		self.id = id
		self.size = size
		self.expectedSize = expectedSize
		self.local = local
		self.remote = remote
	}
}

public indirect enum InputFile: FunctionResult, TDEnum {
	case id(id: Int32)
	case remote(id: String)
	case local(path: String)
	case generated(originalPath: String, conversion: String, expectedSize: Int32)
}

public struct PhotoSize: Codable, FunctionResult {
	public let type: String
	public let photo: File
	public let width: Int32
	public let height: Int32

	public init(type: String, photo: File, width: Int32, height: Int32) {
		self.type = type
		self.photo = photo
		self.width = width
		self.height = height
	}
}

public indirect enum MaskPoint: FunctionResult, TDEnum {
	case forehead
	case eyes
	case mouth
	case chin
}

public struct MaskPosition: Codable, FunctionResult {
	public let point: MaskPoint
	public let xShift: Double
	public let yShift: Double
	public let scale: Double

	public init(point: MaskPoint, xShift: Double, yShift: Double, scale: Double) {
		self.point = point
		self.xShift = xShift
		self.yShift = yShift
		self.scale = scale
	}
}

public struct TextEntity: Codable, FunctionResult {
	public let offset: Int32
	public let length: Int32
	public let type: TextEntityType

	public init(offset: Int32, length: Int32, type: TextEntityType) {
		self.offset = offset
		self.length = length
		self.type = type
	}
}

public struct TextEntities: Codable, FunctionResult {
	public let entities: [TextEntity]

	public init(entities: [TextEntity]) {
		self.entities = entities
	}
}

public struct FormattedText: Codable, FunctionResult {
	public let text: String
	public let entities: [TextEntity]

	public init(text: String, entities: [TextEntity]) {
		self.text = text
		self.entities = entities
	}
}

public struct Animation: Codable, FunctionResult {
	public let duration: Int32
	public let width: Int32
	public let height: Int32
	public let fileName: String
	public let mimeType: String
	public let thumbnail: PhotoSize?
	public let animation: File

	public init(duration: Int32, width: Int32, height: Int32, fileName: String, mimeType: String, thumbnail: PhotoSize?, animation: File) {
		self.duration = duration
		self.width = width
		self.height = height
		self.fileName = fileName
		self.mimeType = mimeType
		self.thumbnail = thumbnail
		self.animation = animation
	}
}

public struct Audio: Codable, FunctionResult {
	public let duration: Int32
	public let title: String
	public let performer: String
	public let fileName: String
	public let mimeType: String
	public let albumCoverThumbnail: PhotoSize?
	public let audio: File

	public init(duration: Int32, title: String, performer: String, fileName: String, mimeType: String, albumCoverThumbnail: PhotoSize?, audio: File) {
		self.duration = duration
		self.title = title
		self.performer = performer
		self.fileName = fileName
		self.mimeType = mimeType
		self.albumCoverThumbnail = albumCoverThumbnail
		self.audio = audio
	}
}

public struct Document: Codable, FunctionResult {
	public let fileName: String
	public let mimeType: String
	public let thumbnail: PhotoSize?
	public let document: File

	public init(fileName: String, mimeType: String, thumbnail: PhotoSize?, document: File) {
		self.fileName = fileName
		self.mimeType = mimeType
		self.thumbnail = thumbnail
		self.document = document
	}
}

public struct Photo: Codable, FunctionResult {
	public let id: TDInt64
	public let hasStickers: Bool
	public let sizes: [PhotoSize]

	public init(id: TDInt64, hasStickers: Bool, sizes: [PhotoSize]) {
		self.id = id
		self.hasStickers = hasStickers
		self.sizes = sizes
	}
}

public struct Sticker: Codable, FunctionResult {
	public let setId: TDInt64
	public let width: Int32
	public let height: Int32
	public let emoji: String
	public let isMask: Bool
	public let maskPosition: MaskPosition?
	public let thumbnail: PhotoSize?
	public let sticker: File

	public init(setId: TDInt64, width: Int32, height: Int32, emoji: String, isMask: Bool, maskPosition: MaskPosition?, thumbnail: PhotoSize?, sticker: File) {
		self.setId = setId
		self.width = width
		self.height = height
		self.emoji = emoji
		self.isMask = isMask
		self.maskPosition = maskPosition
		self.thumbnail = thumbnail
		self.sticker = sticker
	}
}

public struct Video: Codable, FunctionResult {
	public let duration: Int32
	public let width: Int32
	public let height: Int32
	public let fileName: String
	public let mimeType: String
	public let hasStickers: Bool
	public let supportsStreaming: Bool
	public let thumbnail: PhotoSize?
	public let video: File

	public init(duration: Int32, width: Int32, height: Int32, fileName: String, mimeType: String, hasStickers: Bool, supportsStreaming: Bool, thumbnail: PhotoSize?, video: File) {
		self.duration = duration
		self.width = width
		self.height = height
		self.fileName = fileName
		self.mimeType = mimeType
		self.hasStickers = hasStickers
		self.supportsStreaming = supportsStreaming
		self.thumbnail = thumbnail
		self.video = video
	}
}

public struct VideoNote: Codable, FunctionResult {
	public let duration: Int32
	public let length: Int32
	public let thumbnail: PhotoSize?
	public let video: File

	public init(duration: Int32, length: Int32, thumbnail: PhotoSize?, video: File) {
		self.duration = duration
		self.length = length
		self.thumbnail = thumbnail
		self.video = video
	}
}

public struct VoiceNote: Codable, FunctionResult {
	public let duration: Int32
	public let waveform: Bytes
	public let mimeType: String
	public let voice: File

	public init(duration: Int32, waveform: Bytes, mimeType: String, voice: File) {
		self.duration = duration
		self.waveform = waveform
		self.mimeType = mimeType
		self.voice = voice
	}
}

public struct Contact: Codable, FunctionResult {
	public let phoneNumber: String
	public let firstName: String
	public let lastName: String
	public let userId: Int32

	public init(phoneNumber: String, firstName: String, lastName: String, userId: Int32) {
		self.phoneNumber = phoneNumber
		self.firstName = firstName
		self.lastName = lastName
		self.userId = userId
	}
}

public struct Location: Codable, FunctionResult {
	public let latitude: Double
	public let longitude: Double

	public init(latitude: Double, longitude: Double) {
		self.latitude = latitude
		self.longitude = longitude
	}
}

public struct Venue: Codable, FunctionResult {
	public let location: Location
	public let title: String
	public let address: String
	public let provider: String
	public let id: String

	public init(location: Location, title: String, address: String, provider: String, id: String) {
		self.location = location
		self.title = title
		self.address = address
		self.provider = provider
		self.id = id
	}
}

public struct Game: Codable, FunctionResult {
	public let id: TDInt64
	public let shortName: String
	public let title: String
	public let text: FormattedText
	public let description: String
	public let photo: Photo
	public let animation: Animation?

	public init(id: TDInt64, shortName: String, title: String, text: FormattedText, description: String, photo: Photo, animation: Animation?) {
		self.id = id
		self.shortName = shortName
		self.title = title
		self.text = text
		self.description = description
		self.photo = photo
		self.animation = animation
	}
}

public struct ProfilePhoto: Codable, FunctionResult {
	public let id: TDInt64
	public let small: File
	public let big: File

	public init(id: TDInt64, small: File, big: File) {
		self.id = id
		self.small = small
		self.big = big
	}
}

public struct ChatPhoto: Codable, FunctionResult {
	public let small: File
	public let big: File

	public init(small: File, big: File) {
		self.small = small
		self.big = big
	}
}

public indirect enum LinkState: FunctionResult, TDEnum {
	case none
	case knowsPhoneNumber
	case isContact
}

public indirect enum UserType: FunctionResult, TDEnum {
	case regular
	case deleted
	case bot(canJoinGroups: Bool, canReadAllGroupMessages: Bool, isInline: Bool, inlineQueryPlaceholder: String, needLocation: Bool)
	case unknown
}

public struct BotCommand: Codable, FunctionResult {
	public let command: String
	public let description: String

	public init(command: String, description: String) {
		self.command = command
		self.description = description
	}
}

public struct BotInfo: Codable, FunctionResult {
	public let description: String
	public let commands: [BotCommand]

	public init(description: String, commands: [BotCommand]) {
		self.description = description
		self.commands = commands
	}
}

public struct User: Codable, FunctionResult {
	public let id: Int32
	public let firstName: String
	public let lastName: String
	public let username: String
	public let phoneNumber: String
	public let status: UserStatus
	public let profilePhoto: ProfilePhoto?
	public let outgoingLink: LinkState
	public let incomingLink: LinkState
	public let isVerified: Bool
	public let restrictionReason: String
	public let haveAccess: Bool
	public let type: UserType
	public let languageCode: String

	public init(id: Int32, firstName: String, lastName: String, username: String, phoneNumber: String, status: UserStatus, profilePhoto: ProfilePhoto?, outgoingLink: LinkState, incomingLink: LinkState, isVerified: Bool, restrictionReason: String, haveAccess: Bool, type: UserType, languageCode: String) {
		self.id = id
		self.firstName = firstName
		self.lastName = lastName
		self.username = username
		self.phoneNumber = phoneNumber
		self.status = status
		self.profilePhoto = profilePhoto
		self.outgoingLink = outgoingLink
		self.incomingLink = incomingLink
		self.isVerified = isVerified
		self.restrictionReason = restrictionReason
		self.haveAccess = haveAccess
		self.type = type
		self.languageCode = languageCode
	}
}

public struct UserFullInfo: Codable, FunctionResult {
	public let isBlocked: Bool
	public let canBeCalled: Bool
	public let hasPrivateCalls: Bool
	public let bio: String
	public let shareText: String
	public let groupInCommonCount: Int32
	public let botInfo: BotInfo?

	public init(isBlocked: Bool, canBeCalled: Bool, hasPrivateCalls: Bool, bio: String, shareText: String, groupInCommonCount: Int32, botInfo: BotInfo?) {
		self.isBlocked = isBlocked
		self.canBeCalled = canBeCalled
		self.hasPrivateCalls = hasPrivateCalls
		self.bio = bio
		self.shareText = shareText
		self.groupInCommonCount = groupInCommonCount
		self.botInfo = botInfo
	}
}

public struct UserProfilePhotos: Codable, FunctionResult {
	public let totalCount: Int32
	public let photos: [Photo]

	public init(totalCount: Int32, photos: [Photo]) {
		self.totalCount = totalCount
		self.photos = photos
	}
}

public struct Users: Codable, FunctionResult {
	public let totalCount: Int32
	public let userIds: [Int32]

	public init(totalCount: Int32, userIds: [Int32]) {
		self.totalCount = totalCount
		self.userIds = userIds
	}
}

public indirect enum ChatMemberStatus: FunctionResult, TDEnum {
	case creator(isMember: Bool)
	case administrator(canBeEdited: Bool, canChangeInfo: Bool, canPostMessages: Bool, canEditMessages: Bool, canDeleteMessages: Bool, canInviteUsers: Bool, canRestrictMembers: Bool, canPinMessages: Bool, canPromoteMembers: Bool)
	case member
	case restricted(isMember: Bool, restrictedUntilDate: Int32, canSendMessages: Bool, canSendMediaMessages: Bool, canSendOtherMessages: Bool, canAddWebPagePreviews: Bool)
	case left
	case banned(bannedUntilDate: Int32)
}

public struct ChatMember: Codable, FunctionResult {
	public let userId: Int32
	public let inviterUserId: Int32
	public let joinedChatDate: Int32
	public let status: ChatMemberStatus
	public let botInfo: BotInfo?

	public init(userId: Int32, inviterUserId: Int32, joinedChatDate: Int32, status: ChatMemberStatus, botInfo: BotInfo?) {
		self.userId = userId
		self.inviterUserId = inviterUserId
		self.joinedChatDate = joinedChatDate
		self.status = status
		self.botInfo = botInfo
	}
}

public struct ChatMembers: Codable, FunctionResult {
	public let totalCount: Int32
	public let members: [ChatMember]

	public init(totalCount: Int32, members: [ChatMember]) {
		self.totalCount = totalCount
		self.members = members
	}
}

public indirect enum SupergroupMembersFilter: FunctionResult, TDEnum {
	case recent
	case administrators
	case search(query: String)
	case restricted(query: String)
	case banned(query: String)
	case bots
}

public struct BasicGroup: Codable, FunctionResult {
	public let id: Int32
	public let memberCount: Int32
	public let status: ChatMemberStatus
	public let everyoneIsAdministrator: Bool
	public let isActive: Bool
	public let upgradedToSupergroupId: Int32

	public init(id: Int32, memberCount: Int32, status: ChatMemberStatus, everyoneIsAdministrator: Bool, isActive: Bool, upgradedToSupergroupId: Int32) {
		self.id = id
		self.memberCount = memberCount
		self.status = status
		self.everyoneIsAdministrator = everyoneIsAdministrator
		self.isActive = isActive
		self.upgradedToSupergroupId = upgradedToSupergroupId
	}
}

public struct BasicGroupFullInfo: Codable, FunctionResult {
	public let creatorUserId: Int32
	public let members: [ChatMember]
	public let inviteLink: String

	public init(creatorUserId: Int32, members: [ChatMember], inviteLink: String) {
		self.creatorUserId = creatorUserId
		self.members = members
		self.inviteLink = inviteLink
	}
}

public struct Supergroup: Codable, FunctionResult {
	public let id: Int32
	public let username: String
	public let date: Int32
	public let status: ChatMemberStatus
	public let memberCount: Int32
	public let anyoneCanInvite: Bool
	public let signMessages: Bool
	public let isChannel: Bool
	public let isVerified: Bool
	public let restrictionReason: String

	public init(id: Int32, username: String, date: Int32, status: ChatMemberStatus, memberCount: Int32, anyoneCanInvite: Bool, signMessages: Bool, isChannel: Bool, isVerified: Bool, restrictionReason: String) {
		self.id = id
		self.username = username
		self.date = date
		self.status = status
		self.memberCount = memberCount
		self.anyoneCanInvite = anyoneCanInvite
		self.signMessages = signMessages
		self.isChannel = isChannel
		self.isVerified = isVerified
		self.restrictionReason = restrictionReason
	}
}

public struct SupergroupFullInfo: Codable, FunctionResult {
	public let description: String
	public let memberCount: Int32
	public let administratorCount: Int32
	public let restrictedCount: Int32
	public let bannedCount: Int32
	public let canGetMembers: Bool
	public let canSetUsername: Bool
	public let canSetStickerSet: Bool
	public let isAllHistoryAvailable: Bool
	public let stickerSetId: TDInt64
	public let inviteLink: String
	public let pinnedMessageId: Int53
	public let upgradedFromBasicGroupId: Int32
	public let upgradedFromMaxMessageId: Int53

	public init(description: String, memberCount: Int32, administratorCount: Int32, restrictedCount: Int32, bannedCount: Int32, canGetMembers: Bool, canSetUsername: Bool, canSetStickerSet: Bool, isAllHistoryAvailable: Bool, stickerSetId: TDInt64, inviteLink: String, pinnedMessageId: Int53, upgradedFromBasicGroupId: Int32, upgradedFromMaxMessageId: Int53) {
		self.description = description
		self.memberCount = memberCount
		self.administratorCount = administratorCount
		self.restrictedCount = restrictedCount
		self.bannedCount = bannedCount
		self.canGetMembers = canGetMembers
		self.canSetUsername = canSetUsername
		self.canSetStickerSet = canSetStickerSet
		self.isAllHistoryAvailable = isAllHistoryAvailable
		self.stickerSetId = stickerSetId
		self.inviteLink = inviteLink
		self.pinnedMessageId = pinnedMessageId
		self.upgradedFromBasicGroupId = upgradedFromBasicGroupId
		self.upgradedFromMaxMessageId = upgradedFromMaxMessageId
	}
}

public indirect enum SecretChatState: FunctionResult, TDEnum {
	case pending
	case ready
	case closed
}

public struct SecretChat: Codable, FunctionResult {
	public let id: Int32
	public let userId: Int32
	public let state: SecretChatState
	public let isOutbound: Bool
	public let ttl: Int32
	public let keyHash: Bytes
	public let layer: Int32

	public init(id: Int32, userId: Int32, state: SecretChatState, isOutbound: Bool, ttl: Int32, keyHash: Bytes, layer: Int32) {
		self.id = id
		self.userId = userId
		self.state = state
		self.isOutbound = isOutbound
		self.ttl = ttl
		self.keyHash = keyHash
		self.layer = layer
	}
}

// sourcery: noPrefix = true
public indirect enum MessageForwardInfo: FunctionResult, TDEnum {
	case messageForwardedFromUser(senderUserId: Int32, date: Int32, forwardedFromChatId: Int53, forwardedFromMessageId: Int53)
	case messageForwardedPost(chatId: Int53, authorSignature: String, date: Int32, messageId: Int53, forwardedFromChatId: Int53, forwardedFromMessageId: Int53)
}

public indirect enum MessageSendingState: FunctionResult, TDEnum {
	case pending
	case failed
}

public struct Message: Codable, FunctionResult {
	public let id: Int53
	public let senderUserId: Int32
	public let chatId: Int53
	public let sendingState: MessageSendingState?
	public let isOutgoing: Bool
	public let canBeEdited: Bool
	public let canBeForwarded: Bool
	public let canBeDeletedOnlyForSelf: Bool
	public let canBeDeletedForAllUsers: Bool
	public let isChannelPost: Bool
	public let containsUnreadMention: Bool
	public let date: Int32
	public let editDate: Int32
	public let forwardInfo: MessageForwardInfo?
	public let replyToMessageId: Int53
	public let ttl: Int32
	public let ttlExpiresIn: Double
	public let viaBotUserId: Int32
	public let authorSignature: String
	public let views: Int32
	public let mediaAlbumId: TDInt64
	public let content: MessageContent
	public let replyMarkup: ReplyMarkup?

	public init(id: Int53, senderUserId: Int32, chatId: Int53, sendingState: MessageSendingState?, isOutgoing: Bool, canBeEdited: Bool, canBeForwarded: Bool, canBeDeletedOnlyForSelf: Bool, canBeDeletedForAllUsers: Bool, isChannelPost: Bool, containsUnreadMention: Bool, date: Int32, editDate: Int32, forwardInfo: MessageForwardInfo?, replyToMessageId: Int53, ttl: Int32, ttlExpiresIn: Double, viaBotUserId: Int32, authorSignature: String, views: Int32, mediaAlbumId: TDInt64, content: MessageContent, replyMarkup: ReplyMarkup?) {
		self.id = id
		self.senderUserId = senderUserId
		self.chatId = chatId
		self.sendingState = sendingState
		self.isOutgoing = isOutgoing
		self.canBeEdited = canBeEdited
		self.canBeForwarded = canBeForwarded
		self.canBeDeletedOnlyForSelf = canBeDeletedOnlyForSelf
		self.canBeDeletedForAllUsers = canBeDeletedForAllUsers
		self.isChannelPost = isChannelPost
		self.containsUnreadMention = containsUnreadMention
		self.date = date
		self.editDate = editDate
		self.forwardInfo = forwardInfo
		self.replyToMessageId = replyToMessageId
		self.ttl = ttl
		self.ttlExpiresIn = ttlExpiresIn
		self.viaBotUserId = viaBotUserId
		self.authorSignature = authorSignature
		self.views = views
		self.mediaAlbumId = mediaAlbumId
		self.content = content
		self.replyMarkup = replyMarkup
	}
}

public struct Messages: Codable, FunctionResult {
	public let totalCount: Int32
	public let messages: [Message]?

	public init(totalCount: Int32, messages: [Message]?) {
		self.totalCount = totalCount
		self.messages = messages
	}
}

public struct FoundMessages: Codable, FunctionResult {
	public let messages: [Message]
	public let nextFromSearchId: TDInt64

	public init(messages: [Message], nextFromSearchId: TDInt64) {
		self.messages = messages
		self.nextFromSearchId = nextFromSearchId
	}
}

public indirect enum NotificationSettingsScope: FunctionResult, TDEnum {
	case chat(chatId: Int53)
	case privateChats
	case basicGroupChats
	case allChats
}

public struct NotificationSettings: Codable, FunctionResult {
	public let muteFor: Int32
	public let sound: String
	public let showPreview: Bool

	public init(muteFor: Int32, sound: String, showPreview: Bool) {
		self.muteFor = muteFor
		self.sound = sound
		self.showPreview = showPreview
	}
}

public struct DraftMessage: Codable, FunctionResult {
	public let replyToMessageId: Int53
	public let inputMessageText: InputMessageContent

	public init(replyToMessageId: Int53, inputMessageText: InputMessageContent) {
		self.replyToMessageId = replyToMessageId
		self.inputMessageText = inputMessageText
	}
}

public indirect enum ChatType: FunctionResult, TDEnum {
	case `private`(userId: Int32)
	case basicGroup(basicGroupId: Int32)
	case supergroup(supergroupId: Int32, isChannel: Bool)
	case secret(secretChatId: Int32, userId: Int32)
}

public struct Chat: Codable, FunctionResult {
	public let id: Int53
	public let type: ChatType
	public let title: String
	public let photo: ChatPhoto?
	public let lastMessage: Message?
	public let order: TDInt64
	public let isPinned: Bool
	public let canBeReported: Bool
	public let unreadCount: Int32
	public let lastReadInboxMessageId: Int53
	public let lastReadOutboxMessageId: Int53
	public let unreadMentionCount: Int32
	public let notificationSettings: NotificationSettings
	public let replyMarkupMessageId: Int53
	public let draftMessage: DraftMessage?
	public let clientData: String

	public init(id: Int53, type: ChatType, title: String, photo: ChatPhoto?, lastMessage: Message?, order: TDInt64, isPinned: Bool, canBeReported: Bool, unreadCount: Int32, lastReadInboxMessageId: Int53, lastReadOutboxMessageId: Int53, unreadMentionCount: Int32, notificationSettings: NotificationSettings, replyMarkupMessageId: Int53, draftMessage: DraftMessage?, clientData: String) {
		self.id = id
		self.type = type
		self.title = title
		self.photo = photo
		self.lastMessage = lastMessage
		self.order = order
		self.isPinned = isPinned
		self.canBeReported = canBeReported
		self.unreadCount = unreadCount
		self.lastReadInboxMessageId = lastReadInboxMessageId
		self.lastReadOutboxMessageId = lastReadOutboxMessageId
		self.unreadMentionCount = unreadMentionCount
		self.notificationSettings = notificationSettings
		self.replyMarkupMessageId = replyMarkupMessageId
		self.draftMessage = draftMessage
		self.clientData = clientData
	}
}

public struct Chats: Codable, FunctionResult {
	public let chatIds: [Int53]

	public init(chatIds: [Int53]) {
		self.chatIds = chatIds
	}
}

public struct ChatInviteLink: Codable, FunctionResult {
	public let inviteLink: String

	public init(inviteLink: String) {
		self.inviteLink = inviteLink
	}
}

public struct ChatInviteLinkInfo: Codable, FunctionResult {
	public let chatId: Int53
	public let type: ChatType
	public let title: String
	public let photo: ChatPhoto?
	public let memberCount: Int32
	public let memberUserIds: [Int32]
	public let isPublic: Bool

	public init(chatId: Int53, type: ChatType, title: String, photo: ChatPhoto?, memberCount: Int32, memberUserIds: [Int32], isPublic: Bool) {
		self.chatId = chatId
		self.type = type
		self.title = title
		self.photo = photo
		self.memberCount = memberCount
		self.memberUserIds = memberUserIds
		self.isPublic = isPublic
	}
}

public indirect enum KeyboardButtonType: FunctionResult, TDEnum {
	case text
	case requestPhoneNumber
	case requestLocation
}

public struct KeyboardButton: Codable, FunctionResult {
	public let text: String
	public let type: KeyboardButtonType

	public init(text: String, type: KeyboardButtonType) {
		self.text = text
		self.type = type
	}
}

public indirect enum InlineKeyboardButtonType: FunctionResult, TDEnum {
	case url(url: String)
	case callback(data: Bytes)
	case callbackGame
	case switchInline(query: String, inCurrentChat: Bool)
	case buy
}

public struct InlineKeyboardButton: Codable, FunctionResult {
	public let text: String
	public let type: InlineKeyboardButtonType

	public init(text: String, type: InlineKeyboardButtonType) {
		self.text = text
		self.type = type
	}
}

public indirect enum ReplyMarkup: FunctionResult, TDEnum {
	case removeKeyboard(isPersonal: Bool)
	case forceReply(isPersonal: Bool)
	case showKeyboard(rows: [[KeyboardButton]], resizeKeyboard: Bool, oneTime: Bool, isPersonal: Bool)
	case inlineKeyboard(rows: [[InlineKeyboardButton]])
}

public indirect enum RichText: FunctionResult, TDEnum {
	case plain(text: String)
	case bold(text: RichText)
	case italic(text: RichText)
	case underline(text: RichText)
	case strikethrough(text: RichText)
	case fixed(text: RichText)
	case url(text: RichText, url: String)
	case emailAddress(text: RichText, emailAddress: String)
	case s(texts: [RichText])
}

public indirect enum PageBlock: FunctionResult, TDEnum {
	case title(title: RichText)
	case subtitle(subtitle: RichText)
	case authorDate(author: RichText, publishDate: Int32)
	case header(header: RichText)
	case subheader(subheader: RichText)
	case paragraph(text: RichText)
	case preformatted(text: RichText, language: String)
	case footer(footer: RichText)
	case divider
	case anchor(name: String)
	case list(items: [RichText], isOrdered: Bool)
	case blockQuote(text: RichText, caption: RichText)
	case pullQuote(text: RichText, caption: RichText)
	case animation(animation: Animation?, caption: RichText, needAutoplay: Bool)
	case audio(audio: Audio?, caption: RichText)
	case photo(photo: Photo?, caption: RichText)
	case video(video: Video?, caption: RichText, needAutoplay: Bool, isLooped: Bool)
	case cover(cover: PageBlock)
	case embedded(url: String, html: String, posterPhoto: Photo?, width: Int32, height: Int32, caption: RichText, isFullWidth: Bool, allowScrolling: Bool)
	case embeddedPost(url: String, author: String, authorPhoto: Photo, date: Int32, pageBlocks: [PageBlock], caption: RichText)
	case collage(pageBlocks: [PageBlock], caption: RichText)
	case slideshow(pageBlocks: [PageBlock], caption: RichText)
	case chatLink(title: String, photo: ChatPhoto?, username: String)
}

public struct WebPageInstantView: Codable, FunctionResult {
	public let pageBlocks: [PageBlock]
	public let isFull: Bool

	public init(pageBlocks: [PageBlock], isFull: Bool) {
		self.pageBlocks = pageBlocks
		self.isFull = isFull
	}
}

public struct WebPage: Codable, FunctionResult {
	public let url: String
	public let displayUrl: String
	public let type: String
	public let siteName: String
	public let title: String
	public let description: String
	public let photo: Photo?
	public let embedUrl: String
	public let embedType: String
	public let embedWidth: Int32
	public let embedHeight: Int32
	public let duration: Int32
	public let author: String
	public let animation: Animation?
	public let audio: Audio?
	public let document: Document?
	public let sticker: Sticker?
	public let video: Video?
	public let videoNote: VideoNote?
	public let voiceNote: VoiceNote?
	public let hasInstantView: Bool

	public init(url: String, displayUrl: String, type: String, siteName: String, title: String, description: String, photo: Photo?, embedUrl: String, embedType: String, embedWidth: Int32, embedHeight: Int32, duration: Int32, author: String, animation: Animation?, audio: Audio?, document: Document?, sticker: Sticker?, video: Video?, videoNote: VideoNote?, voiceNote: VoiceNote?, hasInstantView: Bool) {
		self.url = url
		self.displayUrl = displayUrl
		self.type = type
		self.siteName = siteName
		self.title = title
		self.description = description
		self.photo = photo
		self.embedUrl = embedUrl
		self.embedType = embedType
		self.embedWidth = embedWidth
		self.embedHeight = embedHeight
		self.duration = duration
		self.author = author
		self.animation = animation
		self.audio = audio
		self.document = document
		self.sticker = sticker
		self.video = video
		self.videoNote = videoNote
		self.voiceNote = voiceNote
		self.hasInstantView = hasInstantView
	}
}

public struct LabeledPricePart: Codable, FunctionResult {
	public let label: String
	public let amount: Int53

	public init(label: String, amount: Int53) {
		self.label = label
		self.amount = amount
	}
}

public struct Invoice: Codable, FunctionResult {
	public let currency: String
	public let priceParts: [LabeledPricePart]
	public let isTest: Bool
	public let needName: Bool
	public let needPhoneNumber: Bool
	public let needEmailAddress: Bool
	public let needShippingAddress: Bool
	public let sendPhoneNumberToProvider: Bool
	public let sendEmailAddressToProvider: Bool
	public let isFlexible: Bool

	public init(currency: String, priceParts: [LabeledPricePart], isTest: Bool, needName: Bool, needPhoneNumber: Bool, needEmailAddress: Bool, needShippingAddress: Bool, sendPhoneNumberToProvider: Bool, sendEmailAddressToProvider: Bool, isFlexible: Bool) {
		self.currency = currency
		self.priceParts = priceParts
		self.isTest = isTest
		self.needName = needName
		self.needPhoneNumber = needPhoneNumber
		self.needEmailAddress = needEmailAddress
		self.needShippingAddress = needShippingAddress
		self.sendPhoneNumberToProvider = sendPhoneNumberToProvider
		self.sendEmailAddressToProvider = sendEmailAddressToProvider
		self.isFlexible = isFlexible
	}
}

public struct ShippingAddress: Codable, FunctionResult {
	public let countryCode: String
	public let state: String
	public let city: String
	public let streetLine1: String
	public let streetLine2: String
	public let postalCode: String

	public init(countryCode: String, state: String, city: String, streetLine1: String, streetLine2: String, postalCode: String) {
		self.countryCode = countryCode
		self.state = state
		self.city = city
		self.streetLine1 = streetLine1
		self.streetLine2 = streetLine2
		self.postalCode = postalCode
	}
}

public struct OrderInfo: Codable, FunctionResult {
	public let name: String
	public let phoneNumber: String
	public let emailAddress: String
	public let shippingAddress: ShippingAddress?

	public init(name: String, phoneNumber: String, emailAddress: String, shippingAddress: ShippingAddress?) {
		self.name = name
		self.phoneNumber = phoneNumber
		self.emailAddress = emailAddress
		self.shippingAddress = shippingAddress
	}
}

public struct ShippingOption: Codable, FunctionResult {
	public let id: String
	public let title: String
	public let priceParts: [LabeledPricePart]

	public init(id: String, title: String, priceParts: [LabeledPricePart]) {
		self.id = id
		self.title = title
		self.priceParts = priceParts
	}
}

public struct SavedCredentials: Codable, FunctionResult {
	public let id: String
	public let title: String

	public init(id: String, title: String) {
		self.id = id
		self.title = title
	}
}

public indirect enum InputCredentials: FunctionResult, TDEnum {
	case saved(savedCredentialsId: String)
	case new(data: String, allowSave: Bool)
	case androidPay(data: String)
	case applePay(data: String)
}

public struct PaymentsProviderStripe: Codable, FunctionResult {
	public let publishableKey: String
	public let needCountry: Bool
	public let needPostalCode: Bool
	public let needCardholderName: Bool

	public init(publishableKey: String, needCountry: Bool, needPostalCode: Bool, needCardholderName: Bool) {
		self.publishableKey = publishableKey
		self.needCountry = needCountry
		self.needPostalCode = needPostalCode
		self.needCardholderName = needCardholderName
	}
}

public struct PaymentForm: Codable, FunctionResult {
	public let invoice: Invoice
	public let url: String
	public let paymentsProvider: PaymentsProviderStripe?
	public let savedOrderInfo: OrderInfo?
	public let savedCredentials: SavedCredentials?
	public let canSaveCredentials: Bool
	public let needPassword: Bool

	public init(invoice: Invoice, url: String, paymentsProvider: PaymentsProviderStripe?, savedOrderInfo: OrderInfo?, savedCredentials: SavedCredentials?, canSaveCredentials: Bool, needPassword: Bool) {
		self.invoice = invoice
		self.url = url
		self.paymentsProvider = paymentsProvider
		self.savedOrderInfo = savedOrderInfo
		self.savedCredentials = savedCredentials
		self.canSaveCredentials = canSaveCredentials
		self.needPassword = needPassword
	}
}

public struct ValidatedOrderInfo: Codable, FunctionResult {
	public let orderInfoId: String
	public let shippingOptions: [ShippingOption]

	public init(orderInfoId: String, shippingOptions: [ShippingOption]) {
		self.orderInfoId = orderInfoId
		self.shippingOptions = shippingOptions
	}
}

public struct PaymentResult: Codable, FunctionResult {
	public let success: Bool
	public let verificationUrl: String

	public init(success: Bool, verificationUrl: String) {
		self.success = success
		self.verificationUrl = verificationUrl
	}
}

public struct PaymentReceipt: Codable, FunctionResult {
	public let date: Int32
	public let paymentsProviderUserId: Int32
	public let invoice: Invoice
	public let orderInfo: OrderInfo?
	public let shippingOption: ShippingOption?
	public let credentialsTitle: String

	public init(date: Int32, paymentsProviderUserId: Int32, invoice: Invoice, orderInfo: OrderInfo?, shippingOption: ShippingOption?, credentialsTitle: String) {
		self.date = date
		self.paymentsProviderUserId = paymentsProviderUserId
		self.invoice = invoice
		self.orderInfo = orderInfo
		self.shippingOption = shippingOption
		self.credentialsTitle = credentialsTitle
	}
}

// sourcery: noPrefix = true
public indirect enum MessageContent: FunctionResult, TDEnum {
	case messageText(text: FormattedText, webPage: WebPage?)
	case messageAnimation(animation: Animation, caption: FormattedText, isSecret: Bool)
	case messageAudio(audio: Audio, caption: FormattedText)
	case messageDocument(document: Document, caption: FormattedText)
	case messagePhoto(photo: Photo, caption: FormattedText, isSecret: Bool)
	case messageExpiredPhoto
	case messageSticker(sticker: Sticker)
	case messageVideo(video: Video, caption: FormattedText, isSecret: Bool)
	case messageExpiredVideo
	case messageVideoNote(videoNote: VideoNote, isViewed: Bool, isSecret: Bool)
	case messageVoiceNote(voiceNote: VoiceNote, caption: FormattedText, isListened: Bool)
	case messageLocation(location: Location, livePeriod: Int32, expiresIn: Int32)
	case messageVenue(venue: Venue)
	case messageContact(contact: Contact)
	case messageGame(game: Game)
	case messageInvoice(title: String, description: String, photo: Photo?, currency: String, totalAmount: Int53, startParameter: String, isTest: Bool, needShippingAddress: Bool, receiptMessageId: Int53)
	case messageCall(discardReason: CallDiscardReason, duration: Int32)
	case messageBasicGroupChatCreate(title: String, memberUserIds: [Int32])
	case messageSupergroupChatCreate(title: String)
	case messageChatChangeTitle(title: String)
	case messageChatChangePhoto(photo: Photo)
	case messageChatDeletePhoto
	case messageChatAddMembers(memberUserIds: [Int32])
	case messageChatJoinByLink
	case messageChatDeleteMember(userId: Int32)
	case messageChatUpgradeTo(supergroupId: Int32)
	case messageChatUpgradeFrom(title: String, basicGroupId: Int32)
	case messagePinMessage(messageId: Int53)
	case messageScreenshotTaken
	case messageChatSetTtl(ttl: Int32)
	case messageCustomServiceAction(text: String)
	case messageGameScore(gameMessageId: Int53, gameId: TDInt64, score: Int32)
	case messagePaymentSuccessful(invoiceMessageId: Int53, currency: String, totalAmount: Int53)
	case messagePaymentSuccessfulBot(invoiceMessageId: Int53, currency: String, totalAmount: Int53, invoicePayload: Bytes, shippingOptionId: String, orderInfo: OrderInfo?, telegramPaymentChargeId: String, providerPaymentChargeId: String)
	case messageContactRegistered
	case messageWebsiteConnected(domainName: String)
	case messageUnsupported
}

public indirect enum TextEntityType: FunctionResult, TDEnum {
	case mention
	case hashtag
	case cashtag
	case botCommand
	case url
	case emailAddress
	case bold
	case italic
	case code
	case pre
	case preCode(language: String)
	case textUrl(url: String)
	case mentionName(userId: Int32)
	case phoneNumber
}

public struct InputThumbnail: Codable, FunctionResult {
	public let thumbnail: InputFile
	public let width: Int32
	public let height: Int32

	public init(thumbnail: InputFile, width: Int32, height: Int32) {
		self.thumbnail = thumbnail
		self.width = width
		self.height = height
	}
}

// sourcery: noPrefix = true
public indirect enum InputMessageContent: FunctionResult, TDEnum {
	case inputMessageText(text: FormattedText, disableWebPagePreview: Bool, clearDraft: Bool)
	case inputMessageAnimation(animation: InputFile, thumbnail: InputThumbnail, duration: Int32, width: Int32, height: Int32, caption: FormattedText)
	case inputMessageAudio(audio: InputFile, albumCoverThumbnail: InputThumbnail, duration: Int32, title: String, performer: String, caption: FormattedText)
	case inputMessageDocument(document: InputFile, thumbnail: InputThumbnail, caption: FormattedText)
	case inputMessagePhoto(photo: InputFile, thumbnail: InputThumbnail, addedStickerFileIds: [Int32], width: Int32, height: Int32, caption: FormattedText, ttl: Int32)
	case inputMessageSticker(sticker: InputFile, thumbnail: InputThumbnail, width: Int32, height: Int32)
	case inputMessageVideo(video: InputFile, thumbnail: InputThumbnail, addedStickerFileIds: [Int32], duration: Int32, width: Int32, height: Int32, supportsStreaming: Bool, caption: FormattedText, ttl: Int32)
	case inputMessageVideoNote(videoNote: InputFile, thumbnail: InputThumbnail, duration: Int32, length: Int32)
	case inputMessageVoiceNote(voiceNote: InputFile, duration: Int32, waveform: Bytes, caption: FormattedText)
	case inputMessageLocation(location: Location, livePeriod: Int32)
	case inputMessageVenue(venue: Venue)
	case inputMessageContact(contact: Contact)
	case inputMessageGame(botUserId: Int32, gameShortName: String)
	case inputMessageInvoice(invoice: Invoice, title: String, description: String, photoUrl: String, photoSize: Int32, photoWidth: Int32, photoHeight: Int32, payload: Bytes, providerToken: String, providerData: String, startParameter: String)
	case inputMessageForwarded(fromChatId: Int53, messageId: Int53, inGameShare: Bool)
}

public indirect enum SearchMessagesFilter: FunctionResult, TDEnum {
	case empty
	case animation
	case audio
	case document
	case photo
	case video
	case voiceNote
	case photoAndVideo
	case url
	case chatPhoto
	case call
	case missedCall
	case videoNote
	case voiceAndVideoNote
	case mention
	case unreadMention
}

public indirect enum ChatAction: FunctionResult, TDEnum {
	case typing
	case recordingVideo
	case uploadingVideo(progress: Int32)
	case recordingVoiceNote
	case uploadingVoiceNote(progress: Int32)
	case uploadingPhoto(progress: Int32)
	case uploadingDocument(progress: Int32)
	case choosingLocation
	case choosingContact
	case startPlayingGame
	case recordingVideoNote
	case uploadingVideoNote(progress: Int32)
	case cancel
}

public indirect enum UserStatus: FunctionResult, TDEnum {
	case empty
	case online(expires: Int32)
	case offline(wasOnline: Int32)
	case recently
	case lastWeek
	case lastMonth
}

public struct Stickers: Codable, FunctionResult {
	public let stickers: [Sticker]

	public init(stickers: [Sticker]) {
		self.stickers = stickers
	}
}

public struct StickerEmojis: Codable, FunctionResult {
	public let emojis: [String]

	public init(emojis: [String]) {
		self.emojis = emojis
	}
}

public struct StickerSet: Codable, FunctionResult {
	public let id: TDInt64
	public let title: String
	public let name: String
	public let isInstalled: Bool
	public let isArchived: Bool
	public let isOfficial: Bool
	public let isMasks: Bool
	public let isViewed: Bool
	public let stickers: [Sticker]
	public let emojis: [StickerEmojis]

	public init(id: TDInt64, title: String, name: String, isInstalled: Bool, isArchived: Bool, isOfficial: Bool, isMasks: Bool, isViewed: Bool, stickers: [Sticker], emojis: [StickerEmojis]) {
		self.id = id
		self.title = title
		self.name = name
		self.isInstalled = isInstalled
		self.isArchived = isArchived
		self.isOfficial = isOfficial
		self.isMasks = isMasks
		self.isViewed = isViewed
		self.stickers = stickers
		self.emojis = emojis
	}
}

public struct StickerSetInfo: Codable, FunctionResult {
	public let id: TDInt64
	public let title: String
	public let name: String
	public let isInstalled: Bool
	public let isArchived: Bool
	public let isOfficial: Bool
	public let isMasks: Bool
	public let isViewed: Bool
	public let size: Int32
	public let covers: [Sticker]

	public init(id: TDInt64, title: String, name: String, isInstalled: Bool, isArchived: Bool, isOfficial: Bool, isMasks: Bool, isViewed: Bool, size: Int32, covers: [Sticker]) {
		self.id = id
		self.title = title
		self.name = name
		self.isInstalled = isInstalled
		self.isArchived = isArchived
		self.isOfficial = isOfficial
		self.isMasks = isMasks
		self.isViewed = isViewed
		self.size = size
		self.covers = covers
	}
}

public struct StickerSets: Codable, FunctionResult {
	public let totalCount: Int32
	public let sets: [StickerSetInfo]

	public init(totalCount: Int32, sets: [StickerSetInfo]) {
		self.totalCount = totalCount
		self.sets = sets
	}
}

public indirect enum CallDiscardReason: FunctionResult, TDEnum {
	case empty
	case missed
	case declined
	case disconnected
	case hungUp
}

public struct CallProtocol: Codable, FunctionResult {
	public let udpP2p: Bool
	public let udpReflector: Bool
	public let minLayer: Int32
	public let maxLayer: Int32

	public init(udpP2p: Bool, udpReflector: Bool, minLayer: Int32, maxLayer: Int32) {
		self.udpP2p = udpP2p
		self.udpReflector = udpReflector
		self.minLayer = minLayer
		self.maxLayer = maxLayer
	}
}

public struct CallConnection: Codable, FunctionResult {
	public let id: TDInt64
	public let ip: String
	public let ipv6: String
	public let port: Int32
	public let peerTag: Bytes

	public init(id: TDInt64, ip: String, ipv6: String, port: Int32, peerTag: Bytes) {
		self.id = id
		self.ip = ip
		self.ipv6 = ipv6
		self.port = port
		self.peerTag = peerTag
	}
}

public struct CallId: Codable, FunctionResult {
	public let id: Int32

	public init(id: Int32) {
		self.id = id
	}
}

public indirect enum CallState: FunctionResult, TDEnum {
	case pending(isCreated: Bool, isReceived: Bool)
	case exchangingKeys
	case ready(protocol: CallProtocol, connections: [CallConnection], config: String, encryptionKey: Bytes, emojis: [String])
	case hangingUp
	case discarded(reason: CallDiscardReason, needRating: Bool, needDebugInformation: Bool)
	case error(error: Error)
}

public struct Call: Codable, FunctionResult {
	public let id: Int32
	public let userId: Int32
	public let isOutgoing: Bool
	public let state: CallState

	public init(id: Int32, userId: Int32, isOutgoing: Bool, state: CallState) {
		self.id = id
		self.userId = userId
		self.isOutgoing = isOutgoing
		self.state = state
	}
}

public struct Animations: Codable, FunctionResult {
	public let animations: [Animation]

	public init(animations: [Animation]) {
		self.animations = animations
	}
}

public struct ImportedContacts: Codable, FunctionResult {
	public let userIds: [Int32]
	public let importerCount: [Int32]

	public init(userIds: [Int32], importerCount: [Int32]) {
		self.userIds = userIds
		self.importerCount = importerCount
	}
}

public indirect enum InputInlineQueryResult: FunctionResult, TDEnum {
	case animatedGif(id: String, title: String, thumbnailUrl: String, gifUrl: String, gifDuration: Int32, gifWidth: Int32, gifHeight: Int32, replyMarkup: ReplyMarkup, inputMessageContent: InputMessageContent)
	case animatedMpeg4(id: String, title: String, thumbnailUrl: String, mpeg4Url: String, mpeg4Duration: Int32, mpeg4Width: Int32, mpeg4Height: Int32, replyMarkup: ReplyMarkup, inputMessageContent: InputMessageContent)
	case article(id: String, url: String, hideUrl: Bool, title: String, description: String, thumbnailUrl: String, thumbnailWidth: Int32, thumbnailHeight: Int32, replyMarkup: ReplyMarkup, inputMessageContent: InputMessageContent)
	case audio(id: String, title: String, performer: String, audioUrl: String, audioDuration: Int32, replyMarkup: ReplyMarkup, inputMessageContent: InputMessageContent)
	case contact(id: String, contact: Contact, thumbnailUrl: String, thumbnailWidth: Int32, thumbnailHeight: Int32, replyMarkup: ReplyMarkup, inputMessageContent: InputMessageContent)
	case document(id: String, title: String, description: String, documentUrl: String, mimeType: String, thumbnailUrl: String, thumbnailWidth: Int32, thumbnailHeight: Int32, replyMarkup: ReplyMarkup, inputMessageContent: InputMessageContent)
	case game(id: String, gameShortName: String, replyMarkup: ReplyMarkup)
	case location(id: String, location: Location, livePeriod: Int32, title: String, thumbnailUrl: String, thumbnailWidth: Int32, thumbnailHeight: Int32, replyMarkup: ReplyMarkup, inputMessageContent: InputMessageContent)
	case photo(id: String, title: String, description: String, thumbnailUrl: String, photoUrl: String, photoWidth: Int32, photoHeight: Int32, replyMarkup: ReplyMarkup, inputMessageContent: InputMessageContent)
	case sticker(id: String, thumbnailUrl: String, stickerUrl: String, stickerWidth: Int32, stickerHeight: Int32, replyMarkup: ReplyMarkup, inputMessageContent: InputMessageContent)
	case venue(id: String, venue: Venue, thumbnailUrl: String, thumbnailWidth: Int32, thumbnailHeight: Int32, replyMarkup: ReplyMarkup, inputMessageContent: InputMessageContent)
	case video(id: String, title: String, description: String, thumbnailUrl: String, videoUrl: String, mimeType: String, videoWidth: Int32, videoHeight: Int32, videoDuration: Int32, replyMarkup: ReplyMarkup, inputMessageContent: InputMessageContent)
	case voiceNote(id: String, title: String, voiceNoteUrl: String, voiceNoteDuration: Int32, replyMarkup: ReplyMarkup, inputMessageContent: InputMessageContent)
}

public indirect enum InlineQueryResult: FunctionResult, TDEnum {
	case article(id: String, url: String, hideUrl: Bool, title: String, description: String, thumbnail: PhotoSize?)
	case contact(id: String, contact: Contact, thumbnail: PhotoSize?)
	case location(id: String, location: Location, title: String, thumbnail: PhotoSize?)
	case venue(id: String, venue: Venue, thumbnail: PhotoSize?)
	case game(id: String, game: Game)
	case animation(id: String, animation: Animation, title: String)
	case audio(id: String, audio: Audio)
	case document(id: String, document: Document, title: String, description: String)
	case photo(id: String, photo: Photo, title: String, description: String)
	case sticker(id: String, sticker: Sticker)
	case video(id: String, video: Video, title: String, description: String)
	case voiceNote(id: String, voiceNote: VoiceNote, title: String)
}

public struct InlineQueryResults: Codable, FunctionResult {
	public let inlineQueryId: TDInt64
	public let nextOffset: String
	public let results: [InlineQueryResult]
	public let switchPmText: String
	public let switchPmParameter: String

	public init(inlineQueryId: TDInt64, nextOffset: String, results: [InlineQueryResult], switchPmText: String, switchPmParameter: String) {
		self.inlineQueryId = inlineQueryId
		self.nextOffset = nextOffset
		self.results = results
		self.switchPmText = switchPmText
		self.switchPmParameter = switchPmParameter
	}
}

public indirect enum CallbackQueryPayload: FunctionResult, TDEnum {
	case data(data: Bytes)
	case game(gameShortName: String)
}

public struct CallbackQueryAnswer: Codable, FunctionResult {
	public let text: String
	public let showAlert: Bool
	public let url: String

	public init(text: String, showAlert: Bool, url: String) {
		self.text = text
		self.showAlert = showAlert
		self.url = url
	}
}

public struct CustomRequestResult: Codable, FunctionResult {
	public let result: String

	public init(result: String) {
		self.result = result
	}
}

public struct GameHighScore: Codable, FunctionResult {
	public let position: Int32
	public let userId: Int32
	public let score: Int32

	public init(position: Int32, userId: Int32, score: Int32) {
		self.position = position
		self.userId = userId
		self.score = score
	}
}

public struct GameHighScores: Codable, FunctionResult {
	public let scores: [GameHighScore]

	public init(scores: [GameHighScore]) {
		self.scores = scores
	}
}

// sourcery: noPrefix = true
public indirect enum ChatEventAction: FunctionResult, TDEnum {
	case chatEventMessageEdited(oldMessage: Message, newMessage: Message)
	case chatEventMessageDeleted(message: Message)
	case chatEventMessagePinned(message: Message)
	case chatEventMessageUnpinned
	case chatEventMemberJoined
	case chatEventMemberLeft
	case chatEventMemberInvited(userId: Int32, status: ChatMemberStatus)
	case chatEventMemberPromoted(userId: Int32, oldStatus: ChatMemberStatus, newStatus: ChatMemberStatus)
	case chatEventMemberRestricted(userId: Int32, oldStatus: ChatMemberStatus, newStatus: ChatMemberStatus)
	case chatEventTitleChanged(oldTitle: String, newTitle: String)
	case chatEventDescriptionChanged(oldDescription: String, newDescription: String)
	case chatEventUsernameChanged(oldUsername: String, newUsername: String)
	case chatEventPhotoChanged(oldPhoto: ChatPhoto?, newPhoto: ChatPhoto?)
	case chatEventInvitesToggled(anyoneCanInvite: Bool)
	case chatEventSignMessagesToggled(signMessages: Bool)
	case chatEventStickerSetChanged(oldStickerSetId: TDInt64, newStickerSetId: TDInt64)
	case chatEventIsAllHistoryAvailableToggled(isAllHistoryAvailable: Bool)
}

public struct ChatEvent: Codable, FunctionResult {
	public let id: TDInt64
	public let date: Int32
	public let userId: Int32
	public let action: ChatEventAction

	public init(id: TDInt64, date: Int32, userId: Int32, action: ChatEventAction) {
		self.id = id
		self.date = date
		self.userId = userId
		self.action = action
	}
}

public struct ChatEvents: Codable, FunctionResult {
	public let events: [ChatEvent]

	public init(events: [ChatEvent]) {
		self.events = events
	}
}

public struct ChatEventLogFilters: Codable, FunctionResult {
	public let messageEdits: Bool
	public let messageDeletions: Bool
	public let messagePins: Bool
	public let memberJoins: Bool
	public let memberLeaves: Bool
	public let memberInvites: Bool
	public let memberPromotions: Bool
	public let memberRestrictions: Bool
	public let infoChanges: Bool
	public let settingChanges: Bool

	public init(messageEdits: Bool, messageDeletions: Bool, messagePins: Bool, memberJoins: Bool, memberLeaves: Bool, memberInvites: Bool, memberPromotions: Bool, memberRestrictions: Bool, infoChanges: Bool, settingChanges: Bool) {
		self.messageEdits = messageEdits
		self.messageDeletions = messageDeletions
		self.messagePins = messagePins
		self.memberJoins = memberJoins
		self.memberLeaves = memberLeaves
		self.memberInvites = memberInvites
		self.memberPromotions = memberPromotions
		self.memberRestrictions = memberRestrictions
		self.infoChanges = infoChanges
		self.settingChanges = settingChanges
	}
}

public indirect enum DeviceToken: FunctionResult, TDEnum {
	case googleCloudMessaging(token: String)
	case applePush(deviceToken: String, isAppSandbox: Bool)
	case applePushVoIP(deviceToken: String, isAppSandbox: Bool)
	case windowsPush(accessToken: String)
	case microsoftPush(channelUri: String)
	case microsoftPushVoIP(channelUri: String)
	case webPush(endpoint: String, p256dhBase64url: String, authBase64url: String)
	case simplePush(endpoint: String)
	case ubuntuPush(token: String)
	case blackBerryPush(token: String)
	case tizenPush(regId: String)
}

public struct Wallpaper: Codable, FunctionResult {
	public let id: Int32
	public let sizes: [PhotoSize]
	public let color: Int32

	public init(id: Int32, sizes: [PhotoSize], color: Int32) {
		self.id = id
		self.sizes = sizes
		self.color = color
	}
}

public struct Wallpapers: Codable, FunctionResult {
	public let wallpapers: [Wallpaper]

	public init(wallpapers: [Wallpaper]) {
		self.wallpapers = wallpapers
	}
}

public struct Hashtags: Codable, FunctionResult {
	public let hashtags: [String]

	public init(hashtags: [String]) {
		self.hashtags = hashtags
	}
}

public indirect enum CheckChatUsernameResult: FunctionResult, TDEnum {
	case ok
	case usernameInvalid
	case usernameOccupied
	case publicChatsTooMuch
	case publicGroupsUnavailable
}

public indirect enum OptionValue: FunctionResult, TDEnum {
	case boolean(value: Bool)
	case empty
	case integer(value: Int32)
	case string(value: String)
}

public indirect enum UserPrivacySettingRule: FunctionResult, TDEnum {
	case allowAll
	case allowContacts
	case allowUsers(userIds: [Int32])
	case restrictAll
	case restrictContacts
	case restrictUsers(userIds: [Int32])
}

public struct UserPrivacySettingRules: Codable, FunctionResult {
	public let rules: [UserPrivacySettingRule]

	public init(rules: [UserPrivacySettingRule]) {
		self.rules = rules
	}
}

public indirect enum UserPrivacySetting: FunctionResult, TDEnum {
	case showStatus
	case allowChatInvites
	case allowCalls
}

public struct AccountTtl: Codable, FunctionResult {
	public let days: Int32

	public init(days: Int32) {
		self.days = days
	}
}

public struct Session: Codable, FunctionResult {
	public let id: TDInt64
	public let isCurrent: Bool
	public let apiId: Int32
	public let applicationName: String
	public let applicationVersion: String
	public let isOfficialApplication: Bool
	public let deviceModel: String
	public let platform: String
	public let systemVersion: String
	public let logInDate: Int32
	public let lastActiveDate: Int32
	public let ip: String
	public let country: String
	public let region: String

	public init(id: TDInt64, isCurrent: Bool, apiId: Int32, applicationName: String, applicationVersion: String, isOfficialApplication: Bool, deviceModel: String, platform: String, systemVersion: String, logInDate: Int32, lastActiveDate: Int32, ip: String, country: String, region: String) {
		self.id = id
		self.isCurrent = isCurrent
		self.apiId = apiId
		self.applicationName = applicationName
		self.applicationVersion = applicationVersion
		self.isOfficialApplication = isOfficialApplication
		self.deviceModel = deviceModel
		self.platform = platform
		self.systemVersion = systemVersion
		self.logInDate = logInDate
		self.lastActiveDate = lastActiveDate
		self.ip = ip
		self.country = country
		self.region = region
	}
}

public struct Sessions: Codable, FunctionResult {
	public let sessions: [Session]

	public init(sessions: [Session]) {
		self.sessions = sessions
	}
}

public struct ConnectedWebsite: Codable, FunctionResult {
	public let id: TDInt64
	public let domainName: String
	public let botUserId: Int32
	public let browser: String
	public let platform: String
	public let logInDate: Int32
	public let lastActiveDate: Int32
	public let ip: String
	public let location: String

	public init(id: TDInt64, domainName: String, botUserId: Int32, browser: String, platform: String, logInDate: Int32, lastActiveDate: Int32, ip: String, location: String) {
		self.id = id
		self.domainName = domainName
		self.botUserId = botUserId
		self.browser = browser
		self.platform = platform
		self.logInDate = logInDate
		self.lastActiveDate = lastActiveDate
		self.ip = ip
		self.location = location
	}
}

public struct ConnectedWebsites: Codable, FunctionResult {
	public let websites: [ConnectedWebsite]

	public init(websites: [ConnectedWebsite]) {
		self.websites = websites
	}
}

public struct ChatReportSpamState: Codable, FunctionResult {
	public let canReportSpam: Bool

	public init(canReportSpam: Bool) {
		self.canReportSpam = canReportSpam
	}
}

public indirect enum ChatReportReason: FunctionResult, TDEnum {
	case spam
	case violence
	case pornography
	case custom(text: String)
}

public struct PublicMessageLink: Codable, FunctionResult {
	public let link: String
	public let html: String

	public init(link: String, html: String) {
		self.link = link
		self.html = html
	}
}

public indirect enum FileType: FunctionResult, TDEnum {
	case none
	case animation
	case audio
	case document
	case photo
	case profilePhoto
	case secret
	case sticker
	case thumbnail
	case unknown
	case video
	case videoNote
	case voiceNote
	case wallpaper
	case secretThumbnail
}

public struct StorageStatisticsByFileType: Codable, FunctionResult {
	public let fileType: FileType
	public let size: Int53
	public let count: Int32

	public init(fileType: FileType, size: Int53, count: Int32) {
		self.fileType = fileType
		self.size = size
		self.count = count
	}
}

public struct StorageStatisticsByChat: Codable, FunctionResult {
	public let chatId: Int53
	public let size: Int53
	public let count: Int32
	public let byFileType: [StorageStatisticsByFileType]

	public init(chatId: Int53, size: Int53, count: Int32, byFileType: [StorageStatisticsByFileType]) {
		self.chatId = chatId
		self.size = size
		self.count = count
		self.byFileType = byFileType
	}
}

public struct StorageStatistics: Codable, FunctionResult {
	public let size: Int53
	public let count: Int32
	public let byChat: [StorageStatisticsByChat]

	public init(size: Int53, count: Int32, byChat: [StorageStatisticsByChat]) {
		self.size = size
		self.count = count
		self.byChat = byChat
	}
}

public struct StorageStatisticsFast: Codable, FunctionResult {
	public let filesSize: Int53
	public let fileCount: Int32
	public let databaseSize: Int53

	public init(filesSize: Int53, fileCount: Int32, databaseSize: Int53) {
		self.filesSize = filesSize
		self.fileCount = fileCount
		self.databaseSize = databaseSize
	}
}

public indirect enum NetworkType: FunctionResult, TDEnum {
	case none
	case mobile
	case mobileRoaming
	case wiFi
	case other
}

public indirect enum NetworkStatisticsEntry: FunctionResult, TDEnum {
	case file(fileType: FileType, networkType: NetworkType, sentBytes: Int53, receivedBytes: Int53)
	case call(networkType: NetworkType, sentBytes: Int53, receivedBytes: Int53, duration: Double)
}

public struct NetworkStatistics: Codable, FunctionResult {
	public let sinceDate: Int32
	public let entries: [NetworkStatisticsEntry]

	public init(sinceDate: Int32, entries: [NetworkStatisticsEntry]) {
		self.sinceDate = sinceDate
		self.entries = entries
	}
}

public indirect enum ConnectionState: FunctionResult, TDEnum {
	case waitingForNetwork
	case connectingToProxy
	case connecting
	case updating
	case ready
}

public indirect enum TopChatCategory: FunctionResult, TDEnum {
	case users
	case bots
	case groups
	case channels
	case inlineBots
	case calls
}

public indirect enum TMeUrlType: FunctionResult, TDEnum {
	case user(userId: Int32)
	case supergroup(supergroupId: Int53)
	case chatInvite(info: ChatInviteLinkInfo)
	case stickerSet(stickerSetId: TDInt64)
}

public struct TMeUrl: Codable, FunctionResult {
	public let url: String
	public let type: TMeUrlType

	public init(url: String, type: TMeUrlType) {
		self.url = url
		self.type = type
	}
}

public struct TMeUrls: Codable, FunctionResult {
	public let urls: [TMeUrl]

	public init(urls: [TMeUrl]) {
		self.urls = urls
	}
}

public struct Count: Codable, FunctionResult {
	public let count: Int32

	public init(count: Int32) {
		self.count = count
	}
}

public struct Text: Codable, FunctionResult {
	public let text: String

	public init(text: String) {
		self.text = text
	}
}

public indirect enum TextParseMode: FunctionResult, TDEnum {
	case markdown
	case hTML
}

public indirect enum Proxy: FunctionResult, TDEnum {
	case empty
	case socks5(server: String, port: Int32, username: String, password: String)
}

public struct InputSticker: Codable, FunctionResult {
	public let pngSticker: InputFile
	public let emojis: String
	public let maskPosition: MaskPosition?

	public init(pngSticker: InputFile, emojis: String, maskPosition: MaskPosition?) {
		self.pngSticker = pngSticker
		self.emojis = emojis
		self.maskPosition = maskPosition
	}
}

public indirect enum Update: FunctionResult, TDEnum {
	case authorizationState(authorizationState: AuthorizationState)
	case newMessage(message: Message, disableNotification: Bool, containsMention: Bool)
	case messageSendAcknowledged(chatId: Int53, messageId: Int53)
	case messageSendSucceeded(message: Message, oldMessageId: Int53)
	case messageSendFailed(message: Message, oldMessageId: Int53, errorCode: Int32, errorMessage: String)
	case messageContent(chatId: Int53, messageId: Int53, newContent: MessageContent)
	case messageEdited(chatId: Int53, messageId: Int53, editDate: Int32, replyMarkup: ReplyMarkup?)
	case messageViews(chatId: Int53, messageId: Int53, views: Int32)
	case messageContentOpened(chatId: Int53, messageId: Int53)
	case messageMentionRead(chatId: Int53, messageId: Int53, unreadMentionCount: Int32)
	case newChat(chat: Chat)
	case chatTitle(chatId: Int53, title: String)
	case chatPhoto(chatId: Int53, photo: ChatPhoto?)
	case chatLastMessage(chatId: Int53, lastMessage: Message?, order: TDInt64)
	case chatOrder(chatId: Int53, order: TDInt64)
	case chatIsPinned(chatId: Int53, isPinned: Bool, order: TDInt64)
	case chatReadInbox(chatId: Int53, lastReadInboxMessageId: Int53, unreadCount: Int32)
	case chatReadOutbox(chatId: Int53, lastReadOutboxMessageId: Int53)
	case chatUnreadMentionCount(chatId: Int53, unreadMentionCount: Int32)
	case notificationSettings(scope: NotificationSettingsScope, notificationSettings: NotificationSettings)
	case chatReplyMarkup(chatId: Int53, replyMarkupMessageId: Int53)
	case chatDraftMessage(chatId: Int53, draftMessage: DraftMessage?, order: TDInt64)
	case deleteMessages(chatId: Int53, messageIds: [Int53], isPermanent: Bool, fromCache: Bool)
	case userChatAction(chatId: Int53, userId: Int32, action: ChatAction)
	case userStatus(userId: Int32, status: UserStatus)
	case user(user: User)
	case basicGroup(basicGroup: BasicGroup)
	case supergroup(supergroup: Supergroup)
	case secretChat(secretChat: SecretChat)
	case userFullInfo(userId: Int32, userFullInfo: UserFullInfo)
	case basicGroupFullInfo(basicGroupId: Int32, basicGroupFullInfo: BasicGroupFullInfo)
	case supergroupFullInfo(supergroupId: Int32, supergroupFullInfo: SupergroupFullInfo)
	case serviceNotification(type: String, content: MessageContent)
	case file(file: File)
	case fileGenerationStart(generationId: TDInt64, originalPath: String, destinationPath: String, conversion: String)
	case fileGenerationStop(generationId: TDInt64)
	case call(call: Call)
	case userPrivacySettingRules(setting: UserPrivacySetting, rules: UserPrivacySettingRules)
	case unreadMessageCount(unreadCount: Int32, unreadUnmutedCount: Int32)
	case option(name: String, value: OptionValue)
	case installedStickerSets(isMasks: Bool, stickerSetIds: [Int64])
	case trendingStickerSets(stickerSets: StickerSets)
	case recentStickers(isAttached: Bool, stickerIds: [Int32])
	case favoriteStickers(stickerIds: [Int32])
	case savedAnimations(animationIds: [Int32])
	case connectionState(state: ConnectionState)
	case newInlineQuery(id: TDInt64, senderUserId: Int32, userLocation: Location?, query: String, offset: String)
	case newChosenInlineResult(senderUserId: Int32, userLocation: Location?, query: String, resultId: String, inlineMessageId: String)
	case newCallbackQuery(id: TDInt64, senderUserId: Int32, chatId: Int53, messageId: Int53, chatInstance: TDInt64, payload: CallbackQueryPayload)
	case newInlineCallbackQuery(id: TDInt64, senderUserId: Int32, inlineMessageId: String, chatInstance: TDInt64, payload: CallbackQueryPayload)
	case newShippingQuery(id: TDInt64, senderUserId: Int32, invoicePayload: String, shippingAddress: ShippingAddress)
	case newPreCheckoutQuery(id: TDInt64, senderUserId: Int32, currency: String, totalAmount: Int53, invoicePayload: Bytes, shippingOptionId: String, orderInfo: OrderInfo?)
	case newCustomEvent(event: String)
	case newCustomQuery(id: TDInt64, data: String, timeout: Int32)
}

public struct TestInt: Codable, FunctionResult {
	public let value: Int32

	public init(value: Int32) {
		self.value = value
	}
}

public struct TestString: Codable, FunctionResult {
	public let value: String

	public init(value: String) {
		self.value = value
	}
}

public struct TestBytes: Codable, FunctionResult {
	public let value: Bytes

	public init(value: Bytes) {
		self.value = value
	}
}

public struct TestVectorInt: Codable, FunctionResult {
	public let value: [Int32]

	public init(value: [Int32]) {
		self.value = value
	}
}

public struct TestVectorIntObject: Codable, FunctionResult {
	public let value: [TestInt]

	public init(value: [TestInt]) {
		self.value = value
	}
}

public struct TestVectorString: Codable, FunctionResult {
	public let value: [String]

	public init(value: [String]) {
		self.value = value
	}
}

public struct TestVectorStringObject: Codable, FunctionResult {
	public let value: [TestString]

	public init(value: [TestString]) {
		self.value = value
	}
}

public struct GetAuthorizationState: Codable, TDFunction {
	public typealias Result = AuthorizationState

	public init() {
	}
}

public struct SetTdlibParameters: Codable, TDFunction {
	public typealias Result = Ok
	public let parameters: TdlibParameters

	public init(parameters: TdlibParameters) {
		self.parameters = parameters
	}
}

public struct CheckDatabaseEncryptionKey: Codable, TDFunction {
	public typealias Result = Ok
	public let encryptionKey: Bytes

	public init(encryptionKey: Bytes) {
		self.encryptionKey = encryptionKey
	}
}

public struct SetAuthenticationPhoneNumber: Codable, TDFunction {
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

public struct ResendAuthenticationCode: Codable, TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct CheckAuthenticationCode: Codable, TDFunction {
	public typealias Result = Ok
	public let code: String
	public let firstName: String
	public let lastName: String

	public init(code: String, firstName: String, lastName: String) {
		self.code = code
		self.firstName = firstName
		self.lastName = lastName
	}
}

public struct CheckAuthenticationPassword: Codable, TDFunction {
	public typealias Result = Ok
	public let password: String

	public init(password: String) {
		self.password = password
	}
}

public struct RequestAuthenticationPasswordRecovery: Codable, TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct RecoverAuthenticationPassword: Codable, TDFunction {
	public typealias Result = Ok
	public let recoveryCode: String

	public init(recoveryCode: String) {
		self.recoveryCode = recoveryCode
	}
}

public struct CheckAuthenticationBotToken: Codable, TDFunction {
	public typealias Result = Ok
	public let token: String

	public init(token: String) {
		self.token = token
	}
}

public struct LogOut: Codable, TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct Close: Codable, TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct Destroy: Codable, TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct SetDatabaseEncryptionKey: Codable, TDFunction {
	public typealias Result = Ok
	public let newEncryptionKey: Bytes

	public init(newEncryptionKey: Bytes) {
		self.newEncryptionKey = newEncryptionKey
	}
}

public struct GetPasswordState: Codable, TDFunction {
	public typealias Result = PasswordState

	public init() {
	}
}

public struct SetPassword: Codable, TDFunction {
	public typealias Result = PasswordState
	public let oldPassword: String
	public let newPassword: String
	public let newHint: String
	public let setRecoveryEmailAddress: Bool
	public let newRecoveryEmailAddress: String

	public init(oldPassword: String, newPassword: String, newHint: String, setRecoveryEmailAddress: Bool, newRecoveryEmailAddress: String) {
		self.oldPassword = oldPassword
		self.newPassword = newPassword
		self.newHint = newHint
		self.setRecoveryEmailAddress = setRecoveryEmailAddress
		self.newRecoveryEmailAddress = newRecoveryEmailAddress
	}
}

public struct GetRecoveryEmailAddress: Codable, TDFunction {
	public typealias Result = RecoveryEmailAddress
	public let password: String

	public init(password: String) {
		self.password = password
	}
}

public struct SetRecoveryEmailAddress: Codable, TDFunction {
	public typealias Result = PasswordState
	public let password: String
	public let newRecoveryEmailAddress: String

	public init(password: String, newRecoveryEmailAddress: String) {
		self.password = password
		self.newRecoveryEmailAddress = newRecoveryEmailAddress
	}
}

public struct RequestPasswordRecovery: Codable, TDFunction {
	public typealias Result = PasswordRecoveryInfo

	public init() {
	}
}

public struct RecoverPassword: Codable, TDFunction {
	public typealias Result = PasswordState
	public let recoveryCode: String

	public init(recoveryCode: String) {
		self.recoveryCode = recoveryCode
	}
}

public struct CreateTemporaryPassword: Codable, TDFunction {
	public typealias Result = TemporaryPasswordState
	public let password: String
	public let validFor: Int32

	public init(password: String, validFor: Int32) {
		self.password = password
		self.validFor = validFor
	}
}

public struct GetTemporaryPasswordState: Codable, TDFunction {
	public typealias Result = TemporaryPasswordState

	public init() {
	}
}

public struct ProcessDcUpdate: Codable, TDFunction {
	public typealias Result = Ok
	public let dc: String
	public let addr: String

	public init(dc: String, addr: String) {
		self.dc = dc
		self.addr = addr
	}
}

public struct GetMe: Codable, TDFunction {
	public typealias Result = User

	public init() {
	}
}

public struct GetUser: Codable, TDFunction {
	public typealias Result = User
	public let userId: Int32

	public init(userId: Int32) {
		self.userId = userId
	}
}

public struct GetUserFullInfo: Codable, TDFunction {
	public typealias Result = UserFullInfo
	public let userId: Int32

	public init(userId: Int32) {
		self.userId = userId
	}
}

public struct GetBasicGroup: Codable, TDFunction {
	public typealias Result = BasicGroup
	public let basicGroupId: Int32

	public init(basicGroupId: Int32) {
		self.basicGroupId = basicGroupId
	}
}

public struct GetBasicGroupFullInfo: Codable, TDFunction {
	public typealias Result = BasicGroupFullInfo
	public let basicGroupId: Int32

	public init(basicGroupId: Int32) {
		self.basicGroupId = basicGroupId
	}
}

public struct GetSupergroup: Codable, TDFunction {
	public typealias Result = Supergroup
	public let supergroupId: Int32

	public init(supergroupId: Int32) {
		self.supergroupId = supergroupId
	}
}

public struct GetSupergroupFullInfo: Codable, TDFunction {
	public typealias Result = SupergroupFullInfo
	public let supergroupId: Int32

	public init(supergroupId: Int32) {
		self.supergroupId = supergroupId
	}
}

public struct GetSecretChat: Codable, TDFunction {
	public typealias Result = SecretChat
	public let secretChatId: Int32

	public init(secretChatId: Int32) {
		self.secretChatId = secretChatId
	}
}

public struct GetChat: Codable, TDFunction {
	public typealias Result = Chat
	public let chatId: Int53

	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

public struct GetMessage: Codable, TDFunction {
	public typealias Result = Message
	public let chatId: Int53
	public let messageId: Int53

	public init(chatId: Int53, messageId: Int53) {
		self.chatId = chatId
		self.messageId = messageId
	}
}

public struct GetRepliedMessage: Codable, TDFunction {
	public typealias Result = Message
	public let chatId: Int53
	public let messageId: Int53

	public init(chatId: Int53, messageId: Int53) {
		self.chatId = chatId
		self.messageId = messageId
	}
}

public struct GetChatPinnedMessage: Codable, TDFunction {
	public typealias Result = Message
	public let chatId: Int53

	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

public struct GetMessages: Codable, TDFunction {
	public typealias Result = Messages
	public let chatId: Int53
	public let messageIds: [Int53]

	public init(chatId: Int53, messageIds: [Int53]) {
		self.chatId = chatId
		self.messageIds = messageIds
	}
}

public struct GetFile: Codable, TDFunction {
	public typealias Result = File
	public let fileId: Int32

	public init(fileId: Int32) {
		self.fileId = fileId
	}
}

public struct GetRemoteFile: Codable, TDFunction {
	public typealias Result = File
	public let remoteFileId: String
	public let fileType: FileType

	public init(remoteFileId: String, fileType: FileType) {
		self.remoteFileId = remoteFileId
		self.fileType = fileType
	}
}

public struct GetChats: Codable, TDFunction {
	public typealias Result = Chats
	public let offsetOrder: TDInt64
	public let offsetChatId: Int53
	public let limit: Int32

	public init(offsetOrder: TDInt64, offsetChatId: Int53, limit: Int32) {
		self.offsetOrder = offsetOrder
		self.offsetChatId = offsetChatId
		self.limit = limit
	}
}

public struct SearchPublicChat: Codable, TDFunction {
	public typealias Result = Chat
	public let username: String

	public init(username: String) {
		self.username = username
	}
}

public struct SearchPublicChats: Codable, TDFunction {
	public typealias Result = Chats
	public let query: String

	public init(query: String) {
		self.query = query
	}
}

public struct SearchChats: Codable, TDFunction {
	public typealias Result = Chats
	public let query: String
	public let limit: Int32

	public init(query: String, limit: Int32) {
		self.query = query
		self.limit = limit
	}
}

public struct SearchChatsOnServer: Codable, TDFunction {
	public typealias Result = Chats
	public let query: String
	public let limit: Int32

	public init(query: String, limit: Int32) {
		self.query = query
		self.limit = limit
	}
}

public struct GetTopChats: Codable, TDFunction {
	public typealias Result = Chats
	public let category: TopChatCategory
	public let limit: Int32

	public init(category: TopChatCategory, limit: Int32) {
		self.category = category
		self.limit = limit
	}
}

public struct RemoveTopChat: Codable, TDFunction {
	public typealias Result = Ok
	public let category: TopChatCategory
	public let chatId: Int53

	public init(category: TopChatCategory, chatId: Int53) {
		self.category = category
		self.chatId = chatId
	}
}

public struct AddRecentlyFoundChat: Codable, TDFunction {
	public typealias Result = Ok
	public let chatId: Int53

	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

public struct RemoveRecentlyFoundChat: Codable, TDFunction {
	public typealias Result = Ok
	public let chatId: Int53

	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

public struct ClearRecentlyFoundChats: Codable, TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct CheckChatUsername: Codable, TDFunction {
	public typealias Result = CheckChatUsernameResult
	public let chatId: TDInt64
	public let username: String

	public init(chatId: TDInt64, username: String) {
		self.chatId = chatId
		self.username = username
	}
}

public struct GetCreatedPublicChats: Codable, TDFunction {
	public typealias Result = Chats

	public init() {
	}
}

public struct GetGroupsInCommon: Codable, TDFunction {
	public typealias Result = Chats
	public let userId: Int32
	public let offsetChatId: Int53
	public let limit: Int32

	public init(userId: Int32, offsetChatId: Int53, limit: Int32) {
		self.userId = userId
		self.offsetChatId = offsetChatId
		self.limit = limit
	}
}

public struct GetChatHistory: Codable, TDFunction {
	public typealias Result = Messages
	public let chatId: Int53
	public let fromMessageId: Int53
	public let offset: Int32
	public let limit: Int32
	public let onlyLocal: Bool

	public init(chatId: Int53, fromMessageId: Int53, offset: Int32, limit: Int32, onlyLocal: Bool) {
		self.chatId = chatId
		self.fromMessageId = fromMessageId
		self.offset = offset
		self.limit = limit
		self.onlyLocal = onlyLocal
	}
}

public struct DeleteChatHistory: Codable, TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let removeFromChatList: Bool

	public init(chatId: Int53, removeFromChatList: Bool) {
		self.chatId = chatId
		self.removeFromChatList = removeFromChatList
	}
}

public struct SearchChatMessages: Codable, TDFunction {
	public typealias Result = Messages
	public let chatId: Int53
	public let query: String
	public let senderUserId: Int32
	public let fromMessageId: Int53
	public let offset: Int32
	public let limit: Int32
	public let filter: SearchMessagesFilter

	public init(chatId: Int53, query: String, senderUserId: Int32, fromMessageId: Int53, offset: Int32, limit: Int32, filter: SearchMessagesFilter) {
		self.chatId = chatId
		self.query = query
		self.senderUserId = senderUserId
		self.fromMessageId = fromMessageId
		self.offset = offset
		self.limit = limit
		self.filter = filter
	}
}

public struct SearchMessages: Codable, TDFunction {
	public typealias Result = Messages
	public let query: String
	public let offsetDate: Int32
	public let offsetChatId: Int53
	public let offsetMessageId: Int53
	public let limit: Int32

	public init(query: String, offsetDate: Int32, offsetChatId: Int53, offsetMessageId: Int53, limit: Int32) {
		self.query = query
		self.offsetDate = offsetDate
		self.offsetChatId = offsetChatId
		self.offsetMessageId = offsetMessageId
		self.limit = limit
	}
}

public struct SearchSecretMessages: Codable, TDFunction {
	public typealias Result = FoundMessages
	public let chatId: Int53
	public let query: String
	public let fromSearchId: TDInt64
	public let limit: Int32
	public let filter: SearchMessagesFilter

	public init(chatId: Int53, query: String, fromSearchId: TDInt64, limit: Int32, filter: SearchMessagesFilter) {
		self.chatId = chatId
		self.query = query
		self.fromSearchId = fromSearchId
		self.limit = limit
		self.filter = filter
	}
}

public struct SearchCallMessages: Codable, TDFunction {
	public typealias Result = Messages
	public let fromMessageId: Int53
	public let limit: Int32
	public let onlyMissed: Bool

	public init(fromMessageId: Int53, limit: Int32, onlyMissed: Bool) {
		self.fromMessageId = fromMessageId
		self.limit = limit
		self.onlyMissed = onlyMissed
	}
}

public struct SearchChatRecentLocationMessages: Codable, TDFunction {
	public typealias Result = Messages
	public let chatId: Int53
	public let limit: Int32

	public init(chatId: Int53, limit: Int32) {
		self.chatId = chatId
		self.limit = limit
	}
}

public struct GetActiveLiveLocationMessages: Codable, TDFunction {
	public typealias Result = Messages

	public init() {
	}
}

public struct GetChatMessageByDate: Codable, TDFunction {
	public typealias Result = Message
	public let chatId: Int53
	public let date: Int32

	public init(chatId: Int53, date: Int32) {
		self.chatId = chatId
		self.date = date
	}
}

public struct GetPublicMessageLink: Codable, TDFunction {
	public typealias Result = PublicMessageLink
	public let chatId: Int53
	public let messageId: Int53
	public let forAlbum: Bool

	public init(chatId: Int53, messageId: Int53, forAlbum: Bool) {
		self.chatId = chatId
		self.messageId = messageId
		self.forAlbum = forAlbum
	}
}

public struct SendMessage: Codable, TDFunction {
	public typealias Result = Message
	public let chatId: Int53
	public let replyToMessageId: Int53
	public let disableNotification: Bool
	public let fromBackground: Bool
	public let replyMarkup: ReplyMarkup
	public let inputMessageContent: InputMessageContent

	public init(chatId: Int53, replyToMessageId: Int53, disableNotification: Bool, fromBackground: Bool, replyMarkup: ReplyMarkup, inputMessageContent: InputMessageContent) {
		self.chatId = chatId
		self.replyToMessageId = replyToMessageId
		self.disableNotification = disableNotification
		self.fromBackground = fromBackground
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
	}
}

public struct SendMessageAlbum: Codable, TDFunction {
	public typealias Result = Messages
	public let chatId: Int53
	public let replyToMessageId: Int53
	public let disableNotification: Bool
	public let fromBackground: Bool
	public let inputMessageContents: [InputMessageContent]

	public init(chatId: Int53, replyToMessageId: Int53, disableNotification: Bool, fromBackground: Bool, inputMessageContents: [InputMessageContent]) {
		self.chatId = chatId
		self.replyToMessageId = replyToMessageId
		self.disableNotification = disableNotification
		self.fromBackground = fromBackground
		self.inputMessageContents = inputMessageContents
	}
}

public struct SendBotStartMessage: Codable, TDFunction {
	public typealias Result = Message
	public let botUserId: Int32
	public let chatId: Int53
	public let parameter: String

	public init(botUserId: Int32, chatId: Int53, parameter: String) {
		self.botUserId = botUserId
		self.chatId = chatId
		self.parameter = parameter
	}
}

public struct SendInlineQueryResultMessage: Codable, TDFunction {
	public typealias Result = Message
	public let chatId: Int53
	public let replyToMessageId: Int53
	public let disableNotification: Bool
	public let fromBackground: Bool
	public let queryId: TDInt64
	public let resultId: String

	public init(chatId: Int53, replyToMessageId: Int53, disableNotification: Bool, fromBackground: Bool, queryId: TDInt64, resultId: String) {
		self.chatId = chatId
		self.replyToMessageId = replyToMessageId
		self.disableNotification = disableNotification
		self.fromBackground = fromBackground
		self.queryId = queryId
		self.resultId = resultId
	}
}

public struct ForwardMessages: Codable, TDFunction {
	public typealias Result = Messages
	public let chatId: Int53
	public let fromChatId: Int53
	public let messageIds: [Int53]
	public let disableNotification: Bool
	public let fromBackground: Bool
	public let asAlbum: Bool

	public init(chatId: Int53, fromChatId: Int53, messageIds: [Int53], disableNotification: Bool, fromBackground: Bool, asAlbum: Bool) {
		self.chatId = chatId
		self.fromChatId = fromChatId
		self.messageIds = messageIds
		self.disableNotification = disableNotification
		self.fromBackground = fromBackground
		self.asAlbum = asAlbum
	}
}

public struct SendChatSetTtlMessage: Codable, TDFunction {
	public typealias Result = Message
	public let chatId: Int53
	public let ttl: Int32

	public init(chatId: Int53, ttl: Int32) {
		self.chatId = chatId
		self.ttl = ttl
	}
}

public struct SendChatScreenshotTakenNotification: Codable, TDFunction {
	public typealias Result = Ok
	public let chatId: Int53

	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

public struct DeleteMessages: Codable, TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let messageIds: [Int53]
	public let revoke: Bool

	public init(chatId: Int53, messageIds: [Int53], revoke: Bool) {
		self.chatId = chatId
		self.messageIds = messageIds
		self.revoke = revoke
	}
}

public struct DeleteChatMessagesFromUser: Codable, TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let userId: Int32

	public init(chatId: Int53, userId: Int32) {
		self.chatId = chatId
		self.userId = userId
	}
}

public struct EditMessageText: Codable, TDFunction {
	public typealias Result = Message
	public let chatId: Int53
	public let messageId: Int53
	public let replyMarkup: ReplyMarkup
	public let inputMessageContent: InputMessageContent

	public init(chatId: Int53, messageId: Int53, replyMarkup: ReplyMarkup, inputMessageContent: InputMessageContent) {
		self.chatId = chatId
		self.messageId = messageId
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
	}
}

public struct EditMessageLiveLocation: Codable, TDFunction {
	public typealias Result = Message
	public let chatId: Int53
	public let messageId: Int53
	public let replyMarkup: ReplyMarkup
	public let location: Location?

	public init(chatId: Int53, messageId: Int53, replyMarkup: ReplyMarkup, location: Location?) {
		self.chatId = chatId
		self.messageId = messageId
		self.replyMarkup = replyMarkup
		self.location = location
	}
}

public struct EditMessageCaption: Codable, TDFunction {
	public typealias Result = Message
	public let chatId: Int53
	public let messageId: Int53
	public let replyMarkup: ReplyMarkup
	public let caption: FormattedText

	public init(chatId: Int53, messageId: Int53, replyMarkup: ReplyMarkup, caption: FormattedText) {
		self.chatId = chatId
		self.messageId = messageId
		self.replyMarkup = replyMarkup
		self.caption = caption
	}
}

public struct EditMessageReplyMarkup: Codable, TDFunction {
	public typealias Result = Message
	public let chatId: Int53
	public let messageId: Int53
	public let replyMarkup: ReplyMarkup

	public init(chatId: Int53, messageId: Int53, replyMarkup: ReplyMarkup) {
		self.chatId = chatId
		self.messageId = messageId
		self.replyMarkup = replyMarkup
	}
}

public struct EditInlineMessageText: Codable, TDFunction {
	public typealias Result = Ok
	public let inlineMessageId: String
	public let replyMarkup: ReplyMarkup
	public let inputMessageContent: InputMessageContent

	public init(inlineMessageId: String, replyMarkup: ReplyMarkup, inputMessageContent: InputMessageContent) {
		self.inlineMessageId = inlineMessageId
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
	}
}

public struct EditInlineMessageLiveLocation: Codable, TDFunction {
	public typealias Result = Ok
	public let inlineMessageId: String
	public let replyMarkup: ReplyMarkup
	public let location: Location?

	public init(inlineMessageId: String, replyMarkup: ReplyMarkup, location: Location?) {
		self.inlineMessageId = inlineMessageId
		self.replyMarkup = replyMarkup
		self.location = location
	}
}

public struct EditInlineMessageCaption: Codable, TDFunction {
	public typealias Result = Ok
	public let inlineMessageId: String
	public let replyMarkup: ReplyMarkup
	public let caption: FormattedText

	public init(inlineMessageId: String, replyMarkup: ReplyMarkup, caption: FormattedText) {
		self.inlineMessageId = inlineMessageId
		self.replyMarkup = replyMarkup
		self.caption = caption
	}
}

public struct EditInlineMessageReplyMarkup: Codable, TDFunction {
	public typealias Result = Ok
	public let inlineMessageId: String
	public let replyMarkup: ReplyMarkup

	public init(inlineMessageId: String, replyMarkup: ReplyMarkup) {
		self.inlineMessageId = inlineMessageId
		self.replyMarkup = replyMarkup
	}
}

public struct GetTextEntities: Codable, TDFunction {
	public typealias Result = TextEntities
	public let text: String

	public init(text: String) {
		self.text = text
	}
}

public struct ParseTextEntities: Codable, TDFunction {
	public typealias Result = FormattedText
	public let text: String
	public let parseMode: TextParseMode

	public init(text: String, parseMode: TextParseMode) {
		self.text = text
		self.parseMode = parseMode
	}
}

public struct GetFileMimeType: Codable, TDFunction {
	public typealias Result = Text
	public let fileName: String

	public init(fileName: String) {
		self.fileName = fileName
	}
}

public struct GetFileExtension: Codable, TDFunction {
	public typealias Result = Text
	public let mimeType: String

	public init(mimeType: String) {
		self.mimeType = mimeType
	}
}

public struct GetInlineQueryResults: Codable, TDFunction {
	public typealias Result = InlineQueryResults
	public let botUserId: Int32
	public let chatId: Int53
	public let userLocation: Location
	public let query: String
	public let offset: String

	public init(botUserId: Int32, chatId: Int53, userLocation: Location, query: String, offset: String) {
		self.botUserId = botUserId
		self.chatId = chatId
		self.userLocation = userLocation
		self.query = query
		self.offset = offset
	}
}

public struct AnswerInlineQuery: Codable, TDFunction {
	public typealias Result = Ok
	public let inlineQueryId: TDInt64
	public let isPersonal: Bool
	public let results: [InputInlineQueryResult]
	public let cacheTime: Int32
	public let nextOffset: String
	public let switchPmText: String
	public let switchPmParameter: String

	public init(inlineQueryId: TDInt64, isPersonal: Bool, results: [InputInlineQueryResult], cacheTime: Int32, nextOffset: String, switchPmText: String, switchPmParameter: String) {
		self.inlineQueryId = inlineQueryId
		self.isPersonal = isPersonal
		self.results = results
		self.cacheTime = cacheTime
		self.nextOffset = nextOffset
		self.switchPmText = switchPmText
		self.switchPmParameter = switchPmParameter
	}
}

public struct GetCallbackQueryAnswer: Codable, TDFunction {
	public typealias Result = CallbackQueryAnswer
	public let chatId: Int53
	public let messageId: Int53
	public let payload: CallbackQueryPayload

	public init(chatId: Int53, messageId: Int53, payload: CallbackQueryPayload) {
		self.chatId = chatId
		self.messageId = messageId
		self.payload = payload
	}
}

public struct AnswerCallbackQuery: Codable, TDFunction {
	public typealias Result = Ok
	public let callbackQueryId: TDInt64
	public let text: String
	public let showAlert: Bool
	public let url: String
	public let cacheTime: Int32

	public init(callbackQueryId: TDInt64, text: String, showAlert: Bool, url: String, cacheTime: Int32) {
		self.callbackQueryId = callbackQueryId
		self.text = text
		self.showAlert = showAlert
		self.url = url
		self.cacheTime = cacheTime
	}
}

public struct AnswerShippingQuery: Codable, TDFunction {
	public typealias Result = Ok
	public let shippingQueryId: TDInt64
	public let shippingOptions: [ShippingOption]
	public let errorMessage: String

	public init(shippingQueryId: TDInt64, shippingOptions: [ShippingOption], errorMessage: String) {
		self.shippingQueryId = shippingQueryId
		self.shippingOptions = shippingOptions
		self.errorMessage = errorMessage
	}
}

public struct AnswerPreCheckoutQuery: Codable, TDFunction {
	public typealias Result = Ok
	public let preCheckoutQueryId: TDInt64
	public let errorMessage: String

	public init(preCheckoutQueryId: TDInt64, errorMessage: String) {
		self.preCheckoutQueryId = preCheckoutQueryId
		self.errorMessage = errorMessage
	}
}

public struct SetGameScore: Codable, TDFunction {
	public typealias Result = Message
	public let chatId: Int53
	public let messageId: Int53
	public let editMessage: Bool
	public let userId: Int32
	public let score: Int32
	public let force: Bool

	public init(chatId: Int53, messageId: Int53, editMessage: Bool, userId: Int32, score: Int32, force: Bool) {
		self.chatId = chatId
		self.messageId = messageId
		self.editMessage = editMessage
		self.userId = userId
		self.score = score
		self.force = force
	}
}

public struct SetInlineGameScore: Codable, TDFunction {
	public typealias Result = Ok
	public let inlineMessageId: String
	public let editMessage: Bool
	public let userId: Int32
	public let score: Int32
	public let force: Bool

	public init(inlineMessageId: String, editMessage: Bool, userId: Int32, score: Int32, force: Bool) {
		self.inlineMessageId = inlineMessageId
		self.editMessage = editMessage
		self.userId = userId
		self.score = score
		self.force = force
	}
}

public struct GetGameHighScores: Codable, TDFunction {
	public typealias Result = GameHighScores
	public let chatId: Int53
	public let messageId: Int53
	public let userId: Int32

	public init(chatId: Int53, messageId: Int53, userId: Int32) {
		self.chatId = chatId
		self.messageId = messageId
		self.userId = userId
	}
}

public struct GetInlineGameHighScores: Codable, TDFunction {
	public typealias Result = GameHighScores
	public let inlineMessageId: String
	public let userId: Int32

	public init(inlineMessageId: String, userId: Int32) {
		self.inlineMessageId = inlineMessageId
		self.userId = userId
	}
}

public struct DeleteChatReplyMarkup: Codable, TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let messageId: Int53

	public init(chatId: Int53, messageId: Int53) {
		self.chatId = chatId
		self.messageId = messageId
	}
}

public struct SendChatAction: Codable, TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let action: ChatAction

	public init(chatId: Int53, action: ChatAction) {
		self.chatId = chatId
		self.action = action
	}
}

public struct OpenChat: Codable, TDFunction {
	public typealias Result = Ok
	public let chatId: Int53

	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

public struct CloseChat: Codable, TDFunction {
	public typealias Result = Ok
	public let chatId: Int53

	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

public struct ViewMessages: Codable, TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let messageIds: [Int53]
	public let forceRead: Bool

	public init(chatId: Int53, messageIds: [Int53], forceRead: Bool) {
		self.chatId = chatId
		self.messageIds = messageIds
		self.forceRead = forceRead
	}
}

public struct OpenMessageContent: Codable, TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let messageId: Int53

	public init(chatId: Int53, messageId: Int53) {
		self.chatId = chatId
		self.messageId = messageId
	}
}

public struct ReadAllChatMentions: Codable, TDFunction {
	public typealias Result = Ok
	public let chatId: Int53

	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

public struct CreatePrivateChat: Codable, TDFunction {
	public typealias Result = Chat
	public let userId: Int32
	public let force: Bool

	public init(userId: Int32, force: Bool) {
		self.userId = userId
		self.force = force
	}
}

public struct CreateBasicGroupChat: Codable, TDFunction {
	public typealias Result = Chat
	public let basicGroupId: Int32
	public let force: Bool

	public init(basicGroupId: Int32, force: Bool) {
		self.basicGroupId = basicGroupId
		self.force = force
	}
}

public struct CreateSupergroupChat: Codable, TDFunction {
	public typealias Result = Chat
	public let supergroupId: Int32
	public let force: Bool

	public init(supergroupId: Int32, force: Bool) {
		self.supergroupId = supergroupId
		self.force = force
	}
}

public struct CreateSecretChat: Codable, TDFunction {
	public typealias Result = Chat
	public let secretChatId: Int32

	public init(secretChatId: Int32) {
		self.secretChatId = secretChatId
	}
}

public struct CreateNewBasicGroupChat: Codable, TDFunction {
	public typealias Result = Chat
	public let userIds: [Int32]
	public let title: String

	public init(userIds: [Int32], title: String) {
		self.userIds = userIds
		self.title = title
	}
}

public struct CreateNewSupergroupChat: Codable, TDFunction {
	public typealias Result = Chat
	public let title: String
	public let isChannel: Bool
	public let description: String

	public init(title: String, isChannel: Bool, description: String) {
		self.title = title
		self.isChannel = isChannel
		self.description = description
	}
}

public struct CreateNewSecretChat: Codable, TDFunction {
	public typealias Result = Chat
	public let userId: Int32

	public init(userId: Int32) {
		self.userId = userId
	}
}

public struct UpgradeBasicGroupChatToSupergroupChat: Codable, TDFunction {
	public typealias Result = Chat
	public let chatId: Int53

	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

public struct SetChatTitle: Codable, TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let title: String

	public init(chatId: Int53, title: String) {
		self.chatId = chatId
		self.title = title
	}
}

public struct SetChatPhoto: Codable, TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let photo: InputFile

	public init(chatId: Int53, photo: InputFile) {
		self.chatId = chatId
		self.photo = photo
	}
}

public struct SetChatDraftMessage: Codable, TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let draftMessage: DraftMessage?

	public init(chatId: Int53, draftMessage: DraftMessage?) {
		self.chatId = chatId
		self.draftMessage = draftMessage
	}
}

public struct ToggleChatIsPinned: Codable, TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let isPinned: Bool

	public init(chatId: Int53, isPinned: Bool) {
		self.chatId = chatId
		self.isPinned = isPinned
	}
}

public struct SetChatClientData: Codable, TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let clientData: String

	public init(chatId: Int53, clientData: String) {
		self.chatId = chatId
		self.clientData = clientData
	}
}

public struct AddChatMember: Codable, TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let userId: Int32
	public let forwardLimit: Int32

	public init(chatId: Int53, userId: Int32, forwardLimit: Int32) {
		self.chatId = chatId
		self.userId = userId
		self.forwardLimit = forwardLimit
	}
}

public struct AddChatMembers: Codable, TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let userIds: [Int32]

	public init(chatId: Int53, userIds: [Int32]) {
		self.chatId = chatId
		self.userIds = userIds
	}
}

public struct SetChatMemberStatus: Codable, TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let userId: Int32
	public let status: ChatMemberStatus

	public init(chatId: Int53, userId: Int32, status: ChatMemberStatus) {
		self.chatId = chatId
		self.userId = userId
		self.status = status
	}
}

public struct GetChatMember: Codable, TDFunction {
	public typealias Result = ChatMember
	public let chatId: Int53
	public let userId: Int32

	public init(chatId: Int53, userId: Int32) {
		self.chatId = chatId
		self.userId = userId
	}
}

public struct SearchChatMembers: Codable, TDFunction {
	public typealias Result = ChatMembers
	public let chatId: Int53
	public let query: String
	public let limit: Int32

	public init(chatId: Int53, query: String, limit: Int32) {
		self.chatId = chatId
		self.query = query
		self.limit = limit
	}
}

public struct GetChatAdministrators: Codable, TDFunction {
	public typealias Result = Users
	public let chatId: Int53

	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

public struct SetPinnedChats: Codable, TDFunction {
	public typealias Result = Ok
	public let chatIds: [Int53]

	public init(chatIds: [Int53]) {
		self.chatIds = chatIds
	}
}

public struct DownloadFile: Codable, TDFunction {
	public typealias Result = File
	public let fileId: Int32
	public let priority: Int32

	public init(fileId: Int32, priority: Int32) {
		self.fileId = fileId
		self.priority = priority
	}
}

public struct CancelDownloadFile: Codable, TDFunction {
	public typealias Result = Ok
	public let fileId: Int32
	public let onlyIfPending: Bool

	public init(fileId: Int32, onlyIfPending: Bool) {
		self.fileId = fileId
		self.onlyIfPending = onlyIfPending
	}
}

public struct UploadFile: Codable, TDFunction {
	public typealias Result = File
	public let file: InputFile
	public let fileType: FileType
	public let priority: Int32

	public init(file: InputFile, fileType: FileType, priority: Int32) {
		self.file = file
		self.fileType = fileType
		self.priority = priority
	}
}

public struct CancelUploadFile: Codable, TDFunction {
	public typealias Result = Ok
	public let fileId: Int32

	public init(fileId: Int32) {
		self.fileId = fileId
	}
}

public struct SetFileGenerationProgress: Codable, TDFunction {
	public typealias Result = Ok
	public let generationId: TDInt64
	public let expectedSize: Int32
	public let localPrefixSize: Int32

	public init(generationId: TDInt64, expectedSize: Int32, localPrefixSize: Int32) {
		self.generationId = generationId
		self.expectedSize = expectedSize
		self.localPrefixSize = localPrefixSize
	}
}

public struct FinishFileGeneration: Codable, TDFunction {
	public typealias Result = Ok
	public let generationId: TDInt64
	public let error: Error

	public init(generationId: TDInt64, error: Error) {
		self.generationId = generationId
		self.error = error
	}
}

public struct DeleteFile: Codable, TDFunction {
	public typealias Result = Ok
	public let fileId: Int32

	public init(fileId: Int32) {
		self.fileId = fileId
	}
}

public struct GenerateChatInviteLink: Codable, TDFunction {
	public typealias Result = ChatInviteLink
	public let chatId: Int53

	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

public struct CheckChatInviteLink: Codable, TDFunction {
	public typealias Result = ChatInviteLinkInfo
	public let inviteLink: String

	public init(inviteLink: String) {
		self.inviteLink = inviteLink
	}
}

public struct JoinChatByInviteLink: Codable, TDFunction {
	public typealias Result = Chat
	public let inviteLink: String

	public init(inviteLink: String) {
		self.inviteLink = inviteLink
	}
}

public struct CreateCall: Codable, TDFunction {
	public typealias Result = CallId
	public let userId: Int32
	public let `protocol`: CallProtocol

	public init(userId: Int32, protocol: CallProtocol) {
		self.userId = userId
		self.protocol = `protocol`
	}
}

public struct AcceptCall: Codable, TDFunction {
	public typealias Result = Ok
	public let callId: Int32
	public let `protocol`: CallProtocol

	public init(callId: Int32, protocol: CallProtocol) {
		self.callId = callId
		self.protocol = `protocol`
	}
}

public struct DiscardCall: Codable, TDFunction {
	public typealias Result = Ok
	public let callId: Int32
	public let isDisconnected: Bool
	public let duration: Int32
	public let connectionId: TDInt64

	public init(callId: Int32, isDisconnected: Bool, duration: Int32, connectionId: TDInt64) {
		self.callId = callId
		self.isDisconnected = isDisconnected
		self.duration = duration
		self.connectionId = connectionId
	}
}

public struct SendCallRating: Codable, TDFunction {
	public typealias Result = Ok
	public let callId: Int32
	public let rating: Int32
	public let comment: String

	public init(callId: Int32, rating: Int32, comment: String) {
		self.callId = callId
		self.rating = rating
		self.comment = comment
	}
}

public struct SendCallDebugInformation: Codable, TDFunction {
	public typealias Result = Ok
	public let callId: Int32
	public let debugInformation: String

	public init(callId: Int32, debugInformation: String) {
		self.callId = callId
		self.debugInformation = debugInformation
	}
}

public struct BlockUser: Codable, TDFunction {
	public typealias Result = Ok
	public let userId: Int32

	public init(userId: Int32) {
		self.userId = userId
	}
}

public struct UnblockUser: Codable, TDFunction {
	public typealias Result = Ok
	public let userId: Int32

	public init(userId: Int32) {
		self.userId = userId
	}
}

public struct GetBlockedUsers: Codable, TDFunction {
	public typealias Result = Users
	public let offset: Int32
	public let limit: Int32

	public init(offset: Int32, limit: Int32) {
		self.offset = offset
		self.limit = limit
	}
}

public struct ImportContacts: Codable, TDFunction {
	public typealias Result = ImportedContacts
	public let contacts: [Contact]

	public init(contacts: [Contact]) {
		self.contacts = contacts
	}
}

public struct SearchContacts: Codable, TDFunction {
	public typealias Result = Users
	public let query: String
	public let limit: Int32

	public init(query: String, limit: Int32) {
		self.query = query
		self.limit = limit
	}
}

public struct RemoveContacts: Codable, TDFunction {
	public typealias Result = Ok
	public let userIds: [Int32]

	public init(userIds: [Int32]) {
		self.userIds = userIds
	}
}

public struct GetImportedContactCount: Codable, TDFunction {
	public typealias Result = Count

	public init() {
	}
}

public struct ChangeImportedContacts: Codable, TDFunction {
	public typealias Result = ImportedContacts
	public let contacts: [Contact]

	public init(contacts: [Contact]) {
		self.contacts = contacts
	}
}

public struct ClearImportedContacts: Codable, TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct GetUserProfilePhotos: Codable, TDFunction {
	public typealias Result = UserProfilePhotos
	public let userId: Int32
	public let offset: Int32
	public let limit: Int32

	public init(userId: Int32, offset: Int32, limit: Int32) {
		self.userId = userId
		self.offset = offset
		self.limit = limit
	}
}

public struct GetStickers: Codable, TDFunction {
	public typealias Result = Stickers
	public let emoji: String
	public let limit: Int32

	public init(emoji: String, limit: Int32) {
		self.emoji = emoji
		self.limit = limit
	}
}

public struct SearchStickers: Codable, TDFunction {
	public typealias Result = Stickers
	public let emoji: String
	public let limit: Int32

	public init(emoji: String, limit: Int32) {
		self.emoji = emoji
		self.limit = limit
	}
}

public struct GetInstalledStickerSets: Codable, TDFunction {
	public typealias Result = StickerSets
	public let isMasks: Bool

	public init(isMasks: Bool) {
		self.isMasks = isMasks
	}
}

public struct GetArchivedStickerSets: Codable, TDFunction {
	public typealias Result = StickerSets
	public let isMasks: Bool
	public let offsetStickerSetId: TDInt64
	public let limit: Int32

	public init(isMasks: Bool, offsetStickerSetId: TDInt64, limit: Int32) {
		self.isMasks = isMasks
		self.offsetStickerSetId = offsetStickerSetId
		self.limit = limit
	}
}

public struct GetTrendingStickerSets: Codable, TDFunction {
	public typealias Result = StickerSets

	public init() {
	}
}

public struct GetAttachedStickerSets: Codable, TDFunction {
	public typealias Result = StickerSets
	public let fileId: Int32

	public init(fileId: Int32) {
		self.fileId = fileId
	}
}

public struct GetStickerSet: Codable, TDFunction {
	public typealias Result = StickerSet
	public let setId: TDInt64

	public init(setId: TDInt64) {
		self.setId = setId
	}
}

public struct SearchStickerSet: Codable, TDFunction {
	public typealias Result = StickerSet
	public let name: String

	public init(name: String) {
		self.name = name
	}
}

public struct SearchInstalledStickerSets: Codable, TDFunction {
	public typealias Result = StickerSets
	public let isMasks: Bool
	public let query: String
	public let limit: Int32

	public init(isMasks: Bool, query: String, limit: Int32) {
		self.isMasks = isMasks
		self.query = query
		self.limit = limit
	}
}

public struct SearchStickerSets: Codable, TDFunction {
	public typealias Result = StickerSets
	public let query: String

	public init(query: String) {
		self.query = query
	}
}

public struct ChangeStickerSet: Codable, TDFunction {
	public typealias Result = Ok
	public let setId: TDInt64
	public let isInstalled: Bool
	public let isArchived: Bool

	public init(setId: TDInt64, isInstalled: Bool, isArchived: Bool) {
		self.setId = setId
		self.isInstalled = isInstalled
		self.isArchived = isArchived
	}
}

public struct ViewTrendingStickerSets: Codable, TDFunction {
	public typealias Result = Ok
	public let stickerSetIds: [Int64]

	public init(stickerSetIds: [Int64]) {
		self.stickerSetIds = stickerSetIds
	}
}

public struct ReorderInstalledStickerSets: Codable, TDFunction {
	public typealias Result = Ok
	public let isMasks: Bool
	public let stickerSetIds: [Int64]

	public init(isMasks: Bool, stickerSetIds: [Int64]) {
		self.isMasks = isMasks
		self.stickerSetIds = stickerSetIds
	}
}

public struct GetRecentStickers: Codable, TDFunction {
	public typealias Result = Stickers
	public let isAttached: Bool

	public init(isAttached: Bool) {
		self.isAttached = isAttached
	}
}

public struct AddRecentSticker: Codable, TDFunction {
	public typealias Result = Stickers
	public let isAttached: Bool
	public let sticker: InputFile

	public init(isAttached: Bool, sticker: InputFile) {
		self.isAttached = isAttached
		self.sticker = sticker
	}
}

public struct RemoveRecentSticker: Codable, TDFunction {
	public typealias Result = Ok
	public let isAttached: Bool
	public let sticker: InputFile

	public init(isAttached: Bool, sticker: InputFile) {
		self.isAttached = isAttached
		self.sticker = sticker
	}
}

public struct ClearRecentStickers: Codable, TDFunction {
	public typealias Result = Ok
	public let isAttached: Bool

	public init(isAttached: Bool) {
		self.isAttached = isAttached
	}
}

public struct GetFavoriteStickers: Codable, TDFunction {
	public typealias Result = Stickers

	public init() {
	}
}

public struct AddFavoriteSticker: Codable, TDFunction {
	public typealias Result = Ok
	public let sticker: InputFile

	public init(sticker: InputFile) {
		self.sticker = sticker
	}
}

public struct RemoveFavoriteSticker: Codable, TDFunction {
	public typealias Result = Ok
	public let sticker: InputFile

	public init(sticker: InputFile) {
		self.sticker = sticker
	}
}

public struct GetStickerEmojis: Codable, TDFunction {
	public typealias Result = StickerEmojis
	public let sticker: InputFile

	public init(sticker: InputFile) {
		self.sticker = sticker
	}
}

public struct GetSavedAnimations: Codable, TDFunction {
	public typealias Result = Animations

	public init() {
	}
}

public struct AddSavedAnimation: Codable, TDFunction {
	public typealias Result = Ok
	public let animation: InputFile

	public init(animation: InputFile) {
		self.animation = animation
	}
}

public struct RemoveSavedAnimation: Codable, TDFunction {
	public typealias Result = Ok
	public let animation: InputFile

	public init(animation: InputFile) {
		self.animation = animation
	}
}

public struct GetRecentInlineBots: Codable, TDFunction {
	public typealias Result = Users

	public init() {
	}
}

public struct SearchHashtags: Codable, TDFunction {
	public typealias Result = Hashtags
	public let prefix: String
	public let limit: Int32

	public init(prefix: String, limit: Int32) {
		self.prefix = prefix
		self.limit = limit
	}
}

public struct RemoveRecentHashtag: Codable, TDFunction {
	public typealias Result = Ok
	public let hashtag: String

	public init(hashtag: String) {
		self.hashtag = hashtag
	}
}

public struct GetWebPagePreview: Codable, TDFunction {
	public typealias Result = WebPage
	public let text: FormattedText

	public init(text: FormattedText) {
		self.text = text
	}
}

public struct GetWebPageInstantView: Codable, TDFunction {
	public typealias Result = WebPageInstantView
	public let url: String
	public let forceFull: Bool

	public init(url: String, forceFull: Bool) {
		self.url = url
		self.forceFull = forceFull
	}
}

public struct GetNotificationSettings: Codable, TDFunction {
	public typealias Result = NotificationSettings
	public let scope: NotificationSettingsScope

	public init(scope: NotificationSettingsScope) {
		self.scope = scope
	}
}

public struct SetNotificationSettings: Codable, TDFunction {
	public typealias Result = Ok
	public let scope: NotificationSettingsScope
	public let notificationSettings: NotificationSettings

	public init(scope: NotificationSettingsScope, notificationSettings: NotificationSettings) {
		self.scope = scope
		self.notificationSettings = notificationSettings
	}
}

public struct ResetAllNotificationSettings: Codable, TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct SetProfilePhoto: Codable, TDFunction {
	public typealias Result = Ok
	public let photo: InputFile

	public init(photo: InputFile) {
		self.photo = photo
	}
}

public struct DeleteProfilePhoto: Codable, TDFunction {
	public typealias Result = Ok
	public let profilePhotoId: TDInt64

	public init(profilePhotoId: TDInt64) {
		self.profilePhotoId = profilePhotoId
	}
}

public struct SetName: Codable, TDFunction {
	public typealias Result = Ok
	public let firstName: String
	public let lastName: String

	public init(firstName: String, lastName: String) {
		self.firstName = firstName
		self.lastName = lastName
	}
}

public struct SetBio: Codable, TDFunction {
	public typealias Result = Ok
	public let bio: String

	public init(bio: String) {
		self.bio = bio
	}
}

public struct SetUsername: Codable, TDFunction {
	public typealias Result = Ok
	public let username: String

	public init(username: String) {
		self.username = username
	}
}

public struct ChangePhoneNumber: Codable, TDFunction {
	public typealias Result = AuthenticationCodeInfo
	public let phoneNumber: String
	public let allowFlashCall: Bool
	public let isCurrentPhoneNumber: Bool

	public init(phoneNumber: String, allowFlashCall: Bool, isCurrentPhoneNumber: Bool) {
		self.phoneNumber = phoneNumber
		self.allowFlashCall = allowFlashCall
		self.isCurrentPhoneNumber = isCurrentPhoneNumber
	}
}

public struct ResendChangePhoneNumberCode: Codable, TDFunction {
	public typealias Result = AuthenticationCodeInfo

	public init() {
	}
}

public struct CheckChangePhoneNumberCode: Codable, TDFunction {
	public typealias Result = Ok
	public let code: String

	public init(code: String) {
		self.code = code
	}
}

public struct GetActiveSessions: Codable, TDFunction {
	public typealias Result = Sessions

	public init() {
	}
}

public struct TerminateSession: Codable, TDFunction {
	public typealias Result = Ok
	public let sessionId: TDInt64

	public init(sessionId: TDInt64) {
		self.sessionId = sessionId
	}
}

public struct TerminateAllOtherSessions: Codable, TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct GetConnectedWebsites: Codable, TDFunction {
	public typealias Result = ConnectedWebsites

	public init() {
	}
}

public struct DisconnectWebsite: Codable, TDFunction {
	public typealias Result = Ok
	public let websiteId: TDInt64

	public init(websiteId: TDInt64) {
		self.websiteId = websiteId
	}
}

public struct DisconnectAllWebsites: Codable, TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct ToggleBasicGroupAdministrators: Codable, TDFunction {
	public typealias Result = Ok
	public let basicGroupId: Int32
	public let everyoneIsAdministrator: Bool

	public init(basicGroupId: Int32, everyoneIsAdministrator: Bool) {
		self.basicGroupId = basicGroupId
		self.everyoneIsAdministrator = everyoneIsAdministrator
	}
}

public struct SetSupergroupUsername: Codable, TDFunction {
	public typealias Result = Ok
	public let supergroupId: Int32
	public let username: String

	public init(supergroupId: Int32, username: String) {
		self.supergroupId = supergroupId
		self.username = username
	}
}

public struct SetSupergroupStickerSet: Codable, TDFunction {
	public typealias Result = Ok
	public let supergroupId: Int32
	public let stickerSetId: TDInt64

	public init(supergroupId: Int32, stickerSetId: TDInt64) {
		self.supergroupId = supergroupId
		self.stickerSetId = stickerSetId
	}
}

public struct ToggleSupergroupInvites: Codable, TDFunction {
	public typealias Result = Ok
	public let supergroupId: Int32
	public let anyoneCanInvite: Bool

	public init(supergroupId: Int32, anyoneCanInvite: Bool) {
		self.supergroupId = supergroupId
		self.anyoneCanInvite = anyoneCanInvite
	}
}

public struct ToggleSupergroupSignMessages: Codable, TDFunction {
	public typealias Result = Ok
	public let supergroupId: Int32
	public let signMessages: Bool

	public init(supergroupId: Int32, signMessages: Bool) {
		self.supergroupId = supergroupId
		self.signMessages = signMessages
	}
}

public struct ToggleSupergroupIsAllHistoryAvailable: Codable, TDFunction {
	public typealias Result = Ok
	public let supergroupId: Int32
	public let isAllHistoryAvailable: Bool

	public init(supergroupId: Int32, isAllHistoryAvailable: Bool) {
		self.supergroupId = supergroupId
		self.isAllHistoryAvailable = isAllHistoryAvailable
	}
}

public struct SetSupergroupDescription: Codable, TDFunction {
	public typealias Result = Ok
	public let supergroupId: Int32
	public let description: String

	public init(supergroupId: Int32, description: String) {
		self.supergroupId = supergroupId
		self.description = description
	}
}

public struct PinSupergroupMessage: Codable, TDFunction {
	public typealias Result = Ok
	public let supergroupId: Int32
	public let messageId: Int53
	public let disableNotification: Bool

	public init(supergroupId: Int32, messageId: Int53, disableNotification: Bool) {
		self.supergroupId = supergroupId
		self.messageId = messageId
		self.disableNotification = disableNotification
	}
}

public struct UnpinSupergroupMessage: Codable, TDFunction {
	public typealias Result = Ok
	public let supergroupId: Int32

	public init(supergroupId: Int32) {
		self.supergroupId = supergroupId
	}
}

public struct ReportSupergroupSpam: Codable, TDFunction {
	public typealias Result = Ok
	public let supergroupId: Int32
	public let userId: Int32
	public let messageIds: [Int53]

	public init(supergroupId: Int32, userId: Int32, messageIds: [Int53]) {
		self.supergroupId = supergroupId
		self.userId = userId
		self.messageIds = messageIds
	}
}

public struct GetSupergroupMembers: Codable, TDFunction {
	public typealias Result = ChatMembers
	public let supergroupId: Int32
	public let filter: SupergroupMembersFilter
	public let offset: Int32
	public let limit: Int32

	public init(supergroupId: Int32, filter: SupergroupMembersFilter, offset: Int32, limit: Int32) {
		self.supergroupId = supergroupId
		self.filter = filter
		self.offset = offset
		self.limit = limit
	}
}

public struct DeleteSupergroup: Codable, TDFunction {
	public typealias Result = Ok
	public let supergroupId: Int32

	public init(supergroupId: Int32) {
		self.supergroupId = supergroupId
	}
}

public struct CloseSecretChat: Codable, TDFunction {
	public typealias Result = Ok
	public let secretChatId: Int32

	public init(secretChatId: Int32) {
		self.secretChatId = secretChatId
	}
}

public struct GetChatEventLog: Codable, TDFunction {
	public typealias Result = ChatEvents
	public let chatId: Int53
	public let query: String
	public let fromEventId: TDInt64
	public let limit: Int32
	public let filters: ChatEventLogFilters
	public let userIds: [Int32]

	public init(chatId: Int53, query: String, fromEventId: TDInt64, limit: Int32, filters: ChatEventLogFilters, userIds: [Int32]) {
		self.chatId = chatId
		self.query = query
		self.fromEventId = fromEventId
		self.limit = limit
		self.filters = filters
		self.userIds = userIds
	}
}

public struct GetPaymentForm: Codable, TDFunction {
	public typealias Result = PaymentForm
	public let chatId: Int53
	public let messageId: Int53

	public init(chatId: Int53, messageId: Int53) {
		self.chatId = chatId
		self.messageId = messageId
	}
}

public struct ValidateOrderInfo: Codable, TDFunction {
	public typealias Result = ValidatedOrderInfo
	public let chatId: Int53
	public let messageId: Int53
	public let orderInfo: OrderInfo
	public let allowSave: Bool

	public init(chatId: Int53, messageId: Int53, orderInfo: OrderInfo, allowSave: Bool) {
		self.chatId = chatId
		self.messageId = messageId
		self.orderInfo = orderInfo
		self.allowSave = allowSave
	}
}

public struct SendPaymentForm: Codable, TDFunction {
	public typealias Result = PaymentResult
	public let chatId: Int53
	public let messageId: Int53
	public let orderInfoId: String
	public let shippingOptionId: String
	public let credentials: InputCredentials

	public init(chatId: Int53, messageId: Int53, orderInfoId: String, shippingOptionId: String, credentials: InputCredentials) {
		self.chatId = chatId
		self.messageId = messageId
		self.orderInfoId = orderInfoId
		self.shippingOptionId = shippingOptionId
		self.credentials = credentials
	}
}

public struct GetPaymentReceipt: Codable, TDFunction {
	public typealias Result = PaymentReceipt
	public let chatId: Int53
	public let messageId: Int53

	public init(chatId: Int53, messageId: Int53) {
		self.chatId = chatId
		self.messageId = messageId
	}
}

public struct GetSavedOrderInfo: Codable, TDFunction {
	public typealias Result = OrderInfo

	public init() {
	}
}

public struct DeleteSavedOrderInfo: Codable, TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct DeleteSavedCredentials: Codable, TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct GetSupportUser: Codable, TDFunction {
	public typealias Result = User

	public init() {
	}
}

public struct GetWallpapers: Codable, TDFunction {
	public typealias Result = Wallpapers

	public init() {
	}
}

public struct RegisterDevice: Codable, TDFunction {
	public typealias Result = Ok
	public let deviceToken: DeviceToken
	public let otherUserIds: [Int32]

	public init(deviceToken: DeviceToken, otherUserIds: [Int32]) {
		self.deviceToken = deviceToken
		self.otherUserIds = otherUserIds
	}
}

public struct GetRecentlyVisitedTMeUrls: Codable, TDFunction {
	public typealias Result = TMeUrls
	public let referrer: String

	public init(referrer: String) {
		self.referrer = referrer
	}
}

public struct SetUserPrivacySettingRules: Codable, TDFunction {
	public typealias Result = Ok
	public let setting: UserPrivacySetting
	public let rules: UserPrivacySettingRules

	public init(setting: UserPrivacySetting, rules: UserPrivacySettingRules) {
		self.setting = setting
		self.rules = rules
	}
}

public struct GetUserPrivacySettingRules: Codable, TDFunction {
	public typealias Result = UserPrivacySettingRules
	public let setting: UserPrivacySetting

	public init(setting: UserPrivacySetting) {
		self.setting = setting
	}
}

public struct GetOption: Codable, TDFunction {
	public typealias Result = OptionValue
	public let name: String

	public init(name: String) {
		self.name = name
	}
}

public struct SetOption: Codable, TDFunction {
	public typealias Result = Ok
	public let name: String
	public let value: OptionValue

	public init(name: String, value: OptionValue) {
		self.name = name
		self.value = value
	}
}

public struct SetAccountTtl: Codable, TDFunction {
	public typealias Result = Ok
	public let ttl: AccountTtl

	public init(ttl: AccountTtl) {
		self.ttl = ttl
	}
}

public struct GetAccountTtl: Codable, TDFunction {
	public typealias Result = AccountTtl

	public init() {
	}
}

public struct DeleteAccount: Codable, TDFunction {
	public typealias Result = Ok
	public let reason: String

	public init(reason: String) {
		self.reason = reason
	}
}

public struct GetChatReportSpamState: Codable, TDFunction {
	public typealias Result = ChatReportSpamState
	public let chatId: Int53

	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

public struct ChangeChatReportSpamState: Codable, TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let isSpamChat: Bool

	public init(chatId: Int53, isSpamChat: Bool) {
		self.chatId = chatId
		self.isSpamChat = isSpamChat
	}
}

public struct ReportChat: Codable, TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let reason: ChatReportReason
	public let messageIds: [Int53]

	public init(chatId: Int53, reason: ChatReportReason, messageIds: [Int53]) {
		self.chatId = chatId
		self.reason = reason
		self.messageIds = messageIds
	}
}

public struct GetStorageStatistics: Codable, TDFunction {
	public typealias Result = StorageStatistics
	public let chatLimit: Int32

	public init(chatLimit: Int32) {
		self.chatLimit = chatLimit
	}
}

public struct GetStorageStatisticsFast: Codable, TDFunction {
	public typealias Result = StorageStatisticsFast

	public init() {
	}
}

public struct OptimizeStorage: Codable, TDFunction {
	public typealias Result = StorageStatistics
	public let size: Int53
	public let ttl: Int32
	public let count: Int32
	public let immunityDelay: Int32
	public let fileTypes: [FileType]
	public let chatIds: [Int53]
	public let excludeChatIds: [Int53]
	public let chatLimit: Int32

	public init(size: Int53, ttl: Int32, count: Int32, immunityDelay: Int32, fileTypes: [FileType], chatIds: [Int53], excludeChatIds: [Int53], chatLimit: Int32) {
		self.size = size
		self.ttl = ttl
		self.count = count
		self.immunityDelay = immunityDelay
		self.fileTypes = fileTypes
		self.chatIds = chatIds
		self.excludeChatIds = excludeChatIds
		self.chatLimit = chatLimit
	}
}

public struct SetNetworkType: Codable, TDFunction {
	public typealias Result = Ok
	public let type: NetworkType

	public init(type: NetworkType) {
		self.type = type
	}
}

public struct GetNetworkStatistics: Codable, TDFunction {
	public typealias Result = NetworkStatistics
	public let onlyCurrent: Bool

	public init(onlyCurrent: Bool) {
		self.onlyCurrent = onlyCurrent
	}
}

public struct AddNetworkStatistics: Codable, TDFunction {
	public typealias Result = Ok
	public let entry: NetworkStatisticsEntry

	public init(entry: NetworkStatisticsEntry) {
		self.entry = entry
	}
}

public struct ResetNetworkStatistics: Codable, TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct SetBotUpdatesStatus: Codable, TDFunction {
	public typealias Result = Ok
	public let pendingUpdateCount: Int32
	public let errorMessage: String

	public init(pendingUpdateCount: Int32, errorMessage: String) {
		self.pendingUpdateCount = pendingUpdateCount
		self.errorMessage = errorMessage
	}
}

public struct UploadStickerFile: Codable, TDFunction {
	public typealias Result = File
	public let userId: Int32
	public let pngSticker: InputFile

	public init(userId: Int32, pngSticker: InputFile) {
		self.userId = userId
		self.pngSticker = pngSticker
	}
}

public struct CreateNewStickerSet: Codable, TDFunction {
	public typealias Result = StickerSet
	public let userId: Int32
	public let title: String
	public let name: String
	public let isMasks: Bool
	public let stickers: [InputSticker]

	public init(userId: Int32, title: String, name: String, isMasks: Bool, stickers: [InputSticker]) {
		self.userId = userId
		self.title = title
		self.name = name
		self.isMasks = isMasks
		self.stickers = stickers
	}
}

public struct AddStickerToSet: Codable, TDFunction {
	public typealias Result = StickerSet
	public let userId: Int32
	public let name: String
	public let sticker: InputSticker

	public init(userId: Int32, name: String, sticker: InputSticker) {
		self.userId = userId
		self.name = name
		self.sticker = sticker
	}
}

public struct SetStickerPositionInSet: Codable, TDFunction {
	public typealias Result = Ok
	public let sticker: InputFile
	public let position: Int32

	public init(sticker: InputFile, position: Int32) {
		self.sticker = sticker
		self.position = position
	}
}

public struct RemoveStickerFromSet: Codable, TDFunction {
	public typealias Result = Ok
	public let sticker: InputFile

	public init(sticker: InputFile) {
		self.sticker = sticker
	}
}

public struct SendCustomRequest: Codable, TDFunction {
	public typealias Result = CustomRequestResult
	public let method: String
	public let parameters: String

	public init(method: String, parameters: String) {
		self.method = method
		self.parameters = parameters
	}
}

public struct AnswerCustomQuery: Codable, TDFunction {
	public typealias Result = Ok
	public let customQueryId: TDInt64
	public let data: String

	public init(customQueryId: TDInt64, data: String) {
		self.customQueryId = customQueryId
		self.data = data
	}
}

public struct SetAlarm: Codable, TDFunction {
	public typealias Result = Ok
	public let seconds: Double

	public init(seconds: Double) {
		self.seconds = seconds
	}
}

public struct GetCountryCode: Codable, TDFunction {
	public typealias Result = Text

	public init() {
	}
}

public struct GetInviteText: Codable, TDFunction {
	public typealias Result = Text

	public init() {
	}
}

public struct GetTermsOfService: Codable, TDFunction {
	public typealias Result = Text

	public init() {
	}
}

public struct SetProxy: Codable, TDFunction {
	public typealias Result = Ok
	public let proxy: Proxy

	public init(proxy: Proxy) {
		self.proxy = proxy
	}
}

public struct GetProxy: Codable, TDFunction {
	public typealias Result = Proxy

	public init() {
	}
}

public struct TestCallEmpty: Codable, TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct TestCallString: Codable, TDFunction {
	public typealias Result = TestString
	public let x: String

	public init(x: String) {
		self.x = x
	}
}

public struct TestCallBytes: Codable, TDFunction {
	public typealias Result = TestBytes
	public let x: Bytes

	public init(x: Bytes) {
		self.x = x
	}
}

public struct TestCallVectorInt: Codable, TDFunction {
	public typealias Result = TestVectorInt
	public let x: [Int32]

	public init(x: [Int32]) {
		self.x = x
	}
}

public struct TestCallVectorIntObject: Codable, TDFunction {
	public typealias Result = TestVectorIntObject
	public let x: [TestInt]

	public init(x: [TestInt]) {
		self.x = x
	}
}

public struct TestCallVectorString: Codable, TDFunction {
	public typealias Result = TestVectorString
	public let x: [String]

	public init(x: [String]) {
		self.x = x
	}
}

public struct TestCallVectorStringObject: Codable, TDFunction {
	public typealias Result = TestVectorStringObject
	public let x: [TestString]

	public init(x: [TestString]) {
		self.x = x
	}
}

public struct TestSquareInt: Codable, TDFunction {
	public typealias Result = TestInt
	public let x: Int32

	public init(x: Int32) {
		self.x = x
	}
}

public struct TestNetwork: Codable, TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct TestGetDifference: Codable, TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct TestUseUpdate: Codable, TDFunction {
	public typealias Result = Update

	public init() {
	}
}

public struct TestUseError: Codable, TDFunction {
	public typealias Result = Error

	public init() {
	}
}

