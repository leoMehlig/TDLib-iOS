public struct Error {
	public let code: Int32
	public let message: String

	public init(code: Int32, message: String) {
		self.code = code
		self.message = message
	}
}

public struct Ok {

	public init() {
	}
}

public struct TdlibParameters {
	public let useTestDc: Bool
	public let databaseDirectory: String
	public let filesDirectory: String
	public let useFileDatabase: Bool
	public let useChatInfoDatabase: Bool
	public let useMessageDatabase: Bool
	public let disableMessageUnload: Bool
	public let useSecretChats: Bool
	public let apiId: Int32
	public let apiHash: String
	public let systemLanguageCode: String
	public let deviceModel: String
	public let systemVersion: String
	public let applicationVersion: String
	public let enableStorageOptimizer: Bool
	public let ignoreFileNames: Bool

	public init(useTestDc: Bool, databaseDirectory: String, filesDirectory: String, useFileDatabase: Bool, useChatInfoDatabase: Bool, useMessageDatabase: Bool, disableMessageUnload: Bool, useSecretChats: Bool, apiId: Int32, apiHash: String, systemLanguageCode: String, deviceModel: String, systemVersion: String, applicationVersion: String, enableStorageOptimizer: Bool, ignoreFileNames: Bool) {
		self.useTestDc = useTestDc
		self.databaseDirectory = databaseDirectory
		self.filesDirectory = filesDirectory
		self.useFileDatabase = useFileDatabase
		self.useChatInfoDatabase = useChatInfoDatabase
		self.useMessageDatabase = useMessageDatabase
		self.disableMessageUnload = disableMessageUnload
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

public enum AuthenticationCodeType: TDEnum {
	case authenticationCodeTypeTelegramMessage(length: Int32)
	case authenticationCodeTypeSms(length: Int32)
	case authenticationCodeTypeCall(length: Int32)
	case authenticationCodeTypeFlashCall(pattern: String)
}

public struct AuthenticationCodeInfo {
	public let type: Authenticationcodetype
	public let nextType: Authenticationcodetype
	public let timeout: Int32

	public init(type: Authenticationcodetype, nextType: Authenticationcodetype, timeout: Int32) {
		self.type = type
		self.nextType = nextType
		self.timeout = timeout
	}
}

public enum AuthorizationState: TDEnum {
	case authorizationStateWaitTdlibParameters
	case authorizationStateWaitEncryptionKey(isEncrypted: Bool)
	case authorizationStateWaitPhoneNumber
	case authorizationStateWaitCode(isRegistered: Bool, codeInfo: Authenticationcodeinfo)
	case authorizationStateWaitPassword(passwordHint: String, hasRecoveryEmailAddress: Bool, recoveryEmailAddressPattern: String)
	case authorizationStateReady
	case authorizationStateLoggingOut
	case authorizationStateClosing
	case authorizationStateClosed
}

public struct PasswordState {
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

public struct PasswordRecoveryInfo {
	public let recoveryEmailAddressPattern: String

	public init(recoveryEmailAddressPattern: String) {
		self.recoveryEmailAddressPattern = recoveryEmailAddressPattern
	}
}

public struct RecoveryEmailAddress {
	public let recoveryEmailAddress: String

	public init(recoveryEmailAddress: String) {
		self.recoveryEmailAddress = recoveryEmailAddress
	}
}

public struct TemporaryPasswordState {
	public let hasPassword: Bool
	public let validFor: Int32

	public init(hasPassword: Bool, validFor: Int32) {
		self.hasPassword = hasPassword
		self.validFor = validFor
	}
}

public struct LocalFile {
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

public struct RemoteFile {
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

public struct File {
	public let id: Int32
	public let size: Int32
	public let expectedSize: Int32
	public let local: Localfile
	public let remote: Remotefile

	public init(id: Int32, size: Int32, expectedSize: Int32, local: Localfile, remote: Remotefile) {
		self.id = id
		self.size = size
		self.expectedSize = expectedSize
		self.local = local
		self.remote = remote
	}
}

public enum InputFile: TDEnum {
	case inputFileId(id: Int32)
	case inputFileRemote(id: String)
	case inputFileLocal(path: String)
	case inputFileGenerated(originalPath: String, conversion: String, expectedSize: Int32)
}

public struct PhotoSize {
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

public enum MaskPoint: TDEnum {
	case maskPointForehead
	case maskPointEyes
	case maskPointMouth
	case maskPointChin
}

public struct MaskPosition {
	public let point: Maskpoint
	public let xShift: Double
	public let yShift: Double
	public let scale: Double

	public init(point: Maskpoint, xShift: Double, yShift: Double, scale: Double) {
		self.point = point
		self.xShift = xShift
		self.yShift = yShift
		self.scale = scale
	}
}

public struct TextEntity {
	public let offset: Int32
	public let length: Int32
	public let type: Textentitytype

	public init(offset: Int32, length: Int32, type: Textentitytype) {
		self.offset = offset
		self.length = length
		self.type = type
	}
}

public struct TextEntities {
	public let entities: Vector<textentity>

	public init(entities: Vector<textentity>) {
		self.entities = entities
	}
}

public struct FormattedText {
	public let text: String
	public let entities: Vector<textentity>

	public init(text: String, entities: Vector<textentity>) {
		self.text = text
		self.entities = entities
	}
}

public struct Animation {
	public let duration: Int32
	public let width: Int32
	public let height: Int32
	public let fileName: String
	public let mimeType: String
	public let thumbnail: Photosize
	public let animation: File

	public init(duration: Int32, width: Int32, height: Int32, fileName: String, mimeType: String, thumbnail: Photosize, animation: File) {
		self.duration = duration
		self.width = width
		self.height = height
		self.fileName = fileName
		self.mimeType = mimeType
		self.thumbnail = thumbnail
		self.animation = animation
	}
}

public struct Audio {
	public let duration: Int32
	public let title: String
	public let performer: String
	public let fileName: String
	public let mimeType: String
	public let albumCoverThumbnail: Photosize
	public let audio: File

	public init(duration: Int32, title: String, performer: String, fileName: String, mimeType: String, albumCoverThumbnail: Photosize, audio: File) {
		self.duration = duration
		self.title = title
		self.performer = performer
		self.fileName = fileName
		self.mimeType = mimeType
		self.albumCoverThumbnail = albumCoverThumbnail
		self.audio = audio
	}
}

public struct Document {
	public let fileName: String
	public let mimeType: String
	public let thumbnail: Photosize
	public let document: File

	public init(fileName: String, mimeType: String, thumbnail: Photosize, document: File) {
		self.fileName = fileName
		self.mimeType = mimeType
		self.thumbnail = thumbnail
		self.document = document
	}
}

public struct Photo {
	public let id: Int64
	public let hasStickers: Bool
	public let sizes: Vector<photosize>

	public init(id: Int64, hasStickers: Bool, sizes: Vector<photosize>) {
		self.id = id
		self.hasStickers = hasStickers
		self.sizes = sizes
	}
}

public struct Sticker {
	public let setId: Int64
	public let width: Int32
	public let height: Int32
	public let emoji: String
	public let isMask: Bool
	public let maskPosition: Maskposition
	public let thumbnail: Photosize
	public let sticker: File

	public init(setId: Int64, width: Int32, height: Int32, emoji: String, isMask: Bool, maskPosition: Maskposition, thumbnail: Photosize, sticker: File) {
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

public struct Video {
	public let duration: Int32
	public let width: Int32
	public let height: Int32
	public let fileName: String
	public let mimeType: String
	public let hasStickers: Bool
	public let thumbnail: Photosize
	public let video: File

	public init(duration: Int32, width: Int32, height: Int32, fileName: String, mimeType: String, hasStickers: Bool, thumbnail: Photosize, video: File) {
		self.duration = duration
		self.width = width
		self.height = height
		self.fileName = fileName
		self.mimeType = mimeType
		self.hasStickers = hasStickers
		self.thumbnail = thumbnail
		self.video = video
	}
}

public struct VideoNote {
	public let duration: Int32
	public let length: Int32
	public let thumbnail: Photosize
	public let video: File

	public init(duration: Int32, length: Int32, thumbnail: Photosize, video: File) {
		self.duration = duration
		self.length = length
		self.thumbnail = thumbnail
		self.video = video
	}
}

public struct VoiceNote {
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

public struct Contact {
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

public struct Location {
	public let latitude: Double
	public let longitude: Double

	public init(latitude: Double, longitude: Double) {
		self.latitude = latitude
		self.longitude = longitude
	}
}

public struct Venue {
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

public struct Game {
	public let id: Int64
	public let shortName: String
	public let title: String
	public let text: Formattedtext
	public let description: String
	public let photo: Photo
	public let animation: Animation

	public init(id: Int64, shortName: String, title: String, text: Formattedtext, description: String, photo: Photo, animation: Animation) {
		self.id = id
		self.shortName = shortName
		self.title = title
		self.text = text
		self.description = description
		self.photo = photo
		self.animation = animation
	}
}

public struct ProfilePhoto {
	public let id: Int64
	public let small: File
	public let big: File

	public init(id: Int64, small: File, big: File) {
		self.id = id
		self.small = small
		self.big = big
	}
}

public struct ChatPhoto {
	public let small: File
	public let big: File

	public init(small: File, big: File) {
		self.small = small
		self.big = big
	}
}

public enum LinkState: TDEnum {
	case linkStateNone
	case linkStateKnowsPhoneNumber
	case linkStateIsContact
}

public enum UserType: TDEnum {
	case userTypeRegular
	case userTypeDeleted
	case userTypeBot(canJoinGroups: Bool, canReadAllGroupMessages: Bool, isInline: Bool, inlineQueryPlaceholder: String, needLocation: Bool)
	case userTypeUnknown
}

public struct BotCommand {
	public let command: String
	public let description: String

	public init(command: String, description: String) {
		self.command = command
		self.description = description
	}
}

public struct BotInfo {
	public let description: String
	public let commands: Vector<botcommand>

	public init(description: String, commands: Vector<botcommand>) {
		self.description = description
		self.commands = commands
	}
}

public struct User {
	public let id: Int32
	public let firstName: String
	public let lastName: String
	public let username: String
	public let phoneNumber: String
	public let status: Userstatus
	public let profilePhoto: Profilephoto
	public let outgoingLink: Linkstate
	public let incomingLink: Linkstate
	public let isVerified: Bool
	public let restrictionReason: String
	public let haveAccess: Bool
	public let type: Usertype
	public let languageCode: String

	public init(id: Int32, firstName: String, lastName: String, username: String, phoneNumber: String, status: Userstatus, profilePhoto: Profilephoto, outgoingLink: Linkstate, incomingLink: Linkstate, isVerified: Bool, restrictionReason: String, haveAccess: Bool, type: Usertype, languageCode: String) {
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

public struct UserFullInfo {
	public let isBlocked: Bool
	public let canBeCalled: Bool
	public let hasPrivateCalls: Bool
	public let bio: String
	public let shareText: String
	public let groupInCommonCount: Int32
	public let botInfo: Botinfo

	public init(isBlocked: Bool, canBeCalled: Bool, hasPrivateCalls: Bool, bio: String, shareText: String, groupInCommonCount: Int32, botInfo: Botinfo) {
		self.isBlocked = isBlocked
		self.canBeCalled = canBeCalled
		self.hasPrivateCalls = hasPrivateCalls
		self.bio = bio
		self.shareText = shareText
		self.groupInCommonCount = groupInCommonCount
		self.botInfo = botInfo
	}
}

public struct UserProfilePhotos {
	public let totalCount: Int32
	public let photos: Vector<photo>

	public init(totalCount: Int32, photos: Vector<photo>) {
		self.totalCount = totalCount
		self.photos = photos
	}
}

public struct Users {
	public let totalCount: Int32
	public let userIds: Vector<int32>

	public init(totalCount: Int32, userIds: Vector<int32>) {
		self.totalCount = totalCount
		self.userIds = userIds
	}
}

public enum ChatMemberStatus: TDEnum {
	case chatMemberStatusCreator(isMember: Bool)
	case chatMemberStatusAdministrator(canBeEdited: Bool, canChangeInfo: Bool, canPostMessages: Bool, canEditMessages: Bool, canDeleteMessages: Bool, canInviteUsers: Bool, canRestrictMembers: Bool, canPinMessages: Bool, canPromoteMembers: Bool)
	case chatMemberStatusMember
	case chatMemberStatusRestricted(isMember: Bool, restrictedUntilDate: Int32, canSendMessages: Bool, canSendMediaMessages: Bool, canSendOtherMessages: Bool, canAddWebPagePreviews: Bool)
	case chatMemberStatusLeft
	case chatMemberStatusBanned(bannedUntilDate: Int32)
}

public struct ChatMember {
	public let userId: Int32
	public let inviterUserId: Int32
	public let joinedChatDate: Int32
	public let status: Chatmemberstatus
	public let botInfo: Botinfo

	public init(userId: Int32, inviterUserId: Int32, joinedChatDate: Int32, status: Chatmemberstatus, botInfo: Botinfo) {
		self.userId = userId
		self.inviterUserId = inviterUserId
		self.joinedChatDate = joinedChatDate
		self.status = status
		self.botInfo = botInfo
	}
}

public struct ChatMembers {
	public let totalCount: Int32
	public let members: Vector<chatmember>

	public init(totalCount: Int32, members: Vector<chatmember>) {
		self.totalCount = totalCount
		self.members = members
	}
}

public enum SupergroupMembersFilter: TDEnum {
	case supergroupMembersFilterRecent
	case supergroupMembersFilterAdministrators
	case supergroupMembersFilterSearch(query: String)
	case supergroupMembersFilterRestricted(query: String)
	case supergroupMembersFilterBanned(query: String)
	case supergroupMembersFilterBots
}

public struct BasicGroup {
	public let id: Int32
	public let memberCount: Int32
	public let status: Chatmemberstatus
	public let everyoneIsAdministrator: Bool
	public let isActive: Bool
	public let upgradedToSupergroupId: Int32

	public init(id: Int32, memberCount: Int32, status: Chatmemberstatus, everyoneIsAdministrator: Bool, isActive: Bool, upgradedToSupergroupId: Int32) {
		self.id = id
		self.memberCount = memberCount
		self.status = status
		self.everyoneIsAdministrator = everyoneIsAdministrator
		self.isActive = isActive
		self.upgradedToSupergroupId = upgradedToSupergroupId
	}
}

public struct BasicGroupFullInfo {
	public let creatorUserId: Int32
	public let members: Vector<chatmember>
	public let inviteLink: String

	public init(creatorUserId: Int32, members: Vector<chatmember>, inviteLink: String) {
		self.creatorUserId = creatorUserId
		self.members = members
		self.inviteLink = inviteLink
	}
}

public struct Supergroup {
	public let id: Int32
	public let username: String
	public let date: Int32
	public let status: Chatmemberstatus
	public let memberCount: Int32
	public let anyoneCanInvite: Bool
	public let signMessages: Bool
	public let isChannel: Bool
	public let isVerified: Bool
	public let restrictionReason: String

	public init(id: Int32, username: String, date: Int32, status: Chatmemberstatus, memberCount: Int32, anyoneCanInvite: Bool, signMessages: Bool, isChannel: Bool, isVerified: Bool, restrictionReason: String) {
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

public struct SupergroupFullInfo {
	public let description: String
	public let memberCount: Int32
	public let administratorCount: Int32
	public let restrictedCount: Int32
	public let bannedCount: Int32
	public let canGetMembers: Bool
	public let canSetUsername: Bool
	public let canSetStickerSet: Bool
	public let isAllHistoryAvailable: Bool
	public let stickerSetId: Int64
	public let inviteLink: String
	public let pinnedMessageId: Int53
	public let upgradedFromBasicGroupId: Int32
	public let upgradedFromMaxMessageId: Int53

	public init(description: String, memberCount: Int32, administratorCount: Int32, restrictedCount: Int32, bannedCount: Int32, canGetMembers: Bool, canSetUsername: Bool, canSetStickerSet: Bool, isAllHistoryAvailable: Bool, stickerSetId: Int64, inviteLink: String, pinnedMessageId: Int53, upgradedFromBasicGroupId: Int32, upgradedFromMaxMessageId: Int53) {
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

public enum SecretChatState: TDEnum {
	case secretChatStatePending
	case secretChatStateReady
	case secretChatStateClosed
}

public struct SecretChat {
	public let id: Int32
	public let userId: Int32
	public let state: Secretchatstate
	public let isOutbound: Bool
	public let ttl: Int32
	public let keyHash: Bytes
	public let layer: Int32

	public init(id: Int32, userId: Int32, state: Secretchatstate, isOutbound: Bool, ttl: Int32, keyHash: Bytes, layer: Int32) {
		self.id = id
		self.userId = userId
		self.state = state
		self.isOutbound = isOutbound
		self.ttl = ttl
		self.keyHash = keyHash
		self.layer = layer
	}
}

public enum MessageForwardInfo: TDEnum {
	case messageForwardedFromUser(senderUserId: Int32, date: Int32, forwardedFromChatId: Int53, forwardedFromMessageId: Int53)
	case messageForwardedPost(chatId: Int53, authorSignature: String, date: Int32, messageId: Int53, forwardedFromChatId: Int53, forwardedFromMessageId: Int53)
}

public enum MessageSendingState: TDEnum {
	case messageSendingStatePending
	case messageSendingStateFailed
}

public struct Message {
	public let id: Int53
	public let senderUserId: Int32
	public let chatId: Int53
	public let sendingState: Messagesendingstate
	public let isOutgoing: Bool
	public let canBeEdited: Bool
	public let canBeForwarded: Bool
	public let canBeDeletedOnlyForSelf: Bool
	public let canBeDeletedForAllUsers: Bool
	public let isChannelPost: Bool
	public let containsUnreadMention: Bool
	public let date: Int32
	public let editDate: Int32
	public let forwardInfo: Messageforwardinfo
	public let replyToMessageId: Int53
	public let ttl: Int32
	public let ttlExpiresIn: Double
	public let viaBotUserId: Int32
	public let authorSignature: String
	public let views: Int32
	public let mediaAlbumId: Int64
	public let content: Messagecontent
	public let replyMarkup: Replymarkup

	public init(id: Int53, senderUserId: Int32, chatId: Int53, sendingState: Messagesendingstate, isOutgoing: Bool, canBeEdited: Bool, canBeForwarded: Bool, canBeDeletedOnlyForSelf: Bool, canBeDeletedForAllUsers: Bool, isChannelPost: Bool, containsUnreadMention: Bool, date: Int32, editDate: Int32, forwardInfo: Messageforwardinfo, replyToMessageId: Int53, ttl: Int32, ttlExpiresIn: Double, viaBotUserId: Int32, authorSignature: String, views: Int32, mediaAlbumId: Int64, content: Messagecontent, replyMarkup: Replymarkup) {
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

public struct Messages {
	public let totalCount: Int32
	public let messages: Vector<message>

	public init(totalCount: Int32, messages: Vector<message>) {
		self.totalCount = totalCount
		self.messages = messages
	}
}

public struct FoundMessages {
	public let messages: Vector<message>
	public let nextFromSearchId: Int64

	public init(messages: Vector<message>, nextFromSearchId: Int64) {
		self.messages = messages
		self.nextFromSearchId = nextFromSearchId
	}
}

public enum NotificationSettingsScope: TDEnum {
	case notificationSettingsScopeChat(chatId: Int53)
	case notificationSettingsScopePrivateChats
	case notificationSettingsScopeBasicGroupChats
	case notificationSettingsScopeAllChats
}

public struct NotificationSettings {
	public let muteFor: Int32
	public let sound: String
	public let showPreview: Bool

	public init(muteFor: Int32, sound: String, showPreview: Bool) {
		self.muteFor = muteFor
		self.sound = sound
		self.showPreview = showPreview
	}
}

public struct DraftMessage {
	public let replyToMessageId: Int53
	public let inputMessageText: Inputmessagecontent

	public init(replyToMessageId: Int53, inputMessageText: Inputmessagecontent) {
		self.replyToMessageId = replyToMessageId
		self.inputMessageText = inputMessageText
	}
}

public enum ChatType: TDEnum {
	case chatTypePrivate(userId: Int32)
	case chatTypeBasicGroup(basicGroupId: Int32)
	case chatTypeSupergroup(supergroupId: Int32, isChannel: Bool)
	case chatTypeSecret(secretChatId: Int32, userId: Int32)
}

public struct Chat {
	public let id: Int53
	public let type: Chattype
	public let title: String
	public let photo: Chatphoto
	public let lastMessage: Message
	public let order: Int64
	public let isPinned: Bool
	public let unreadCount: Int32
	public let lastReadInboxMessageId: Int53
	public let lastReadOutboxMessageId: Int53
	public let unreadMentionCount: Int32
	public let notificationSettings: Notificationsettings
	public let replyMarkupMessageId: Int53
	public let draftMessage: Draftmessage
	public let clientData: String

	public init(id: Int53, type: Chattype, title: String, photo: Chatphoto, lastMessage: Message, order: Int64, isPinned: Bool, unreadCount: Int32, lastReadInboxMessageId: Int53, lastReadOutboxMessageId: Int53, unreadMentionCount: Int32, notificationSettings: Notificationsettings, replyMarkupMessageId: Int53, draftMessage: Draftmessage, clientData: String) {
		self.id = id
		self.type = type
		self.title = title
		self.photo = photo
		self.lastMessage = lastMessage
		self.order = order
		self.isPinned = isPinned
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

public struct Chats {
	public let chatIds: Vector<int53>

	public init(chatIds: Vector<int53>) {
		self.chatIds = chatIds
	}
}

public struct ChatInviteLink {
	public let inviteLink: String

	public init(inviteLink: String) {
		self.inviteLink = inviteLink
	}
}

public struct ChatInviteLinkInfo {
	public let chatId: Int53
	public let type: Chattype
	public let title: String
	public let photo: Chatphoto
	public let memberCount: Int32
	public let memberUserIds: Vector<int32>
	public let isPublic: Bool

	public init(chatId: Int53, type: Chattype, title: String, photo: Chatphoto, memberCount: Int32, memberUserIds: Vector<int32>, isPublic: Bool) {
		self.chatId = chatId
		self.type = type
		self.title = title
		self.photo = photo
		self.memberCount = memberCount
		self.memberUserIds = memberUserIds
		self.isPublic = isPublic
	}
}

public enum KeyboardButtonType: TDEnum {
	case keyboardButtonTypeText
	case keyboardButtonTypeRequestPhoneNumber
	case keyboardButtonTypeRequestLocation
}

public struct KeyboardButton {
	public let text: String
	public let type: Keyboardbuttontype

	public init(text: String, type: Keyboardbuttontype) {
		self.text = text
		self.type = type
	}
}

public enum InlineKeyboardButtonType: TDEnum {
	case inlineKeyboardButtonTypeUrl(url: String)
	case inlineKeyboardButtonTypeCallback(data: Bytes)
	case inlineKeyboardButtonTypeCallbackGame
	case inlineKeyboardButtonTypeSwitchInline(query: String, inCurrentChat: Bool)
	case inlineKeyboardButtonTypeBuy
}

public struct InlineKeyboardButton {
	public let text: String
	public let type: Inlinekeyboardbuttontype

	public init(text: String, type: Inlinekeyboardbuttontype) {
		self.text = text
		self.type = type
	}
}

public enum ReplyMarkup: TDEnum {
	case replyMarkupRemoveKeyboard(isPersonal: Bool)
	case replyMarkupForceReply(isPersonal: Bool)
	case replyMarkupShowKeyboard(rows: Vector<vector<keyboardbutton>>, resizeKeyboard: Bool, oneTime: Bool, isPersonal: Bool)
	case replyMarkupInlineKeyboard(rows: Vector<vector<inlinekeyboardbutton>>)
}

public enum RichText: TDEnum {
	case richTextPlain(text: String)
	case richTextBold(text: Richtext)
	case richTextItalic(text: Richtext)
	case richTextUnderline(text: Richtext)
	case richTextStrikethrough(text: Richtext)
	case richTextFixed(text: Richtext)
	case richTextUrl(text: Richtext, url: String)
	case richTextEmailAddress(text: Richtext, emailAddress: String)
	case richTexts(texts: Vector<richtext>)
}

public enum PageBlock: TDEnum {
	case pageBlockTitle(title: Richtext)
	case pageBlockSubtitle(subtitle: Richtext)
	case pageBlockAuthorDate(author: Richtext, publishDate: Int32)
	case pageBlockHeader(header: Richtext)
	case pageBlockSubheader(subheader: Richtext)
	case pageBlockParagraph(text: Richtext)
	case pageBlockPreformatted(text: Richtext, language: String)
	case pageBlockFooter(footer: Richtext)
	case pageBlockDivider
	case pageBlockAnchor(name: String)
	case pageBlockList(items: Vector<richtext>, isOrdered: Bool)
	case pageBlockBlockQuote(text: Richtext, caption: Richtext)
	case pageBlockPullQuote(text: Richtext, caption: Richtext)
	case pageBlockAnimation(animation: Animation, caption: Richtext, needAutoplay: Bool)
	case pageBlockAudio(audio: Audio, caption: Richtext)
	case pageBlockPhoto(photo: Photo, caption: Richtext)
	case pageBlockVideo(video: Video, caption: Richtext, needAutoplay: Bool, isLooped: Bool)
	case pageBlockCover(cover: Pageblock)
	case pageBlockEmbedded(url: String, html: String, posterPhoto: Photo, width: Int32, height: Int32, caption: Richtext, isFullWidth: Bool, allowScrolling: Bool)
	case pageBlockEmbeddedPost(url: String, author: String, authorPhoto: Photo, date: Int32, pageBlocks: Vector<pageblock>, caption: Richtext)
	case pageBlockCollage(pageBlocks: Vector<pageblock>, caption: Richtext)
	case pageBlockSlideshow(pageBlocks: Vector<pageblock>, caption: Richtext)
	case pageBlockChatLink(title: String, photo: Chatphoto, username: String)
}

public struct WebPageInstantView {
	public let pageBlocks: Vector<pageblock>
	public let isFull: Bool

	public init(pageBlocks: Vector<pageblock>, isFull: Bool) {
		self.pageBlocks = pageBlocks
		self.isFull = isFull
	}
}

public struct WebPage {
	public let url: String
	public let displayUrl: String
	public let type: String
	public let siteName: String
	public let title: String
	public let description: String
	public let photo: Photo
	public let embedUrl: String
	public let embedType: String
	public let embedWidth: Int32
	public let embedHeight: Int32
	public let duration: Int32
	public let author: String
	public let animation: Animation
	public let audio: Audio
	public let document: Document
	public let sticker: Sticker
	public let video: Video
	public let videoNote: Videonote
	public let voiceNote: Voicenote
	public let hasInstantView: Bool

	public init(url: String, displayUrl: String, type: String, siteName: String, title: String, description: String, photo: Photo, embedUrl: String, embedType: String, embedWidth: Int32, embedHeight: Int32, duration: Int32, author: String, animation: Animation, audio: Audio, document: Document, sticker: Sticker, video: Video, videoNote: Videonote, voiceNote: Voicenote, hasInstantView: Bool) {
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

public struct LabeledPricePart {
	public let label: String
	public let amount: Int53

	public init(label: String, amount: Int53) {
		self.label = label
		self.amount = amount
	}
}

public struct Invoice {
	public let currency: String
	public let priceParts: Vector<labeledpricepart>
	public let isTest: Bool
	public let needName: Bool
	public let needPhoneNumber: Bool
	public let needEmailAddress: Bool
	public let needShippingAddress: Bool
	public let sendPhoneNumberToProvider: Bool
	public let sendEmailAddressToProvider: Bool
	public let isFlexible: Bool

	public init(currency: String, priceParts: Vector<labeledpricepart>, isTest: Bool, needName: Bool, needPhoneNumber: Bool, needEmailAddress: Bool, needShippingAddress: Bool, sendPhoneNumberToProvider: Bool, sendEmailAddressToProvider: Bool, isFlexible: Bool) {
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

public struct ShippingAddress {
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

public struct OrderInfo {
	public let name: String
	public let phoneNumber: String
	public let emailAddress: String
	public let shippingAddress: Shippingaddress

	public init(name: String, phoneNumber: String, emailAddress: String, shippingAddress: Shippingaddress) {
		self.name = name
		self.phoneNumber = phoneNumber
		self.emailAddress = emailAddress
		self.shippingAddress = shippingAddress
	}
}

public struct ShippingOption {
	public let id: String
	public let title: String
	public let priceParts: Vector<labeledpricepart>

	public init(id: String, title: String, priceParts: Vector<labeledpricepart>) {
		self.id = id
		self.title = title
		self.priceParts = priceParts
	}
}

public struct SavedCredentials {
	public let id: String
	public let title: String

	public init(id: String, title: String) {
		self.id = id
		self.title = title
	}
}

public enum InputCredentials: TDEnum {
	case inputCredentialsSaved(savedCredentialsId: String)
	case inputCredentialsNew(data: String, allowSave: Bool)
	case inputCredentialsAndroidPay(data: String)
	case inputCredentialsApplePay(data: String)
}

public struct PaymentsProviderStripe {
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

public struct PaymentForm {
	public let invoice: Invoice
	public let url: String
	public let paymentsProvider: Paymentsproviderstripe
	public let savedOrderInfo: Orderinfo
	public let savedCredentials: Savedcredentials
	public let canSaveCredentials: Bool
	public let needPassword: Bool

	public init(invoice: Invoice, url: String, paymentsProvider: Paymentsproviderstripe, savedOrderInfo: Orderinfo, savedCredentials: Savedcredentials, canSaveCredentials: Bool, needPassword: Bool) {
		self.invoice = invoice
		self.url = url
		self.paymentsProvider = paymentsProvider
		self.savedOrderInfo = savedOrderInfo
		self.savedCredentials = savedCredentials
		self.canSaveCredentials = canSaveCredentials
		self.needPassword = needPassword
	}
}

public struct ValidatedOrderInfo {
	public let orderInfoId: String
	public let shippingOptions: Vector<shippingoption>

	public init(orderInfoId: String, shippingOptions: Vector<shippingoption>) {
		self.orderInfoId = orderInfoId
		self.shippingOptions = shippingOptions
	}
}

public struct PaymentResult {
	public let success: Bool
	public let verificationUrl: String

	public init(success: Bool, verificationUrl: String) {
		self.success = success
		self.verificationUrl = verificationUrl
	}
}

public struct PaymentReceipt {
	public let date: Int32
	public let paymentsProviderUserId: Int32
	public let invoice: Invoice
	public let orderInfo: Orderinfo
	public let shippingOption: Shippingoption
	public let credentialsTitle: String

	public init(date: Int32, paymentsProviderUserId: Int32, invoice: Invoice, orderInfo: Orderinfo, shippingOption: Shippingoption, credentialsTitle: String) {
		self.date = date
		self.paymentsProviderUserId = paymentsProviderUserId
		self.invoice = invoice
		self.orderInfo = orderInfo
		self.shippingOption = shippingOption
		self.credentialsTitle = credentialsTitle
	}
}

public enum MessageContent: TDEnum {
	case messageText(text: Formattedtext, webPage: Webpage)
	case messageAnimation(animation: Animation, caption: Formattedtext)
	case messageAudio(audio: Audio, caption: Formattedtext)
	case messageDocument(document: Document, caption: Formattedtext)
	case messagePhoto(photo: Photo, caption: Formattedtext)
	case messageExpiredPhoto
	case messageSticker(sticker: Sticker)
	case messageVideo(video: Video, caption: Formattedtext)
	case messageExpiredVideo
	case messageVideoNote(videoNote: Videonote, isViewed: Bool)
	case messageVoiceNote(voiceNote: Voicenote, caption: Formattedtext, isListened: Bool)
	case messageLocation(location: Location, livePeriod: Int32)
	case messageVenue(venue: Venue)
	case messageContact(contact: Contact)
	case messageGame(game: Game)
	case messageInvoice(title: String, description: String, photo: Photo, currency: String, totalAmount: Int53, startParameter: String, isTest: Bool, needShippingAddress: Bool, receiptMessageId: Int53)
	case messageCall(discardReason: Calldiscardreason, duration: Int32)
	case messageBasicGroupChatCreate(title: String, memberUserIds: Vector<int32>)
	case messageSupergroupChatCreate(title: String)
	case messageChatChangeTitle(title: String)
	case messageChatChangePhoto(photo: Photo)
	case messageChatDeletePhoto
	case messageChatAddMembers(memberUserIds: Vector<int32>)
	case messageChatJoinByLink
	case messageChatDeleteMember(userId: Int32)
	case messageChatUpgradeTo(supergroupId: Int32)
	case messageChatUpgradeFrom(title: String, basicGroupId: Int32)
	case messagePinMessage(messageId: Int53)
	case messageScreenshotTaken
	case messageChatSetTtl(ttl: Int32)
	case messageCustomServiceAction(text: String)
	case messageGameScore(gameMessageId: Int53, gameId: Int64, score: Int32)
	case messagePaymentSuccessful(invoiceMessageId: Int53, currency: String, totalAmount: Int53)
	case messagePaymentSuccessfulBot(invoiceMessageId: Int53, currency: String, totalAmount: Int53, invoicePayload: Bytes, shippingOptionId: String, orderInfo: Orderinfo, telegramPaymentChargeId: String, providerPaymentChargeId: String)
	case messageContactRegistered
	case messageUnsupported
}

public enum TextEntityType: TDEnum {
	case textEntityTypeMention
	case textEntityTypeHashtag
	case textEntityTypeBotCommand
	case textEntityTypeUrl
	case textEntityTypeEmailAddress
	case textEntityTypeBold
	case textEntityTypeItalic
	case textEntityTypeCode
	case textEntityTypePre
	case textEntityTypePreCode(language: String)
	case textEntityTypeTextUrl(url: String)
	case textEntityTypeMentionName(userId: Int32)
}

public struct InputThumbnail {
	public let thumbnail: Inputfile
	public let width: Int32
	public let height: Int32

	public init(thumbnail: Inputfile, width: Int32, height: Int32) {
		self.thumbnail = thumbnail
		self.width = width
		self.height = height
	}
}

public enum InputMessageContent: TDEnum {
	case inputMessageText(text: Formattedtext, disableWebPagePreview: Bool, clearDraft: Bool)
	case inputMessageAnimation(animation: Inputfile, thumbnail: Inputthumbnail, duration: Int32, width: Int32, height: Int32, caption: Formattedtext)
	case inputMessageAudio(audio: Inputfile, albumCoverThumbnail: Inputthumbnail, duration: Int32, title: String, performer: String, caption: Formattedtext)
	case inputMessageDocument(document: Inputfile, thumbnail: Inputthumbnail, caption: Formattedtext)
	case inputMessagePhoto(photo: Inputfile, thumbnail: Inputthumbnail, addedStickerFileIds: Vector<int32>, width: Int32, height: Int32, caption: Formattedtext, ttl: Int32)
	case inputMessageSticker(sticker: Inputfile, thumbnail: Inputthumbnail, width: Int32, height: Int32)
	case inputMessageVideo(video: Inputfile, thumbnail: Inputthumbnail, addedStickerFileIds: Vector<int32>, duration: Int32, width: Int32, height: Int32, caption: Formattedtext, ttl: Int32)
	case inputMessageVideoNote(videoNote: Inputfile, thumbnail: Inputthumbnail, duration: Int32, length: Int32)
	case inputMessageVoiceNote(voiceNote: Inputfile, duration: Int32, waveform: Bytes, caption: Formattedtext)
	case inputMessageLocation(location: Location, livePeriod: Int32)
	case inputMessageVenue(venue: Venue)
	case inputMessageContact(contact: Contact)
	case inputMessageGame(botUserId: Int32, gameShortName: String)
	case inputMessageInvoice(invoice: Invoice, title: String, description: String, photoUrl: String, photoSize: Int32, photoWidth: Int32, photoHeight: Int32, payload: Bytes, providerToken: String, providerData: String, startParameter: String)
	case inputMessageForwarded(fromChatId: Int53, messageId: Int53, inGameShare: Bool)
}

public enum SearchMessagesFilter: TDEnum {
	case searchMessagesFilterEmpty
	case searchMessagesFilterAnimation
	case searchMessagesFilterAudio
	case searchMessagesFilterDocument
	case searchMessagesFilterPhoto
	case searchMessagesFilterVideo
	case searchMessagesFilterVoiceNote
	case searchMessagesFilterPhotoAndVideo
	case searchMessagesFilterUrl
	case searchMessagesFilterChatPhoto
	case searchMessagesFilterCall
	case searchMessagesFilterMissedCall
	case searchMessagesFilterVideoNote
	case searchMessagesFilterVoiceAndVideoNote
	case searchMessagesFilterMention
	case searchMessagesFilterUnreadMention
}

public enum ChatAction: TDEnum {
	case chatActionTyping
	case chatActionRecordingVideo
	case chatActionUploadingVideo(progress: Int32)
	case chatActionRecordingVoiceNote
	case chatActionUploadingVoiceNote(progress: Int32)
	case chatActionUploadingPhoto(progress: Int32)
	case chatActionUploadingDocument(progress: Int32)
	case chatActionChoosingLocation
	case chatActionChoosingContact
	case chatActionStartPlayingGame
	case chatActionRecordingVideoNote
	case chatActionUploadingVideoNote(progress: Int32)
	case chatActionCancel
}

public enum UserStatus: TDEnum {
	case userStatusEmpty
	case userStatusOnline(expires: Int32)
	case userStatusOffline(wasOnline: Int32)
	case userStatusRecently
	case userStatusLastWeek
	case userStatusLastMonth
}

public struct Stickers {
	public let stickers: Vector<sticker>

	public init(stickers: Vector<sticker>) {
		self.stickers = stickers
	}
}

public struct StickerEmojis {
	public let emojis: Vector<string>

	public init(emojis: Vector<string>) {
		self.emojis = emojis
	}
}

public struct StickerSet {
	public let id: Int64
	public let title: String
	public let name: String
	public let isInstalled: Bool
	public let isArchived: Bool
	public let isOfficial: Bool
	public let isMasks: Bool
	public let isViewed: Bool
	public let stickers: Vector<sticker>
	public let emojis: Vector<stickeremojis>

	public init(id: Int64, title: String, name: String, isInstalled: Bool, isArchived: Bool, isOfficial: Bool, isMasks: Bool, isViewed: Bool, stickers: Vector<sticker>, emojis: Vector<stickeremojis>) {
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

public struct StickerSetInfo {
	public let id: Int64
	public let title: String
	public let name: String
	public let isInstalled: Bool
	public let isArchived: Bool
	public let isOfficial: Bool
	public let isMasks: Bool
	public let isViewed: Bool
	public let size: Int32
	public let covers: Vector<sticker>

	public init(id: Int64, title: String, name: String, isInstalled: Bool, isArchived: Bool, isOfficial: Bool, isMasks: Bool, isViewed: Bool, size: Int32, covers: Vector<sticker>) {
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

public struct StickerSets {
	public let totalCount: Int32
	public let sets: Vector<stickersetinfo>

	public init(totalCount: Int32, sets: Vector<stickersetinfo>) {
		self.totalCount = totalCount
		self.sets = sets
	}
}

public enum CallDiscardReason: TDEnum {
	case callDiscardReasonEmpty
	case callDiscardReasonMissed
	case callDiscardReasonDeclined
	case callDiscardReasonDisconnected
	case callDiscardReasonHungUp
}

public struct CallProtocol {
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

public struct CallConnection {
	public let id: Int64
	public let ip: String
	public let ipv6: String
	public let port: Int32
	public let peerTag: Bytes

	public init(id: Int64, ip: String, ipv6: String, port: Int32, peerTag: Bytes) {
		self.id = id
		self.ip = ip
		self.ipv6 = ipv6
		self.port = port
		self.peerTag = peerTag
	}
}

public struct CallId {
	public let id: Int32

	public init(id: Int32) {
		self.id = id
	}
}

public enum CallState: TDEnum {
	case callStatePending(isCreated: Bool, isReceived: Bool)
	case callStateExchangingKeys
	case callStateReady(protocol: Callprotocol, connections: Vector<callconnection>, config: String, encryptionKey: Bytes, emojis: Vector<string>)
	case callStateHangingUp
	case callStateDiscarded(reason: Calldiscardreason, needRating: Bool, needDebugInformation: Bool)
	case callStateError(error: Error)
}

public struct Call {
	public let id: Int32
	public let userId: Int32
	public let isOutgoing: Bool
	public let state: Callstate

	public init(id: Int32, userId: Int32, isOutgoing: Bool, state: Callstate) {
		self.id = id
		self.userId = userId
		self.isOutgoing = isOutgoing
		self.state = state
	}
}

public struct Animations {
	public let animations: Vector<animation>

	public init(animations: Vector<animation>) {
		self.animations = animations
	}
}

public struct ImportedContacts {
	public let userIds: Vector<int32>
	public let importerCount: Vector<int32>

	public init(userIds: Vector<int32>, importerCount: Vector<int32>) {
		self.userIds = userIds
		self.importerCount = importerCount
	}
}

public enum InputInlineQueryResult: TDEnum {
	case inputInlineQueryResultAnimatedGif(id: String, title: String, thumbnailUrl: String, gifUrl: String, gifDuration: Int32, gifWidth: Int32, gifHeight: Int32, replyMarkup: Replymarkup, inputMessageContent: Inputmessagecontent)
	case inputInlineQueryResultAnimatedMpeg4(id: String, title: String, thumbnailUrl: String, mpeg4Url: String, mpeg4Duration: Int32, mpeg4Width: Int32, mpeg4Height: Int32, replyMarkup: Replymarkup, inputMessageContent: Inputmessagecontent)
	case inputInlineQueryResultArticle(id: String, url: String, hideUrl: Bool, title: String, description: String, thumbnailUrl: String, thumbnailWidth: Int32, thumbnailHeight: Int32, replyMarkup: Replymarkup, inputMessageContent: Inputmessagecontent)
	case inputInlineQueryResultAudio(id: String, title: String, performer: String, audioUrl: String, audioDuration: Int32, replyMarkup: Replymarkup, inputMessageContent: Inputmessagecontent)
	case inputInlineQueryResultContact(id: String, contact: Contact, thumbnailUrl: String, thumbnailWidth: Int32, thumbnailHeight: Int32, replyMarkup: Replymarkup, inputMessageContent: Inputmessagecontent)
	case inputInlineQueryResultDocument(id: String, title: String, description: String, documentUrl: String, mimeType: String, thumbnailUrl: String, thumbnailWidth: Int32, thumbnailHeight: Int32, replyMarkup: Replymarkup, inputMessageContent: Inputmessagecontent)
	case inputInlineQueryResultGame(id: String, gameShortName: String, replyMarkup: Replymarkup)
	case inputInlineQueryResultLocation(id: String, location: Location, livePeriod: Int32, title: String, thumbnailUrl: String, thumbnailWidth: Int32, thumbnailHeight: Int32, replyMarkup: Replymarkup, inputMessageContent: Inputmessagecontent)
	case inputInlineQueryResultPhoto(id: String, title: String, description: String, thumbnailUrl: String, photoUrl: String, photoWidth: Int32, photoHeight: Int32, replyMarkup: Replymarkup, inputMessageContent: Inputmessagecontent)
	case inputInlineQueryResultSticker(id: String, thumbnailUrl: String, stickerUrl: String, stickerWidth: Int32, stickerHeight: Int32, replyMarkup: Replymarkup, inputMessageContent: Inputmessagecontent)
	case inputInlineQueryResultVenue(id: String, venue: Venue, thumbnailUrl: String, thumbnailWidth: Int32, thumbnailHeight: Int32, replyMarkup: Replymarkup, inputMessageContent: Inputmessagecontent)
	case inputInlineQueryResultVideo(id: String, title: String, description: String, thumbnailUrl: String, videoUrl: String, mimeType: String, videoWidth: Int32, videoHeight: Int32, videoDuration: Int32, replyMarkup: Replymarkup, inputMessageContent: Inputmessagecontent)
	case inputInlineQueryResultVoiceNote(id: String, title: String, voiceNoteUrl: String, voiceNoteDuration: Int32, replyMarkup: Replymarkup, inputMessageContent: Inputmessagecontent)
}

public enum InlineQueryResult: TDEnum {
	case inlineQueryResultArticle(id: String, url: String, hideUrl: Bool, title: String, description: String, thumbnail: Photosize)
	case inlineQueryResultContact(id: String, contact: Contact, thumbnail: Photosize)
	case inlineQueryResultLocation(id: String, location: Location, title: String, thumbnail: Photosize)
	case inlineQueryResultVenue(id: String, venue: Venue, thumbnail: Photosize)
	case inlineQueryResultGame(id: String, game: Game)
	case inlineQueryResultAnimation(id: String, animation: Animation, title: String)
	case inlineQueryResultAudio(id: String, audio: Audio)
	case inlineQueryResultDocument(id: String, document: Document, title: String, description: String)
	case inlineQueryResultPhoto(id: String, photo: Photo, title: String, description: String)
	case inlineQueryResultSticker(id: String, sticker: Sticker)
	case inlineQueryResultVideo(id: String, video: Video, title: String, description: String)
	case inlineQueryResultVoiceNote(id: String, voiceNote: Voicenote, title: String)
}

public struct InlineQueryResults {
	public let inlineQueryId: Int64
	public let nextOffset: String
	public let results: Vector<inlinequeryresult>
	public let switchPmText: String
	public let switchPmParameter: String

	public init(inlineQueryId: Int64, nextOffset: String, results: Vector<inlinequeryresult>, switchPmText: String, switchPmParameter: String) {
		self.inlineQueryId = inlineQueryId
		self.nextOffset = nextOffset
		self.results = results
		self.switchPmText = switchPmText
		self.switchPmParameter = switchPmParameter
	}
}

public enum CallbackQueryPayload: TDEnum {
	case callbackQueryPayloadData(data: Bytes)
	case callbackQueryPayloadGame(gameShortName: String)
}

public struct CallbackQueryAnswer {
	public let text: String
	public let showAlert: Bool
	public let url: String

	public init(text: String, showAlert: Bool, url: String) {
		self.text = text
		self.showAlert = showAlert
		self.url = url
	}
}

public struct CustomRequestResult {
	public let result: String

	public init(result: String) {
		self.result = result
	}
}

public struct GameHighScore {
	public let position: Int32
	public let userId: Int32
	public let score: Int32

	public init(position: Int32, userId: Int32, score: Int32) {
		self.position = position
		self.userId = userId
		self.score = score
	}
}

public struct GameHighScores {
	public let scores: Vector<gamehighscore>

	public init(scores: Vector<gamehighscore>) {
		self.scores = scores
	}
}

public enum ChatEventAction: TDEnum {
	case chatEventMessageEdited(oldMessage: Message, newMessage: Message)
	case chatEventMessageDeleted(message: Message)
	case chatEventMessagePinned(message: Message)
	case chatEventMessageUnpinned
	case chatEventMemberJoined
	case chatEventMemberLeft
	case chatEventMemberInvited(userId: Int32, status: Chatmemberstatus)
	case chatEventMemberPromoted(userId: Int32, oldStatus: Chatmemberstatus, newStatus: Chatmemberstatus)
	case chatEventMemberRestricted(userId: Int32, oldStatus: Chatmemberstatus, newStatus: Chatmemberstatus)
	case chatEventTitleChanged(oldTitle: String, newTitle: String)
	case chatEventDescriptionChanged(oldDescription: String, newDescription: String)
	case chatEventUsernameChanged(oldUsername: String, newUsername: String)
	case chatEventPhotoChanged(oldPhoto: Chatphoto, newPhoto: Chatphoto)
	case chatEventInvitesToggled(anyoneCanInvite: Bool)
	case chatEventSignMessagesToggled(signMessages: Bool)
	case chatEventStickerSetChanged(oldStickerSetId: Int64, newStickerSetId: Int64)
	case chatEventIsAllHistoryAvailableToggled(isAllHistoryAvailable: Bool)
}

public struct ChatEvent {
	public let id: Int64
	public let date: Int32
	public let userId: Int32
	public let action: Chateventaction

	public init(id: Int64, date: Int32, userId: Int32, action: Chateventaction) {
		self.id = id
		self.date = date
		self.userId = userId
		self.action = action
	}
}

public struct ChatEvents {
	public let events: Vector<chatevent>

	public init(events: Vector<chatevent>) {
		self.events = events
	}
}

public struct ChatEventLogFilters {
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

public enum DeviceToken: TDEnum {
	case deviceTokenGoogleCloudMessaging(token: String)
	case deviceTokenApplePush(deviceToken: String, isAppSandbox: Bool)
	case deviceTokenApplePushVoIP(deviceToken: String, isAppSandbox: Bool)
	case deviceTokenWindowsPush(accessToken: String)
	case deviceTokenMicrosoftPush(channelUri: String)
	case deviceTokenMicrosoftPushVoIP(channelUri: String)
	case deviceTokenWebPush(endpoint: String, p256dhBase64url: String, authBase64url: String)
	case deviceTokenSimplePush(endpoint: String)
	case deviceTokenUbuntuPush(token: String)
	case deviceTokenBlackberryPush(token: String)
	case deviceTokenTizenPush(regId: String)
}

public struct Wallpaper {
	public let id: Int32
	public let sizes: Vector<photosize>
	public let color: Int32

	public init(id: Int32, sizes: Vector<photosize>, color: Int32) {
		self.id = id
		self.sizes = sizes
		self.color = color
	}
}

public struct Wallpapers {
	public let wallpapers: Vector<wallpaper>

	public init(wallpapers: Vector<wallpaper>) {
		self.wallpapers = wallpapers
	}
}

public struct Hashtags {
	public let hashtags: Vector<string>

	public init(hashtags: Vector<string>) {
		self.hashtags = hashtags
	}
}

public enum OptionValue: TDEnum {
	case optionValueBoolean(value: Bool)
	case optionValueEmpty
	case optionValueInteger(value: Int32)
	case optionValueString(value: String)
}

public enum UserPrivacySettingRule: TDEnum {
	case userPrivacySettingRuleAllowAll
	case userPrivacySettingRuleAllowContacts
	case userPrivacySettingRuleAllowUsers(userIds: Vector<int32>)
	case userPrivacySettingRuleRestrictAll
	case userPrivacySettingRuleRestrictContacts
	case userPrivacySettingRuleRestrictUsers(userIds: Vector<int32>)
}

public struct UserPrivacySettingRules {
	public let rules: Vector<userprivacysettingrule>

	public init(rules: Vector<userprivacysettingrule>) {
		self.rules = rules
	}
}

public enum UserPrivacySetting: TDEnum {
	case userPrivacySettingShowStatus
	case userPrivacySettingAllowChatInvites
	case userPrivacySettingAllowCalls
}

public struct AccountTtl {
	public let days: Int32

	public init(days: Int32) {
		self.days = days
	}
}

public struct Session {
	public let id: Int64
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

	public init(id: Int64, isCurrent: Bool, apiId: Int32, applicationName: String, applicationVersion: String, isOfficialApplication: Bool, deviceModel: String, platform: String, systemVersion: String, logInDate: Int32, lastActiveDate: Int32, ip: String, country: String, region: String) {
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

public struct Sessions {
	public let sessions: Vector<session>

	public init(sessions: Vector<session>) {
		self.sessions = sessions
	}
}

public struct ChatReportSpamState {
	public let canReportSpam: Bool

	public init(canReportSpam: Bool) {
		self.canReportSpam = canReportSpam
	}
}

public enum ChatReportReason: TDEnum {
	case chatReportReasonSpam
	case chatReportReasonViolence
	case chatReportReasonPornography
	case chatReportReasonCustom(text: String)
}

public struct PublicMessageLink {
	public let link: String
	public let html: String

	public init(link: String, html: String) {
		self.link = link
		self.html = html
	}
}

public enum FileType: TDEnum {
	case fileTypeNone
	case fileTypeAnimation
	case fileTypeAudio
	case fileTypeDocument
	case fileTypePhoto
	case fileTypeProfilePhoto
	case fileTypeSecret
	case fileTypeSticker
	case fileTypeThumbnail
	case fileTypeUnknown
	case fileTypeVideo
	case fileTypeVideoNote
	case fileTypeVoiceNote
	case fileTypeWallpaper
	case fileTypeSecretThumbnail
}

public struct StorageStatisticsByFileType {
	public let fileType: Filetype
	public let size: Int53
	public let count: Int32

	public init(fileType: Filetype, size: Int53, count: Int32) {
		self.fileType = fileType
		self.size = size
		self.count = count
	}
}

public struct StorageStatisticsByChat {
	public let chatId: Int53
	public let size: Int53
	public let count: Int32
	public let byFileType: Vector<storagestatisticsbyfiletype>

	public init(chatId: Int53, size: Int53, count: Int32, byFileType: Vector<storagestatisticsbyfiletype>) {
		self.chatId = chatId
		self.size = size
		self.count = count
		self.byFileType = byFileType
	}
}

public struct StorageStatistics {
	public let size: Int53
	public let count: Int32
	public let byChat: Vector<storagestatisticsbychat>

	public init(size: Int53, count: Int32, byChat: Vector<storagestatisticsbychat>) {
		self.size = size
		self.count = count
		self.byChat = byChat
	}
}

public struct StorageStatisticsFast {
	public let filesSize: Int53
	public let fileCount: Int32
	public let databaseSize: Int53

	public init(filesSize: Int53, fileCount: Int32, databaseSize: Int53) {
		self.filesSize = filesSize
		self.fileCount = fileCount
		self.databaseSize = databaseSize
	}
}

public enum NetworkType: TDEnum {
	case networkTypeNone
	case networkTypeMobile
	case networkTypeMobileRoaming
	case networkTypeWiFi
	case networkTypeOther
}

public enum NetworkStatisticsEntry: TDEnum {
	case networkStatisticsEntryFile(fileType: Filetype, networkType: Networktype, sentBytes: Int53, receivedBytes: Int53)
	case networkStatisticsEntryCall(networkType: Networktype, sentBytes: Int53, receivedBytes: Int53, duration: Double)
}

public struct NetworkStatistics {
	public let sinceDate: Int32
	public let entries: Vector<networkstatisticsentry>

	public init(sinceDate: Int32, entries: Vector<networkstatisticsentry>) {
		self.sinceDate = sinceDate
		self.entries = entries
	}
}

public enum ConnectionState: TDEnum {
	case connectionStateWaitingForNetwork
	case connectionStateConnectingToProxy
	case connectionStateConnecting
	case connectionStateUpdating
	case connectionStateReady
}

public enum TopChatCategory: TDEnum {
	case topChatCategoryUsers
	case topChatCategoryBots
	case topChatCategoryGroups
	case topChatCategoryChannels
	case topChatCategoryInlineBots
	case topChatCategoryCalls
}

public enum TMeUrlType: TDEnum {
	case tMeUrlTypeUser(userId: Int32)
	case tMeUrlTypeSupergroup(supergroupId: Int53)
	case tMeUrlTypeChatInvite(info: Chatinvitelinkinfo)
	case tMeUrlTypeStickerSet(stickerSetId: Int64)
}

public struct TMeUrl {
	public let url: String
	public let type: Tmeurltype

	public init(url: String, type: Tmeurltype) {
		self.url = url
		self.type = type
	}
}

public struct TMeUrls {
	public let urls: Vector<tmeurl>

	public init(urls: Vector<tmeurl>) {
		self.urls = urls
	}
}

public struct Count {
	public let count: Int32

	public init(count: Int32) {
		self.count = count
	}
}

public struct Text {
	public let text: String

	public init(text: String) {
		self.text = text
	}
}

public enum TextParseMode: TDEnum {
	case textParseModeMarkdown
	case textParseModeHTML
}

public enum Proxy: TDEnum {
	case proxyEmpty
	case proxySocks5(server: String, port: Int32, username: String, password: String)
}

public struct InputSticker {
	public let pngSticker: Inputfile
	public let emojis: String
	public let maskPosition: Maskposition

	public init(pngSticker: Inputfile, emojis: String, maskPosition: Maskposition) {
		self.pngSticker = pngSticker
		self.emojis = emojis
		self.maskPosition = maskPosition
	}
}

public enum Update: TDEnum {
	case updateAuthorizationState(authorizationState: Authorizationstate)
	case updateNewMessage(message: Message, disableNotification: Bool, containsMention: Bool)
	case updateMessageSendAcknowledged(chatId: Int53, messageId: Int53)
	case updateMessageSendSucceeded(message: Message, oldMessageId: Int53)
	case updateMessageSendFailed(message: Message, oldMessageId: Int53, errorCode: Int32, errorMessage: String)
	case updateMessageContent(chatId: Int53, messageId: Int53, newContent: Messagecontent)
	case updateMessageEdited(chatId: Int53, messageId: Int53, editDate: Int32, replyMarkup: Replymarkup)
	case updateMessageViews(chatId: Int53, messageId: Int53, views: Int32)
	case updateMessageContentOpened(chatId: Int53, messageId: Int53)
	case updateMessageMentionRead(chatId: Int53, messageId: Int53, unreadMentionCount: Int32)
	case updateNewChat(chat: Chat)
	case updateChatTitle(chatId: Int53, title: String)
	case updateChatPhoto(chatId: Int53, photo: Chatphoto)
	case updateChatLastMessage(chatId: Int53, lastMessage: Message, order: Int64)
	case updateChatOrder(chatId: Int53, order: Int64)
	case updateChatIsPinned(chatId: Int53, isPinned: Bool, order: Int64)
	case updateChatReadInbox(chatId: Int53, lastReadInboxMessageId: Int53, unreadCount: Int32)
	case updateChatReadOutbox(chatId: Int53, lastReadOutboxMessageId: Int53)
	case updateChatUnreadMentionCount(chatId: Int53, unreadMentionCount: Int32)
	case updateNotificationSettings(scope: Notificationsettingsscope, notificationSettings: Notificationsettings)
	case updateChatReplyMarkup(chatId: Int53, replyMarkupMessageId: Int53)
	case updateChatDraftMessage(chatId: Int53, draftMessage: Draftmessage, order: Int64)
	case updateDeleteMessages(chatId: Int53, messageIds: Vector<int53>, isPermanent: Bool, fromCache: Bool)
	case updateUserChatAction(chatId: Int53, userId: Int32, action: Chataction)
	case updateUserStatus(userId: Int32, status: Userstatus)
	case updateUser(user: User)
	case updateBasicGroup(basicGroup: Basicgroup)
	case updateSupergroup(supergroup: Supergroup)
	case updateSecretChat(secretChat: Secretchat)
	case updateUserFullInfo(userId: Int32, userFullInfo: Userfullinfo)
	case updateBasicGroupFullInfo(basicGroupId: Int32, basicGroupFullInfo: Basicgroupfullinfo)
	case updateSupergroupFullInfo(supergroupId: Int32, supergroupFullInfo: Supergroupfullinfo)
	case updateServiceNotification(type: String, content: Messagecontent)
	case updateFile(file: File)
	case updateFileGenerationStart(generationId: Int64, originalPath: String, destinationPath: String, conversion: String)
	case updateFileGenerationStop(generationId: Int64)
	case updateCall(call: Call)
	case updateUserPrivacySettingRules(setting: Userprivacysetting, rules: Userprivacysettingrules)
	case updateOption(name: String, value: Optionvalue)
	case updateInstalledStickerSets(isMasks: Bool, stickerSetIds: Vector<int64>)
	case updateTrendingStickerSets(stickerSets: Stickersets)
	case updateRecentStickers(isAttached: Bool, stickerIds: Vector<int32>)
	case updateFavoriteStickers(stickerIds: Vector<int32>)
	case updateSavedAnimations(animationIds: Vector<int32>)
	case updateConnectionState(state: Connectionstate)
	case updateNewInlineQuery(id: Int64, senderUserId: Int32, userLocation: Location, query: String, offset: String)
	case updateNewChosenInlineResult(senderUserId: Int32, userLocation: Location, query: String, resultId: String, inlineMessageId: String)
	case updateNewCallbackQuery(id: Int64, senderUserId: Int32, chatId: Int53, messageId: Int53, chatInstance: Int64, payload: Callbackquerypayload)
	case updateNewInlineCallbackQuery(id: Int64, senderUserId: Int32, inlineMessageId: String, chatInstance: Int64, payload: Callbackquerypayload)
	case updateNewShippingQuery(id: Int64, senderUserId: Int32, invoicePayload: String, shippingAddress: Shippingaddress)
	case updateNewPreCheckoutQuery(id: Int64, senderUserId: Int32, currency: String, totalAmount: Int53, invoicePayload: Bytes, shippingOptionId: String, orderInfo: Orderinfo)
	case updateNewCustomEvent(event: String)
	case updateNewCustomQuery(id: Int64, data: String, timeout: Int32)
}

public struct TestInt {
	public let value: Int32

	public init(value: Int32) {
		self.value = value
	}
}

public struct TestString {
	public let value: String

	public init(value: String) {
		self.value = value
	}
}

public struct TestBytes {
	public let value: Bytes

	public init(value: Bytes) {
		self.value = value
	}
}

public struct TestVectorInt {
	public let value: Vector<int32>

	public init(value: Vector<int32>) {
		self.value = value
	}
}

public struct TestVectorIntObject {
	public let value: Vector<testint>

	public init(value: Vector<testint>) {
		self.value = value
	}
}

public struct TestVectorString {
	public let value: Vector<string>

	public init(value: Vector<string>) {
		self.value = value
	}
}

public struct TestVectorStringObject {
	public let value: Vector<teststring>

	public init(value: Vector<teststring>) {
		self.value = value
	}
}

public struct GetAuthorizationState: TDFunction {
	public typealias Result = AuthorizationState

	public init() {
	}
}

public struct SetTdlibParameters: TDFunction {
	public typealias Result = Ok
	public let parameters: Tdlibparameters

	public init(parameters: Tdlibparameters) {
		self.parameters = parameters
	}
}

public struct CheckDatabaseEncryptionKey: TDFunction {
	public typealias Result = Ok
	public let encryptionKey: Bytes

	public init(encryptionKey: Bytes) {
		self.encryptionKey = encryptionKey
	}
}

public struct SetAuthenticationPhoneNumber: TDFunction {
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

public struct ResendAuthenticationCode: TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct CheckAuthenticationCode: TDFunction {
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

public struct CheckAuthenticationPassword: TDFunction {
	public typealias Result = Ok
	public let password: String

	public init(password: String) {
		self.password = password
	}
}

public struct RequestAuthenticationPasswordRecovery: TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct RecoverAuthenticationPassword: TDFunction {
	public typealias Result = Ok
	public let recoveryCode: String

	public init(recoveryCode: String) {
		self.recoveryCode = recoveryCode
	}
}

public struct CheckAuthenticationBotToken: TDFunction {
	public typealias Result = Ok
	public let token: String

	public init(token: String) {
		self.token = token
	}
}

public struct LogOut: TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct Close: TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct Destroy: TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct SetDatabaseEncryptionKey: TDFunction {
	public typealias Result = Ok
	public let newEncryptionKey: Bytes

	public init(newEncryptionKey: Bytes) {
		self.newEncryptionKey = newEncryptionKey
	}
}

public struct GetPasswordState: TDFunction {
	public typealias Result = PasswordState

	public init() {
	}
}

public struct SetPassword: TDFunction {
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

public struct GetRecoveryEmailAddress: TDFunction {
	public typealias Result = RecoveryEmailAddress
	public let password: String

	public init(password: String) {
		self.password = password
	}
}

public struct SetRecoveryEmailAddress: TDFunction {
	public typealias Result = PasswordState
	public let password: String
	public let newRecoveryEmailAddress: String

	public init(password: String, newRecoveryEmailAddress: String) {
		self.password = password
		self.newRecoveryEmailAddress = newRecoveryEmailAddress
	}
}

public struct RequestPasswordRecovery: TDFunction {
	public typealias Result = PasswordRecoveryInfo

	public init() {
	}
}

public struct RecoverPassword: TDFunction {
	public typealias Result = PasswordState
	public let recoveryCode: String

	public init(recoveryCode: String) {
		self.recoveryCode = recoveryCode
	}
}

public struct CreateTemporaryPassword: TDFunction {
	public typealias Result = TemporaryPasswordState
	public let password: String
	public let validFor: Int32

	public init(password: String, validFor: Int32) {
		self.password = password
		self.validFor = validFor
	}
}

public struct GetTemporaryPasswordState: TDFunction {
	public typealias Result = TemporaryPasswordState

	public init() {
	}
}

public struct ProcessDcUpdate: TDFunction {
	public typealias Result = Ok
	public let dc: String
	public let addr: String

	public init(dc: String, addr: String) {
		self.dc = dc
		self.addr = addr
	}
}

public struct GetMe: TDFunction {
	public typealias Result = User

	public init() {
	}
}

public struct GetUser: TDFunction {
	public typealias Result = User
	public let userId: Int32

	public init(userId: Int32) {
		self.userId = userId
	}
}

public struct GetUserFullInfo: TDFunction {
	public typealias Result = UserFullInfo
	public let userId: Int32

	public init(userId: Int32) {
		self.userId = userId
	}
}

public struct GetBasicGroup: TDFunction {
	public typealias Result = BasicGroup
	public let basicGroupId: Int32

	public init(basicGroupId: Int32) {
		self.basicGroupId = basicGroupId
	}
}

public struct GetBasicGroupFullInfo: TDFunction {
	public typealias Result = BasicGroupFullInfo
	public let basicGroupId: Int32

	public init(basicGroupId: Int32) {
		self.basicGroupId = basicGroupId
	}
}

public struct GetSupergroup: TDFunction {
	public typealias Result = Supergroup
	public let supergroupId: Int32

	public init(supergroupId: Int32) {
		self.supergroupId = supergroupId
	}
}

public struct GetSupergroupFullInfo: TDFunction {
	public typealias Result = SupergroupFullInfo
	public let supergroupId: Int32

	public init(supergroupId: Int32) {
		self.supergroupId = supergroupId
	}
}

public struct GetSecretChat: TDFunction {
	public typealias Result = SecretChat
	public let secretChatId: Int32

	public init(secretChatId: Int32) {
		self.secretChatId = secretChatId
	}
}

public struct GetChat: TDFunction {
	public typealias Result = Chat
	public let chatId: Int53

	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

public struct GetMessage: TDFunction {
	public typealias Result = Message
	public let chatId: Int53
	public let messageId: Int53

	public init(chatId: Int53, messageId: Int53) {
		self.chatId = chatId
		self.messageId = messageId
	}
}

public struct GetMessages: TDFunction {
	public typealias Result = Messages
	public let chatId: Int53
	public let messageIds: Vector<int53>

	public init(chatId: Int53, messageIds: Vector<int53>) {
		self.chatId = chatId
		self.messageIds = messageIds
	}
}

public struct GetFile: TDFunction {
	public typealias Result = File
	public let fileId: Int32

	public init(fileId: Int32) {
		self.fileId = fileId
	}
}

public struct GetRemoteFile: TDFunction {
	public typealias Result = File
	public let remoteFileId: String
	public let fileType: Filetype

	public init(remoteFileId: String, fileType: Filetype) {
		self.remoteFileId = remoteFileId
		self.fileType = fileType
	}
}

public struct GetChats: TDFunction {
	public typealias Result = Chats
	public let offsetOrder: Int64
	public let offsetChatId: Int53
	public let limit: Int32

	public init(offsetOrder: Int64, offsetChatId: Int53, limit: Int32) {
		self.offsetOrder = offsetOrder
		self.offsetChatId = offsetChatId
		self.limit = limit
	}
}

public struct SearchPublicChat: TDFunction {
	public typealias Result = Chat
	public let username: String

	public init(username: String) {
		self.username = username
	}
}

public struct SearchPublicChats: TDFunction {
	public typealias Result = Chats
	public let query: String

	public init(query: String) {
		self.query = query
	}
}

public struct SearchChats: TDFunction {
	public typealias Result = Chats
	public let query: String
	public let limit: Int32

	public init(query: String, limit: Int32) {
		self.query = query
		self.limit = limit
	}
}

public struct SearchChatsOnServer: TDFunction {
	public typealias Result = Chats
	public let query: String
	public let limit: Int32

	public init(query: String, limit: Int32) {
		self.query = query
		self.limit = limit
	}
}

public struct GetTopChats: TDFunction {
	public typealias Result = Chats
	public let category: Topchatcategory
	public let limit: Int32

	public init(category: Topchatcategory, limit: Int32) {
		self.category = category
		self.limit = limit
	}
}

public struct RemoveTopChat: TDFunction {
	public typealias Result = Ok
	public let category: Topchatcategory
	public let chatId: Int53

	public init(category: Topchatcategory, chatId: Int53) {
		self.category = category
		self.chatId = chatId
	}
}

public struct AddRecentlyFoundChat: TDFunction {
	public typealias Result = Ok
	public let chatId: Int53

	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

public struct RemoveRecentlyFoundChat: TDFunction {
	public typealias Result = Ok
	public let chatId: Int53

	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

public struct ClearRecentlyFoundChats: TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct GetGroupsInCommon: TDFunction {
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

public struct GetCreatedPublicChats: TDFunction {
	public typealias Result = Chats

	public init() {
	}
}

public struct GetChatHistory: TDFunction {
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

public struct DeleteChatHistory: TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let removeFromChatList: Bool

	public init(chatId: Int53, removeFromChatList: Bool) {
		self.chatId = chatId
		self.removeFromChatList = removeFromChatList
	}
}

public struct SearchChatMessages: TDFunction {
	public typealias Result = Messages
	public let chatId: Int53
	public let query: String
	public let senderUserId: Int32
	public let fromMessageId: Int53
	public let offset: Int32
	public let limit: Int32
	public let filter: Searchmessagesfilter

	public init(chatId: Int53, query: String, senderUserId: Int32, fromMessageId: Int53, offset: Int32, limit: Int32, filter: Searchmessagesfilter) {
		self.chatId = chatId
		self.query = query
		self.senderUserId = senderUserId
		self.fromMessageId = fromMessageId
		self.offset = offset
		self.limit = limit
		self.filter = filter
	}
}

public struct SearchMessages: TDFunction {
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

public struct SearchSecretMessages: TDFunction {
	public typealias Result = FoundMessages
	public let chatId: Int53
	public let query: String
	public let fromSearchId: Int64
	public let limit: Int32
	public let filter: Searchmessagesfilter

	public init(chatId: Int53, query: String, fromSearchId: Int64, limit: Int32, filter: Searchmessagesfilter) {
		self.chatId = chatId
		self.query = query
		self.fromSearchId = fromSearchId
		self.limit = limit
		self.filter = filter
	}
}

public struct SearchCallMessages: TDFunction {
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

public struct SearchChatRecentLocationMessages: TDFunction {
	public typealias Result = Messages
	public let chatId: Int53
	public let limit: Int32

	public init(chatId: Int53, limit: Int32) {
		self.chatId = chatId
		self.limit = limit
	}
}

public struct GetActiveLiveLocationMessages: TDFunction {
	public typealias Result = Messages

	public init() {
	}
}

public struct GetChatMessageByDate: TDFunction {
	public typealias Result = Messages
	public let chatId: Int53
	public let date: Int32

	public init(chatId: Int53, date: Int32) {
		self.chatId = chatId
		self.date = date
	}
}

public struct GetPublicMessageLink: TDFunction {
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

public struct SendMessage: TDFunction {
	public typealias Result = Message
	public let chatId: Int53
	public let replyToMessageId: Int53
	public let disableNotification: Bool
	public let fromBackground: Bool
	public let replyMarkup: Replymarkup
	public let inputMessageContent: Inputmessagecontent

	public init(chatId: Int53, replyToMessageId: Int53, disableNotification: Bool, fromBackground: Bool, replyMarkup: Replymarkup, inputMessageContent: Inputmessagecontent) {
		self.chatId = chatId
		self.replyToMessageId = replyToMessageId
		self.disableNotification = disableNotification
		self.fromBackground = fromBackground
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
	}
}

public struct SendMessageAlbum: TDFunction {
	public typealias Result = Messages
	public let chatId: Int53
	public let replyToMessageId: Int53
	public let disableNotification: Bool
	public let fromBackground: Bool
	public let inputMessageContents: Vector<inputmessagecontent>

	public init(chatId: Int53, replyToMessageId: Int53, disableNotification: Bool, fromBackground: Bool, inputMessageContents: Vector<inputmessagecontent>) {
		self.chatId = chatId
		self.replyToMessageId = replyToMessageId
		self.disableNotification = disableNotification
		self.fromBackground = fromBackground
		self.inputMessageContents = inputMessageContents
	}
}

public struct SendBotStartMessage: TDFunction {
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

public struct SendInlineQueryResultMessage: TDFunction {
	public typealias Result = Message
	public let chatId: Int53
	public let replyToMessageId: Int53
	public let disableNotification: Bool
	public let fromBackground: Bool
	public let queryId: Int64
	public let resultId: String

	public init(chatId: Int53, replyToMessageId: Int53, disableNotification: Bool, fromBackground: Bool, queryId: Int64, resultId: String) {
		self.chatId = chatId
		self.replyToMessageId = replyToMessageId
		self.disableNotification = disableNotification
		self.fromBackground = fromBackground
		self.queryId = queryId
		self.resultId = resultId
	}
}

public struct ForwardMessages: TDFunction {
	public typealias Result = Messages
	public let chatId: Int53
	public let fromChatId: Int53
	public let messageIds: Vector<int53>
	public let disableNotification: Bool
	public let fromBackground: Bool
	public let asAlbum: Bool

	public init(chatId: Int53, fromChatId: Int53, messageIds: Vector<int53>, disableNotification: Bool, fromBackground: Bool, asAlbum: Bool) {
		self.chatId = chatId
		self.fromChatId = fromChatId
		self.messageIds = messageIds
		self.disableNotification = disableNotification
		self.fromBackground = fromBackground
		self.asAlbum = asAlbum
	}
}

public struct SendChatSetTtlMessage: TDFunction {
	public typealias Result = Message
	public let chatId: Int53
	public let ttl: Int32

	public init(chatId: Int53, ttl: Int32) {
		self.chatId = chatId
		self.ttl = ttl
	}
}

public struct SendChatScreenshotTakenNotification: TDFunction {
	public typealias Result = Ok
	public let chatId: Int53

	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

public struct DeleteMessages: TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let messageIds: Vector<int53>
	public let revoke: Bool

	public init(chatId: Int53, messageIds: Vector<int53>, revoke: Bool) {
		self.chatId = chatId
		self.messageIds = messageIds
		self.revoke = revoke
	}
}

public struct DeleteChatMessagesFromUser: TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let userId: Int32

	public init(chatId: Int53, userId: Int32) {
		self.chatId = chatId
		self.userId = userId
	}
}

public struct EditMessageText: TDFunction {
	public typealias Result = Message
	public let chatId: Int53
	public let messageId: Int53
	public let replyMarkup: Replymarkup
	public let inputMessageContent: Inputmessagecontent

	public init(chatId: Int53, messageId: Int53, replyMarkup: Replymarkup, inputMessageContent: Inputmessagecontent) {
		self.chatId = chatId
		self.messageId = messageId
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
	}
}

public struct EditMessageLiveLocation: TDFunction {
	public typealias Result = Message
	public let chatId: Int53
	public let messageId: Int53
	public let replyMarkup: Replymarkup
	public let location: Location

	public init(chatId: Int53, messageId: Int53, replyMarkup: Replymarkup, location: Location) {
		self.chatId = chatId
		self.messageId = messageId
		self.replyMarkup = replyMarkup
		self.location = location
	}
}

public struct EditMessageCaption: TDFunction {
	public typealias Result = Message
	public let chatId: Int53
	public let messageId: Int53
	public let replyMarkup: Replymarkup
	public let caption: Formattedtext

	public init(chatId: Int53, messageId: Int53, replyMarkup: Replymarkup, caption: Formattedtext) {
		self.chatId = chatId
		self.messageId = messageId
		self.replyMarkup = replyMarkup
		self.caption = caption
	}
}

public struct EditMessageReplyMarkup: TDFunction {
	public typealias Result = Message
	public let chatId: Int53
	public let messageId: Int53
	public let replyMarkup: Replymarkup

	public init(chatId: Int53, messageId: Int53, replyMarkup: Replymarkup) {
		self.chatId = chatId
		self.messageId = messageId
		self.replyMarkup = replyMarkup
	}
}

public struct EditInlineMessageText: TDFunction {
	public typealias Result = Ok
	public let inlineMessageId: String
	public let replyMarkup: Replymarkup
	public let inputMessageContent: Inputmessagecontent

	public init(inlineMessageId: String, replyMarkup: Replymarkup, inputMessageContent: Inputmessagecontent) {
		self.inlineMessageId = inlineMessageId
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
	}
}

public struct EditInlineMessageLiveLocation: TDFunction {
	public typealias Result = Ok
	public let inlineMessageId: String
	public let replyMarkup: Replymarkup
	public let location: Location

	public init(inlineMessageId: String, replyMarkup: Replymarkup, location: Location) {
		self.inlineMessageId = inlineMessageId
		self.replyMarkup = replyMarkup
		self.location = location
	}
}

public struct EditInlineMessageCaption: TDFunction {
	public typealias Result = Ok
	public let inlineMessageId: String
	public let replyMarkup: Replymarkup
	public let caption: Formattedtext

	public init(inlineMessageId: String, replyMarkup: Replymarkup, caption: Formattedtext) {
		self.inlineMessageId = inlineMessageId
		self.replyMarkup = replyMarkup
		self.caption = caption
	}
}

public struct EditInlineMessageReplyMarkup: TDFunction {
	public typealias Result = Ok
	public let inlineMessageId: String
	public let replyMarkup: Replymarkup

	public init(inlineMessageId: String, replyMarkup: Replymarkup) {
		self.inlineMessageId = inlineMessageId
		self.replyMarkup = replyMarkup
	}
}

public struct GetTextEntities: TDFunction {
	public typealias Result = TextEntities
	public let text: String

	public init(text: String) {
		self.text = text
	}
}

public struct ParseTextEntities: TDFunction {
	public typealias Result = FormattedText
	public let text: String
	public let parseMode: Textparsemode

	public init(text: String, parseMode: Textparsemode) {
		self.text = text
		self.parseMode = parseMode
	}
}

public struct GetFileMimeType: TDFunction {
	public typealias Result = Text
	public let fileName: String

	public init(fileName: String) {
		self.fileName = fileName
	}
}

public struct GetFileExtension: TDFunction {
	public typealias Result = Text
	public let mimeType: String

	public init(mimeType: String) {
		self.mimeType = mimeType
	}
}

public struct GetInlineQueryResults: TDFunction {
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

public struct AnswerInlineQuery: TDFunction {
	public typealias Result = Ok
	public let inlineQueryId: Int64
	public let isPersonal: Bool
	public let results: Vector<inputinlinequeryresult>
	public let cacheTime: Int32
	public let nextOffset: String
	public let switchPmText: String
	public let switchPmParameter: String

	public init(inlineQueryId: Int64, isPersonal: Bool, results: Vector<inputinlinequeryresult>, cacheTime: Int32, nextOffset: String, switchPmText: String, switchPmParameter: String) {
		self.inlineQueryId = inlineQueryId
		self.isPersonal = isPersonal
		self.results = results
		self.cacheTime = cacheTime
		self.nextOffset = nextOffset
		self.switchPmText = switchPmText
		self.switchPmParameter = switchPmParameter
	}
}

public struct GetCallbackQueryAnswer: TDFunction {
	public typealias Result = CallbackQueryAnswer
	public let chatId: Int53
	public let messageId: Int53
	public let payload: Callbackquerypayload

	public init(chatId: Int53, messageId: Int53, payload: Callbackquerypayload) {
		self.chatId = chatId
		self.messageId = messageId
		self.payload = payload
	}
}

public struct AnswerCallbackQuery: TDFunction {
	public typealias Result = Ok
	public let callbackQueryId: Int64
	public let text: String
	public let showAlert: Bool
	public let url: String
	public let cacheTime: Int32

	public init(callbackQueryId: Int64, text: String, showAlert: Bool, url: String, cacheTime: Int32) {
		self.callbackQueryId = callbackQueryId
		self.text = text
		self.showAlert = showAlert
		self.url = url
		self.cacheTime = cacheTime
	}
}

public struct AnswerShippingQuery: TDFunction {
	public typealias Result = Ok
	public let shippingQueryId: Int64
	public let shippingOptions: Vector<shippingoption>
	public let errorMessage: String

	public init(shippingQueryId: Int64, shippingOptions: Vector<shippingoption>, errorMessage: String) {
		self.shippingQueryId = shippingQueryId
		self.shippingOptions = shippingOptions
		self.errorMessage = errorMessage
	}
}

public struct AnswerPreCheckoutQuery: TDFunction {
	public typealias Result = Ok
	public let preCheckoutQueryId: Int64
	public let errorMessage: String

	public init(preCheckoutQueryId: Int64, errorMessage: String) {
		self.preCheckoutQueryId = preCheckoutQueryId
		self.errorMessage = errorMessage
	}
}

public struct SetGameScore: TDFunction {
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

public struct SetInlineGameScore: TDFunction {
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

public struct GetGameHighScores: TDFunction {
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

public struct GetInlineGameHighScores: TDFunction {
	public typealias Result = GameHighScores
	public let inlineMessageId: String
	public let userId: Int32

	public init(inlineMessageId: String, userId: Int32) {
		self.inlineMessageId = inlineMessageId
		self.userId = userId
	}
}

public struct DeleteChatReplyMarkup: TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let messageId: Int53

	public init(chatId: Int53, messageId: Int53) {
		self.chatId = chatId
		self.messageId = messageId
	}
}

public struct SendChatAction: TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let action: Chataction

	public init(chatId: Int53, action: Chataction) {
		self.chatId = chatId
		self.action = action
	}
}

public struct OpenChat: TDFunction {
	public typealias Result = Ok
	public let chatId: Int53

	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

public struct CloseChat: TDFunction {
	public typealias Result = Ok
	public let chatId: Int53

	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

public struct ViewMessages: TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let messageIds: Vector<int53>
	public let forceRead: Bool

	public init(chatId: Int53, messageIds: Vector<int53>, forceRead: Bool) {
		self.chatId = chatId
		self.messageIds = messageIds
		self.forceRead = forceRead
	}
}

public struct OpenMessageContent: TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let messageId: Int53

	public init(chatId: Int53, messageId: Int53) {
		self.chatId = chatId
		self.messageId = messageId
	}
}

public struct ReadAllChatMentions: TDFunction {
	public typealias Result = Ok
	public let chatId: Int53

	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

public struct CreatePrivateChat: TDFunction {
	public typealias Result = Chat
	public let userId: Int32
	public let force: Bool

	public init(userId: Int32, force: Bool) {
		self.userId = userId
		self.force = force
	}
}

public struct CreateBasicGroupChat: TDFunction {
	public typealias Result = Chat
	public let basicGroupId: Int32
	public let force: Bool

	public init(basicGroupId: Int32, force: Bool) {
		self.basicGroupId = basicGroupId
		self.force = force
	}
}

public struct CreateSupergroupChat: TDFunction {
	public typealias Result = Chat
	public let supergroupId: Int32
	public let force: Bool

	public init(supergroupId: Int32, force: Bool) {
		self.supergroupId = supergroupId
		self.force = force
	}
}

public struct CreateSecretChat: TDFunction {
	public typealias Result = Chat
	public let secretChatId: Int32

	public init(secretChatId: Int32) {
		self.secretChatId = secretChatId
	}
}

public struct CreateNewBasicGroupChat: TDFunction {
	public typealias Result = Chat
	public let userIds: Vector<int32>
	public let title: String

	public init(userIds: Vector<int32>, title: String) {
		self.userIds = userIds
		self.title = title
	}
}

public struct CreateNewSupergroupChat: TDFunction {
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

public struct CreateNewSecretChat: TDFunction {
	public typealias Result = Chat
	public let userId: Int32

	public init(userId: Int32) {
		self.userId = userId
	}
}

public struct UpgradeBasicGroupChatToSupergroupChat: TDFunction {
	public typealias Result = Chat
	public let chatId: Int53

	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

public struct SetChatTitle: TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let title: String

	public init(chatId: Int53, title: String) {
		self.chatId = chatId
		self.title = title
	}
}

public struct SetChatPhoto: TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let photo: Inputfile

	public init(chatId: Int53, photo: Inputfile) {
		self.chatId = chatId
		self.photo = photo
	}
}

public struct SetChatDraftMessage: TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let draftMessage: Draftmessage

	public init(chatId: Int53, draftMessage: Draftmessage) {
		self.chatId = chatId
		self.draftMessage = draftMessage
	}
}

public struct ToggleChatIsPinned: TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let isPinned: Bool

	public init(chatId: Int53, isPinned: Bool) {
		self.chatId = chatId
		self.isPinned = isPinned
	}
}

public struct SetChatClientData: TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let clientData: String

	public init(chatId: Int53, clientData: String) {
		self.chatId = chatId
		self.clientData = clientData
	}
}

public struct AddChatMember: TDFunction {
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

public struct AddChatMembers: TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let userIds: Vector<int32>

	public init(chatId: Int53, userIds: Vector<int32>) {
		self.chatId = chatId
		self.userIds = userIds
	}
}

public struct SetChatMemberStatus: TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let userId: Int32
	public let status: Chatmemberstatus

	public init(chatId: Int53, userId: Int32, status: Chatmemberstatus) {
		self.chatId = chatId
		self.userId = userId
		self.status = status
	}
}

public struct GetChatMember: TDFunction {
	public typealias Result = ChatMember
	public let chatId: Int53
	public let userId: Int32

	public init(chatId: Int53, userId: Int32) {
		self.chatId = chatId
		self.userId = userId
	}
}

public struct SearchChatMembers: TDFunction {
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

public struct GetChatAdministrators: TDFunction {
	public typealias Result = Users
	public let chatId: Int53

	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

public struct SetPinnedChats: TDFunction {
	public typealias Result = Ok
	public let chatIds: Vector<int53>

	public init(chatIds: Vector<int53>) {
		self.chatIds = chatIds
	}
}

public struct DownloadFile: TDFunction {
	public typealias Result = File
	public let fileId: Int32
	public let priority: Int32

	public init(fileId: Int32, priority: Int32) {
		self.fileId = fileId
		self.priority = priority
	}
}

public struct CancelDownloadFile: TDFunction {
	public typealias Result = Ok
	public let fileId: Int32
	public let onlyIfPending: Bool

	public init(fileId: Int32, onlyIfPending: Bool) {
		self.fileId = fileId
		self.onlyIfPending = onlyIfPending
	}
}

public struct UploadFile: TDFunction {
	public typealias Result = File
	public let file: Inputfile
	public let fileType: Filetype
	public let priority: Int32

	public init(file: Inputfile, fileType: Filetype, priority: Int32) {
		self.file = file
		self.fileType = fileType
		self.priority = priority
	}
}

public struct CancelUploadFile: TDFunction {
	public typealias Result = Ok
	public let fileId: Int32

	public init(fileId: Int32) {
		self.fileId = fileId
	}
}

public struct SetFileGenerationProgress: TDFunction {
	public typealias Result = Ok
	public let generationId: Int64
	public let expectedSize: Int32
	public let localPrefixSize: Int32

	public init(generationId: Int64, expectedSize: Int32, localPrefixSize: Int32) {
		self.generationId = generationId
		self.expectedSize = expectedSize
		self.localPrefixSize = localPrefixSize
	}
}

public struct FinishFileGeneration: TDFunction {
	public typealias Result = Ok
	public let generationId: Int64
	public let error: Error

	public init(generationId: Int64, error: Error) {
		self.generationId = generationId
		self.error = error
	}
}

public struct DeleteFile: TDFunction {
	public typealias Result = Ok
	public let fileId: Int32

	public init(fileId: Int32) {
		self.fileId = fileId
	}
}

public struct GenerateChatInviteLink: TDFunction {
	public typealias Result = ChatInviteLink
	public let chatId: Int53

	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

public struct CheckChatInviteLink: TDFunction {
	public typealias Result = ChatInviteLinkInfo
	public let inviteLink: String

	public init(inviteLink: String) {
		self.inviteLink = inviteLink
	}
}

public struct JoinChatByInviteLink: TDFunction {
	public typealias Result = Ok
	public let inviteLink: String

	public init(inviteLink: String) {
		self.inviteLink = inviteLink
	}
}

public struct CreateCall: TDFunction {
	public typealias Result = CallId
	public let userId: Int32
	public let protocol: Callprotocol

	public init(userId: Int32, protocol: Callprotocol) {
		self.userId = userId
		self.protocol = protocol
	}
}

public struct AcceptCall: TDFunction {
	public typealias Result = Ok
	public let callId: Int32
	public let protocol: Callprotocol

	public init(callId: Int32, protocol: Callprotocol) {
		self.callId = callId
		self.protocol = protocol
	}
}

public struct DiscardCall: TDFunction {
	public typealias Result = Ok
	public let callId: Int32
	public let isDisconnected: Bool
	public let duration: Int32
	public let connectionId: Int64

	public init(callId: Int32, isDisconnected: Bool, duration: Int32, connectionId: Int64) {
		self.callId = callId
		self.isDisconnected = isDisconnected
		self.duration = duration
		self.connectionId = connectionId
	}
}

public struct SendCallRating: TDFunction {
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

public struct SendCallDebugInformation: TDFunction {
	public typealias Result = Ok
	public let callId: Int32
	public let debugInformation: String

	public init(callId: Int32, debugInformation: String) {
		self.callId = callId
		self.debugInformation = debugInformation
	}
}

public struct BlockUser: TDFunction {
	public typealias Result = Ok
	public let userId: Int32

	public init(userId: Int32) {
		self.userId = userId
	}
}

public struct UnblockUser: TDFunction {
	public typealias Result = Ok
	public let userId: Int32

	public init(userId: Int32) {
		self.userId = userId
	}
}

public struct GetBlockedUsers: TDFunction {
	public typealias Result = Users
	public let offset: Int32
	public let limit: Int32

	public init(offset: Int32, limit: Int32) {
		self.offset = offset
		self.limit = limit
	}
}

public struct ImportContacts: TDFunction {
	public typealias Result = ImportedContacts
	public let contacts: Vector<contact>

	public init(contacts: Vector<contact>) {
		self.contacts = contacts
	}
}

public struct SearchContacts: TDFunction {
	public typealias Result = Users
	public let query: String
	public let limit: Int32

	public init(query: String, limit: Int32) {
		self.query = query
		self.limit = limit
	}
}

public struct RemoveContacts: TDFunction {
	public typealias Result = Ok
	public let userIds: Vector<int32>

	public init(userIds: Vector<int32>) {
		self.userIds = userIds
	}
}

public struct GetImportedContactCount: TDFunction {
	public typealias Result = Count

	public init() {
	}
}

public struct ChangeImportedContacts: TDFunction {
	public typealias Result = ImportedContacts
	public let contacts: Vector<contact>

	public init(contacts: Vector<contact>) {
		self.contacts = contacts
	}
}

public struct ClearImportedContacts: TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct GetUserProfilePhotos: TDFunction {
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

public struct GetStickers: TDFunction {
	public typealias Result = Stickers
	public let emoji: String
	public let limit: Int32

	public init(emoji: String, limit: Int32) {
		self.emoji = emoji
		self.limit = limit
	}
}

public struct GetInstalledStickerSets: TDFunction {
	public typealias Result = StickerSets
	public let isMasks: Bool

	public init(isMasks: Bool) {
		self.isMasks = isMasks
	}
}

public struct GetArchivedStickerSets: TDFunction {
	public typealias Result = StickerSets
	public let isMasks: Bool
	public let offsetStickerSetId: Int64
	public let limit: Int32

	public init(isMasks: Bool, offsetStickerSetId: Int64, limit: Int32) {
		self.isMasks = isMasks
		self.offsetStickerSetId = offsetStickerSetId
		self.limit = limit
	}
}

public struct GetTrendingStickerSets: TDFunction {
	public typealias Result = StickerSets

	public init() {
	}
}

public struct GetAttachedStickerSets: TDFunction {
	public typealias Result = StickerSets
	public let fileId: Int32

	public init(fileId: Int32) {
		self.fileId = fileId
	}
}

public struct GetStickerSet: TDFunction {
	public typealias Result = StickerSet
	public let setId: Int64

	public init(setId: Int64) {
		self.setId = setId
	}
}

public struct SearchStickerSet: TDFunction {
	public typealias Result = StickerSet
	public let name: String

	public init(name: String) {
		self.name = name
	}
}

public struct ChangeStickerSet: TDFunction {
	public typealias Result = Ok
	public let setId: Int64
	public let isInstalled: Bool
	public let isArchived: Bool

	public init(setId: Int64, isInstalled: Bool, isArchived: Bool) {
		self.setId = setId
		self.isInstalled = isInstalled
		self.isArchived = isArchived
	}
}

public struct ViewTrendingStickerSets: TDFunction {
	public typealias Result = Ok
	public let stickerSetIds: Vector<int64>

	public init(stickerSetIds: Vector<int64>) {
		self.stickerSetIds = stickerSetIds
	}
}

public struct ReorderInstalledStickerSets: TDFunction {
	public typealias Result = Ok
	public let isMasks: Bool
	public let stickerSetIds: Vector<int64>

	public init(isMasks: Bool, stickerSetIds: Vector<int64>) {
		self.isMasks = isMasks
		self.stickerSetIds = stickerSetIds
	}
}

public struct GetRecentStickers: TDFunction {
	public typealias Result = Stickers
	public let isAttached: Bool

	public init(isAttached: Bool) {
		self.isAttached = isAttached
	}
}

public struct AddRecentSticker: TDFunction {
	public typealias Result = Stickers
	public let isAttached: Bool
	public let sticker: Inputfile

	public init(isAttached: Bool, sticker: Inputfile) {
		self.isAttached = isAttached
		self.sticker = sticker
	}
}

public struct RemoveRecentSticker: TDFunction {
	public typealias Result = Ok
	public let isAttached: Bool
	public let sticker: Inputfile

	public init(isAttached: Bool, sticker: Inputfile) {
		self.isAttached = isAttached
		self.sticker = sticker
	}
}

public struct ClearRecentStickers: TDFunction {
	public typealias Result = Ok
	public let isAttached: Bool

	public init(isAttached: Bool) {
		self.isAttached = isAttached
	}
}

public struct GetFavoriteStickers: TDFunction {
	public typealias Result = Stickers

	public init() {
	}
}

public struct AddFavoriteSticker: TDFunction {
	public typealias Result = Ok
	public let sticker: Inputfile

	public init(sticker: Inputfile) {
		self.sticker = sticker
	}
}

public struct RemoveFavoriteSticker: TDFunction {
	public typealias Result = Ok
	public let sticker: Inputfile

	public init(sticker: Inputfile) {
		self.sticker = sticker
	}
}

public struct GetStickerEmojis: TDFunction {
	public typealias Result = StickerEmojis
	public let sticker: Inputfile

	public init(sticker: Inputfile) {
		self.sticker = sticker
	}
}

public struct GetSavedAnimations: TDFunction {
	public typealias Result = Animations

	public init() {
	}
}

public struct AddSavedAnimation: TDFunction {
	public typealias Result = Ok
	public let animation: Inputfile

	public init(animation: Inputfile) {
		self.animation = animation
	}
}

public struct RemoveSavedAnimation: TDFunction {
	public typealias Result = Ok
	public let animation: Inputfile

	public init(animation: Inputfile) {
		self.animation = animation
	}
}

public struct GetRecentInlineBots: TDFunction {
	public typealias Result = Users

	public init() {
	}
}

public struct SearchHashtags: TDFunction {
	public typealias Result = Hashtags
	public let prefix: String
	public let limit: Int32

	public init(prefix: String, limit: Int32) {
		self.prefix = prefix
		self.limit = limit
	}
}

public struct RemoveRecentHashtag: TDFunction {
	public typealias Result = Ok
	public let hashtag: String

	public init(hashtag: String) {
		self.hashtag = hashtag
	}
}

public struct GetWebPagePreview: TDFunction {
	public typealias Result = WebPage
	public let messageText: String

	public init(messageText: String) {
		self.messageText = messageText
	}
}

public struct GetWebPageInstantView: TDFunction {
	public typealias Result = WebPageInstantView
	public let url: String
	public let forceFull: Bool

	public init(url: String, forceFull: Bool) {
		self.url = url
		self.forceFull = forceFull
	}
}

public struct GetNotificationSettings: TDFunction {
	public typealias Result = NotificationSettings
	public let scope: Notificationsettingsscope

	public init(scope: Notificationsettingsscope) {
		self.scope = scope
	}
}

public struct SetNotificationSettings: TDFunction {
	public typealias Result = Ok
	public let scope: Notificationsettingsscope
	public let notificationSettings: Notificationsettings

	public init(scope: Notificationsettingsscope, notificationSettings: Notificationsettings) {
		self.scope = scope
		self.notificationSettings = notificationSettings
	}
}

public struct ResetAllNotificationSettings: TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct SetProfilePhoto: TDFunction {
	public typealias Result = Ok
	public let photo: Inputfile

	public init(photo: Inputfile) {
		self.photo = photo
	}
}

public struct DeleteProfilePhoto: TDFunction {
	public typealias Result = Ok
	public let profilePhotoId: Int64

	public init(profilePhotoId: Int64) {
		self.profilePhotoId = profilePhotoId
	}
}

public struct SetName: TDFunction {
	public typealias Result = Ok
	public let firstName: String
	public let lastName: String

	public init(firstName: String, lastName: String) {
		self.firstName = firstName
		self.lastName = lastName
	}
}

public struct SetBio: TDFunction {
	public typealias Result = Ok
	public let bio: String

	public init(bio: String) {
		self.bio = bio
	}
}

public struct SetUsername: TDFunction {
	public typealias Result = Ok
	public let username: String

	public init(username: String) {
		self.username = username
	}
}

public struct ChangePhoneNumber: TDFunction {
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

public struct ResendChangePhoneNumberCode: TDFunction {
	public typealias Result = AuthenticationCodeInfo

	public init() {
	}
}

public struct CheckChangePhoneNumberCode: TDFunction {
	public typealias Result = Ok
	public let code: String

	public init(code: String) {
		self.code = code
	}
}

public struct GetActiveSessions: TDFunction {
	public typealias Result = Sessions

	public init() {
	}
}

public struct TerminateSession: TDFunction {
	public typealias Result = Ok
	public let sessionId: Int64

	public init(sessionId: Int64) {
		self.sessionId = sessionId
	}
}

public struct TerminateAllOtherSessions: TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct ToggleBasicGroupAdministrators: TDFunction {
	public typealias Result = Ok
	public let basicGroupId: Int32
	public let everyoneIsAdministrator: Bool

	public init(basicGroupId: Int32, everyoneIsAdministrator: Bool) {
		self.basicGroupId = basicGroupId
		self.everyoneIsAdministrator = everyoneIsAdministrator
	}
}

public struct SetSupergroupUsername: TDFunction {
	public typealias Result = Ok
	public let supergroupId: Int32
	public let username: String

	public init(supergroupId: Int32, username: String) {
		self.supergroupId = supergroupId
		self.username = username
	}
}

public struct SetSupergroupStickerSet: TDFunction {
	public typealias Result = Ok
	public let supergroupId: Int32
	public let stickerSetId: Int64

	public init(supergroupId: Int32, stickerSetId: Int64) {
		self.supergroupId = supergroupId
		self.stickerSetId = stickerSetId
	}
}

public struct ToggleSupergroupInvites: TDFunction {
	public typealias Result = Ok
	public let supergroupId: Int32
	public let anyoneCanInvite: Bool

	public init(supergroupId: Int32, anyoneCanInvite: Bool) {
		self.supergroupId = supergroupId
		self.anyoneCanInvite = anyoneCanInvite
	}
}

public struct ToggleSupergroupSignMessages: TDFunction {
	public typealias Result = Ok
	public let supergroupId: Int32
	public let signMessages: Bool

	public init(supergroupId: Int32, signMessages: Bool) {
		self.supergroupId = supergroupId
		self.signMessages = signMessages
	}
}

public struct ToggleSupergroupIsAllHistoryAvailable: TDFunction {
	public typealias Result = Ok
	public let supergroupId: Int32
	public let isAllHistoryAvailable: Bool

	public init(supergroupId: Int32, isAllHistoryAvailable: Bool) {
		self.supergroupId = supergroupId
		self.isAllHistoryAvailable = isAllHistoryAvailable
	}
}

public struct SetSupergroupDescription: TDFunction {
	public typealias Result = Ok
	public let supergroupId: Int32
	public let description: String

	public init(supergroupId: Int32, description: String) {
		self.supergroupId = supergroupId
		self.description = description
	}
}

public struct PinSupergroupMessage: TDFunction {
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

public struct UnpinSupergroupMessage: TDFunction {
	public typealias Result = Ok
	public let supergroupId: Int32

	public init(supergroupId: Int32) {
		self.supergroupId = supergroupId
	}
}

public struct ReportSupergroupSpam: TDFunction {
	public typealias Result = Ok
	public let supergroupId: Int32
	public let userId: Int32
	public let messageIds: Vector<int53>

	public init(supergroupId: Int32, userId: Int32, messageIds: Vector<int53>) {
		self.supergroupId = supergroupId
		self.userId = userId
		self.messageIds = messageIds
	}
}

public struct GetSupergroupMembers: TDFunction {
	public typealias Result = ChatMembers
	public let supergroupId: Int32
	public let filter: Supergroupmembersfilter
	public let offset: Int32
	public let limit: Int32

	public init(supergroupId: Int32, filter: Supergroupmembersfilter, offset: Int32, limit: Int32) {
		self.supergroupId = supergroupId
		self.filter = filter
		self.offset = offset
		self.limit = limit
	}
}

public struct DeleteSupergroup: TDFunction {
	public typealias Result = Ok
	public let supergroupId: Int32

	public init(supergroupId: Int32) {
		self.supergroupId = supergroupId
	}
}

public struct CloseSecretChat: TDFunction {
	public typealias Result = Ok
	public let secretChatId: Int32

	public init(secretChatId: Int32) {
		self.secretChatId = secretChatId
	}
}

public struct GetChatEventLog: TDFunction {
	public typealias Result = ChatEvents
	public let chatId: Int53
	public let query: String
	public let fromEventId: Int64
	public let limit: Int32
	public let filters: Chateventlogfilters
	public let userIds: Vector<int32>

	public init(chatId: Int53, query: String, fromEventId: Int64, limit: Int32, filters: Chateventlogfilters, userIds: Vector<int32>) {
		self.chatId = chatId
		self.query = query
		self.fromEventId = fromEventId
		self.limit = limit
		self.filters = filters
		self.userIds = userIds
	}
}

public struct GetPaymentForm: TDFunction {
	public typealias Result = PaymentForm
	public let chatId: Int53
	public let messageId: Int53

	public init(chatId: Int53, messageId: Int53) {
		self.chatId = chatId
		self.messageId = messageId
	}
}

public struct ValidateOrderInfo: TDFunction {
	public typealias Result = ValidatedOrderInfo
	public let chatId: Int53
	public let messageId: Int53
	public let orderInfo: Orderinfo
	public let allowSave: Bool

	public init(chatId: Int53, messageId: Int53, orderInfo: Orderinfo, allowSave: Bool) {
		self.chatId = chatId
		self.messageId = messageId
		self.orderInfo = orderInfo
		self.allowSave = allowSave
	}
}

public struct SendPaymentForm: TDFunction {
	public typealias Result = PaymentResult
	public let chatId: Int53
	public let messageId: Int53
	public let orderInfoId: String
	public let shippingOptionId: String
	public let credentials: Inputcredentials

	public init(chatId: Int53, messageId: Int53, orderInfoId: String, shippingOptionId: String, credentials: Inputcredentials) {
		self.chatId = chatId
		self.messageId = messageId
		self.orderInfoId = orderInfoId
		self.shippingOptionId = shippingOptionId
		self.credentials = credentials
	}
}

public struct GetPaymentReceipt: TDFunction {
	public typealias Result = PaymentReceipt
	public let chatId: Int53
	public let messageId: Int53

	public init(chatId: Int53, messageId: Int53) {
		self.chatId = chatId
		self.messageId = messageId
	}
}

public struct GetSavedOrderInfo: TDFunction {
	public typealias Result = OrderInfo

	public init() {
	}
}

public struct DeleteSavedOrderInfo: TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct DeleteSavedCredentials: TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct GetSupportUser: TDFunction {
	public typealias Result = User

	public init() {
	}
}

public struct GetWallpapers: TDFunction {
	public typealias Result = Wallpapers

	public init() {
	}
}

public struct RegisterDevice: TDFunction {
	public typealias Result = Ok
	public let deviceToken: Devicetoken
	public let otherUserIds: Vector<int32>

	public init(deviceToken: Devicetoken, otherUserIds: Vector<int32>) {
		self.deviceToken = deviceToken
		self.otherUserIds = otherUserIds
	}
}

public struct GetRecentlyVisitedTMeUrls: TDFunction {
	public typealias Result = TMeUrls
	public let referrer: String

	public init(referrer: String) {
		self.referrer = referrer
	}
}

public struct SetUserPrivacySettingRules: TDFunction {
	public typealias Result = Ok
	public let setting: Userprivacysetting
	public let rules: Userprivacysettingrules

	public init(setting: Userprivacysetting, rules: Userprivacysettingrules) {
		self.setting = setting
		self.rules = rules
	}
}

public struct GetUserPrivacySettingRules: TDFunction {
	public typealias Result = UserPrivacySettingRules
	public let setting: Userprivacysetting

	public init(setting: Userprivacysetting) {
		self.setting = setting
	}
}

public struct GetOption: TDFunction {
	public typealias Result = OptionValue
	public let name: String

	public init(name: String) {
		self.name = name
	}
}

public struct SetOption: TDFunction {
	public typealias Result = Ok
	public let name: String
	public let value: Optionvalue

	public init(name: String, value: Optionvalue) {
		self.name = name
		self.value = value
	}
}

public struct SetAccountTtl: TDFunction {
	public typealias Result = Ok
	public let ttl: Accountttl

	public init(ttl: Accountttl) {
		self.ttl = ttl
	}
}

public struct GetAccountTtl: TDFunction {
	public typealias Result = AccountTtl

	public init() {
	}
}

public struct DeleteAccount: TDFunction {
	public typealias Result = Ok
	public let reason: String

	public init(reason: String) {
		self.reason = reason
	}
}

public struct GetChatReportSpamState: TDFunction {
	public typealias Result = ChatReportSpamState
	public let chatId: Int53

	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

public struct ChangeChatReportSpamState: TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let isSpamChat: Bool

	public init(chatId: Int53, isSpamChat: Bool) {
		self.chatId = chatId
		self.isSpamChat = isSpamChat
	}
}

public struct ReportChat: TDFunction {
	public typealias Result = Ok
	public let chatId: Int53
	public let reason: Chatreportreason

	public init(chatId: Int53, reason: Chatreportreason) {
		self.chatId = chatId
		self.reason = reason
	}
}

public struct GetStorageStatistics: TDFunction {
	public typealias Result = StorageStatistics
	public let chatLimit: Int32

	public init(chatLimit: Int32) {
		self.chatLimit = chatLimit
	}
}

public struct GetStorageStatisticsFast: TDFunction {
	public typealias Result = StorageStatisticsFast

	public init() {
	}
}

public struct OptimizeStorage: TDFunction {
	public typealias Result = StorageStatistics
	public let size: Int53
	public let ttl: Int32
	public let count: Int32
	public let immunityDelay: Int32
	public let fileTypes: Vector<filetype>
	public let chatIds: Vector<int53>
	public let excludeChatIds: Vector<int53>
	public let chatLimit: Int32

	public init(size: Int53, ttl: Int32, count: Int32, immunityDelay: Int32, fileTypes: Vector<filetype>, chatIds: Vector<int53>, excludeChatIds: Vector<int53>, chatLimit: Int32) {
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

public struct SetNetworkType: TDFunction {
	public typealias Result = Ok
	public let type: Networktype

	public init(type: Networktype) {
		self.type = type
	}
}

public struct GetNetworkStatistics: TDFunction {
	public typealias Result = NetworkStatistics
	public let onlyCurrent: Bool

	public init(onlyCurrent: Bool) {
		self.onlyCurrent = onlyCurrent
	}
}

public struct AddNetworkStatistics: TDFunction {
	public typealias Result = Ok
	public let entry: Networkstatisticsentry

	public init(entry: Networkstatisticsentry) {
		self.entry = entry
	}
}

public struct ResetNetworkStatistics: TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct SetBotUpdatesStatus: TDFunction {
	public typealias Result = Ok
	public let pendingUpdateCount: Int32
	public let errorMessage: String

	public init(pendingUpdateCount: Int32, errorMessage: String) {
		self.pendingUpdateCount = pendingUpdateCount
		self.errorMessage = errorMessage
	}
}

public struct UploadStickerFile: TDFunction {
	public typealias Result = File
	public let userId: Int32
	public let pngSticker: Inputfile

	public init(userId: Int32, pngSticker: Inputfile) {
		self.userId = userId
		self.pngSticker = pngSticker
	}
}

public struct CreateNewStickerSet: TDFunction {
	public typealias Result = StickerSet
	public let userId: Int32
	public let title: String
	public let name: String
	public let isMasks: Bool
	public let stickers: Vector<inputsticker>

	public init(userId: Int32, title: String, name: String, isMasks: Bool, stickers: Vector<inputsticker>) {
		self.userId = userId
		self.title = title
		self.name = name
		self.isMasks = isMasks
		self.stickers = stickers
	}
}

public struct AddStickerToSet: TDFunction {
	public typealias Result = StickerSet
	public let userId: Int32
	public let name: String
	public let sticker: Inputsticker

	public init(userId: Int32, name: String, sticker: Inputsticker) {
		self.userId = userId
		self.name = name
		self.sticker = sticker
	}
}

public struct SetStickerPositionInSet: TDFunction {
	public typealias Result = Ok
	public let sticker: Inputfile
	public let position: Int32

	public init(sticker: Inputfile, position: Int32) {
		self.sticker = sticker
		self.position = position
	}
}

public struct RemoveStickerFromSet: TDFunction {
	public typealias Result = Ok
	public let sticker: Inputfile

	public init(sticker: Inputfile) {
		self.sticker = sticker
	}
}

public struct SendCustomRequest: TDFunction {
	public typealias Result = CustomRequestResult
	public let method: String
	public let parameters: String

	public init(method: String, parameters: String) {
		self.method = method
		self.parameters = parameters
	}
}

public struct AnswerCustomQuery: TDFunction {
	public typealias Result = Ok
	public let customQueryId: Int64
	public let data: String

	public init(customQueryId: Int64, data: String) {
		self.customQueryId = customQueryId
		self.data = data
	}
}

public struct SetAlarm: TDFunction {
	public typealias Result = Ok
	public let seconds: Double

	public init(seconds: Double) {
		self.seconds = seconds
	}
}

public struct GetInviteText: TDFunction {
	public typealias Result = Text

	public init() {
	}
}

public struct GetTermsOfService: TDFunction {
	public typealias Result = Text

	public init() {
	}
}

public struct SetProxy: TDFunction {
	public typealias Result = Ok
	public let proxy: Proxy

	public init(proxy: Proxy) {
		self.proxy = proxy
	}
}

public struct GetProxy: TDFunction {
	public typealias Result = Proxy

	public init() {
	}
}

public struct TestCallEmpty: TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct TestCallString: TDFunction {
	public typealias Result = TestString
	public let x: String

	public init(x: String) {
		self.x = x
	}
}

public struct TestCallBytes: TDFunction {
	public typealias Result = TestBytes
	public let x: Bytes

	public init(x: Bytes) {
		self.x = x
	}
}

public struct TestCallVectorInt: TDFunction {
	public typealias Result = TestVectorInt
	public let x: Vector<int32>

	public init(x: Vector<int32>) {
		self.x = x
	}
}

public struct TestCallVectorIntObject: TDFunction {
	public typealias Result = TestVectorIntObject
	public let x: Vector<testint>

	public init(x: Vector<testint>) {
		self.x = x
	}
}

public struct TestCallVectorString: TDFunction {
	public typealias Result = TestVectorString
	public let x: Vector<string>

	public init(x: Vector<string>) {
		self.x = x
	}
}

public struct TestCallVectorStringObject: TDFunction {
	public typealias Result = TestVectorStringObject
	public let x: Vector<teststring>

	public init(x: Vector<teststring>) {
		self.x = x
	}
}

public struct TestSquareInt: TDFunction {
	public typealias Result = TestInt
	public let x: Int32

	public init(x: Int32) {
		self.x = x
	}
}

public struct TestNetwork: TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct TestGetDifference: TDFunction {
	public typealias Result = Ok

	public init() {
	}
}

public struct TestUseUpdate: TDFunction {
	public typealias Result = Update

	public init() {
	}
}

public struct TestUseError: TDFunction {
	public typealias Result = Error

	public init() {
	}
}

