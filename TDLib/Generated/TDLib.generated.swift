public typealias Int53 = Int64
public typealias Bytes = Data

///  An object of this type can be returned on every function call, in case of an error 
public struct Error: Codable, Equatable, FunctionResult {
	///  Error code; subject to future changes. If the error code is 406, the error message must not be processed in any way and must not be displayed to the user 
	public let code: Int32
	///  Error message; subject to future changes
	public let message: String
	/// An object of this type can be returned on every function call, in case of an error 
	/// - Parameters:
	///   - code: Error code; subject to future changes. If the error code is 406, the error message must not be processed in any way and must not be displayed to the user 
	///   - message: Error message; subject to future changes
	public init(code: Int32, message: String) {
		self.code = code
		self.message = message
	}
}

///  An object of this type is returned on a successful function call for certain functions
public struct Ok: Codable, Equatable, FunctionResult {
	/// An object of this type is returned on a successful function call for certain functions
	public init() {
	}
}

///  Contains parameters for TDLib initialization 
public struct TdlibParameters: Codable, Equatable, FunctionResult {
	///  If set to true, the Telegram test environment will be used instead of the production environment 
	public let useTestDc: Bool
	///  The path to the directory for the persistent database; if empty, the current working directory will be used 
	public let databaseDirectory: String
	///  The path to the directory for storing files; if empty, database_directory will be used 
	public let filesDirectory: String
	///  If set to true, information about downloaded and uploaded files will be saved between application restarts 
	public let useFileDatabase: Bool
	///  If set to true, the library will maintain a cache of users, basic groups, supergroups, channels and secret chats. Implies use_file_database 
	public let useChatInfoDatabase: Bool
	///  If set to true, the library will maintain a cache of chats and messages. Implies use_chat_info_database 
	public let useMessageDatabase: Bool
	///  If set to true, support for secret chats will be enabled 
	public let useSecretChats: Bool
	///  Application identifier for Telegram API access, which can be obtained at https://my.telegram.org 
	public let apiId: Int32
	///  Application identifier hash for Telegram API access, which can be obtained at https://my.telegram.org 
	public let apiHash: String
	///  IETF language tag of the user's operating system language; must be non-empty 
	public let systemLanguageCode: String
	///  Model of the device the application is being run on; must be non-empty 
	public let deviceModel: String
	///  Version of the operating system the application is being run on; must be non-empty 
	public let systemVersion: String
	///  Application version; must be non-empty 
	public let applicationVersion: String
	///  If set to true, old files will automatically be deleted 
	public let enableStorageOptimizer: Bool
	///  If set to true, original file names will be ignored. Otherwise, downloaded files will be saved under names as close as possible to the original name
	public let ignoreFileNames: Bool
	/// Contains parameters for TDLib initialization 
	/// - Parameters:
	///   - useTestDc: If set to true, the Telegram test environment will be used instead of the production environment 
	///   - databaseDirectory: The path to the directory for the persistent database; if empty, the current working directory will be used 
	///   - filesDirectory: The path to the directory for storing files; if empty, database_directory will be used 
	///   - useFileDatabase: If set to true, information about downloaded and uploaded files will be saved between application restarts 
	///   - useChatInfoDatabase: If set to true, the library will maintain a cache of users, basic groups, supergroups, channels and secret chats. Implies use_file_database 
	///   - useMessageDatabase: If set to true, the library will maintain a cache of chats and messages. Implies use_chat_info_database 
	///   - useSecretChats: If set to true, support for secret chats will be enabled 
	///   - apiId: Application identifier for Telegram API access, which can be obtained at https://my.telegram.org 
	///   - apiHash: Application identifier hash for Telegram API access, which can be obtained at https://my.telegram.org 
	///   - systemLanguageCode: IETF language tag of the user's operating system language; must be non-empty 
	///   - deviceModel: Model of the device the application is being run on; must be non-empty 
	///   - systemVersion: Version of the operating system the application is being run on; must be non-empty 
	///   - applicationVersion: Application version; must be non-empty 
	///   - enableStorageOptimizer: If set to true, old files will automatically be deleted 
	///   - ignoreFileNames: If set to true, original file names will be ignored. Otherwise, downloaded files will be saved under names as close as possible to the original name
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

///  Provides information about the method by which an authentication code is delivered to the user 
public indirect enum AuthenticationCodeType: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  An authentication code is delivered via a private Telegram message, which can be viewed in another client 
	/// - length: Length of the code
	case telegramMessage(length: Int32)
	///  An authentication code is delivered via an SMS message to the specified phone number 
	/// - length: Length of the code
	case sms(length: Int32)
	///  An authentication code is delivered via a phone call to the specified phone number 
	/// - length: Length of the code
	case call(length: Int32)
	///  An authentication code is delivered by an immediately cancelled call to the specified phone number. The number from which the call was made is the code 
	/// - pattern: Pattern of the phone number from which the call will be made
	case flashCall(pattern: String)
}

///  Information about the authentication code that was sent 
public struct AuthenticationCodeInfo: Codable, Equatable, FunctionResult {
	///  A phone number that is being authenticated 
	public let phoneNumber: String
	///  Describes the way the code was sent to the user 
	public let type: AuthenticationCodeType
	///  Describes the way the next code will be sent to the user; may be null 
	public let nextType: AuthenticationCodeType?
	///  Timeout before the code should be re-sent, in seconds
	public let timeout: Int32
	/// Information about the authentication code that was sent 
	/// - Parameters:
	///   - phoneNumber: A phone number that is being authenticated 
	///   - type: Describes the way the code was sent to the user 
	///   - nextType: Describes the way the next code will be sent to the user; may be null 
	///   - timeout: Timeout before the code should be re-sent, in seconds
	public init(phoneNumber: String, type: AuthenticationCodeType, nextType: AuthenticationCodeType?, timeout: Int32) {
		self.phoneNumber = phoneNumber
		self.type = type
		self.nextType = nextType
		self.timeout = timeout
	}
}

///  Represents the current authorization state of the client 
public indirect enum AuthorizationState: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  TDLib needs TdlibParameters for initialization
	case waitTdlibParameters
	///  TDLib needs an encryption key to decrypt the local database 
	/// - isEncrypted: True, if the database is currently encrypted
	case waitEncryptionKey(isEncrypted: Bool)
	///  TDLib needs the user's phone number to authorize
	case waitPhoneNumber
	///  TDLib needs the user's authentication code to finalize authorization 
	/// - isRegistered: True, if the user is already registered 
	/// - codeInfo: Information about the authorization code that was sent
	case waitCode(isRegistered: Bool, codeInfo: AuthenticationCodeInfo)
	///  The user has been authorized, but needs to enter a password to start using the application 
	/// - passwordHint: Hint for the password; can be empty 
	/// - hasRecoveryEmailAddress: True if a recovery email address has been set up 
	/// - recoveryEmailAddressPattern: Pattern of the email address to which the recovery email was sent; empty until a recovery email has been sent
	case waitPassword(passwordHint: String, hasRecoveryEmailAddress: Bool, recoveryEmailAddressPattern: String)
	///  The user has been successfully authorized. TDLib is now ready to answer queries
	case ready
	///  The user is currently logging out
	case loggingOut
	///  TDLib is closing, all subsequent queries will be answered with the error 500. Note that closing TDLib can take a while. All resources will be freed only after authorizationStateClosed has been received
	case closing
	///  TDLib client is in its final state. All databases are closed and all resources are released. No other updates will be received after this. All queries will be responded to -with error code 500. To continue working, one should create a new instance of the TDLib client
	case closed
}

///  Represents the current state of 2-step verification 
public struct PasswordState: Codable, Equatable, FunctionResult {
	///  True if a 2-step verification password has been set up 
	public let hasPassword: Bool
	///  Hint for the password; can be empty 
	public let passwordHint: String
	///  True if a recovery email has been set up 
	public let hasRecoveryEmailAddress: Bool
	///  Pattern of the email address to which a confirmation email was sent
	public let unconfirmedRecoveryEmailAddressPattern: String
	/// Represents the current state of 2-step verification 
	/// - Parameters:
	///   - hasPassword: True if a 2-step verification password has been set up 
	///   - passwordHint: Hint for the password; can be empty 
	///   - hasRecoveryEmailAddress: True if a recovery email has been set up 
	///   - unconfirmedRecoveryEmailAddressPattern: Pattern of the email address to which a confirmation email was sent
	public init(hasPassword: Bool, passwordHint: String, hasRecoveryEmailAddress: Bool, unconfirmedRecoveryEmailAddressPattern: String) {
		self.hasPassword = hasPassword
		self.passwordHint = passwordHint
		self.hasRecoveryEmailAddress = hasRecoveryEmailAddress
		self.unconfirmedRecoveryEmailAddressPattern = unconfirmedRecoveryEmailAddressPattern
	}
}

///  Contains information available to the user after requesting password recovery 
public struct PasswordRecoveryInfo: Codable, Equatable, FunctionResult {
	///  Pattern of the email address to which a recovery email was sent
	public let recoveryEmailAddressPattern: String
	/// Contains information available to the user after requesting password recovery 
	/// - Parameters:
	///   - recoveryEmailAddressPattern: Pattern of the email address to which a recovery email was sent
	public init(recoveryEmailAddressPattern: String) {
		self.recoveryEmailAddressPattern = recoveryEmailAddressPattern
	}
}

///  Contains information about the current recovery email address 
public struct RecoveryEmailAddress: Codable, Equatable, FunctionResult {
	///  Recovery email address
	public let recoveryEmailAddress: String
	/// Contains information about the current recovery email address 
	/// - Parameters:
	///   - recoveryEmailAddress: Recovery email address
	public init(recoveryEmailAddress: String) {
		self.recoveryEmailAddress = recoveryEmailAddress
	}
}

///  Returns information about the availability of a temporary password, which can be used for payments 
public struct TemporaryPasswordState: Codable, Equatable, FunctionResult {
	///  True, if a temporary password is available 
	public let hasPassword: Bool
	///  Time left before the temporary password expires, in seconds
	public let validFor: Int32
	/// Returns information about the availability of a temporary password, which can be used for payments 
	/// - Parameters:
	///   - hasPassword: True, if a temporary password is available 
	///   - validFor: Time left before the temporary password expires, in seconds
	public init(hasPassword: Bool, validFor: Int32) {
		self.hasPassword = hasPassword
		self.validFor = validFor
	}
}

///  Represents a local file 
public struct LocalFile: Codable, Equatable, FunctionResult {
	///  Local path to the locally available file part; may be empty 
	public let path: String
	///  True, if it is possible to try to download or generate the file 
	public let canBeDownloaded: Bool
	///  True, if the file can be deleted 
	public let canBeDeleted: Bool
	///  True, if the file is currently being downloaded (or a local copy is being generated by some other means) 
	public let isDownloadingActive: Bool
	///  True, if the local copy is fully available 
	public let isDownloadingCompleted: Bool
	///  If is_downloading_completed is false, then only some prefix of the file is ready to be read. downloaded_prefix_size is the size of that prefix 
	public let downloadedPrefixSize: Int32
	///  Total downloaded file bytes. Should be used only for calculating download progress. The actual file size may be bigger, and some parts of it may contain garbage
	public let downloadedSize: Int32
	/// Represents a local file 
	/// - Parameters:
	///   - path: Local path to the locally available file part; may be empty 
	///   - canBeDownloaded: True, if it is possible to try to download or generate the file 
	///   - canBeDeleted: True, if the file can be deleted 
	///   - isDownloadingActive: True, if the file is currently being downloaded (or a local copy is being generated by some other means) 
	///   - isDownloadingCompleted: True, if the local copy is fully available 
	///   - downloadedPrefixSize: If is_downloading_completed is false, then only some prefix of the file is ready to be read. downloaded_prefix_size is the size of that prefix 
	///   - downloadedSize: Total downloaded file bytes. Should be used only for calculating download progress. The actual file size may be bigger, and some parts of it may contain garbage
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

///  Represents a remote file 
public struct RemoteFile: Codable, Equatable, FunctionResult {
	///  Remote file identifier, may be empty. Can be used across application restarts or even from other devices for the current user. If the ID starts with "http://" or "https://", it represents the HTTP URL of the file. TDLib is currently unable to download files if only their URL is known. -If downloadFile is called on such a file or if it is sent to a secret chat, TDLib starts a file generation process by sending updateFileGenerationStart to the client with the HTTP URL in the original_path and "#url#" as the conversion string. Clients should generate the file by downloading it to the specified location 
	public let id: String
	///  True, if the file is currently being uploaded (or a remote copy is being generated by some other means) 
	public let isUploadingActive: Bool
	///  True, if a remote copy is fully available 
	public let isUploadingCompleted: Bool
	///  Size of the remote available part of the file; 0 if unknown
	public let uploadedSize: Int32
	/// Represents a remote file 
	/// - Parameters:
	///   - id: Remote file identifier, may be empty. Can be used across application restarts or even from other devices for the current user. If the ID starts with "http://" or "https://", it represents the HTTP URL of the file. TDLib is currently unable to download files if only their URL is known. -If downloadFile is called on such a file or if it is sent to a secret chat, TDLib starts a file generation process by sending updateFileGenerationStart to the client with the HTTP URL in the original_path and "#url#" as the conversion string. Clients should generate the file by downloading it to the specified location 
	///   - isUploadingActive: True, if the file is currently being uploaded (or a remote copy is being generated by some other means) 
	///   - isUploadingCompleted: True, if a remote copy is fully available 
	///   - uploadedSize: Size of the remote available part of the file; 0 if unknown
	public init(id: String, isUploadingActive: Bool, isUploadingCompleted: Bool, uploadedSize: Int32) {
		self.id = id
		self.isUploadingActive = isUploadingActive
		self.isUploadingCompleted = isUploadingCompleted
		self.uploadedSize = uploadedSize
	}
}

///  Represents a file 
public struct File: Codable, Equatable, FunctionResult {
	///  Unique file identifier 
	public let id: Int32
	///  File size; 0 if unknown 
	public let size: Int32
	///  Expected file size in case the exact file size is unknown, but an approximate size is known. Can be used to show download/upload progress 
	public let expectedSize: Int32
	///  Information about the local copy of the file 
	public let local: LocalFile
	///  Information about the remote copy of the file
	public let remote: RemoteFile
	/// Represents a file 
	/// - Parameters:
	///   - id: Unique file identifier 
	///   - size: File size; 0 if unknown 
	///   - expectedSize: Expected file size in case the exact file size is unknown, but an approximate size is known. Can be used to show download/upload progress 
	///   - local: Information about the local copy of the file 
	///   - remote: Information about the remote copy of the file
	public init(id: Int32, size: Int32, expectedSize: Int32, local: LocalFile, remote: RemoteFile) {
		self.id = id
		self.size = size
		self.expectedSize = expectedSize
		self.local = local
		self.remote = remote
	}
}

///  Points to a file 
public indirect enum InputFile: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  A file defined by its unique ID 
	/// - id: Unique file identifier
	case id(id: Int32)
	///  A file defined by its remote ID 
	/// - id: Remote file identifier
	case remote(id: String)
	///  A file defined by a local path 
	/// - path: Local path to the file
	case local(path: String)
	///  A file generated by the client 
	/// - originalPath: Local path to a file from which the file is generated, may be empty if there is no such file 
	/// - conversion: String specifying the conversion applied to the original file; should be persistent across application restarts 
	/// - expectedSize: Expected size of the generated file; 0 if unknown
	case generated(originalPath: String, conversion: String, expectedSize: Int32)
}

///  Photo description 
public struct PhotoSize: Codable, Equatable, FunctionResult {
	///  Thumbnail type (see https://core.telegram.org/constructor/photoSize) 
	public let type: String
	///  Information about the photo file 
	public let photo: File
	///  Photo width 
	public let width: Int32
	///  Photo height
	public let height: Int32
	/// Photo description 
	/// - Parameters:
	///   - type: Thumbnail type (see https://core.telegram.org/constructor/photoSize) 
	///   - photo: Information about the photo file 
	///   - width: Photo width 
	///   - height: Photo height
	public init(type: String, photo: File, width: Int32, height: Int32) {
		self.type = type
		self.photo = photo
		self.width = width
		self.height = height
	}
}

///  Part of the face, relative to which a mask should be placed 
public indirect enum MaskPoint: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  A mask should be placed relatively to the forehead
	case forehead
	///  A mask should be placed relatively to the eyes
	case eyes
	///  A mask should be placed relatively to the mouth
	case mouth
	///  A mask should be placed relatively to the chin
	case chin
}

///  Position on a photo where a mask should be placed 
public struct MaskPosition: Codable, Equatable, FunctionResult {
	///  Part of the face, relative to which the mask should be placed 
	public let point: MaskPoint
	///  Shift by X-axis measured in widths of the mask scaled to the face size, from left to right. (For example, -1.0 will place the mask just to the left of the default mask position) 
	public let xShift: Double
	///  Shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom. (For example, 1.0 will place the mask just below the default mask position) 
	public let yShift: Double
	///  Mask scaling coefficient. (For example, 2.0 means a doubled size)
	public let scale: Double
	/// Position on a photo where a mask should be placed 
	/// - Parameters:
	///   - point: Part of the face, relative to which the mask should be placed 
	///   - xShift: Shift by X-axis measured in widths of the mask scaled to the face size, from left to right. (For example, -1.0 will place the mask just to the left of the default mask position) 
	///   - yShift: Shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom. (For example, 1.0 will place the mask just below the default mask position) 
	///   - scale: Mask scaling coefficient. (For example, 2.0 means a doubled size)
	public init(point: MaskPoint, xShift: Double, yShift: Double, scale: Double) {
		self.point = point
		self.xShift = xShift
		self.yShift = yShift
		self.scale = scale
	}
}

///  Represents a part of the text that needs to be formatted in some unusual way 
public struct TextEntity: Codable, Equatable, FunctionResult {
	///  Offset of the entity in UTF-16 code points 
	public let offset: Int32
	///  Length of the entity, in UTF-16 code points 
	public let length: Int32
	///  Type of the entity
	public let type: TextEntityType
	/// Represents a part of the text that needs to be formatted in some unusual way 
	/// - Parameters:
	///   - offset: Offset of the entity in UTF-16 code points 
	///   - length: Length of the entity, in UTF-16 code points 
	///   - type: Type of the entity
	public init(offset: Int32, length: Int32, type: TextEntityType) {
		self.offset = offset
		self.length = length
		self.type = type
	}
}

///  Contains a list of text entities 
public struct TextEntities: Codable, Equatable, FunctionResult {
	///  List of text entities
	public let entities: [TextEntity]
	/// Contains a list of text entities 
	/// - Parameters:
	///   - entities: List of text entities
	public init(entities: [TextEntity]) {
		self.entities = entities
	}
}

///  A text with some entities 
public struct FormattedText: Codable, Equatable, FunctionResult {
	///  The text 
	public let text: String
	///  Entities contained in the text
	public let entities: [TextEntity]
	/// A text with some entities 
	/// - Parameters:
	///   - text: The text 
	///   - entities: Entities contained in the text
	public init(text: String, entities: [TextEntity]) {
		self.text = text
		self.entities = entities
	}
}

///  Describes an animation file. The animation must be encoded in GIF or MPEG4 format 
public struct Animation: Codable, Equatable, FunctionResult {
	///  Duration of the animation, in seconds; as defined by the sender 
	public let duration: Int32
	///  Width of the animation 
	public let width: Int32
	///  Height of the animation 
	public let height: Int32
	///  Original name of the file; as defined by the sender 
	public let fileName: String
	///  MIME type of the file, usually "image/gif" or "video/mp4" 
	public let mimeType: String
	///  Animation thumbnail; may be null 
	public let thumbnail: PhotoSize?
	///  File containing the animation
	public let animation: File
	/// Describes an animation file. The animation must be encoded in GIF or MPEG4 format 
	/// - Parameters:
	///   - duration: Duration of the animation, in seconds; as defined by the sender 
	///   - width: Width of the animation 
	///   - height: Height of the animation 
	///   - fileName: Original name of the file; as defined by the sender 
	///   - mimeType: MIME type of the file, usually "image/gif" or "video/mp4" 
	///   - thumbnail: Animation thumbnail; may be null 
	///   - animation: File containing the animation
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

///  Describes an audio file. Audio is usually in MP3 format 
public struct Audio: Codable, Equatable, FunctionResult {
	///  Duration of the audio, in seconds; as defined by the sender 
	public let duration: Int32
	///  Title of the audio; as defined by the sender 
	public let title: String
	///  Performer of the audio; as defined by the sender 
	public let performer: String
	///  Original name of the file; as defined by the sender 
	public let fileName: String
	///  The MIME type of the file; as defined by the sender 
	public let mimeType: String
	///  The thumbnail of the album cover; as defined by the sender. The full size thumbnail should be extracted from the downloaded file; may be null 
	public let albumCoverThumbnail: PhotoSize?
	///  File containing the audio
	public let audio: File
	/// Describes an audio file. Audio is usually in MP3 format 
	/// - Parameters:
	///   - duration: Duration of the audio, in seconds; as defined by the sender 
	///   - title: Title of the audio; as defined by the sender 
	///   - performer: Performer of the audio; as defined by the sender 
	///   - fileName: Original name of the file; as defined by the sender 
	///   - mimeType: The MIME type of the file; as defined by the sender 
	///   - albumCoverThumbnail: The thumbnail of the album cover; as defined by the sender. The full size thumbnail should be extracted from the downloaded file; may be null 
	///   - audio: File containing the audio
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

///  Describes a document of any type 
public struct Document: Codable, Equatable, FunctionResult {
	///  Original name of the file; as defined by the sender 
	public let fileName: String
	///  MIME type of the file; as defined by the sender 
	public let mimeType: String
	///  Document thumbnail; as defined by the sender; may be null 
	public let thumbnail: PhotoSize?
	///  File containing the document
	public let document: File
	/// Describes a document of any type 
	/// - Parameters:
	///   - fileName: Original name of the file; as defined by the sender 
	///   - mimeType: MIME type of the file; as defined by the sender 
	///   - thumbnail: Document thumbnail; as defined by the sender; may be null 
	///   - document: File containing the document
	public init(fileName: String, mimeType: String, thumbnail: PhotoSize?, document: File) {
		self.fileName = fileName
		self.mimeType = mimeType
		self.thumbnail = thumbnail
		self.document = document
	}
}

///  Describes a photo 
public struct Photo: Codable, Equatable, FunctionResult {
	///  Photo identifier; 0 for deleted photos 
	public let id: TDInt64
	///  True, if stickers were added to the photo 
	public let hasStickers: Bool
	///  Available variants of the photo, in different sizes
	public let sizes: [PhotoSize]
	/// Describes a photo 
	/// - Parameters:
	///   - id: Photo identifier; 0 for deleted photos 
	///   - hasStickers: True, if stickers were added to the photo 
	///   - sizes: Available variants of the photo, in different sizes
	public init(id: TDInt64, hasStickers: Bool, sizes: [PhotoSize]) {
		self.id = id
		self.hasStickers = hasStickers
		self.sizes = sizes
	}
}

///  Describes a sticker 
public struct Sticker: Codable, Equatable, FunctionResult {
	///  The identifier of the sticker set to which the sticker belongs; 0 if none 
	public let setId: TDInt64
	///  Sticker width; as defined by the sender 
	public let width: Int32
	///  Sticker height; as defined by the sender 
	public let height: Int32
	///  Emoji corresponding to the sticker 
	public let emoji: String
	///  True, if the sticker is a mask 
	public let isMask: Bool
	///  Position where the mask should be placed; may be null 
	public let maskPosition: MaskPosition?
	///  Sticker thumbnail in WEBP or JPEG format; may be null 
	public let thumbnail: PhotoSize?
	///  File containing the sticker
	public let sticker: File
	/// Describes a sticker 
	/// - Parameters:
	///   - setId: The identifier of the sticker set to which the sticker belongs; 0 if none 
	///   - width: Sticker width; as defined by the sender 
	///   - height: Sticker height; as defined by the sender 
	///   - emoji: Emoji corresponding to the sticker 
	///   - isMask: True, if the sticker is a mask 
	///   - maskPosition: Position where the mask should be placed; may be null 
	///   - thumbnail: Sticker thumbnail in WEBP or JPEG format; may be null 
	///   - sticker: File containing the sticker
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

///  Describes a video file 
public struct Video: Codable, Equatable, FunctionResult {
	///  Duration of the video, in seconds; as defined by the sender 
	public let duration: Int32
	///  Video width; as defined by the sender 
	public let width: Int32
	///  Video height; as defined by the sender 
	public let height: Int32
	///  Original name of the file; as defined by the sender 
	public let fileName: String
	///  MIME type of the file; as defined by the sender 
	public let mimeType: String
	///  True, if stickers were added to the photo 
	public let hasStickers: Bool
	///  True, if the video should be tried to be streamed 
	public let supportsStreaming: Bool
	///  Video thumbnail; as defined by the sender; may be null 
	public let thumbnail: PhotoSize?
	///  File containing the video
	public let video: File
	/// Describes a video file 
	/// - Parameters:
	///   - duration: Duration of the video, in seconds; as defined by the sender 
	///   - width: Video width; as defined by the sender 
	///   - height: Video height; as defined by the sender 
	///   - fileName: Original name of the file; as defined by the sender 
	///   - mimeType: MIME type of the file; as defined by the sender 
	///   - hasStickers: True, if stickers were added to the photo 
	///   - supportsStreaming: True, if the video should be tried to be streamed 
	///   - thumbnail: Video thumbnail; as defined by the sender; may be null 
	///   - video: File containing the video
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

///  Describes a video note. The video must be equal in width and height, cropped to a circle, and stored in MPEG4 format 
public struct VideoNote: Codable, Equatable, FunctionResult {
	///  Duration of the video, in seconds; as defined by the sender 
	public let duration: Int32
	///  Video width and height; as defined by the sender 
	public let length: Int32
	///  Video thumbnail; as defined by the sender; may be null 
	public let thumbnail: PhotoSize?
	///  File containing the video
	public let video: File
	/// Describes a video note. The video must be equal in width and height, cropped to a circle, and stored in MPEG4 format 
	/// - Parameters:
	///   - duration: Duration of the video, in seconds; as defined by the sender 
	///   - length: Video width and height; as defined by the sender 
	///   - thumbnail: Video thumbnail; as defined by the sender; may be null 
	///   - video: File containing the video
	public init(duration: Int32, length: Int32, thumbnail: PhotoSize?, video: File) {
		self.duration = duration
		self.length = length
		self.thumbnail = thumbnail
		self.video = video
	}
}

///  Describes a voice note. The voice note must be encoded with the Opus codec, and stored inside an OGG container. Voice notes can have only a single audio channel 
public struct VoiceNote: Codable, Equatable, FunctionResult {
	///  Duration of the voice note, in seconds; as defined by the sender 
	public let duration: Int32
	///  A waveform representation of the voice note in 5-bit format 
	public let waveform: Bytes
	///  MIME type of the file; as defined by the sender 
	public let mimeType: String
	///  File containing the voice note
	public let voice: File
	/// Describes a voice note. The voice note must be encoded with the Opus codec, and stored inside an OGG container. Voice notes can have only a single audio channel 
	/// - Parameters:
	///   - duration: Duration of the voice note, in seconds; as defined by the sender 
	///   - waveform: A waveform representation of the voice note in 5-bit format 
	///   - mimeType: MIME type of the file; as defined by the sender 
	///   - voice: File containing the voice note
	public init(duration: Int32, waveform: Bytes, mimeType: String, voice: File) {
		self.duration = duration
		self.waveform = waveform
		self.mimeType = mimeType
		self.voice = voice
	}
}

///  Describes a user contact 
public struct Contact: Codable, Equatable, FunctionResult {
	///  Phone number of the user 
	public let phoneNumber: String
	///  First name of the user; 1-255 characters in length 
	public let firstName: String
	///  Last name of the user 
	public let lastName: String
	///  Identifier of the user, if known; otherwise 0
	public let userId: Int32
	/// Describes a user contact 
	/// - Parameters:
	///   - phoneNumber: Phone number of the user 
	///   - firstName: First name of the user; 1-255 characters in length 
	///   - lastName: Last name of the user 
	///   - userId: Identifier of the user, if known; otherwise 0
	public init(phoneNumber: String, firstName: String, lastName: String, userId: Int32) {
		self.phoneNumber = phoneNumber
		self.firstName = firstName
		self.lastName = lastName
		self.userId = userId
	}
}

///  Describes a location on planet Earth 
public struct Location: Codable, Equatable, FunctionResult {
	///  Latitude of the location in degrees; as defined by the sender 
	public let latitude: Double
	///  Longitude of the location, in degrees; as defined by the sender
	public let longitude: Double
	/// Describes a location on planet Earth 
	/// - Parameters:
	///   - latitude: Latitude of the location in degrees; as defined by the sender 
	///   - longitude: Longitude of the location, in degrees; as defined by the sender
	public init(latitude: Double, longitude: Double) {
		self.latitude = latitude
		self.longitude = longitude
	}
}

///  Describes a venue 
public struct Venue: Codable, Equatable, FunctionResult {
	///  Venue location; as defined by the sender 
	public let location: Location
	///  Venue name; as defined by the sender 
	public let title: String
	///  Venue address; as defined by the sender 
	public let address: String
	///  Provider of the venue database; as defined by the sender. Currently only "foursquare" needs to be supported 
	public let provider: String
	///  Identifier of the venue in the provider database; as defined by the sender
	public let id: String
	/// Describes a venue 
	/// - Parameters:
	///   - location: Venue location; as defined by the sender 
	///   - title: Venue name; as defined by the sender 
	///   - address: Venue address; as defined by the sender 
	///   - provider: Provider of the venue database; as defined by the sender. Currently only "foursquare" needs to be supported 
	///   - id: Identifier of the venue in the provider database; as defined by the sender
	public init(location: Location, title: String, address: String, provider: String, id: String) {
		self.location = location
		self.title = title
		self.address = address
		self.provider = provider
		self.id = id
	}
}

///  Describes a game 
public struct Game: Codable, Equatable, FunctionResult {
	///  Game ID 
	public let id: TDInt64
	///  Game short name. To share a game use the URL https://t.me/{bot_username}?game={game_short_name} 
	public let shortName: String
	///  Game title 
	public let title: String
	///  Game text, usually containing scoreboards for a game 
	public let text: FormattedText
	///  Game description 
	public let description: String
	///  Game photo 
	public let photo: Photo
	///  Game animation; may be null
	public let animation: Animation?
	/// Describes a game 
	/// - Parameters:
	///   - id: Game ID 
	///   - shortName: Game short name. To share a game use the URL https://t.me/{bot_username}?game={game_short_name} 
	///   - title: Game title 
	///   - text: Game text, usually containing scoreboards for a game 
	///   - description: Game description 
	///   - photo: Game photo 
	///   - animation: Game animation; may be null
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

///  Describes a user profile photo 
public struct ProfilePhoto: Codable, Equatable, FunctionResult {
	///  Photo identifier; 0 for an empty photo. Can be used to find a photo in a list of userProfilePhotos 
	public let id: TDInt64
	///  A small (160x160) user profile photo 
	public let small: File
	///  A big (640x640) user profile photo
	public let big: File
	/// Describes a user profile photo 
	/// - Parameters:
	///   - id: Photo identifier; 0 for an empty photo. Can be used to find a photo in a list of userProfilePhotos 
	///   - small: A small (160x160) user profile photo 
	///   - big: A big (640x640) user profile photo
	public init(id: TDInt64, small: File, big: File) {
		self.id = id
		self.small = small
		self.big = big
	}
}

///  Describes the photo of a chat 
public struct ChatPhoto: Codable, Equatable, FunctionResult {
	///  A small (160x160) chat photo 
	public let small: File
	///  A big (640x640) chat photo
	public let big: File
	/// Describes the photo of a chat 
	/// - Parameters:
	///   - small: A small (160x160) chat photo 
	///   - big: A big (640x640) chat photo
	public init(small: File, big: File) {
		self.small = small
		self.big = big
	}
}

///  Represents the relationship between user A and user B. For incoming_link, user A is the current user; for outgoing_link, user B is the current user 
public indirect enum LinkState: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  The phone number of user A is not known to user B
	case none
	///  The phone number of user A is known but that number has not been saved to the contacts list of user B
	case knowsPhoneNumber
	///  The phone number of user A has been saved to the contacts list of user B
	case isContact
}

///  Represents the type of the user. The following types are possible: regular users, deleted users and bots 
public indirect enum UserType: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  A regular user
	case regular
	///  A deleted user or deleted bot. No information on the user besides the user_id is available. It is not possible to perform any active actions on this type of user
	case deleted
	///  A bot (see https://core.telegram.org/bots) 
	/// - canJoinGroups: True, if the bot can be invited to basic group and supergroup chats 
	/// - canReadAllGroupMessages: True, if the bot can read all messages in basic group or supergroup chats and not just those addressed to the bot. In private and channel chats a bot can always read all messages 
	/// - isInline: True, if the bot supports inline queries 
	/// - inlineQueryPlaceholder: Placeholder for inline queries (displayed on the client input field) 
	/// - needLocation: True, if the location of the user should be sent with every inline query to this bot
	case bot(canJoinGroups: Bool, canReadAllGroupMessages: Bool, isInline: Bool, inlineQueryPlaceholder: String, needLocation: Bool)
	///  No information on the user besides the user_id is available, yet this user has not been deleted. This object is extremely rare and must be handled like a deleted user. It is not possible to perform any actions on users of this type
	case unknown
}

///  Represents commands supported by a bot 
public struct BotCommand: Codable, Equatable, FunctionResult {
	///  Text of the bot command 
	public let command: String
	///  Description of the bot command
	public let description: String
	/// Represents commands supported by a bot 
	/// - Parameters:
	///   - command: Text of the bot command 
	///   - description: Description of the bot command
	public init(command: String, description: String) {
		self.command = command
		self.description = description
	}
}

///  Provides information about a bot and its supported commands 
public struct BotInfo: Codable, Equatable, FunctionResult {
	///  Long description shown on the user info page 
	public let description: String
	///  A list of commands supported by the bot
	public let commands: [BotCommand]
	/// Provides information about a bot and its supported commands 
	/// - Parameters:
	///   - description: Long description shown on the user info page 
	///   - commands: A list of commands supported by the bot
	public init(description: String, commands: [BotCommand]) {
		self.description = description
		self.commands = commands
	}
}

///  Represents a user 
public struct User: Codable, Equatable, FunctionResult {
	///  User identifier 
	public let id: Int32
	///  First name of the user 
	public let firstName: String
	///  Last name of the user 
	public let lastName: String
	///  Username of the user 
	public let username: String
	///  Phone number of the user 
	public let phoneNumber: String
	///  Current online status of the user 
	public let status: UserStatus
	///  Profile photo of the user; may be null 
	public let profilePhoto: ProfilePhoto?
	///  Relationship from the current user to the other user 
	public let outgoingLink: LinkState
	///  Relationship from the other user to the current user 
	public let incomingLink: LinkState
	///  True, if the user is verified 
	public let isVerified: Bool
	///  If non-empty, it contains the reason why access to this user must be restricted. The format of the string is "{type}: {description}". -{type} contains the type of the restriction and at least one of the suffixes "-all", "-ios", "-android", or "-wp", which describe the platforms on which access should be restricted. (For example, "terms-ios-android". {description} contains a human-readable description of the restriction, which can be shown to the user) 
	public let restrictionReason: String
	///  If false, the user is inaccessible, and the only information known about the user is inside this class. It can't be passed to any method except GetUser 
	public let haveAccess: Bool
	///  Type of the user 
	public let type: UserType
	///  IETF language tag of the user's language; only available to bots
	public let languageCode: String
	/// Represents a user 
	/// - Parameters:
	///   - id: User identifier 
	///   - firstName: First name of the user 
	///   - lastName: Last name of the user 
	///   - username: Username of the user 
	///   - phoneNumber: Phone number of the user 
	///   - status: Current online status of the user 
	///   - profilePhoto: Profile photo of the user; may be null 
	///   - outgoingLink: Relationship from the current user to the other user 
	///   - incomingLink: Relationship from the other user to the current user 
	///   - isVerified: True, if the user is verified 
	///   - restrictionReason: If non-empty, it contains the reason why access to this user must be restricted. The format of the string is "{type}: {description}". -{type} contains the type of the restriction and at least one of the suffixes "-all", "-ios", "-android", or "-wp", which describe the platforms on which access should be restricted. (For example, "terms-ios-android". {description} contains a human-readable description of the restriction, which can be shown to the user) 
	///   - haveAccess: If false, the user is inaccessible, and the only information known about the user is inside this class. It can't be passed to any method except GetUser 
	///   - type: Type of the user 
	///   - languageCode: IETF language tag of the user's language; only available to bots
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

///  Contains full information about a user (except the full list of profile photos) 
public struct UserFullInfo: Codable, Equatable, FunctionResult {
	///  True, if the user is blacklisted by the current user 
	public let isBlocked: Bool
	///  True, if the user can be called 
	public let canBeCalled: Bool
	///  True, if the user can't be called due to their privacy settings 
	public let hasPrivateCalls: Bool
	///  A short user bio 
	public let bio: String
	///  For bots, the text that is included with the link when users share the bot 
	public let shareText: String
	///  Number of group chats where both the other user and the current user are a member; 0 for the current user 
	public let groupInCommonCount: Int32
	///  If the user is a bot, information about the bot; may be null
	public let botInfo: BotInfo?
	/// Contains full information about a user (except the full list of profile photos) 
	/// - Parameters:
	///   - isBlocked: True, if the user is blacklisted by the current user 
	///   - canBeCalled: True, if the user can be called 
	///   - hasPrivateCalls: True, if the user can't be called due to their privacy settings 
	///   - bio: A short user bio 
	///   - shareText: For bots, the text that is included with the link when users share the bot 
	///   - groupInCommonCount: Number of group chats where both the other user and the current user are a member; 0 for the current user 
	///   - botInfo: If the user is a bot, information about the bot; may be null
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

///  Contains part of the list of user photos 
public struct UserProfilePhotos: Codable, Equatable, FunctionResult {
	///  Total number of user profile photos 
	public let totalCount: Int32
	///  A list of photos
	public let photos: [Photo]
	/// Contains part of the list of user photos 
	/// - Parameters:
	///   - totalCount: Total number of user profile photos 
	///   - photos: A list of photos
	public init(totalCount: Int32, photos: [Photo]) {
		self.totalCount = totalCount
		self.photos = photos
	}
}

///  Represents a list of users 
public struct Users: Codable, Equatable, FunctionResult {
	///  Approximate total count of users found 
	public let totalCount: Int32
	///  A list of user identifiers
	public let userIds: [Int32]
	/// Represents a list of users 
	/// - Parameters:
	///   - totalCount: Approximate total count of users found 
	///   - userIds: A list of user identifiers
	public init(totalCount: Int32, userIds: [Int32]) {
		self.totalCount = totalCount
		self.userIds = userIds
	}
}

///  Provides information about the status of a member in a chat 
public indirect enum ChatMemberStatus: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  The user is the creator of a chat and has all the administrator privileges 
	/// - isMember: True, if the user is a member of the chat
	case creator(isMember: Bool)
	///  The user is a member of a chat and has some additional privileges. In basic groups, administrators can edit and delete messages sent by others, add new members, and ban unprivileged members. In supergroups and channels, there are more detailed options for administrator privileges 
	/// - canBeEdited: True, if the current user can edit the administrator privileges for the called user 
	/// - canChangeInfo: True, if the administrator can change the chat title, photo, and other settings 
	/// - canPostMessages: True, if the administrator can create channel posts; applicable to channels only 
	/// - canEditMessages: True, if the administrator can edit messages of other users and pin messages; applicable to channels only 
	/// - canDeleteMessages: True, if the administrator can delete messages of other users 
	/// - canInviteUsers: True, if the administrator can invite new users to the chat 
	/// - canRestrictMembers: True, if the administrator can restrict, ban, or unban chat members 
	/// - canPinMessages: True, if the administrator can pin messages; applicable to supergroups only 
	/// - canPromoteMembers: True, if the administrator can add new administrators with a subset of his own privileges or demote administrators that were directly or indirectly promoted by him
	case administrator(canBeEdited: Bool, canChangeInfo: Bool, canPostMessages: Bool, canEditMessages: Bool, canDeleteMessages: Bool, canInviteUsers: Bool, canRestrictMembers: Bool, canPinMessages: Bool, canPromoteMembers: Bool)
	///  The user is a member of a chat, without any additional privileges or restrictions
	case member
	///  The user is under certain restrictions in the chat. Not supported in basic groups and channels 
	/// - isMember: True, if the user is a member of the chat 
	/// - restrictedUntilDate: Point in time (Unix timestamp) when restrictions will be lifted from the user; 0 if never. If the user is restricted for more than 366 days or for less than 30 seconds from the current time, the user is considered to be restricted forever 
	/// - canSendMessages: True, if the user can send text messages, contacts, locations, and venues 
	/// - canSendMediaMessages: True, if the user can send audio files, documents, photos, videos, video notes, and voice notes. Implies can_send_messages permissions 
	/// - canSendOtherMessages: True, if the user can send animations, games, and stickers and use inline bots. Implies can_send_media_messages permissions 
	/// - canAddWebPagePreviews: True, if the user may add a web page preview to his messages. Implies can_send_messages permissions
	case restricted(isMember: Bool, restrictedUntilDate: Int32, canSendMessages: Bool, canSendMediaMessages: Bool, canSendOtherMessages: Bool, canAddWebPagePreviews: Bool)
	///  The user is not a chat member
	case left
	///  The user was banned (and hence is not a member of the chat). Implies the user can't return to the chat or view messages 
	/// - bannedUntilDate: Point in time (Unix timestamp) when the user will be unbanned; 0 if never. If the user is banned for more than 366 days or for less than 30 seconds from the current time, the user is considered to be banned forever
	case banned(bannedUntilDate: Int32)
}

///  A user with information about joining/leaving a chat 
public struct ChatMember: Codable, Equatable, FunctionResult {
	///  User identifier of the chat member 
	public let userId: Int32
	///  Identifier of a user that invited/promoted/banned this member in the chat; 0 if unknown 
	public let inviterUserId: Int32
	///  Point in time (Unix timestamp) when the user joined a chat 
	public let joinedChatDate: Int32
	///  Status of the member in the chat 
	public let status: ChatMemberStatus
	///  If the user is a bot, information about the bot; may be null. Can be null even for a bot if the bot is not a chat member
	public let botInfo: BotInfo?
	/// A user with information about joining/leaving a chat 
	/// - Parameters:
	///   - userId: User identifier of the chat member 
	///   - inviterUserId: Identifier of a user that invited/promoted/banned this member in the chat; 0 if unknown 
	///   - joinedChatDate: Point in time (Unix timestamp) when the user joined a chat 
	///   - status: Status of the member in the chat 
	///   - botInfo: If the user is a bot, information about the bot; may be null. Can be null even for a bot if the bot is not a chat member
	public init(userId: Int32, inviterUserId: Int32, joinedChatDate: Int32, status: ChatMemberStatus, botInfo: BotInfo?) {
		self.userId = userId
		self.inviterUserId = inviterUserId
		self.joinedChatDate = joinedChatDate
		self.status = status
		self.botInfo = botInfo
	}
}

///  Contains a list of chat members 
public struct ChatMembers: Codable, Equatable, FunctionResult {
	///  Approximate total count of chat members found 
	public let totalCount: Int32
	///  A list of chat members
	public let members: [ChatMember]
	/// Contains a list of chat members 
	/// - Parameters:
	///   - totalCount: Approximate total count of chat members found 
	///   - members: A list of chat members
	public init(totalCount: Int32, members: [ChatMember]) {
		self.totalCount = totalCount
		self.members = members
	}
}

///  Specifies the kind of chat members to return in getSupergroupMembers 
public indirect enum SupergroupMembersFilter: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  Returns recently active users in reverse chronological order
	case recent
	///  Returns the creator and administrators
	case administrators
	///  Used to search for supergroup or channel members via a (string) query 
	/// - query: Query to search for
	case search(query: String)
	///  Returns restricted supergroup members; can be used only by administrators 
	/// - query: Query to search for
	case restricted(query: String)
	///  Returns users banned from the supergroup or channel; can be used only by administrators 
	/// - query: Query to search for
	case banned(query: String)
	///  Returns bot members of the supergroup or channel
	case bots
}

///  Represents a basic group of 0-200 users (must be upgraded to a supergroup to accommodate more than 200 users) 
public struct BasicGroup: Codable, Equatable, FunctionResult {
	///  Group identifier 
	public let id: Int32
	///  Number of members in the group 
	public let memberCount: Int32
	///  Status of the current user in the group 
	public let status: ChatMemberStatus
	///  True, if all members have been granted administrator rights in the group 
	public let everyoneIsAdministrator: Bool
	///  True, if the group is active 
	public let isActive: Bool
	///  Identifier of the supergroup to which this group was upgraded; 0 if none
	public let upgradedToSupergroupId: Int32
	/// Represents a basic group of 0-200 users (must be upgraded to a supergroup to accommodate more than 200 users) 
	/// - Parameters:
	///   - id: Group identifier 
	///   - memberCount: Number of members in the group 
	///   - status: Status of the current user in the group 
	///   - everyoneIsAdministrator: True, if all members have been granted administrator rights in the group 
	///   - isActive: True, if the group is active 
	///   - upgradedToSupergroupId: Identifier of the supergroup to which this group was upgraded; 0 if none
	public init(id: Int32, memberCount: Int32, status: ChatMemberStatus, everyoneIsAdministrator: Bool, isActive: Bool, upgradedToSupergroupId: Int32) {
		self.id = id
		self.memberCount = memberCount
		self.status = status
		self.everyoneIsAdministrator = everyoneIsAdministrator
		self.isActive = isActive
		self.upgradedToSupergroupId = upgradedToSupergroupId
	}
}

///  Contains full information about a basic group 
public struct BasicGroupFullInfo: Codable, Equatable, FunctionResult {
	///  User identifier of the creator of the group; 0 if unknown 
	public let creatorUserId: Int32
	///  Group members 
	public let members: [ChatMember]
	///  Invite link for this group; available only for the group creator and only after it has been generated at least once
	public let inviteLink: String
	/// Contains full information about a basic group 
	/// - Parameters:
	///   - creatorUserId: User identifier of the creator of the group; 0 if unknown 
	///   - members: Group members 
	///   - inviteLink: Invite link for this group; available only for the group creator and only after it has been generated at least once
	public init(creatorUserId: Int32, members: [ChatMember], inviteLink: String) {
		self.creatorUserId = creatorUserId
		self.members = members
		self.inviteLink = inviteLink
	}
}

///  Represents a supergroup or channel with zero or more members (subscribers in the case of channels). From the point of view of the system, a channel is a special kind of a supergroup: only administrators can post and see the list of members, and posts from all administrators use the name and photo of the channel instead of individual names and profile photos. Unlike supergroups, channels can have an unlimited number of subscribers 
public struct Supergroup: Codable, Equatable, FunctionResult {
	///  Supergroup or channel identifier 
	public let id: Int32
	///  Username of the supergroup or channel; empty for private supergroups or channels 
	public let username: String
	///  Point in time (Unix timestamp) when the current user joined, or the point in time when the supergroup or channel was created, in case the user is not a member 
	public let date: Int32
	///  Status of the current user in the supergroup or channel 
	public let status: ChatMemberStatus
	///  Member count; 0 if unknown. Currently it is guaranteed to be known only if the supergroup or channel was found through SearchPublicChats 
	public let memberCount: Int32
	///  True, if any member of the supergroup can invite other members. This field has no meaning for channels 
	public let anyoneCanInvite: Bool
	///  True, if messages sent to the channel should contain information about the sender. This field is only applicable to channels 
	public let signMessages: Bool
	///  True, if the supergroup is a channel 
	public let isChannel: Bool
	///  True, if the supergroup or channel is verified 
	public let isVerified: Bool
	///  If non-empty, contains the reason why access to this supergroup or channel must be restricted. Format of the string is "{type}: {description}". -{type} Contains the type of the restriction and at least one of the suffixes "-all", "-ios", "-android", or "-wp", which describe the platforms on which access should be restricted. (For example, "terms-ios-android". {description} contains a human-readable description of the restriction, which can be shown to the user)
	public let restrictionReason: String
	/// Represents a supergroup or channel with zero or more members (subscribers in the case of channels). From the point of view of the system, a channel is a special kind of a supergroup: only administrators can post and see the list of members, and posts from all administrators use the name and photo of the channel instead of individual names and profile photos. Unlike supergroups, channels can have an unlimited number of subscribers 
	/// - Parameters:
	///   - id: Supergroup or channel identifier 
	///   - username: Username of the supergroup or channel; empty for private supergroups or channels 
	///   - date: Point in time (Unix timestamp) when the current user joined, or the point in time when the supergroup or channel was created, in case the user is not a member 
	///   - status: Status of the current user in the supergroup or channel 
	///   - memberCount: Member count; 0 if unknown. Currently it is guaranteed to be known only if the supergroup or channel was found through SearchPublicChats 
	///   - anyoneCanInvite: True, if any member of the supergroup can invite other members. This field has no meaning for channels 
	///   - signMessages: True, if messages sent to the channel should contain information about the sender. This field is only applicable to channels 
	///   - isChannel: True, if the supergroup is a channel 
	///   - isVerified: True, if the supergroup or channel is verified 
	///   - restrictionReason: If non-empty, contains the reason why access to this supergroup or channel must be restricted. Format of the string is "{type}: {description}". -{type} Contains the type of the restriction and at least one of the suffixes "-all", "-ios", "-android", or "-wp", which describe the platforms on which access should be restricted. (For example, "terms-ios-android". {description} contains a human-readable description of the restriction, which can be shown to the user)
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

///  Contains full information about a supergroup or channel 
public struct SupergroupFullInfo: Codable, Equatable, FunctionResult {
	///  Supergroup or channel description 
	public let description: String
	///  Number of members in the supergroup or channel; 0 if unknown 
	public let memberCount: Int32
	///  Number of privileged users in the supergroup or channel; 0 if unknown 
	public let administratorCount: Int32
	///  Number of restricted users in the supergroup; 0 if unknown 
	public let restrictedCount: Int32
	///  Number of users banned from chat; 0 if unknown 
	public let bannedCount: Int32
	///  True, if members of the chat can be retrieved 
	public let canGetMembers: Bool
	///  True, if the chat can be made public 
	public let canSetUsername: Bool
	///  True, if the supergroup sticker set can be changed 
	public let canSetStickerSet: Bool
	///  True, if new chat members will have access to old messages. In public supergroups and both public and private channels, old messages are always available, so this option affects only private supergroups. The value of this field is only available for chat administrators 
	public let isAllHistoryAvailable: Bool
	///  Identifier of the supergroup sticker set; 0 if none 
	public let stickerSetId: TDInt64
	///  Invite link for this chat 
	public let inviteLink: String
	///  Identifier of the pinned message in the chat; 0 if none 
	public let pinnedMessageId: Int53
	///  Identifier of the basic group from which supergroup was upgraded; 0 if none 
	public let upgradedFromBasicGroupId: Int32
	///  Identifier of the last message in the basic group from which supergroup was upgraded; 0 if none
	public let upgradedFromMaxMessageId: Int53
	/// Contains full information about a supergroup or channel 
	/// - Parameters:
	///   - description: Supergroup or channel description 
	///   - memberCount: Number of members in the supergroup or channel; 0 if unknown 
	///   - administratorCount: Number of privileged users in the supergroup or channel; 0 if unknown 
	///   - restrictedCount: Number of restricted users in the supergroup; 0 if unknown 
	///   - bannedCount: Number of users banned from chat; 0 if unknown 
	///   - canGetMembers: True, if members of the chat can be retrieved 
	///   - canSetUsername: True, if the chat can be made public 
	///   - canSetStickerSet: True, if the supergroup sticker set can be changed 
	///   - isAllHistoryAvailable: True, if new chat members will have access to old messages. In public supergroups and both public and private channels, old messages are always available, so this option affects only private supergroups. The value of this field is only available for chat administrators 
	///   - stickerSetId: Identifier of the supergroup sticker set; 0 if none 
	///   - inviteLink: Invite link for this chat 
	///   - pinnedMessageId: Identifier of the pinned message in the chat; 0 if none 
	///   - upgradedFromBasicGroupId: Identifier of the basic group from which supergroup was upgraded; 0 if none 
	///   - upgradedFromMaxMessageId: Identifier of the last message in the basic group from which supergroup was upgraded; 0 if none
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

///  Describes the current secret chat state 
public indirect enum SecretChatState: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  The secret chat is not yet created; waiting for the other user to get online
	case pending
	///  The secret chat is ready to use
	case ready
	///  The secret chat is closed
	case closed
}

///  Represents a secret chat 
public struct SecretChat: Codable, Equatable, FunctionResult {
	///  Secret chat identifier 
	public let id: Int32
	///  Identifier of the chat partner 
	public let userId: Int32
	///  State of the secret chat 
	public let state: SecretChatState
	///  True, if the chat was created by the current user; otherwise false 
	public let isOutbound: Bool
	///  Current message Time To Live setting (self-destruct timer) for the chat, in seconds 
	public let ttl: Int32
	///  Hash of the currently used key for comparison with the hash of the chat partner's key. This is a string of 36 bytes, which must be used to make a 12x12 square image with a color depth of 4. The first 16 bytes should be used to make a central 8x8 square, while the remaining 20 bytes should be used to construct a 2-pixel-wide border around that square. -Alternatively, the first 32 bytes of the hash can be converted to the hexadecimal format and printed as 32 2-digit hex numbers 
	public let keyHash: Bytes
	///  Secret chat layer; determines features supported by the other client. Video notes are supported if the layer >= 66
	public let layer: Int32
	/// Represents a secret chat 
	/// - Parameters:
	///   - id: Secret chat identifier 
	///   - userId: Identifier of the chat partner 
	///   - state: State of the secret chat 
	///   - isOutbound: True, if the chat was created by the current user; otherwise false 
	///   - ttl: Current message Time To Live setting (self-destruct timer) for the chat, in seconds 
	///   - keyHash: Hash of the currently used key for comparison with the hash of the chat partner's key. This is a string of 36 bytes, which must be used to make a 12x12 square image with a color depth of 4. The first 16 bytes should be used to make a central 8x8 square, while the remaining 20 bytes should be used to construct a 2-pixel-wide border around that square. -Alternatively, the first 32 bytes of the hash can be converted to the hexadecimal format and printed as 32 2-digit hex numbers 
	///   - layer: Secret chat layer; determines features supported by the other client. Video notes are supported if the layer >= 66
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

///  Contains information about the initial sender of a forwarded message 
// sourcery: noPrefix = true
public indirect enum MessageForwardInfo: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  The message was originally written by a known user 
	/// - senderUserId: Identifier of the user that originally sent this message 
	/// - date: Point in time (Unix timestamp) when the message was originally sent 
	/// - forwardedFromChatId: For messages forwarded to the chat with the current user (saved messages), the identifier of the chat from which the message was forwarded; 0 if unknown 
	/// - forwardedFromMessageId: For messages forwarded to the chat with the current user (saved messages) the identifier of the original message from which the new message was forwarded; 0 if unknown
	case messageForwardedFromUser(senderUserId: Int32, date: Int32, forwardedFromChatId: Int53, forwardedFromMessageId: Int53)
	///  The message was originally a post in a channel 
	/// - chatId: Identifier of the chat from which the message was forwarded 
	/// - authorSignature: Post author signature 
	/// - date: Point in time (Unix timestamp) when the message was originally sent 
	/// - messageId: Message identifier of the original message from which the new message was forwarded; 0 if unknown 
	/// - forwardedFromChatId: For messages forwarded to the chat with the current user (saved messages), the identifier of the chat from which the message was forwarded; 0 if unknown 
	/// - forwardedFromMessageId: For messages forwarded to the chat with the current user (saved messages), the identifier of the original message from which the new message was forwarded; 0 if unknown
	case messageForwardedPost(chatId: Int53, authorSignature: String, date: Int32, messageId: Int53, forwardedFromChatId: Int53, forwardedFromMessageId: Int53)
}

///  Contains information about the sending state of the message 
public indirect enum MessageSendingState: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  The message is being sent now, but has not yet been delivered to the server
	case pending
	///  The message failed to be sent
	case failed
}

///  Describes a message 
public struct Message: Codable, Equatable, FunctionResult {
	///  Unique message identifier 
	public let id: Int53
	///  Identifier of the user who sent the message; 0 if unknown. It is unknown for channel posts 
	public let senderUserId: Int32
	///  Chat identifier 
	public let chatId: Int53
	///  Information about the sending state of the message; may be null 
	public let sendingState: MessageSendingState?
	///  True, if the message is outgoing 
	public let isOutgoing: Bool
	///  True, if the message can be edited 
	public let canBeEdited: Bool
	///  True, if the message can be forwarded 
	public let canBeForwarded: Bool
	///  True, if the message can be deleted only for the current user while other users will continue to see it 
	public let canBeDeletedOnlyForSelf: Bool
	///  True, if the message can be deleted for all users 
	public let canBeDeletedForAllUsers: Bool
	///  True, if the message is a channel post. All messages to channels are channel posts, all other messages are not channel posts 
	public let isChannelPost: Bool
	///  True, if the message contains an unread mention for the current user 
	public let containsUnreadMention: Bool
	///  Point in time (Unix timestamp) when the message was sent 
	public let date: Int32
	///  Point in time (Unix timestamp) when the message was last edited 
	public let editDate: Int32
	///  Information about the initial message sender; may be null 
	public let forwardInfo: MessageForwardInfo?
	///  If non-zero, the identifier of the message this message is replying to; can be the identifier of a deleted message 
	public let replyToMessageId: Int53
	///  For self-destructing messages, the message's TTL (Time To Live), in seconds; 0 if none. TDLib will send updateDeleteMessages or updateMessageContent once the TTL expires 
	public let ttl: Int32
	///  Time left before the message expires, in seconds 
	public let ttlExpiresIn: Double
	///  If non-zero, the user identifier of the bot through which this message was sent 
	public let viaBotUserId: Int32
	///  For channel posts, optional author signature 
	public let authorSignature: String
	///  Number of times this message was viewed 
	public let views: Int32
	///  Unique identifier of an album this message belongs to. Only photos and videos can be grouped together in albums 
	public let mediaAlbumId: TDInt64
	///  Content of the message 
	public let content: MessageContent
	///  Reply markup for the message; may be null
	public let replyMarkup: ReplyMarkup?
	/// Describes a message 
	/// - Parameters:
	///   - id: Unique message identifier 
	///   - senderUserId: Identifier of the user who sent the message; 0 if unknown. It is unknown for channel posts 
	///   - chatId: Chat identifier 
	///   - sendingState: Information about the sending state of the message; may be null 
	///   - isOutgoing: True, if the message is outgoing 
	///   - canBeEdited: True, if the message can be edited 
	///   - canBeForwarded: True, if the message can be forwarded 
	///   - canBeDeletedOnlyForSelf: True, if the message can be deleted only for the current user while other users will continue to see it 
	///   - canBeDeletedForAllUsers: True, if the message can be deleted for all users 
	///   - isChannelPost: True, if the message is a channel post. All messages to channels are channel posts, all other messages are not channel posts 
	///   - containsUnreadMention: True, if the message contains an unread mention for the current user 
	///   - date: Point in time (Unix timestamp) when the message was sent 
	///   - editDate: Point in time (Unix timestamp) when the message was last edited 
	///   - forwardInfo: Information about the initial message sender; may be null 
	///   - replyToMessageId: If non-zero, the identifier of the message this message is replying to; can be the identifier of a deleted message 
	///   - ttl: For self-destructing messages, the message's TTL (Time To Live), in seconds; 0 if none. TDLib will send updateDeleteMessages or updateMessageContent once the TTL expires 
	///   - ttlExpiresIn: Time left before the message expires, in seconds 
	///   - viaBotUserId: If non-zero, the user identifier of the bot through which this message was sent 
	///   - authorSignature: For channel posts, optional author signature 
	///   - views: Number of times this message was viewed 
	///   - mediaAlbumId: Unique identifier of an album this message belongs to. Only photos and videos can be grouped together in albums 
	///   - content: Content of the message 
	///   - replyMarkup: Reply markup for the message; may be null
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

///  Contains a list of messages 
public struct Messages: Codable, Equatable, FunctionResult {
	///  Approximate total count of messages found 
	public let totalCount: Int32
	///  List of messages; messages may be null
	public let messages: [Message]?
	/// Contains a list of messages 
	/// - Parameters:
	///   - totalCount: Approximate total count of messages found 
	///   - messages: List of messages; messages may be null
	public init(totalCount: Int32, messages: [Message]?) {
		self.totalCount = totalCount
		self.messages = messages
	}
}

///  Contains a list of messages found by a search 
public struct FoundMessages: Codable, Equatable, FunctionResult {
	///  List of messages 
	public let messages: [Message]
	///  Value to pass as from_search_id to get more results
	public let nextFromSearchId: TDInt64
	/// Contains a list of messages found by a search 
	/// - Parameters:
	///   - messages: List of messages 
	///   - nextFromSearchId: Value to pass as from_search_id to get more results
	public init(messages: [Message], nextFromSearchId: TDInt64) {
		self.messages = messages
		self.nextFromSearchId = nextFromSearchId
	}
}

///  Describes the types of chats for which notification settings are applied 
public indirect enum NotificationSettingsScope: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  Notification settings applied to a particular chat 
	/// - chatId: Chat identifier
	case chat(chatId: Int53)
	///  Notification settings applied to all private chats
	case privateChats
	///  Notification settings applied to all basic groups and channels. (Supergroups have no common settings)
	case basicGroupChats
	///  Notification settings applied to all chats
	case allChats
}

///  Contains information about notification settings for a chat or several chats 
public struct NotificationSettings: Codable, Equatable, FunctionResult {
	///  Time left before notifications will be unmuted, in seconds 
	public let muteFor: Int32
	///  An audio file name for notification sounds; only applies to iOS applications 
	public let sound: String
	///  True, if message content should be displayed in notifications
	public let showPreview: Bool
	/// Contains information about notification settings for a chat or several chats 
	/// - Parameters:
	///   - muteFor: Time left before notifications will be unmuted, in seconds 
	///   - sound: An audio file name for notification sounds; only applies to iOS applications 
	///   - showPreview: True, if message content should be displayed in notifications
	public init(muteFor: Int32, sound: String, showPreview: Bool) {
		self.muteFor = muteFor
		self.sound = sound
		self.showPreview = showPreview
	}
}

///  Contains information about a message draft 
public struct DraftMessage: Codable, Equatable, FunctionResult {
	///  Identifier of the message to reply to; 0 if none 
	public let replyToMessageId: Int53
	///  Content of the message draft; this should always be of type inputMessageText
	public let inputMessageText: InputMessageContent
	/// Contains information about a message draft 
	/// - Parameters:
	///   - replyToMessageId: Identifier of the message to reply to; 0 if none 
	///   - inputMessageText: Content of the message draft; this should always be of type inputMessageText
	public init(replyToMessageId: Int53, inputMessageText: InputMessageContent) {
		self.replyToMessageId = replyToMessageId
		self.inputMessageText = inputMessageText
	}
}

///  Describes the type of a chat 
public indirect enum ChatType: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  An ordinary chat with a user 
	/// - userId: User identifier
	case `private`(userId: Int32)
	///  A basic group (i.e., a chat with 0-200 other users) 
	/// - basicGroupId: Basic group identifier
	case basicGroup(basicGroupId: Int32)
	///  A supergroup (i.e. a chat with up to GetOption("supergroup_max_size") other users), or channel (with unlimited members) 
	/// - supergroupId: Supergroup or channel identifier 
	/// - isChannel: True, if the supergroup is a channel
	case supergroup(supergroupId: Int32, isChannel: Bool)
	///  A secret chat with a user 
	/// - secretChatId: Secret chat identifier 
	/// - userId: User identifier of the secret chat peer
	case secret(secretChatId: Int32, userId: Int32)
}

///  A chat. (Can be a private chat, basic group, supergroup, or secret chat) 
public struct Chat: Codable, Equatable, FunctionResult {
	///  Chat unique identifier 
	public let id: Int53
	///  Type of the chat 
	public let type: ChatType
	///  Chat title 
	public let title: String
	///  Chat photo; may be null 
	public let photo: ChatPhoto?
	///  Last message in the chat; may be null 
	public let lastMessage: Message?
	///  Descending parameter by which chats are sorted in the main chat list. If the order number of two chats is the same, they must be sorted in descending order by ID. If 0, the position of the chat in the list is undetermined 
	public let order: TDInt64
	///  True, if the chat is pinned 
	public let isPinned: Bool
	///  True, if the chat can be reported to Telegram moderators through reportChat 
	public let canBeReported: Bool
	///  Number of unread messages in the chat 
	public let unreadCount: Int32
	///  Identifier of the last read incoming message 
	public let lastReadInboxMessageId: Int53
	///  Identifier of the last read outgoing message 
	public let lastReadOutboxMessageId: Int53
	///  Number of unread messages with a mention/reply in the chat 
	public let unreadMentionCount: Int32
	///  Notification settings for this chat 
	public let notificationSettings: NotificationSettings
	///  Identifier of the message from which reply markup needs to be used; 0 if there is no default custom reply markup in the chat 
	public let replyMarkupMessageId: Int53
	///  A draft of a message in the chat; may be null 
	public let draftMessage: DraftMessage?
	///  Contains client-specific data associated with the chat. (For example, the chat position or local chat notification settings can be stored here.) Persistent if a message database is used
	public let clientData: String
	/// A chat. (Can be a private chat, basic group, supergroup, or secret chat) 
	/// - Parameters:
	///   - id: Chat unique identifier 
	///   - type: Type of the chat 
	///   - title: Chat title 
	///   - photo: Chat photo; may be null 
	///   - lastMessage: Last message in the chat; may be null 
	///   - order: Descending parameter by which chats are sorted in the main chat list. If the order number of two chats is the same, they must be sorted in descending order by ID. If 0, the position of the chat in the list is undetermined 
	///   - isPinned: True, if the chat is pinned 
	///   - canBeReported: True, if the chat can be reported to Telegram moderators through reportChat 
	///   - unreadCount: Number of unread messages in the chat 
	///   - lastReadInboxMessageId: Identifier of the last read incoming message 
	///   - lastReadOutboxMessageId: Identifier of the last read outgoing message 
	///   - unreadMentionCount: Number of unread messages with a mention/reply in the chat 
	///   - notificationSettings: Notification settings for this chat 
	///   - replyMarkupMessageId: Identifier of the message from which reply markup needs to be used; 0 if there is no default custom reply markup in the chat 
	///   - draftMessage: A draft of a message in the chat; may be null 
	///   - clientData: Contains client-specific data associated with the chat. (For example, the chat position or local chat notification settings can be stored here.) Persistent if a message database is used
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

///  Represents a list of chats 
public struct Chats: Codable, Equatable, FunctionResult {
	///  List of chat identifiers
	public let chatIds: [Int53]
	/// Represents a list of chats 
	/// - Parameters:
	///   - chatIds: List of chat identifiers
	public init(chatIds: [Int53]) {
		self.chatIds = chatIds
	}
}

///  Contains a chat invite link 
public struct ChatInviteLink: Codable, Equatable, FunctionResult {
	///  Chat invite link
	public let inviteLink: String
	/// Contains a chat invite link 
	/// - Parameters:
	///   - inviteLink: Chat invite link
	public init(inviteLink: String) {
		self.inviteLink = inviteLink
	}
}

///  Contains information about a chat invite link 
public struct ChatInviteLinkInfo: Codable, Equatable, FunctionResult {
	///  Chat identifier of the invite link; 0 if the user is not a member of this chat 
	public let chatId: Int53
	///  Contains information about the type of the chat 
	public let type: ChatType
	///  Title of the chat 
	public let title: String
	///  Chat photo; may be null 
	public let photo: ChatPhoto?
	///  Number of members 
	public let memberCount: Int32
	///  User identifiers of some chat members that may be known to the current user 
	public let memberUserIds: [Int32]
	///  True, if the chat is a public supergroup or channel with a username
	public let isPublic: Bool
	/// Contains information about a chat invite link 
	/// - Parameters:
	///   - chatId: Chat identifier of the invite link; 0 if the user is not a member of this chat 
	///   - type: Contains information about the type of the chat 
	///   - title: Title of the chat 
	///   - photo: Chat photo; may be null 
	///   - memberCount: Number of members 
	///   - memberUserIds: User identifiers of some chat members that may be known to the current user 
	///   - isPublic: True, if the chat is a public supergroup or channel with a username
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

///  Describes a keyboard button type 
public indirect enum KeyboardButtonType: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  A simple button, with text that should be sent when the button is pressed
	case text
	///  A button that sends the user's phone number when pressed; available only in private chats
	case requestPhoneNumber
	///  A button that sends the user's location when pressed; available only in private chats
	case requestLocation
}

///  Represents a single button in a bot keyboard 
public struct KeyboardButton: Codable, Equatable, FunctionResult {
	///  Text of the button 
	public let text: String
	///  Type of the button
	public let type: KeyboardButtonType
	/// Represents a single button in a bot keyboard 
	/// - Parameters:
	///   - text: Text of the button 
	///   - type: Type of the button
	public init(text: String, type: KeyboardButtonType) {
		self.text = text
		self.type = type
	}
}

///  Describes the type of an inline keyboard button 
public indirect enum InlineKeyboardButtonType: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  A button that opens a specified URL 
	/// - url: URL to open
	case url(url: String)
	///  A button that sends a special callback query to a bot 
	/// - data: Data to be sent to the bot via a callback query
	case callback(data: Bytes)
	///  A button with a game that sends a special callback query to a bot. This button must be in the first column and row of the keyboard and can be attached only to a message with content of the type messageGame
	case callbackGame
	///  A button that forces an inline query to the bot to be inserted in the input field 
	/// - query: Inline query to be sent to the bot 
	/// - inCurrentChat: True, if the inline query should be sent from the current chat
	case switchInline(query: String, inCurrentChat: Bool)
	///  A button to buy something. This button must be in the first column and row of the keyboard and can be attached only to a message with content of the type messageInvoice
	case buy
}

///  Represents a single button in an inline keyboard 
public struct InlineKeyboardButton: Codable, Equatable, FunctionResult {
	///  Text of the button 
	public let text: String
	///  Type of the button
	public let type: InlineKeyboardButtonType
	/// Represents a single button in an inline keyboard 
	/// - Parameters:
	///   - text: Text of the button 
	///   - type: Type of the button
	public init(text: String, type: InlineKeyboardButtonType) {
		self.text = text
		self.type = type
	}
}

///  Contains a description of a custom keyboard and actions that can be done with it to quickly reply to bots 
public indirect enum ReplyMarkup: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  Instructs clients to remove the keyboard once this message has been received. This kind of keyboard can't be received in an incoming message; instead, UpdateChatReplyMarkup with message_id == 0 will be sent 
	/// - isPersonal: True, if the keyboard is removed only for the mentioned users or the target user of a reply
	case removeKeyboard(isPersonal: Bool)
	///  Instructs clients to force a reply to this message 
	/// - isPersonal: True, if a forced reply must automatically be shown to the current user. For outgoing messages, specify true to show the forced reply only for the mentioned users and for the target user of a reply
	case forceReply(isPersonal: Bool)
	///  Contains a custom keyboard layout to quickly reply to bots 
	/// - rows: A list of rows of bot keyboard buttons 
	/// - resizeKeyboard: True, if the client needs to resize the keyboard vertically 
	/// - oneTime: True, if the client needs to hide the keyboard after use 
	/// - isPersonal: True, if the keyboard must automatically be shown to the current user. For outgoing messages, specify true to show the keyboard only for the mentioned users and for the target user of a reply
	case showKeyboard(rows: [[KeyboardButton]], resizeKeyboard: Bool, oneTime: Bool, isPersonal: Bool)
	///  Contains an inline keyboard layout 
	/// - rows: A list of rows of inline keyboard buttons
	case inlineKeyboard(rows: [[InlineKeyboardButton]])
}

///  Describes a text object inside an instant-view web page 
public indirect enum RichText: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  A plain text 
	/// - text: Text
	case plain(text: String)
	///  A bold rich text 
	/// - text: Text
	case bold(text: RichText)
	///  An italicized rich text 
	/// - text: Text
	case italic(text: RichText)
	///  An underlined rich text 
	/// - text: Text
	case underline(text: RichText)
	///  A strike-through rich text 
	/// - text: Text
	case strikethrough(text: RichText)
	///  A fixed-width rich text 
	/// - text: Text
	case fixed(text: RichText)
	///  A rich text URL link 
	/// - text: Text 
	/// - url: URL
	case url(text: RichText, url: String)
	///  A rich text email link 
	/// - text: Text 
	/// - emailAddress: Email address
	case emailAddress(text: RichText, emailAddress: String)
	///  A concatenation of rich texts 
	/// - texts: Texts
	case s(texts: [RichText])
}

///  Describes a block of an instant view web page 
public indirect enum PageBlock: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  The title of a page 
	/// - title: Title
	case title(title: RichText)
	///  The subtitle of a page 
	/// - subtitle: Subtitle
	case subtitle(subtitle: RichText)
	///  The author and publishing date of a page 
	/// - author: Author 
	/// - publishDate: Point in time (Unix timestamp) when the article was published; 0 if unknown
	case authorDate(author: RichText, publishDate: Int32)
	///  A header 
	/// - header: Header
	case header(header: RichText)
	///  A subheader 
	/// - subheader: Subheader
	case subheader(subheader: RichText)
	///  A text paragraph 
	/// - text: Paragraph text
	case paragraph(text: RichText)
	///  A preformatted text paragraph 
	/// - text: Paragraph text 
	/// - language: Programming language for which the text should be formatted
	case preformatted(text: RichText, language: String)
	///  The footer of a page 
	/// - footer: Footer
	case footer(footer: RichText)
	///  An empty block separating a page
	case divider
	///  An invisible anchor on a page, which can be used in a URL to open the page from the specified anchor 
	/// - name: Name of the anchor
	case anchor(name: String)
	///  A list of texts 
	/// - items: Texts 
	/// - isOrdered: True, if the items should be marked with numbers
	case list(items: [RichText], isOrdered: Bool)
	///  A block quote 
	/// - text: Quote text 
	/// - caption: Quote caption
	case blockQuote(text: RichText, caption: RichText)
	///  A pull quote 
	/// - text: Quote text 
	/// - caption: Quote caption
	case pullQuote(text: RichText, caption: RichText)
	///  An animation 
	/// - animation: Animation file; may be null 
	/// - caption: Animation caption 
	/// - needAutoplay: True, if the animation should be played automatically
	case animation(animation: Animation?, caption: RichText, needAutoplay: Bool)
	///  An audio file 
	/// - audio: Audio file; may be null 
	/// - caption: Audio file caption
	case audio(audio: Audio?, caption: RichText)
	///  A photo 
	/// - photo: Photo file; may be null 
	/// - caption: Photo caption
	case photo(photo: Photo?, caption: RichText)
	///  A video 
	/// - video: Video file; may be null 
	/// - caption: Video caption 
	/// - needAutoplay: True, if the video should be played automatically 
	/// - isLooped: True, if the video should be looped
	case video(video: Video?, caption: RichText, needAutoplay: Bool, isLooped: Bool)
	///  A page cover 
	/// - cover: Cover
	case cover(cover: PageBlock)
	///  An embedded web page 
	/// - url: Web page URL, if available 
	/// - html: HTML-markup of the embedded page 
	/// - posterPhoto: Poster photo, if available; may be null 
	/// - width: Block width 
	/// - height: Block height 
	/// - caption: Block caption 
	/// - isFullWidth: True, if the block should be full width 
	/// - allowScrolling: True, if scrolling should be allowed
	case embedded(url: String, html: String, posterPhoto: Photo?, width: Int32, height: Int32, caption: RichText, isFullWidth: Bool, allowScrolling: Bool)
	///  An embedded post 
	/// - url: Web page URL 
	/// - author: Post author 
	/// - authorPhoto: Post author photo 
	/// - date: Point in time (Unix timestamp) when the post was created; 0 if unknown 
	/// - pageBlocks: Post content 
	/// - caption: Post caption
	case embeddedPost(url: String, author: String, authorPhoto: Photo, date: Int32, pageBlocks: [PageBlock], caption: RichText)
	///  A collage 
	/// - pageBlocks: Collage item contents 
	/// - caption: Block caption
	case collage(pageBlocks: [PageBlock], caption: RichText)
	///  A slideshow 
	/// - pageBlocks: Slideshow item contents 
	/// - caption: Block caption
	case slideshow(pageBlocks: [PageBlock], caption: RichText)
	///  A link to a chat 
	/// - title: Chat title 
	/// - photo: Chat photo; may be null 
	/// - username: Chat username, by which all other information about the chat should be resolved
	case chatLink(title: String, photo: ChatPhoto?, username: String)
}

///  Describes an instant view page for a web page 
public struct WebPageInstantView: Codable, Equatable, FunctionResult {
	///  Content of the web page 
	public let pageBlocks: [PageBlock]
	///  True, if the instant view contains the full page. A network request might be needed to get the full web page instant view
	public let isFull: Bool
	/// Describes an instant view page for a web page 
	/// - Parameters:
	///   - pageBlocks: Content of the web page 
	///   - isFull: True, if the instant view contains the full page. A network request might be needed to get the full web page instant view
	public init(pageBlocks: [PageBlock], isFull: Bool) {
		self.pageBlocks = pageBlocks
		self.isFull = isFull
	}
}

///  Describes a web page preview 
public struct WebPage: Codable, Equatable, FunctionResult {
	///  Original URL of the link 
	public let url: String
	///  URL to display 
	public let displayUrl: String
	///  Type of the web page. Can be: article, photo, audio, video, document, profile, app, or something else 
	public let type: String
	///  Short name of the site (e.g., Google Docs, App Store) 
	public let siteName: String
	///  Title of the content 
	public let title: String
	///  Description of the content 
	public let description: String
	///  Image representing the content; may be null 
	public let photo: Photo?
	///  URL to show in the embedded preview 
	public let embedUrl: String
	///  MIME type of the embedded preview, (e.g., text/html or video/mp4) 
	public let embedType: String
	///  Width of the embedded preview 
	public let embedWidth: Int32
	///  Height of the embedded preview 
	public let embedHeight: Int32
	///  Duration of the content, in seconds 
	public let duration: Int32
	///  Author of the content 
	public let author: String
	///  Preview of the content as an animation, if available; may be null 
	public let animation: Animation?
	///  Preview of the content as an audio file, if available; may be null 
	public let audio: Audio?
	///  Preview of the content as a document, if available (currently only available for small PDF files and ZIP archives); may be null 
	public let document: Document?
	///  Preview of the content as a sticker for small WEBP files, if available; may be null 
	public let sticker: Sticker?
	///  Preview of the content as a video, if available; may be null 
	public let video: Video?
	///  Preview of the content as a video note, if available; may be null 
	public let videoNote: VideoNote?
	///  Preview of the content as a voice note, if available; may be null 
	public let voiceNote: VoiceNote?
	///  True, if the web page has an instant view
	public let hasInstantView: Bool
	/// Describes a web page preview 
	/// - Parameters:
	///   - url: Original URL of the link 
	///   - displayUrl: URL to display 
	///   - type: Type of the web page. Can be: article, photo, audio, video, document, profile, app, or something else 
	///   - siteName: Short name of the site (e.g., Google Docs, App Store) 
	///   - title: Title of the content 
	///   - description: Description of the content 
	///   - photo: Image representing the content; may be null 
	///   - embedUrl: URL to show in the embedded preview 
	///   - embedType: MIME type of the embedded preview, (e.g., text/html or video/mp4) 
	///   - embedWidth: Width of the embedded preview 
	///   - embedHeight: Height of the embedded preview 
	///   - duration: Duration of the content, in seconds 
	///   - author: Author of the content 
	///   - animation: Preview of the content as an animation, if available; may be null 
	///   - audio: Preview of the content as an audio file, if available; may be null 
	///   - document: Preview of the content as a document, if available (currently only available for small PDF files and ZIP archives); may be null 
	///   - sticker: Preview of the content as a sticker for small WEBP files, if available; may be null 
	///   - video: Preview of the content as a video, if available; may be null 
	///   - videoNote: Preview of the content as a video note, if available; may be null 
	///   - voiceNote: Preview of the content as a voice note, if available; may be null 
	///   - hasInstantView: True, if the web page has an instant view
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

///  Portion of the price of a product (e.g., "delivery cost", "tax amount") 
public struct LabeledPricePart: Codable, Equatable, FunctionResult {
	///  Label for this portion of the product price 
	public let label: String
	///  Currency amount in minimal quantity of the currency
	public let amount: Int53
	/// Portion of the price of a product (e.g., "delivery cost", "tax amount") 
	/// - Parameters:
	///   - label: Label for this portion of the product price 
	///   - amount: Currency amount in minimal quantity of the currency
	public init(label: String, amount: Int53) {
		self.label = label
		self.amount = amount
	}
}

///  Product invoice 
public struct Invoice: Codable, Equatable, FunctionResult {
	///  ISO 4217 currency code 
	public let currency: String
	///  A list of objects used to calculate the total price of the product 
	public let priceParts: [LabeledPricePart]
	///  True, if the payment is a test payment 
	public let isTest: Bool
	///  True, if the user's name is needed for payment 
	public let needName: Bool
	///  True, if the user's phone number is needed for payment 
	public let needPhoneNumber: Bool
	///  True, if the user's email address is needed for payment 
	public let needEmailAddress: Bool
	///  True, if the user's shipping address is needed for payment 
	public let needShippingAddress: Bool
	///  True, if the user's phone number will be sent to the provider 
	public let sendPhoneNumberToProvider: Bool
	///  True, if the user's email address will be sent to the provider 
	public let sendEmailAddressToProvider: Bool
	///  True, if the total price depends on the shipping method
	public let isFlexible: Bool
	/// Product invoice 
	/// - Parameters:
	///   - currency: ISO 4217 currency code 
	///   - priceParts: A list of objects used to calculate the total price of the product 
	///   - isTest: True, if the payment is a test payment 
	///   - needName: True, if the user's name is needed for payment 
	///   - needPhoneNumber: True, if the user's phone number is needed for payment 
	///   - needEmailAddress: True, if the user's email address is needed for payment 
	///   - needShippingAddress: True, if the user's shipping address is needed for payment 
	///   - sendPhoneNumberToProvider: True, if the user's phone number will be sent to the provider 
	///   - sendEmailAddressToProvider: True, if the user's email address will be sent to the provider 
	///   - isFlexible: True, if the total price depends on the shipping method
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

///  Describes a shipping address 
public struct ShippingAddress: Codable, Equatable, FunctionResult {
	///  Two-letter ISO 3166-1 alpha-2 country code 
	public let countryCode: String
	///  State, if applicable 
	public let state: String
	///  City 
	public let city: String
	///  First line of the address 
	public let streetLine1: String
	///  Second line of the address 
	public let streetLine2: String
	///  Address postal code
	public let postalCode: String
	/// Describes a shipping address 
	/// - Parameters:
	///   - countryCode: Two-letter ISO 3166-1 alpha-2 country code 
	///   - state: State, if applicable 
	///   - city: City 
	///   - streetLine1: First line of the address 
	///   - streetLine2: Second line of the address 
	///   - postalCode: Address postal code
	public init(countryCode: String, state: String, city: String, streetLine1: String, streetLine2: String, postalCode: String) {
		self.countryCode = countryCode
		self.state = state
		self.city = city
		self.streetLine1 = streetLine1
		self.streetLine2 = streetLine2
		self.postalCode = postalCode
	}
}

///  Order information 
public struct OrderInfo: Codable, Equatable, FunctionResult {
	///  Name of the user 
	public let name: String
	///  Phone number of the user 
	public let phoneNumber: String
	///  Email address of the user 
	public let emailAddress: String
	///  Shipping address for this order; may be null
	public let shippingAddress: ShippingAddress?
	/// Order information 
	/// - Parameters:
	///   - name: Name of the user 
	///   - phoneNumber: Phone number of the user 
	///   - emailAddress: Email address of the user 
	///   - shippingAddress: Shipping address for this order; may be null
	public init(name: String, phoneNumber: String, emailAddress: String, shippingAddress: ShippingAddress?) {
		self.name = name
		self.phoneNumber = phoneNumber
		self.emailAddress = emailAddress
		self.shippingAddress = shippingAddress
	}
}

///  One shipping option 
public struct ShippingOption: Codable, Equatable, FunctionResult {
	///  Shipping option identifier 
	public let id: String
	///  Option title 
	public let title: String
	///  A list of objects used to calculate the total shipping costs
	public let priceParts: [LabeledPricePart]
	/// One shipping option 
	/// - Parameters:
	///   - id: Shipping option identifier 
	///   - title: Option title 
	///   - priceParts: A list of objects used to calculate the total shipping costs
	public init(id: String, title: String, priceParts: [LabeledPricePart]) {
		self.id = id
		self.title = title
		self.priceParts = priceParts
	}
}

///  Contains information about saved card credentials 
public struct SavedCredentials: Codable, Equatable, FunctionResult {
	///  Unique identifier of the saved credentials 
	public let id: String
	///  Title of the saved credentials
	public let title: String
	/// Contains information about saved card credentials 
	/// - Parameters:
	///   - id: Unique identifier of the saved credentials 
	///   - title: Title of the saved credentials
	public init(id: String, title: String) {
		self.id = id
		self.title = title
	}
}

///  Contains information about the payment method chosen by the user 
public indirect enum InputCredentials: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  Applies if a user chooses some previously saved payment credentials. To use their previously saved credentials, the user must have a valid temporary password 
	/// - savedCredentialsId: Identifier of the saved credentials
	case saved(savedCredentialsId: String)
	///  Applies if a user enters new credentials on a payment provider website 
	/// - data: Contains JSON-encoded data with a credential identifier from the payment provider 
	/// - allowSave: True, if the credential identifier can be saved on the server side
	case new(data: String, allowSave: Bool)
	///  Applies if a user enters new credentials using Android Pay 
	/// - data: JSON-encoded data with the credential identifier
	case androidPay(data: String)
	///  Applies if a user enters new credentials using Apple Pay 
	/// - data: JSON-encoded data with the credential identifier
	case applePay(data: String)
}

///  Stripe payment provider 
public struct PaymentsProviderStripe: Codable, Equatable, FunctionResult {
	///  Stripe API publishable key 
	public let publishableKey: String
	///  True, if the user country must be provided 
	public let needCountry: Bool
	///  True, if the user ZIP/postal code must be provided 
	public let needPostalCode: Bool
	///  True, if the cardholder name must be provided
	public let needCardholderName: Bool
	/// Stripe payment provider 
	/// - Parameters:
	///   - publishableKey: Stripe API publishable key 
	///   - needCountry: True, if the user country must be provided 
	///   - needPostalCode: True, if the user ZIP/postal code must be provided 
	///   - needCardholderName: True, if the cardholder name must be provided
	public init(publishableKey: String, needCountry: Bool, needPostalCode: Bool, needCardholderName: Bool) {
		self.publishableKey = publishableKey
		self.needCountry = needCountry
		self.needPostalCode = needPostalCode
		self.needCardholderName = needCardholderName
	}
}

///  Contains information about an invoice payment form 
public struct PaymentForm: Codable, Equatable, FunctionResult {
	///  Full information of the invoice 
	public let invoice: Invoice
	///  Payment form URL 
	public let url: String
	///  Contains information about the payment provider, if available, to support it natively without the need for opening the URL; may be null 
	public let paymentsProvider: PaymentsProviderStripe?
	///  Saved server-side order information; may be null 
	public let savedOrderInfo: OrderInfo?
	///  Contains information about saved card credentials; may be null 
	public let savedCredentials: SavedCredentials?
	///  True, if the user can choose to save credentials 
	public let canSaveCredentials: Bool
	///  True, if the user will be able to save credentials protected by a password they set up
	public let needPassword: Bool
	/// Contains information about an invoice payment form 
	/// - Parameters:
	///   - invoice: Full information of the invoice 
	///   - url: Payment form URL 
	///   - paymentsProvider: Contains information about the payment provider, if available, to support it natively without the need for opening the URL; may be null 
	///   - savedOrderInfo: Saved server-side order information; may be null 
	///   - savedCredentials: Contains information about saved card credentials; may be null 
	///   - canSaveCredentials: True, if the user can choose to save credentials 
	///   - needPassword: True, if the user will be able to save credentials protected by a password they set up
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

///  Contains a temporary identifier of validated order information, which is stored for one hour. Also contains the available shipping options 
public struct ValidatedOrderInfo: Codable, Equatable, FunctionResult {
	///  Temporary identifier of the order information 
	public let orderInfoId: String
	///  Available shipping options
	public let shippingOptions: [ShippingOption]
	/// Contains a temporary identifier of validated order information, which is stored for one hour. Also contains the available shipping options 
	/// - Parameters:
	///   - orderInfoId: Temporary identifier of the order information 
	///   - shippingOptions: Available shipping options
	public init(orderInfoId: String, shippingOptions: [ShippingOption]) {
		self.orderInfoId = orderInfoId
		self.shippingOptions = shippingOptions
	}
}

///  Contains the result of a payment request 
public struct PaymentResult: Codable, Equatable, FunctionResult {
	///  True, if the payment request was successful; otherwise the verification_url will be not empty 
	public let success: Bool
	///  URL for additional payment credentials verification
	public let verificationUrl: String
	/// Contains the result of a payment request 
	/// - Parameters:
	///   - success: True, if the payment request was successful; otherwise the verification_url will be not empty 
	///   - verificationUrl: URL for additional payment credentials verification
	public init(success: Bool, verificationUrl: String) {
		self.success = success
		self.verificationUrl = verificationUrl
	}
}

///  Contains information about a successful payment 
public struct PaymentReceipt: Codable, Equatable, FunctionResult {
	///  Point in time (Unix timestamp) when the payment was made 
	public let date: Int32
	///  User identifier of the payment provider bot 
	public let paymentsProviderUserId: Int32
	///  Contains information about the invoice 
	public let invoice: Invoice
	///  Contains order information; may be null 
	public let orderInfo: OrderInfo?
	///  Chosen shipping option; may be null 
	public let shippingOption: ShippingOption?
	///  Title of the saved credentials
	public let credentialsTitle: String
	/// Contains information about a successful payment 
	/// - Parameters:
	///   - date: Point in time (Unix timestamp) when the payment was made 
	///   - paymentsProviderUserId: User identifier of the payment provider bot 
	///   - invoice: Contains information about the invoice 
	///   - orderInfo: Contains order information; may be null 
	///   - shippingOption: Chosen shipping option; may be null 
	///   - credentialsTitle: Title of the saved credentials
	public init(date: Int32, paymentsProviderUserId: Int32, invoice: Invoice, orderInfo: OrderInfo?, shippingOption: ShippingOption?, credentialsTitle: String) {
		self.date = date
		self.paymentsProviderUserId = paymentsProviderUserId
		self.invoice = invoice
		self.orderInfo = orderInfo
		self.shippingOption = shippingOption
		self.credentialsTitle = credentialsTitle
	}
}

///  Contains the content of a message 
// sourcery: noPrefix = true
public indirect enum MessageContent: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  A text message 
	/// - text: Text of the message 
	/// - webPage: A preview of the web page that's mentioned in the text; may be null
	case messageText(text: FormattedText, webPage: WebPage?)
	///  An animation message (GIF-style). 
	/// - animation: Message content 
	/// - caption: Animation caption 
	/// - isSecret: True, if the animation thumbnail must be blurred and the animation must be shown only while tapped
	case messageAnimation(animation: Animation, caption: FormattedText, isSecret: Bool)
	///  An audio message 
	/// - audio: Message content 
	/// - caption: Audio caption
	case messageAudio(audio: Audio, caption: FormattedText)
	///  A document message (general file) 
	/// - document: Message content 
	/// - caption: Document caption
	case messageDocument(document: Document, caption: FormattedText)
	///  A photo message 
	/// - photo: Message content 
	/// - caption: Photo caption 
	/// - isSecret: True, if the photo must be blurred and must be shown only while tapped
	case messagePhoto(photo: Photo, caption: FormattedText, isSecret: Bool)
	///  An expired photo message (self-destructed after TTL has elapsed)
	case messageExpiredPhoto
	///  A sticker message 
	/// - sticker: Message content
	case messageSticker(sticker: Sticker)
	///  A video message 
	/// - video: Message content 
	/// - caption: Video caption 
	/// - isSecret: True, if the video thumbnail must be blurred and the video must be shown only while tapped
	case messageVideo(video: Video, caption: FormattedText, isSecret: Bool)
	///  An expired video message (self-destructed after TTL has elapsed)
	case messageExpiredVideo
	///  A video note message 
	/// - videoNote: Message content 
	/// - isViewed: True, if at least one of the recipients has viewed the video note 
	/// - isSecret: True, if the video note thumbnail must be blurred and the video note must be shown only while tapped
	case messageVideoNote(videoNote: VideoNote, isViewed: Bool, isSecret: Bool)
	///  A voice note message 
	/// - voiceNote: Message content 
	/// - caption: Voice note caption 
	/// - isListened: True, if at least one of the recipients has listened to the voice note
	case messageVoiceNote(voiceNote: VoiceNote, caption: FormattedText, isListened: Bool)
	///  A message with a location 
	/// - location: Message content 
	/// - livePeriod: Time relative to the message sent date until which the location can be updated, in seconds 
	/// - expiresIn: Left time for which the location can be updated, in seconds. updateMessageContent is not sent when this field changes
	case messageLocation(location: Location, livePeriod: Int32, expiresIn: Int32)
	///  A message with information about a venue 
	/// - venue: Message content
	case messageVenue(venue: Venue)
	///  A message with a user contact 
	/// - contact: Message content
	case messageContact(contact: Contact)
	///  A message with a game 
	/// - game: Game
	case messageGame(game: Game)
	///  A message with an invoice from a bot 
	/// - title: Product title 
	/// - description: Product description 
	/// - photo: Product photo; may be null 
	/// - currency: Currency for the product price 
	/// - totalAmount: Product total price in the minimal quantity of the currency 
	/// - startParameter: Unique invoice bot start_parameter. To share an invoice use the URL https://t.me/{bot_username}?start={start_parameter} 
	/// - isTest: True, if the invoice is a test invoice 
	/// - needShippingAddress: True, if the shipping address should be specified 
	/// - receiptMessageId: The identifier of the message with the receipt, after the product has been purchased
	case messageInvoice(title: String, description: String, photo: Photo?, currency: String, totalAmount: Int53, startParameter: String, isTest: Bool, needShippingAddress: Bool, receiptMessageId: Int53)
	///  A message with information about an ended call 
	/// - discardReason: Reason why the call was discarded 
	/// - duration: Call duration, in seconds
	case messageCall(discardReason: CallDiscardReason, duration: Int32)
	///  A newly created basic group 
	/// - title: Title of the basic group 
	/// - memberUserIds: User identifiers of members in the basic group
	case messageBasicGroupChatCreate(title: String, memberUserIds: [Int32])
	///  A newly created supergroup or channel 
	/// - title: Title of the supergroup or channel
	case messageSupergroupChatCreate(title: String)
	///  An updated chat title 
	/// - title: New chat title
	case messageChatChangeTitle(title: String)
	///  An updated chat photo 
	/// - photo: New chat photo
	case messageChatChangePhoto(photo: Photo)
	///  A deleted chat photo
	case messageChatDeletePhoto
	///  New chat members were added 
	/// - memberUserIds: User identifiers of the new members
	case messageChatAddMembers(memberUserIds: [Int32])
	///  A new member joined the chat by invite link
	case messageChatJoinByLink
	///  A chat member was deleted 
	/// - userId: User identifier of the deleted chat member
	case messageChatDeleteMember(userId: Int32)
	///  A basic group was upgraded to a supergroup and was deactivated as the result 
	/// - supergroupId: Identifier of the supergroup to which the basic group was upgraded
	case messageChatUpgradeTo(supergroupId: Int32)
	///  A supergroup has been created from a basic group 
	/// - title: Title of the newly created supergroup 
	/// - basicGroupId: The identifier of the original basic group
	case messageChatUpgradeFrom(title: String, basicGroupId: Int32)
	///  A message has been pinned 
	/// - messageId: Identifier of the pinned message, can be an identifier of a deleted message
	case messagePinMessage(messageId: Int53)
	///  A screenshot of a message in the chat has been taken
	case messageScreenshotTaken
	///  The TTL (Time To Live) setting messages in a secret chat has been changed 
	/// - ttl: New TTL
	case messageChatSetTtl(ttl: Int32)
	///  A non-standard action has happened in the chat 
	/// - text: Message text to be shown in the chat
	case messageCustomServiceAction(text: String)
	///  A new high score was achieved in a game 
	/// - gameMessageId: Identifier of the message with the game, can be an identifier of a deleted message 
	/// - gameId: Identifier of the game, may be different from the games presented in the message with the game 
	/// - score: New score
	case messageGameScore(gameMessageId: Int53, gameId: TDInt64, score: Int32)
	///  A payment has been completed 
	/// - invoiceMessageId: Identifier of the message with the corresponding invoice; can be an identifier of a deleted message 
	/// - currency: Currency for the price of the product 
	/// - totalAmount: Total price for the product, in the minimal quantity of the currency
	case messagePaymentSuccessful(invoiceMessageId: Int53, currency: String, totalAmount: Int53)
	///  A payment has been completed; for bots only 
	/// - invoiceMessageId: Identifier of the message with the corresponding invoice; can be an identifier of a deleted message 
	/// - currency: Currency for price of the product 
	/// - totalAmount: Total price for the product, in the minimal quantity of the currency 
	/// - invoicePayload: Invoice payload 
	/// - shippingOptionId: Identifier of the shipping option chosen by the user, may be empty if not applicable 
	/// - orderInfo: Information about the order; may be null 
	/// - telegramPaymentChargeId: Telegram payment identifier 
	/// - providerPaymentChargeId: Provider payment identifier
	case messagePaymentSuccessfulBot(invoiceMessageId: Int53, currency: String, totalAmount: Int53, invoicePayload: Bytes, shippingOptionId: String, orderInfo: OrderInfo?, telegramPaymentChargeId: String, providerPaymentChargeId: String)
	///  A contact has registered with Telegram
	case messageContactRegistered
	///  The current user has connected a website by logging in using Telegram Login Widget on it 
	/// - domainName: Domain name of the connected website
	case messageWebsiteConnected(domainName: String)
	///  Message content that is not supported by the client
	case messageUnsupported
}

///  Represents a part of the text which must be formatted differently 
public indirect enum TextEntityType: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  A mention of a user by their username
	case mention
	///  A hashtag text, beginning with "#"
	case hashtag
	///  A cashtag text, beginning with "$" and consisting of capital english letters (i.e. "$USD")
	case cashtag
	///  A bot command, beginning with "/". This shouldn't be highlighted if there are no bots in the chat
	case botCommand
	///  An HTTP URL
	case url
	///  An email address
	case emailAddress
	///  A bold text
	case bold
	///  An italic text
	case italic
	///  Text that must be formatted as if inside a code HTML tag
	case code
	///  Text that must be formatted as if inside a pre HTML tag
	case pre
	///  Text that must be formatted as if inside pre, and code HTML tags 
	/// - language: Programming language of the code; as defined by the sender
	case preCode(language: String)
	///  A text description shown instead of a raw URL 
	/// - url: URL to be opened when the link is clicked
	case textUrl(url: String)
	///  A text shows instead of a raw mention of the user (e.g., when the user has no username) 
	/// - userId: Identifier of the mentioned user
	case mentionName(userId: Int32)
	///  A phone number
	case phoneNumber
}

///  A thumbnail to be sent along with a file; should be in JPEG or WEBP format for stickers, and less than 200 kB in size 
public struct InputThumbnail: Codable, Equatable, FunctionResult {
	///  Thumbnail file to send. Sending thumbnails by file_id is currently not supported 
	public let thumbnail: InputFile
	///  Thumbnail width, usually shouldn't exceed 90. Use 0 if unknown 
	public let width: Int32
	///  Thumbnail height, usually shouldn't exceed 90. Use 0 if unknown
	public let height: Int32
	/// A thumbnail to be sent along with a file; should be in JPEG or WEBP format for stickers, and less than 200 kB in size 
	/// - Parameters:
	///   - thumbnail: Thumbnail file to send. Sending thumbnails by file_id is currently not supported 
	///   - width: Thumbnail width, usually shouldn't exceed 90. Use 0 if unknown 
	///   - height: Thumbnail height, usually shouldn't exceed 90. Use 0 if unknown
	public init(thumbnail: InputFile, width: Int32, height: Int32) {
		self.thumbnail = thumbnail
		self.width = width
		self.height = height
	}
}

///  The content of a message to send 
// sourcery: noPrefix = true
public indirect enum InputMessageContent: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  A text message 
	/// - text: Formatted text to be sent. Only Bold, Italic, Code, Pre, PreCode and TextUrl entities are allowed to be specified manually 
	/// - disableWebPagePreview: True, if rich web page previews for URLs in the message text should be disabled 
	/// - clearDraft: True, if a chat message draft should be deleted
	case inputMessageText(text: FormattedText, disableWebPagePreview: Bool, clearDraft: Bool)
	///  An animation message (GIF-style). 
	/// - animation: Animation file to be sent 
	/// - thumbnail: Animation thumbnail, if available 
	/// - duration: Duration of the animation, in seconds 
	/// - width: Width of the animation; may be replaced by the server 
	/// - height: Height of the animation; may be replaced by the server 
	/// - caption: Animation caption; 0-200 characters
	case inputMessageAnimation(animation: InputFile, thumbnail: InputThumbnail, duration: Int32, width: Int32, height: Int32, caption: FormattedText)
	///  An audio message 
	/// - audio: Audio file to be sent 
	/// - albumCoverThumbnail: Thumbnail of the cover for the album, if available 
	/// - duration: Duration of the audio, in seconds; may be replaced by the server 
	/// - title: Title of the audio; 0-64 characters; may be replaced by the server 
	/// - performer: Performer of the audio; 0-64 characters, may be replaced by the server 
	/// - caption: Audio caption; 0-200 characters
	case inputMessageAudio(audio: InputFile, albumCoverThumbnail: InputThumbnail, duration: Int32, title: String, performer: String, caption: FormattedText)
	///  A document message (general file) 
	/// - document: Document to be sent 
	/// - thumbnail: Document thumbnail, if available 
	/// - caption: Document caption; 0-200 characters
	case inputMessageDocument(document: InputFile, thumbnail: InputThumbnail, caption: FormattedText)
	///  A photo message 
	/// - photo: Photo to send 
	/// - thumbnail: Photo thumbnail to be sent, this is sent to the other party in secret chats only 
	/// - addedStickerFileIds: File identifiers of the stickers added to the photo, if applicable 
	/// - width: Photo width 
	/// - height: Photo height 
	/// - caption: Photo caption; 0-200 characters 
	/// - ttl: Photo TTL (Time To Live), in seconds (0-60). A non-zero TTL can be specified only in private chats
	case inputMessagePhoto(photo: InputFile, thumbnail: InputThumbnail, addedStickerFileIds: [Int32], width: Int32, height: Int32, caption: FormattedText, ttl: Int32)
	///  A sticker message 
	/// - sticker: Sticker to be sent 
	/// - thumbnail: Sticker thumbnail, if available 
	/// - width: Sticker width 
	/// - height: Sticker height
	case inputMessageSticker(sticker: InputFile, thumbnail: InputThumbnail, width: Int32, height: Int32)
	///  A video message 
	/// - video: Video to be sent 
	/// - thumbnail: Video thumbnail, if available 
	/// - addedStickerFileIds: File identifiers of the stickers added to the video, if applicable 
	/// - duration: Duration of the video, in seconds 
	/// - width: Video width 
	/// - height: Video height 
	/// - supportsStreaming: True, if the video should be tried to be streamed 
	/// - caption: Video caption; 0-200 characters 
	/// - ttl: Video TTL (Time To Live), in seconds (0-60). A non-zero TTL can be specified only in private chats
	case inputMessageVideo(video: InputFile, thumbnail: InputThumbnail, addedStickerFileIds: [Int32], duration: Int32, width: Int32, height: Int32, supportsStreaming: Bool, caption: FormattedText, ttl: Int32)
	///  A video note message 
	/// - videoNote: Video note to be sent 
	/// - thumbnail: Video thumbnail, if available 
	/// - duration: Duration of the video, in seconds 
	/// - length: Video width and height; must be positive and not greater than 640
	case inputMessageVideoNote(videoNote: InputFile, thumbnail: InputThumbnail, duration: Int32, length: Int32)
	///  A voice note message 
	/// - voiceNote: Voice note to be sent 
	/// - duration: Duration of the voice note, in seconds 
	/// - waveform: Waveform representation of the voice note, in 5-bit format 
	/// - caption: Voice note caption; 0-200 characters
	case inputMessageVoiceNote(voiceNote: InputFile, duration: Int32, waveform: Bytes, caption: FormattedText)
	///  A message with a location 
	/// - location: Location to be sent 
	/// - livePeriod: Period for which the location can be updated, in seconds; should bebetween 60 and 86400 for a live location and 0 otherwise
	case inputMessageLocation(location: Location, livePeriod: Int32)
	///  A message with information about a venue 
	/// - venue: Venue to send
	case inputMessageVenue(venue: Venue)
	///  A message containing a user contact 
	/// - contact: Contact to send
	case inputMessageContact(contact: Contact)
	///  A message with a game; not supported for channels or secret chats 
	/// - botUserId: User identifier of the bot that owns the game 
	/// - gameShortName: Short name of the game
	case inputMessageGame(botUserId: Int32, gameShortName: String)
	///  A message with an invoice; can be used only by bots and only in private chats 
	/// - invoice: Invoice 
	/// - title: Product title; 1-32 characters 
	/// - description: Product description; 0-255 characters 
	/// - photoUrl: Product photo URL; optional 
	/// - photoSize: Product photo size 
	/// - photoWidth: Product photo width 
	/// - photoHeight: Product photo height 
	/// - payload: The invoice payload 
	/// - providerToken: Payment provider token 
	/// - providerData: JSON-encoded data about the invoice, which will be shared with the payment provider 
	/// - startParameter: Unique invoice bot start_parameter for the generation of this invoice
	case inputMessageInvoice(invoice: Invoice, title: String, description: String, photoUrl: String, photoSize: Int32, photoWidth: Int32, photoHeight: Int32, payload: Bytes, providerToken: String, providerData: String, startParameter: String)
	///  A forwarded message 
	/// - fromChatId: Identifier for the chat this forwarded message came from 
	/// - messageId: Identifier of the message to forward 
	/// - inGameShare: True, if a game message should be shared within a launched game; applies only to game messages
	case inputMessageForwarded(fromChatId: Int53, messageId: Int53, inGameShare: Bool)
}

///  Represents a filter for message search results 
public indirect enum SearchMessagesFilter: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  Returns all found messages, no filter is applied
	case empty
	///  Returns only animation messages
	case animation
	///  Returns only audio messages
	case audio
	///  Returns only document messages
	case document
	///  Returns only photo messages
	case photo
	///  Returns only video messages
	case video
	///  Returns only voice note messages
	case voiceNote
	///  Returns only photo and video messages
	case photoAndVideo
	///  Returns only messages containing URLs
	case url
	///  Returns only messages containing chat photos
	case chatPhoto
	///  Returns only call messages
	case call
	///  Returns only incoming call messages with missed/declined discard reasons
	case missedCall
	///  Returns only video note messages
	case videoNote
	///  Returns only voice and video note messages
	case voiceAndVideoNote
	///  Returns only messages with mentions of the current user, or messages that are replies to their messages
	case mention
	///  Returns only messages with unread mentions of the current user or messages that are replies to their messages. When using this filter the results can't be additionally filtered by a query or by the sending user
	case unreadMention
}

///  Describes the different types of activity in a chat 
public indirect enum ChatAction: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  The user is typing a message
	case typing
	///  The user is recording a video
	case recordingVideo
	///  The user is uploading a video 
	/// - progress: Upload progress, as a percentage
	case uploadingVideo(progress: Int32)
	///  The user is recording a voice note
	case recordingVoiceNote
	///  The user is uploading a voice note 
	/// - progress: Upload progress, as a percentage
	case uploadingVoiceNote(progress: Int32)
	///  The user is uploading a photo 
	/// - progress: Upload progress, as a percentage
	case uploadingPhoto(progress: Int32)
	///  The user is uploading a document 
	/// - progress: Upload progress, as a percentage
	case uploadingDocument(progress: Int32)
	///  The user is picking a location or venue to send
	case choosingLocation
	///  The user is picking a contact to send
	case choosingContact
	///  The user has started to play a game
	case startPlayingGame
	///  The user is recording a video note
	case recordingVideoNote
	///  The user is uploading a video note 
	/// - progress: Upload progress, as a percentage
	case uploadingVideoNote(progress: Int32)
	///  The user has cancelled the previous action
	case cancel
}

///  Describes the last time the user was online 
public indirect enum UserStatus: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  The user status was never changed
	case empty
	///  The user is online 
	/// - expires: Point in time (Unix timestamp) when the user's online status will expire
	case online(expires: Int32)
	///  The user is offline 
	/// - wasOnline: Point in time (Unix timestamp) when the user was last online
	case offline(wasOnline: Int32)
	///  The user was online recently
	case recently
	///  The user is offline, but was online last week
	case lastWeek
	///  The user is offline, but was online last month
	case lastMonth
}

///  Represents a list of stickers 
public struct Stickers: Codable, Equatable, FunctionResult {
	///  List of stickers
	public let stickers: [Sticker]
	/// Represents a list of stickers 
	/// - Parameters:
	///   - stickers: List of stickers
	public init(stickers: [Sticker]) {
		self.stickers = stickers
	}
}

///  Represents a list of all emoji corresponding to a sticker in a sticker set. The list is only for informational purposes, because a sticker is always sent with a fixed emoji from the corresponding Sticker object 
public struct StickerEmojis: Codable, Equatable, FunctionResult {
	///  List of emojis
	public let emojis: [String]
	/// Represents a list of all emoji corresponding to a sticker in a sticker set. The list is only for informational purposes, because a sticker is always sent with a fixed emoji from the corresponding Sticker object 
	/// - Parameters:
	///   - emojis: List of emojis
	public init(emojis: [String]) {
		self.emojis = emojis
	}
}

///  Represents a sticker set 
public struct StickerSet: Codable, Equatable, FunctionResult {
	///  Identifier of the sticker set 
	public let id: TDInt64
	///  Title of the sticker set 
	public let title: String
	///  Name of the sticker set 
	public let name: String
	///  True, if the sticker set has been installed by the current user 
	public let isInstalled: Bool
	///  True, if the sticker set has been archived. A sticker set can't be installed and archived simultaneously 
	public let isArchived: Bool
	///  True, if the sticker set is official 
	public let isOfficial: Bool
	///  True, if the stickers in the set are masks 
	public let isMasks: Bool
	///  True for already viewed trending sticker sets 
	public let isViewed: Bool
	///  List of stickers in this set 
	public let stickers: [Sticker]
	///  A list of emoji corresponding to the stickers in the same order
	public let emojis: [StickerEmojis]
	/// Represents a sticker set 
	/// - Parameters:
	///   - id: Identifier of the sticker set 
	///   - title: Title of the sticker set 
	///   - name: Name of the sticker set 
	///   - isInstalled: True, if the sticker set has been installed by the current user 
	///   - isArchived: True, if the sticker set has been archived. A sticker set can't be installed and archived simultaneously 
	///   - isOfficial: True, if the sticker set is official 
	///   - isMasks: True, if the stickers in the set are masks 
	///   - isViewed: True for already viewed trending sticker sets 
	///   - stickers: List of stickers in this set 
	///   - emojis: A list of emoji corresponding to the stickers in the same order
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

///  Represents short information about a sticker set 
public struct StickerSetInfo: Codable, Equatable, FunctionResult {
	///  Identifier of the sticker set 
	public let id: TDInt64
	///  Title of the sticker set 
	public let title: String
	///  Name of the sticker set 
	public let name: String
	///  True, if the sticker set has been installed by current user 
	public let isInstalled: Bool
	///  True, if the sticker set has been archived. A sticker set can't be installed and archived simultaneously 
	public let isArchived: Bool
	///  True, if the sticker set is official 
	public let isOfficial: Bool
	///  True, if the stickers in the set are masks 
	public let isMasks: Bool
	///  True for already viewed trending sticker sets 
	public let isViewed: Bool
	///  Total number of stickers in the set 
	public let size: Int32
	///  Contains up to the first 5 stickers from the set, depending on the context. If the client needs more stickers the full set should be requested
	public let covers: [Sticker]
	/// Represents short information about a sticker set 
	/// - Parameters:
	///   - id: Identifier of the sticker set 
	///   - title: Title of the sticker set 
	///   - name: Name of the sticker set 
	///   - isInstalled: True, if the sticker set has been installed by current user 
	///   - isArchived: True, if the sticker set has been archived. A sticker set can't be installed and archived simultaneously 
	///   - isOfficial: True, if the sticker set is official 
	///   - isMasks: True, if the stickers in the set are masks 
	///   - isViewed: True for already viewed trending sticker sets 
	///   - size: Total number of stickers in the set 
	///   - covers: Contains up to the first 5 stickers from the set, depending on the context. If the client needs more stickers the full set should be requested
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

///  Represents a list of sticker sets 
public struct StickerSets: Codable, Equatable, FunctionResult {
	///  Approximate total number of sticker sets found 
	public let totalCount: Int32
	///  List of sticker sets
	public let sets: [StickerSetInfo]
	/// Represents a list of sticker sets 
	/// - Parameters:
	///   - totalCount: Approximate total number of sticker sets found 
	///   - sets: List of sticker sets
	public init(totalCount: Int32, sets: [StickerSetInfo]) {
		self.totalCount = totalCount
		self.sets = sets
	}
}

///  Describes the reason why a call was discarded 
public indirect enum CallDiscardReason: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  The call wasn't discarded, or the reason is unknown
	case empty
	///  The call was ended before the conversation started. It was cancelled by the caller or missed by the other party
	case missed
	///  The call was ended before the conversation started. It was declined by the other party
	case declined
	///  The call was ended during the conversation because the users were disconnected
	case disconnected
	///  The call was ended because one of the parties hung up
	case hungUp
}

///  Specifies the supported call protocols 
public struct CallProtocol: Codable, Equatable, FunctionResult {
	///  True, if UDP peer-to-peer connections are supported 
	public let udpP2p: Bool
	///  True, if connection through UDP reflectors is supported 
	public let udpReflector: Bool
	///  Minimum supported API layer; use 65 
	public let minLayer: Int32
	///  Maximum supported API layer; use 65
	public let maxLayer: Int32
	/// Specifies the supported call protocols 
	/// - Parameters:
	///   - udpP2p: True, if UDP peer-to-peer connections are supported 
	///   - udpReflector: True, if connection through UDP reflectors is supported 
	///   - minLayer: Minimum supported API layer; use 65 
	///   - maxLayer: Maximum supported API layer; use 65
	public init(udpP2p: Bool, udpReflector: Bool, minLayer: Int32, maxLayer: Int32) {
		self.udpP2p = udpP2p
		self.udpReflector = udpReflector
		self.minLayer = minLayer
		self.maxLayer = maxLayer
	}
}

///  Describes the address of UDP reflectors 
public struct CallConnection: Codable, Equatable, FunctionResult {
	///  Reflector identifier 
	public let id: TDInt64
	///  IPv4 reflector address 
	public let ip: String
	///  IPv6 reflector address 
	public let ipv6: String
	///  Reflector port number 
	public let port: Int32
	///  Connection peer tag
	public let peerTag: Bytes
	/// Describes the address of UDP reflectors 
	/// - Parameters:
	///   - id: Reflector identifier 
	///   - ip: IPv4 reflector address 
	///   - ipv6: IPv6 reflector address 
	///   - port: Reflector port number 
	///   - peerTag: Connection peer tag
	public init(id: TDInt64, ip: String, ipv6: String, port: Int32, peerTag: Bytes) {
		self.id = id
		self.ip = ip
		self.ipv6 = ipv6
		self.port = port
		self.peerTag = peerTag
	}
}

///  Contains the call identifier 
public struct CallId: Codable, Equatable, FunctionResult {
	///  Call identifier
	public let id: Int32
	/// Contains the call identifier 
	/// - Parameters:
	///   - id: Call identifier
	public init(id: Int32) {
		self.id = id
	}
}

///  Describes the current call state 
public indirect enum CallState: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  The call is pending, waiting to be accepted by a user 
	/// - isCreated: True, if the call has already been created by the server 
	/// - isReceived: True, if the call has already been received by the other party
	case pending(isCreated: Bool, isReceived: Bool)
	///  The call has been answered and encryption keys are being exchanged
	case exchangingKeys
	///  The call is ready to use 
	/// - protocol: Call protocols supported by the peer 
	/// - connections: Available UDP reflectors 
	/// - config: A JSON-encoded call config 
	/// - encryptionKey: Call encryption key 
	/// - emojis: Encryption key emojis fingerprint
	case ready(protocol: CallProtocol, connections: [CallConnection], config: String, encryptionKey: Bytes, emojis: [String])
	///  The call is hanging up after discardCall has been called
	case hangingUp
	///  The call has ended successfully 
	/// - reason: The reason, why the call has ended 
	/// - needRating: True, if the call rating should be sent to the server 
	/// - needDebugInformation: True, if the call debug information should be sent to the server
	case discarded(reason: CallDiscardReason, needRating: Bool, needDebugInformation: Bool)
	///  The call has ended with an error 
	/// - error: Error. An error with the code 4005000 will be returned if an outgoing call is missed because of an expired timeout
	case error(error: Error)
}

///  Describes a call 
public struct Call: Codable, Equatable, FunctionResult {
	///  Call identifier, not persistent 
	public let id: Int32
	///  Peer user identifier 
	public let userId: Int32
	///  True, if the call is outgoing 
	public let isOutgoing: Bool
	///  Call state
	public let state: CallState
	/// Describes a call 
	/// - Parameters:
	///   - id: Call identifier, not persistent 
	///   - userId: Peer user identifier 
	///   - isOutgoing: True, if the call is outgoing 
	///   - state: Call state
	public init(id: Int32, userId: Int32, isOutgoing: Bool, state: CallState) {
		self.id = id
		self.userId = userId
		self.isOutgoing = isOutgoing
		self.state = state
	}
}

///  Represents a list of animations 
public struct Animations: Codable, Equatable, FunctionResult {
	///  List of animations
	public let animations: [Animation]
	/// Represents a list of animations 
	/// - Parameters:
	///   - animations: List of animations
	public init(animations: [Animation]) {
		self.animations = animations
	}
}

///  Represents the result of an ImportContacts request 
public struct ImportedContacts: Codable, Equatable, FunctionResult {
	///  User identifiers of the imported contacts in the same order as they were specified in the request; 0 if the contact is not yet a registered user 
	public let userIds: [Int32]
	///  The number of users that imported the corresponding contact; 0 for already registered users or if unavailable
	public let importerCount: [Int32]
	/// Represents the result of an ImportContacts request 
	/// - Parameters:
	///   - userIds: User identifiers of the imported contacts in the same order as they were specified in the request; 0 if the contact is not yet a registered user 
	///   - importerCount: The number of users that imported the corresponding contact; 0 for already registered users or if unavailable
	public init(userIds: [Int32], importerCount: [Int32]) {
		self.userIds = userIds
		self.importerCount = importerCount
	}
}

///  Represents a single result of an inline query; for bots only 
public indirect enum InputInlineQueryResult: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  Represents a link to an animated GIF 
	/// - id: Unique identifier of the query result 
	/// - title: Title of the query result 
	/// - thumbnailUrl: URL of the static result thumbnail (JPEG or GIF), if it exists 
	/// - gifUrl: The URL of the GIF-file (file size must not exceed 1MB) 
	/// - gifDuration: Duration of the GIF, in seconds 
	/// - gifWidth: Width of the GIF 
	/// - gifHeight: Height of the GIF 
	/// - replyMarkup: The message reply markup. Must be of type replyMarkupInlineKeyboard or null 
	/// - inputMessageContent: The content of the message to be sent. Must be one of the following types: InputMessageText, InputMessageAnimation, InputMessageLocation, InputMessageVenue or InputMessageContact
	case animatedGif(id: String, title: String, thumbnailUrl: String, gifUrl: String, gifDuration: Int32, gifWidth: Int32, gifHeight: Int32, replyMarkup: ReplyMarkup, inputMessageContent: InputMessageContent)
	///  Represents a link to an animated (i.e. without sound) H.264/MPEG-4 AVC video 
	/// - id: Unique identifier of the query result 
	/// - title: Title of the result 
	/// - thumbnailUrl: URL of the static result thumbnail (JPEG or GIF), if it exists 
	/// - mpeg4Url: The URL of the MPEG4-file (file size must not exceed 1MB) 
	/// - mpeg4Duration: Duration of the video, in seconds 
	/// - mpeg4Width: Width of the video 
	/// - mpeg4Height: Height of the video 
	/// - replyMarkup: The message reply markup. Must be of type replyMarkupInlineKeyboard or null 
	/// - inputMessageContent: The content of the message to be sent. Must be one of the following types: InputMessageText, InputMessageAnimation, InputMessageLocation, InputMessageVenue or InputMessageContact
	case animatedMpeg4(id: String, title: String, thumbnailUrl: String, mpeg4Url: String, mpeg4Duration: Int32, mpeg4Width: Int32, mpeg4Height: Int32, replyMarkup: ReplyMarkup, inputMessageContent: InputMessageContent)
	///  Represents a link to an article or web page 
	/// - id: Unique identifier of the query result 
	/// - url: URL of the result, if it exists 
	/// - hideUrl: True, if the URL must be not shown 
	/// - title: Title of the result 
	/// - description: A short description of the result 
	/// - thumbnailUrl: URL of the result thumbnail, if it exists 
	/// - thumbnailWidth: Thumbnail width, if known 
	/// - thumbnailHeight: Thumbnail height, if known 
	/// - replyMarkup: The message reply markup. Must be of type replyMarkupInlineKeyboard or null 
	/// - inputMessageContent: The content of the message to be sent. Must be one of the following types: InputMessageText, InputMessageLocation, InputMessageVenue or InputMessageContact
	case article(id: String, url: String, hideUrl: Bool, title: String, description: String, thumbnailUrl: String, thumbnailWidth: Int32, thumbnailHeight: Int32, replyMarkup: ReplyMarkup, inputMessageContent: InputMessageContent)
	///  Represents a link to an MP3 audio file 
	/// - id: Unique identifier of the query result 
	/// - title: Title of the audio file 
	/// - performer: Performer of the audio file 
	/// - audioUrl: The URL of the audio file 
	/// - audioDuration: Audio file duration, in seconds 
	/// - replyMarkup: The message reply markup. Must be of type replyMarkupInlineKeyboard or null 
	/// - inputMessageContent: The content of the message to be sent. Must be one of the following types: InputMessageText, InputMessageAudio, InputMessageLocation, InputMessageVenue or InputMessageContact
	case audio(id: String, title: String, performer: String, audioUrl: String, audioDuration: Int32, replyMarkup: ReplyMarkup, inputMessageContent: InputMessageContent)
	///  Represents a user contact 
	/// - id: Unique identifier of the query result 
	/// - contact: User contact 
	/// - thumbnailUrl: URL of the result thumbnail, if it exists 
	/// - thumbnailWidth: Thumbnail width, if known 
	/// - thumbnailHeight: Thumbnail height, if known 
	/// - replyMarkup: The message reply markup. Must be of type replyMarkupInlineKeyboard or null 
	/// - inputMessageContent: The content of the message to be sent. Must be one of the following types: InputMessageText, InputMessageLocation, InputMessageVenue or InputMessageContact
	case contact(id: String, contact: Contact, thumbnailUrl: String, thumbnailWidth: Int32, thumbnailHeight: Int32, replyMarkup: ReplyMarkup, inputMessageContent: InputMessageContent)
	///  Represents a link to a file 
	/// - id: Unique identifier of the query result 
	/// - title: Title of the resulting file 
	/// - description: Short description of the result, if known 
	/// - documentUrl: URL of the file 
	/// - mimeType: MIME type of the file content; only "application/pdf" and "application/zip" are currently allowed 
	/// - thumbnailUrl: The URL of the file thumbnail, if it exists 
	/// - thumbnailWidth: Width of the thumbnail 
	/// - thumbnailHeight: Height of the thumbnail 
	/// - replyMarkup: The message reply markup. Must be of type replyMarkupInlineKeyboard or null 
	/// - inputMessageContent: The content of the message to be sent. Must be one of the following types: InputMessageText, InputMessageDocument, InputMessageLocation, InputMessageVenue or InputMessageContact
	case document(id: String, title: String, description: String, documentUrl: String, mimeType: String, thumbnailUrl: String, thumbnailWidth: Int32, thumbnailHeight: Int32, replyMarkup: ReplyMarkup, inputMessageContent: InputMessageContent)
	///  Represents a game 
	/// - id: Unique identifier of the query result 
	/// - gameShortName: Short name of the game 
	/// - replyMarkup: Message reply markup. Must be of type replyMarkupInlineKeyboard or null
	case game(id: String, gameShortName: String, replyMarkup: ReplyMarkup)
	///  Represents a point on the map 
	/// - id: Unique identifier of the query result 
	/// - location: Location result 
	/// - livePeriod: Amount of time relative to the message sent time until the location can be updated, in seconds 
	/// - title: Title of the result 
	/// - thumbnailUrl: URL of the result thumbnail, if it exists 
	/// - thumbnailWidth: Thumbnail width, if known 
	/// - thumbnailHeight: Thumbnail height, if known 
	/// - replyMarkup: The message reply markup. Must be of type replyMarkupInlineKeyboard or null 
	/// - inputMessageContent: The content of the message to be sent. Must be one of the following types: InputMessageText, InputMessageLocation, InputMessageVenue or InputMessageContact
	case location(id: String, location: Location, livePeriod: Int32, title: String, thumbnailUrl: String, thumbnailWidth: Int32, thumbnailHeight: Int32, replyMarkup: ReplyMarkup, inputMessageContent: InputMessageContent)
	///  Represents link to a JPEG image 
	/// - id: Unique identifier of the query result 
	/// - title: Title of the result, if known 
	/// - description: A short description of the result, if known 
	/// - thumbnailUrl: URL of the photo thumbnail, if it exists 
	/// - photoUrl: The URL of the JPEG photo (photo size must not exceed 5MB) 
	/// - photoWidth: Width of the photo 
	/// - photoHeight: Height of the photo 
	/// - replyMarkup: The message reply markup. Must be of type replyMarkupInlineKeyboard or null 
	/// - inputMessageContent: The content of the message to be sent. Must be one of the following types: InputMessageText, InputMessagePhoto, InputMessageLocation, InputMessageVenue or InputMessageContact
	case photo(id: String, title: String, description: String, thumbnailUrl: String, photoUrl: String, photoWidth: Int32, photoHeight: Int32, replyMarkup: ReplyMarkup, inputMessageContent: InputMessageContent)
	///  Represents a link to a WEBP sticker 
	/// - id: Unique identifier of the query result 
	/// - thumbnailUrl: URL of the sticker thumbnail, if it exists 
	/// - stickerUrl: The URL of the WEBP sticker (sticker file size must not exceed 5MB) 
	/// - stickerWidth: Width of the sticker 
	/// - stickerHeight: Height of the sticker 
	/// - replyMarkup: The message reply markup. Must be of type replyMarkupInlineKeyboard or null 
	/// - inputMessageContent: The content of the message to be sent. Must be one of the following types: InputMessageText, inputMessageSticker, InputMessageLocation, InputMessageVenue or InputMessageContact
	case sticker(id: String, thumbnailUrl: String, stickerUrl: String, stickerWidth: Int32, stickerHeight: Int32, replyMarkup: ReplyMarkup, inputMessageContent: InputMessageContent)
	///  Represents information about a venue 
	/// - id: Unique identifier of the query result 
	/// - venue: Venue result 
	/// - thumbnailUrl: URL of the result thumbnail, if it exists 
	/// - thumbnailWidth: Thumbnail width, if known 
	/// - thumbnailHeight: Thumbnail height, if known 
	/// - replyMarkup: The message reply markup. Must be of type replyMarkupInlineKeyboard or null 
	/// - inputMessageContent: The content of the message to be sent. Must be one of the following types: InputMessageText, InputMessageLocation, InputMessageVenue or InputMessageContact
	case venue(id: String, venue: Venue, thumbnailUrl: String, thumbnailWidth: Int32, thumbnailHeight: Int32, replyMarkup: ReplyMarkup, inputMessageContent: InputMessageContent)
	///  Represents a link to a page containing an embedded video player or a video file 
	/// - id: Unique identifier of the query result 
	/// - title: Title of the result 
	/// - description: A short description of the result, if known 
	/// - thumbnailUrl: The URL of the video thumbnail (JPEG), if it exists 
	/// - videoUrl: URL of the embedded video player or video file 
	/// - mimeType: MIME type of the content of the video URL, only "text/html" or "video/mp4" are currently supported 
	/// - videoWidth: Width of the video 
	/// - videoHeight: Height of the video 
	/// - videoDuration: Video duration, in seconds 
	/// - replyMarkup: The message reply markup. Must be of type replyMarkupInlineKeyboard or null 
	/// - inputMessageContent: The content of the message to be sent. Must be one of the following types: InputMessageText, InputMessageVideo, InputMessageLocation, InputMessageVenue or InputMessageContact
	case video(id: String, title: String, description: String, thumbnailUrl: String, videoUrl: String, mimeType: String, videoWidth: Int32, videoHeight: Int32, videoDuration: Int32, replyMarkup: ReplyMarkup, inputMessageContent: InputMessageContent)
	///  Represents a link to an opus-encoded audio file within an OGG container, single channel audio 
	/// - id: Unique identifier of the query result 
	/// - title: Title of the voice note 
	/// - voiceNoteUrl: The URL of the voice note file 
	/// - voiceNoteDuration: Duration of the voice note, in seconds 
	/// - replyMarkup: The message reply markup. Must be of type replyMarkupInlineKeyboard or null 
	/// - inputMessageContent: The content of the message to be sent. Must be one of the following types: InputMessageText, InputMessageVoiceNote, InputMessageLocation, InputMessageVenue or InputMessageContact
	case voiceNote(id: String, title: String, voiceNoteUrl: String, voiceNoteDuration: Int32, replyMarkup: ReplyMarkup, inputMessageContent: InputMessageContent)
}

///  Represents a single result of an inline query 
public indirect enum InlineQueryResult: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  Represents a link to an article or web page 
	/// - id: Unique identifier of the query result 
	/// - url: URL of the result, if it exists 
	/// - hideUrl: True, if the URL must be not shown 
	/// - title: Title of the result 
	/// - description: A short description of the result 
	/// - thumbnail: Result thumbnail; may be null
	case article(id: String, url: String, hideUrl: Bool, title: String, description: String, thumbnail: PhotoSize?)
	///  Represents a user contact 
	/// - id: Unique identifier of the query result 
	/// - contact: A user contact 
	/// - thumbnail: Result thumbnail; may be null
	case contact(id: String, contact: Contact, thumbnail: PhotoSize?)
	///  Represents a point on the map 
	/// - id: Unique identifier of the query result 
	/// - location: Location result 
	/// - title: Title of the result 
	/// - thumbnail: Result thumbnail; may be null
	case location(id: String, location: Location, title: String, thumbnail: PhotoSize?)
	///  Represents information about a venue 
	/// - id: Unique identifier of the query result 
	/// - venue: Venue result 
	/// - thumbnail: Result thumbnail; may be null
	case venue(id: String, venue: Venue, thumbnail: PhotoSize?)
	///  Represents information about a game 
	/// - id: Unique identifier of the query result 
	/// - game: Game result
	case game(id: String, game: Game)
	///  Represents an animation file 
	/// - id: Unique identifier of the query result 
	/// - animation: Animation file 
	/// - title: Animation title
	case animation(id: String, animation: Animation, title: String)
	///  Represents an audio file 
	/// - id: Unique identifier of the query result 
	/// - audio: Audio file
	case audio(id: String, audio: Audio)
	///  Represents a document 
	/// - id: Unique identifier of the query result 
	/// - document: Document 
	/// - title: Document title 
	/// - description: Document description
	case document(id: String, document: Document, title: String, description: String)
	///  Represents a photo 
	/// - id: Unique identifier of the query result 
	/// - photo: Photo 
	/// - title: Title of the result, if known 
	/// - description: A short description of the result, if known
	case photo(id: String, photo: Photo, title: String, description: String)
	///  Represents a sticker 
	/// - id: Unique identifier of the query result 
	/// - sticker: Sticker
	case sticker(id: String, sticker: Sticker)
	///  Represents a video 
	/// - id: Unique identifier of the query result 
	/// - video: Video 
	/// - title: Title of the video 
	/// - description: Description of the video
	case video(id: String, video: Video, title: String, description: String)
	///  Represents a voice note 
	/// - id: Unique identifier of the query result 
	/// - voiceNote: Voice note 
	/// - title: Title of the voice note
	case voiceNote(id: String, voiceNote: VoiceNote, title: String)
}

///  Represents the results of the inline query. Use sendInlineQueryResultMessage to send the result of the query 
public struct InlineQueryResults: Codable, Equatable, FunctionResult {
	///  Unique identifier of the inline query 
	public let inlineQueryId: TDInt64
	///  The offset for the next request. If empty, there are no more results 
	public let nextOffset: String
	///  Results of the query 
	public let results: [InlineQueryResult]
	///  If non-empty, this text should be shown on the button, which opens a private chat with the bot and sends the bot a start message with the switch_pm_parameter 
	public let switchPmText: String
	///  Parameter for the bot start message
	public let switchPmParameter: String
	/// Represents the results of the inline query. Use sendInlineQueryResultMessage to send the result of the query 
	/// - Parameters:
	///   - inlineQueryId: Unique identifier of the inline query 
	///   - nextOffset: The offset for the next request. If empty, there are no more results 
	///   - results: Results of the query 
	///   - switchPmText: If non-empty, this text should be shown on the button, which opens a private chat with the bot and sends the bot a start message with the switch_pm_parameter 
	///   - switchPmParameter: Parameter for the bot start message
	public init(inlineQueryId: TDInt64, nextOffset: String, results: [InlineQueryResult], switchPmText: String, switchPmParameter: String) {
		self.inlineQueryId = inlineQueryId
		self.nextOffset = nextOffset
		self.results = results
		self.switchPmText = switchPmText
		self.switchPmParameter = switchPmParameter
	}
}

///  Represents a payload of a callback query 
public indirect enum CallbackQueryPayload: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  The payload from a general callback button 
	/// - data: Data that was attached to the callback button
	case data(data: Bytes)
	///  The payload from a game callback button 
	/// - gameShortName: A short name of the game that was attached to the callback button
	case game(gameShortName: String)
}

///  Contains a bot's answer to a callback query 
public struct CallbackQueryAnswer: Codable, Equatable, FunctionResult {
	///  Text of the answer 
	public let text: String
	///  True, if an alert should be shown to the user instead of a toast notification 
	public let showAlert: Bool
	///  URL to be opened
	public let url: String
	/// Contains a bot's answer to a callback query 
	/// - Parameters:
	///   - text: Text of the answer 
	///   - showAlert: True, if an alert should be shown to the user instead of a toast notification 
	///   - url: URL to be opened
	public init(text: String, showAlert: Bool, url: String) {
		self.text = text
		self.showAlert = showAlert
		self.url = url
	}
}

///  Contains the result of a custom request 
public struct CustomRequestResult: Codable, Equatable, FunctionResult {
	///  A JSON-serialized result
	public let result: String
	/// Contains the result of a custom request 
	/// - Parameters:
	///   - result: A JSON-serialized result
	public init(result: String) {
		self.result = result
	}
}

///  Contains one row of the game high score table 
public struct GameHighScore: Codable, Equatable, FunctionResult {
	///  Position in the high score table 
	public let position: Int32
	///  User identifier 
	public let userId: Int32
	///  User score
	public let score: Int32
	/// Contains one row of the game high score table 
	/// - Parameters:
	///   - position: Position in the high score table 
	///   - userId: User identifier 
	///   - score: User score
	public init(position: Int32, userId: Int32, score: Int32) {
		self.position = position
		self.userId = userId
		self.score = score
	}
}

///  Contains a list of game high scores 
public struct GameHighScores: Codable, Equatable, FunctionResult {
	///  A list of game high scores
	public let scores: [GameHighScore]
	/// Contains a list of game high scores 
	/// - Parameters:
	///   - scores: A list of game high scores
	public init(scores: [GameHighScore]) {
		self.scores = scores
	}
}

///  Represents a chat event 
// sourcery: noPrefix = true
public indirect enum ChatEventAction: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  A message was edited 
	/// - oldMessage: The original message before the edit 
	/// - newMessage: The message after it was edited
	case chatEventMessageEdited(oldMessage: Message, newMessage: Message)
	///  A message was deleted 
	/// - message: Deleted message
	case chatEventMessageDeleted(message: Message)
	///  A message was pinned 
	/// - message: Pinned message
	case chatEventMessagePinned(message: Message)
	///  A message was unpinned
	case chatEventMessageUnpinned
	///  A new member joined the chat
	case chatEventMemberJoined
	///  A member left the chat
	case chatEventMemberLeft
	///  A new chat member was invited 
	/// - userId: New member user identifier 
	/// - status: New member status
	case chatEventMemberInvited(userId: Int32, status: ChatMemberStatus)
	///  A chat member has gained/lost administrator status, or the list of their administrator privileges has changed 
	/// - userId: Chat member user identifier 
	/// - oldStatus: Previous status of the chat member 
	/// - newStatus: New status of the chat member
	case chatEventMemberPromoted(userId: Int32, oldStatus: ChatMemberStatus, newStatus: ChatMemberStatus)
	///  A chat member was restricted/unrestricted or banned/unbanned, or the list of their restrictions has changed 
	/// - userId: Chat member user identifier 
	/// - oldStatus: Previous status of the chat member 
	/// - newStatus: New status of the chat member
	case chatEventMemberRestricted(userId: Int32, oldStatus: ChatMemberStatus, newStatus: ChatMemberStatus)
	///  The chat title was changed 
	/// - oldTitle: Previous chat title 
	/// - newTitle: New chat title
	case chatEventTitleChanged(oldTitle: String, newTitle: String)
	///  The chat description was changed 
	/// - oldDescription: Previous chat description 
	/// - newDescription: New chat description
	case chatEventDescriptionChanged(oldDescription: String, newDescription: String)
	///  The chat username was changed 
	/// - oldUsername: Previous chat username 
	/// - newUsername: New chat username
	case chatEventUsernameChanged(oldUsername: String, newUsername: String)
	///  The chat photo was changed 
	/// - oldPhoto: Previous chat photo value; may be null 
	/// - newPhoto: New chat photo value; may be null
	case chatEventPhotoChanged(oldPhoto: ChatPhoto?, newPhoto: ChatPhoto?)
	///  The anyone_can_invite setting of a supergroup chat was toggled 
	/// - anyoneCanInvite: New value of anyone_can_invite
	case chatEventInvitesToggled(anyoneCanInvite: Bool)
	///  The sign_messages setting of a channel was toggled 
	/// - signMessages: New value of sign_messages
	case chatEventSignMessagesToggled(signMessages: Bool)
	///  The supergroup sticker set was changed 
	/// - oldStickerSetId: Previous identifier of the chat sticker set; 0 if none 
	/// - newStickerSetId: New identifier of the chat sticker set; 0 if none
	case chatEventStickerSetChanged(oldStickerSetId: TDInt64, newStickerSetId: TDInt64)
	///  The is_all_history_available setting of a supergroup was toggled 
	/// - isAllHistoryAvailable: New value of is_all_history_available
	case chatEventIsAllHistoryAvailableToggled(isAllHistoryAvailable: Bool)
}

///  Represents a chat event 
public struct ChatEvent: Codable, Equatable, FunctionResult {
	///  Chat event identifier 
	public let id: TDInt64
	///  Point in time (Unix timestamp) when the event happened 
	public let date: Int32
	///  Identifier of the user who performed the action that triggered the event 
	public let userId: Int32
	///  Action performed by the user
	public let action: ChatEventAction
	/// Represents a chat event 
	/// - Parameters:
	///   - id: Chat event identifier 
	///   - date: Point in time (Unix timestamp) when the event happened 
	///   - userId: Identifier of the user who performed the action that triggered the event 
	///   - action: Action performed by the user
	public init(id: TDInt64, date: Int32, userId: Int32, action: ChatEventAction) {
		self.id = id
		self.date = date
		self.userId = userId
		self.action = action
	}
}

///  Contains a list of chat events 
public struct ChatEvents: Codable, Equatable, FunctionResult {
	///  List of events
	public let events: [ChatEvent]
	/// Contains a list of chat events 
	/// - Parameters:
	///   - events: List of events
	public init(events: [ChatEvent]) {
		self.events = events
	}
}

///  Represents a set of filters used to obtain a chat event log 
public struct ChatEventLogFilters: Codable, Equatable, FunctionResult {
	///  True, if message edits should be returned 
	public let messageEdits: Bool
	///  True, if message deletions should be returned 
	public let messageDeletions: Bool
	///  True, if pin/unpin events should be returned 
	public let messagePins: Bool
	///  True, if members joining events should be returned 
	public let memberJoins: Bool
	///  True, if members leaving events should be returned 
	public let memberLeaves: Bool
	///  True, if invited member events should be returned 
	public let memberInvites: Bool
	///  True, if member promotion/demotion events should be returned 
	public let memberPromotions: Bool
	///  True, if member restricted/unrestricted/banned/unbanned events should be returned 
	public let memberRestrictions: Bool
	///  True, if changes in chat information should be returned 
	public let infoChanges: Bool
	///  True, if changes in chat settings should be returned
	public let settingChanges: Bool
	/// Represents a set of filters used to obtain a chat event log 
	/// - Parameters:
	///   - messageEdits: True, if message edits should be returned 
	///   - messageDeletions: True, if message deletions should be returned 
	///   - messagePins: True, if pin/unpin events should be returned 
	///   - memberJoins: True, if members joining events should be returned 
	///   - memberLeaves: True, if members leaving events should be returned 
	///   - memberInvites: True, if invited member events should be returned 
	///   - memberPromotions: True, if member promotion/demotion events should be returned 
	///   - memberRestrictions: True, if member restricted/unrestricted/banned/unbanned events should be returned 
	///   - infoChanges: True, if changes in chat information should be returned 
	///   - settingChanges: True, if changes in chat settings should be returned
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

///  Represents a data needed to subscribe for push notifications. To use specific push notification service, you must specify the correct application platform and upload valid server authentication data at https://my.telegram.org 
public indirect enum DeviceToken: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  A token for Google Cloud Messaging 
	/// - token: Device registration token, may be empty to de-register a device
	case googleCloudMessaging(token: String)
	///  A token for Apple Push Notification service 
	/// - deviceToken: Device token, may be empty to de-register a device 
	/// - isAppSandbox: True, if App Sandbox is enabled
	case applePush(deviceToken: String, isAppSandbox: Bool)
	///  A token for Apple Push Notification service VoIP notifications 
	/// - deviceToken: Device token, may be empty to de-register a device 
	/// - isAppSandbox: True, if App Sandbox is enabled
	case applePushVoIP(deviceToken: String, isAppSandbox: Bool)
	///  A token for Windows Push Notification Services 
	/// - accessToken: The access token that will be used to send notifications, may be empty to de-register a device
	case windowsPush(accessToken: String)
	///  A token for Microsoft Push Notification Service 
	/// - channelUri: Push notification channel URI, may be empty to de-register a device
	case microsoftPush(channelUri: String)
	///  A token for Microsoft Push Notification Service VoIP channel 
	/// - channelUri: Push notification channel URI, may be empty to de-register a device
	case microsoftPushVoIP(channelUri: String)
	///  A token for web Push API 
	/// - endpoint: Absolute URL exposed by the push service where the application server can send push messages, may be empty to de-register a device 
	/// - p256dhBase64url: Base64url-encoded P-256 elliptic curve Diffie-Hellman public key 
	/// - authBase64url: Base64url-encoded authentication secret
	case webPush(endpoint: String, p256dhBase64url: String, authBase64url: String)
	///  A token for Simple Push API for Firefox OS 
	/// - endpoint: Absolute URL exposed by the push service where the application server can send push messages, may be empty to de-register a device
	case simplePush(endpoint: String)
	///  A token for Ubuntu Push Client service 
	/// - token: Token, may be empty to de-register a device
	case ubuntuPush(token: String)
	///  A token for BlackBerry Push Service 
	/// - token: Token, may be empty to de-register a device
	case blackBerryPush(token: String)
	///  A token for Tizen Push Service 
	/// - regId: Push service registration identifier, may be empty to de-register a device
	case tizenPush(regId: String)
}

///  Contains information about a wallpaper 
public struct Wallpaper: Codable, Equatable, FunctionResult {
	///  Unique persistent wallpaper identifier 
	public let id: Int32
	///  Available variants of the wallpaper in different sizes. These photos can only be downloaded; they can't be sent in a message 
	public let sizes: [PhotoSize]
	///  Main color of the wallpaper in RGB24 format; should be treated as background color if no photos are specified
	public let color: Int32
	/// Contains information about a wallpaper 
	/// - Parameters:
	///   - id: Unique persistent wallpaper identifier 
	///   - sizes: Available variants of the wallpaper in different sizes. These photos can only be downloaded; they can't be sent in a message 
	///   - color: Main color of the wallpaper in RGB24 format; should be treated as background color if no photos are specified
	public init(id: Int32, sizes: [PhotoSize], color: Int32) {
		self.id = id
		self.sizes = sizes
		self.color = color
	}
}

///  Contains a list of wallpapers 
public struct Wallpapers: Codable, Equatable, FunctionResult {
	///  A list of wallpapers
	public let wallpapers: [Wallpaper]
	/// Contains a list of wallpapers 
	/// - Parameters:
	///   - wallpapers: A list of wallpapers
	public init(wallpapers: [Wallpaper]) {
		self.wallpapers = wallpapers
	}
}

///  Contains a list of hashtags 
public struct Hashtags: Codable, Equatable, FunctionResult {
	///  A list of hashtags
	public let hashtags: [String]
	/// Contains a list of hashtags 
	/// - Parameters:
	///   - hashtags: A list of hashtags
	public init(hashtags: [String]) {
		self.hashtags = hashtags
	}
}

///  Represents result of checking whether a username can be set for a chat 
public indirect enum CheckChatUsernameResult: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  The username can be set
	case ok
	///  The username is invalid
	case usernameInvalid
	///  The username is occupied
	case usernameOccupied
	///  The user has too much public chats, one of them should be made private first
	case publicChatsTooMuch
	///  The user can't be a member of a public supergroup
	case publicGroupsUnavailable
}

///  Represents the value of an option 
public indirect enum OptionValue: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  Boolean option 
	/// - value: The value of the option
	case boolean(value: Bool)
	///  An unknown option or an option which has a default value
	case empty
	///  An integer option 
	/// - value: The value of the option
	case integer(value: Int32)
	///  A string option 
	/// - value: The value of the option
	case string(value: String)
}

///  Represents a single rule for managing privacy settings 
public indirect enum UserPrivacySettingRule: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  A rule to allow all users to do something
	case allowAll
	///  A rule to allow all of a user's contacts to do something
	case allowContacts
	///  A rule to allow certain specified users to do something 
	/// - userIds: The user identifiers
	case allowUsers(userIds: [Int32])
	///  A rule to restrict all users from doing something
	case restrictAll
	///  A rule to restrict all contacts of a user from doing something
	case restrictContacts
	///  A rule to restrict all specified users from doing something 
	/// - userIds: The user identifiers
	case restrictUsers(userIds: [Int32])
}

///  A list of privacy rules. Rules are matched in the specified order. The first matched rule defines the privacy setting for a given user. If no rule matches, the action is not allowed 
public struct UserPrivacySettingRules: Codable, Equatable, FunctionResult {
	///  A list of rules
	public let rules: [UserPrivacySettingRule]
	/// A list of privacy rules. Rules are matched in the specified order. The first matched rule defines the privacy setting for a given user. If no rule matches, the action is not allowed 
	/// - Parameters:
	///   - rules: A list of rules
	public init(rules: [UserPrivacySettingRule]) {
		self.rules = rules
	}
}

///  Describes available user privacy settings 
public indirect enum UserPrivacySetting: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  A privacy setting for managing whether the user's online status is visible
	case showStatus
	///  A privacy setting for managing whether the user can be invited to chats
	case allowChatInvites
	///  A privacy setting for managing whether the user can be called
	case allowCalls
}

///  Contains information about the period of inactivity after which the current user's account will automatically be deleted 
public struct AccountTtl: Codable, Equatable, FunctionResult {
	///  Number of days of inactivity before the account will be flagged for deletion; should range from 30-366 days
	public let days: Int32
	/// Contains information about the period of inactivity after which the current user's account will automatically be deleted 
	/// - Parameters:
	///   - days: Number of days of inactivity before the account will be flagged for deletion; should range from 30-366 days
	public init(days: Int32) {
		self.days = days
	}
}

///  Contains information about one session in a Telegram application used by the current user 
public struct Session: Codable, Equatable, FunctionResult {
	///  Session identifier 
	public let id: TDInt64
	///  True, if this session is the current session 
	public let isCurrent: Bool
	///  Telegram API identifier, as provided by the application 
	public let apiId: Int32
	///  Name of the application, as provided by the application 
	public let applicationName: String
	///  The version of the application, as provided by the application 
	public let applicationVersion: String
	///  True, if the application is an official application or uses the api_id of an official application 
	public let isOfficialApplication: Bool
	///  Model of the device the application has been run or is running on, as provided by the application 
	public let deviceModel: String
	///  Operating system the application has been run or is running on, as provided by the application 
	public let platform: String
	///  Version of the operating system the application has been run or is running on, as provided by the application 
	public let systemVersion: String
	///  Point in time (Unix timestamp) when the user has logged in 
	public let logInDate: Int32
	///  Point in time (Unix timestamp) when the session was last used 
	public let lastActiveDate: Int32
	///  IP address from which the session was created, in human-readable format 
	public let ip: String
	///  A two-letter country code for the country from which the session was created, based on the IP address 
	public let country: String
	///  Region code from which the session was created, based on the IP address
	public let region: String
	/// Contains information about one session in a Telegram application used by the current user 
	/// - Parameters:
	///   - id: Session identifier 
	///   - isCurrent: True, if this session is the current session 
	///   - apiId: Telegram API identifier, as provided by the application 
	///   - applicationName: Name of the application, as provided by the application 
	///   - applicationVersion: The version of the application, as provided by the application 
	///   - isOfficialApplication: True, if the application is an official application or uses the api_id of an official application 
	///   - deviceModel: Model of the device the application has been run or is running on, as provided by the application 
	///   - platform: Operating system the application has been run or is running on, as provided by the application 
	///   - systemVersion: Version of the operating system the application has been run or is running on, as provided by the application 
	///   - logInDate: Point in time (Unix timestamp) when the user has logged in 
	///   - lastActiveDate: Point in time (Unix timestamp) when the session was last used 
	///   - ip: IP address from which the session was created, in human-readable format 
	///   - country: A two-letter country code for the country from which the session was created, based on the IP address 
	///   - region: Region code from which the session was created, based on the IP address
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

///  Contains a list of sessions 
public struct Sessions: Codable, Equatable, FunctionResult {
	///  List of sessions
	public let sessions: [Session]
	/// Contains a list of sessions 
	/// - Parameters:
	///   - sessions: List of sessions
	public init(sessions: [Session]) {
		self.sessions = sessions
	}
}

///  Contains information about one website the current user is logged in with Telegram 
public struct ConnectedWebsite: Codable, Equatable, FunctionResult {
	///  Website identifier 
	public let id: TDInt64
	///  The domain name of the website 
	public let domainName: String
	///  User identifier of a bot linked with the website 
	public let botUserId: Int32
	///  The version of a browser used to log in 
	public let browser: String
	///  Operating system the browser is running on 
	public let platform: String
	///  Point in time (Unix timestamp) when the user was logged in 
	public let logInDate: Int32
	///  Point in time (Unix timestamp) when obtained authorization was last used 
	public let lastActiveDate: Int32
	///  IP address from which the user was logged in, in human-readable format 
	public let ip: String
	///  Human-readable description of a country and a region, from which the user was logged in, based on the IP address
	public let location: String
	/// Contains information about one website the current user is logged in with Telegram 
	/// - Parameters:
	///   - id: Website identifier 
	///   - domainName: The domain name of the website 
	///   - botUserId: User identifier of a bot linked with the website 
	///   - browser: The version of a browser used to log in 
	///   - platform: Operating system the browser is running on 
	///   - logInDate: Point in time (Unix timestamp) when the user was logged in 
	///   - lastActiveDate: Point in time (Unix timestamp) when obtained authorization was last used 
	///   - ip: IP address from which the user was logged in, in human-readable format 
	///   - location: Human-readable description of a country and a region, from which the user was logged in, based on the IP address
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

///  Contains a list of websites the current user is logged in with Telegram 
public struct ConnectedWebsites: Codable, Equatable, FunctionResult {
	///  List of connected websites
	public let websites: [ConnectedWebsite]
	/// Contains a list of websites the current user is logged in with Telegram 
	/// - Parameters:
	///   - websites: List of connected websites
	public init(websites: [ConnectedWebsite]) {
		self.websites = websites
	}
}

///  Contains information about the availability of the "Report spam" action for a chat 
public struct ChatReportSpamState: Codable, Equatable, FunctionResult {
	///  True, if a prompt with the "Report spam" action should be shown to the user
	public let canReportSpam: Bool
	/// Contains information about the availability of the "Report spam" action for a chat 
	/// - Parameters:
	///   - canReportSpam: True, if a prompt with the "Report spam" action should be shown to the user
	public init(canReportSpam: Bool) {
		self.canReportSpam = canReportSpam
	}
}

///  Describes the reason why a chat is reported 
public indirect enum ChatReportReason: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  The chat contains spam messages
	case spam
	///  The chat promotes violence
	case violence
	///  The chat contains pornographic messages
	case pornography
	///  A custom reason provided by the user 
	/// - text: Report text
	case custom(text: String)
}

///  Contains a public HTTPS link to a message in a public supergroup or channel 
public struct PublicMessageLink: Codable, Equatable, FunctionResult {
	///  Message link 
	public let link: String
	///  HTML-code for embedding the message
	public let html: String
	/// Contains a public HTTPS link to a message in a public supergroup or channel 
	/// - Parameters:
	///   - link: Message link 
	///   - html: HTML-code for embedding the message
	public init(link: String, html: String) {
		self.link = link
		self.html = html
	}
}

///  Represents the type of a file 
public indirect enum FileType: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  The data is not a file
	case none
	///  The file is an animation
	case animation
	///  The file is an audio file
	case audio
	///  The file is a document
	case document
	///  The file is a photo
	case photo
	///  The file is a profile photo
	case profilePhoto
	///  The file was sent to a secret chat (the file type is not known to the server)
	case secret
	///  The file is a sticker
	case sticker
	///  The file is a thumbnail of another file
	case thumbnail
	///  The file type is not yet known
	case unknown
	///  The file is a video
	case video
	///  The file is a video note
	case videoNote
	///  The file is a voice note
	case voiceNote
	///  The file is a wallpaper
	case wallpaper
	///  The file is a thumbnail of a file from a secret chat
	case secretThumbnail
}

///  Contains the storage usage statistics for a specific file type 
public struct StorageStatisticsByFileType: Codable, Equatable, FunctionResult {
	///  File type 
	public let fileType: FileType
	///  Total size of the files 
	public let size: Int53
	///  Total number of files
	public let count: Int32
	/// Contains the storage usage statistics for a specific file type 
	/// - Parameters:
	///   - fileType: File type 
	///   - size: Total size of the files 
	///   - count: Total number of files
	public init(fileType: FileType, size: Int53, count: Int32) {
		self.fileType = fileType
		self.size = size
		self.count = count
	}
}

///  Contains the storage usage statistics for a specific chat 
public struct StorageStatisticsByChat: Codable, Equatable, FunctionResult {
	///  Chat identifier; 0 if none 
	public let chatId: Int53
	///  Total size of the files in the chat 
	public let size: Int53
	///  Total number of files in the chat 
	public let count: Int32
	///  Statistics split by file types
	public let byFileType: [StorageStatisticsByFileType]
	/// Contains the storage usage statistics for a specific chat 
	/// - Parameters:
	///   - chatId: Chat identifier; 0 if none 
	///   - size: Total size of the files in the chat 
	///   - count: Total number of files in the chat 
	///   - byFileType: Statistics split by file types
	public init(chatId: Int53, size: Int53, count: Int32, byFileType: [StorageStatisticsByFileType]) {
		self.chatId = chatId
		self.size = size
		self.count = count
		self.byFileType = byFileType
	}
}

///  Contains the exact storage usage statistics split by chats and file type 
public struct StorageStatistics: Codable, Equatable, FunctionResult {
	///  Total size of files 
	public let size: Int53
	///  Total number of files 
	public let count: Int32
	///  Statistics split by chats
	public let byChat: [StorageStatisticsByChat]
	/// Contains the exact storage usage statistics split by chats and file type 
	/// - Parameters:
	///   - size: Total size of files 
	///   - count: Total number of files 
	///   - byChat: Statistics split by chats
	public init(size: Int53, count: Int32, byChat: [StorageStatisticsByChat]) {
		self.size = size
		self.count = count
		self.byChat = byChat
	}
}

///  Contains approximate storage usage statistics, excluding files of unknown file type 
public struct StorageStatisticsFast: Codable, Equatable, FunctionResult {
	///  Approximate total size of files 
	public let filesSize: Int53
	///  Approximate number of files 
	public let fileCount: Int32
	///  Size of the database
	public let databaseSize: Int53
	/// Contains approximate storage usage statistics, excluding files of unknown file type 
	/// - Parameters:
	///   - filesSize: Approximate total size of files 
	///   - fileCount: Approximate number of files 
	///   - databaseSize: Size of the database
	public init(filesSize: Int53, fileCount: Int32, databaseSize: Int53) {
		self.filesSize = filesSize
		self.fileCount = fileCount
		self.databaseSize = databaseSize
	}
}

///  Represents the type of a network 
public indirect enum NetworkType: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  The network is not available
	case none
	///  A mobile network
	case mobile
	///  A mobile roaming network
	case mobileRoaming
	///  A Wi-Fi network
	case wiFi
	///  A different network type (e.g., Ethernet network)
	case other
}

///  Contains statistics about network usage 
public indirect enum NetworkStatisticsEntry: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  Contains information about the total amount of data that was used to send and receive files 
	/// - fileType: Type of the file the data is part of 
	/// - networkType: Type of the network the data was sent through. Call setNetworkType to maintain the actual network type 
	/// - sentBytes: Total number of bytes sent 
	/// - receivedBytes: Total number of bytes received
	case file(fileType: FileType, networkType: NetworkType, sentBytes: Int53, receivedBytes: Int53)
	///  Contains information about the total amount of data that was used for calls 
	/// - networkType: Type of the network the data was sent through. Call setNetworkType to maintain the actual network type 
	/// - sentBytes: Total number of bytes sent 
	/// - receivedBytes: Total number of bytes received 
	/// - duration: Total call duration, in seconds
	case call(networkType: NetworkType, sentBytes: Int53, receivedBytes: Int53, duration: Double)
}

///  A full list of available network statistic entries 
public struct NetworkStatistics: Codable, Equatable, FunctionResult {
	///  Point in time (Unix timestamp) when the app began collecting statistics 
	public let sinceDate: Int32
	///  Network statistics entries
	public let entries: [NetworkStatisticsEntry]
	/// A full list of available network statistic entries 
	/// - Parameters:
	///   - sinceDate: Point in time (Unix timestamp) when the app began collecting statistics 
	///   - entries: Network statistics entries
	public init(sinceDate: Int32, entries: [NetworkStatisticsEntry]) {
		self.sinceDate = sinceDate
		self.entries = entries
	}
}

///  Describes the current state of the connection to Telegram servers 
public indirect enum ConnectionState: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  Currently waiting for the network to become available. Use SetNetworkType to change the available network type
	case waitingForNetwork
	///  Currently establishing a connection with a proxy server
	case connectingToProxy
	///  Currently establishing a connection to the Telegram servers
	case connecting
	///  Downloading data received while the client was offline
	case updating
	///  There is a working connection to the Telegram servers
	case ready
}

///  Represents the categories of chats for which a list of frequently used chats can be retrieved 
public indirect enum TopChatCategory: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  A category containing frequently used private chats with non-bot users
	case users
	///  A category containing frequently used private chats with bot users
	case bots
	///  A category containing frequently used basic groups and supergroups
	case groups
	///  A category containing frequently used channels
	case channels
	///  A category containing frequently used chats with inline bots sorted by their usage in inline mode
	case inlineBots
	///  A category containing frequently used chats used for calls
	case calls
}

///  Describes the type of a URL linking to an internal Telegram entity 
public indirect enum TMeUrlType: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  A URL linking to a user 
	/// - userId: Identifier of the user
	case user(userId: Int32)
	///  A URL linking to a public supergroup or channel 
	/// - supergroupId: Identifier of the supergroup or channel
	case supergroup(supergroupId: Int53)
	///  A chat invite link 
	/// - info: Chat invite link info
	case chatInvite(info: ChatInviteLinkInfo)
	///  A URL linking to a sticker set 
	/// - stickerSetId: Identifier of the sticker set
	case stickerSet(stickerSetId: TDInt64)
}

///  Represents a URL linking to an internal Telegram entity 
public struct TMeUrl: Codable, Equatable, FunctionResult {
	///  URL 
	public let url: String
	///  Type of the URL
	public let type: TMeUrlType
	/// Represents a URL linking to an internal Telegram entity 
	/// - Parameters:
	///   - url: URL 
	///   - type: Type of the URL
	public init(url: String, type: TMeUrlType) {
		self.url = url
		self.type = type
	}
}

///  Contains a list of t.me URLs 
public struct TMeUrls: Codable, Equatable, FunctionResult {
	///  List of URLs
	public let urls: [TMeUrl]
	/// Contains a list of t.me URLs 
	/// - Parameters:
	///   - urls: List of URLs
	public init(urls: [TMeUrl]) {
		self.urls = urls
	}
}

///  Contains a counter 
public struct Count: Codable, Equatable, FunctionResult {
	///  Count
	public let count: Int32
	/// Contains a counter 
	/// - Parameters:
	///   - count: Count
	public init(count: Int32) {
		self.count = count
	}
}

///  Contains some text 
public struct Text: Codable, Equatable, FunctionResult {
	///  Text
	public let text: String
	/// Contains some text 
	/// - Parameters:
	///   - text: Text
	public init(text: String) {
		self.text = text
	}
}

///  Describes the way the text should be parsed for TextEntities 
public indirect enum TextParseMode: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  The text should be parsed in markdown-style
	case markdown
	///  The text should be parsed in HTML-style
	case hTML
}

///  Contains information about a proxy server 
public indirect enum Proxy: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  An empty proxy server
	case empty
	///  A SOCKS5 proxy server 
	/// - server: Proxy server IP address 
	/// - port: Proxy server port 
	/// - username: Username for logging in 
	/// - password: Password for logging in
	case socks5(server: String, port: Int32, username: String, password: String)
}

///  Describes a sticker that should be added to a sticker set 
public struct InputSticker: Codable, Equatable, FunctionResult {
	///  PNG image with the sticker; must be up to 512 kB in size and fit in a 512x512 square 
	public let pngSticker: InputFile
	///  Emoji corresponding to the sticker 
	public let emojis: String
	///  For masks, position where the mask should be placed; may be null
	public let maskPosition: MaskPosition?
	/// Describes a sticker that should be added to a sticker set 
	/// - Parameters:
	///   - pngSticker: PNG image with the sticker; must be up to 512 kB in size and fit in a 512x512 square 
	///   - emojis: Emoji corresponding to the sticker 
	///   - maskPosition: For masks, position where the mask should be placed; may be null
	public init(pngSticker: InputFile, emojis: String, maskPosition: MaskPosition?) {
		self.pngSticker = pngSticker
		self.emojis = emojis
		self.maskPosition = maskPosition
	}
}

///  Contains notifications about data changes 
public indirect enum Update: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {
	///  The user authorization state has changed 
	/// - authorizationState: New authorization state
	case authorizationState(authorizationState: AuthorizationState)
	///  A new message was received; can also be an outgoing message 
	/// - message: The new message 
	/// - disableNotification: True, if this message must not generate a notification 
	/// - containsMention: True, if the message contains a mention of the current user
	case newMessage(message: Message, disableNotification: Bool, containsMention: Bool)
	///  A request to send a message has reached the Telegram server. This doesn't mean that the message will be sent successfully or even that the send message request will be processed. This update will be sent only if the option "use_quick_ack" is set to true. This update may be sent multiple times for the same message 
	/// - chatId: The chat identifier of the sent message 
	/// - messageId: A temporary message identifier
	case messageSendAcknowledged(chatId: Int53, messageId: Int53)
	///  A message has been successfully sent 
	/// - message: Information about the sent message. Usually only the message identifier, date, and content are changed, but almost all other fields can also change 
	/// - oldMessageId: The previous temporary message identifier
	case messageSendSucceeded(message: Message, oldMessageId: Int53)
	///  A message failed to send. Be aware that some messages being sent can be irrecoverably deleted, in which case updateDeleteMessages will be received instead of this update 
	/// - message: Contains information about the message that failed to send 
	/// - oldMessageId: The previous temporary message identifier 
	/// - errorCode: An error code 
	/// - errorMessage: Error message
	case messageSendFailed(message: Message, oldMessageId: Int53, errorCode: Int32, errorMessage: String)
	///  The message content has changed 
	/// - chatId: Chat identifier 
	/// - messageId: Message identifier 
	/// - newContent: New message content
	case messageContent(chatId: Int53, messageId: Int53, newContent: MessageContent)
	///  A message was edited. Changes in the message content will come in a separate updateMessageContent 
	/// - chatId: Chat identifier 
	/// - messageId: Message identifier 
	/// - editDate: Point in time (Unix timestamp) when the message was edited 
	/// - replyMarkup: New message reply markup; may be null
	case messageEdited(chatId: Int53, messageId: Int53, editDate: Int32, replyMarkup: ReplyMarkup?)
	///  The view count of the message has changed 
	/// - chatId: Chat identifier 
	/// - messageId: Message identifier 
	/// - views: New value of the view count
	case messageViews(chatId: Int53, messageId: Int53, views: Int32)
	///  The message content was opened. Updates voice note messages to "listened", video note messages to "viewed" and starts the TTL timer for self-destructing messages 
	/// - chatId: Chat identifier 
	/// - messageId: Message identifier
	case messageContentOpened(chatId: Int53, messageId: Int53)
	///  A message with an unread mention was read 
	/// - chatId: Chat identifier 
	/// - messageId: Message identifier 
	/// - unreadMentionCount: The new number of unread mention messages left in the chat
	case messageMentionRead(chatId: Int53, messageId: Int53, unreadMentionCount: Int32)
	///  A new chat has been loaded/created. This update is guaranteed to come before the chat identifier is returned to the client. The chat field changes will be reported through separate updates 
	/// - chat: The chat
	case newChat(chat: Chat)
	///  The title of a chat was changed 
	/// - chatId: Chat identifier 
	/// - title: The new chat title
	case chatTitle(chatId: Int53, title: String)
	///  A chat photo was changed 
	/// - chatId: Chat identifier 
	/// - photo: The new chat photo; may be null
	case chatPhoto(chatId: Int53, photo: ChatPhoto?)
	///  The last message of a chat was changed. If last_message is null then the last message in the chat became unknown. Some new unknown messages might be added to the chat in this case 
	/// - chatId: Chat identifier 
	/// - lastMessage: The new last message in the chat; may be null 
	/// - order: New value of the chat order
	case chatLastMessage(chatId: Int53, lastMessage: Message?, order: TDInt64)
	///  The order of the chat in the chats list has changed. Instead of this update updateChatLastMessage, updateChatIsPinned or updateChatDraftMessage might be sent 
	/// - chatId: Chat identifier 
	/// - order: New value of the order
	case chatOrder(chatId: Int53, order: TDInt64)
	///  A chat was pinned or unpinned 
	/// - chatId: Chat identifier 
	/// - isPinned: New value of is_pinned 
	/// - order: New value of the chat order
	case chatIsPinned(chatId: Int53, isPinned: Bool, order: TDInt64)
	///  Incoming messages were read or number of unread messages has been changed 
	/// - chatId: Chat identifier 
	/// - lastReadInboxMessageId: Identifier of the last read incoming message 
	/// - unreadCount: The number of unread messages left in the chat
	case chatReadInbox(chatId: Int53, lastReadInboxMessageId: Int53, unreadCount: Int32)
	///  Outgoing messages were read 
	/// - chatId: Chat identifier 
	/// - lastReadOutboxMessageId: Identifier of last read outgoing message
	case chatReadOutbox(chatId: Int53, lastReadOutboxMessageId: Int53)
	///  The chat unread_mention_count has changed 
	/// - chatId: Chat identifier 
	/// - unreadMentionCount: The number of unread mention messages left in the chat
	case chatUnreadMentionCount(chatId: Int53, unreadMentionCount: Int32)
	///  Notification settings for some chats were updated 
	/// - scope: Types of chats for which notification settings were updated 
	/// - notificationSettings: The new notification settings
	case notificationSettings(scope: NotificationSettingsScope, notificationSettings: NotificationSettings)
	///  The default chat reply markup was changed. Can occur because new messages with reply markup were received or because an old reply markup was hidden by the user 
	/// - chatId: Chat identifier 
	/// - replyMarkupMessageId: Identifier of the message from which reply markup needs to be used; 0 if there is no default custom reply markup in the chat
	case chatReplyMarkup(chatId: Int53, replyMarkupMessageId: Int53)
	///  A draft has changed. Be aware that the update may come in the currently opened chat but with old content of the draft. If the user has changed the content of the draft, this update shouldn't be applied 
	/// - chatId: Chat identifier 
	/// - draftMessage: The new draft message; may be null 
	/// - order: New value of the chat order
	case chatDraftMessage(chatId: Int53, draftMessage: DraftMessage?, order: TDInt64)
	///  Some messages were deleted 
	/// - chatId: Chat identifier 
	/// - messageIds: Identifiers of the deleted messages 
	/// - isPermanent: True, if the messages are permanently deleted by a user (as opposed to just becoming unaccessible) 
	/// - fromCache: True, if the messages are deleted only from the cache and can possibly be retrieved again in the future
	case deleteMessages(chatId: Int53, messageIds: [Int53], isPermanent: Bool, fromCache: Bool)
	///  User activity in the chat has changed 
	/// - chatId: Chat identifier 
	/// - userId: Identifier of a user performing an action 
	/// - action: The action description
	case userChatAction(chatId: Int53, userId: Int32, action: ChatAction)
	///  The user went online or offline 
	/// - userId: User identifier 
	/// - status: New status of the user
	case userStatus(userId: Int32, status: UserStatus)
	///  Some data of a user has changed. This update is guaranteed to come before the user identifier is returned to the client 
	/// - user: New data about the user
	case user(user: User)
	///  Some data of a basic group has changed. This update is guaranteed to come before the basic group identifier is returned to the client 
	/// - basicGroup: New data about the group
	case basicGroup(basicGroup: BasicGroup)
	///  Some data of a supergroup or a channel has changed. This update is guaranteed to come before the supergroup identifier is returned to the client 
	/// - supergroup: New data about the supergroup
	case supergroup(supergroup: Supergroup)
	///  Some data of a secret chat has changed. This update is guaranteed to come before the secret chat identifier is returned to the client 
	/// - secretChat: New data about the secret chat
	case secretChat(secretChat: SecretChat)
	///  Some data from userFullInfo has been changed 
	/// - userId: User identifier 
	/// - userFullInfo: New full information about the user
	case userFullInfo(userId: Int32, userFullInfo: UserFullInfo)
	///  Some data from basicGroupFullInfo has been changed 
	/// - basicGroupId: Identifier of a basic group 
	/// - basicGroupFullInfo: New full information about the group
	case basicGroupFullInfo(basicGroupId: Int32, basicGroupFullInfo: BasicGroupFullInfo)
	///  Some data from supergroupFullInfo has been changed 
	/// - supergroupId: Identifier of the supergroup or channel 
	/// - supergroupFullInfo: New full information about the supergroup
	case supergroupFullInfo(supergroupId: Int32, supergroupFullInfo: SupergroupFullInfo)
	///  Service notification from the server. Upon receiving this the client must show a popup with the content of the notification 
	/// - type: Notification type 
	/// - content: Notification content
	case serviceNotification(type: String, content: MessageContent)
	///  Information about a file was updated 
	/// - file: New data about the file
	case file(file: File)
	///  The file generation process needs to be started by the client 
	/// - generationId: Unique identifier for the generation process 
	/// - originalPath: The path to a file from which a new file is generated, may be empty 
	/// - destinationPath: The path to a file that should be created and where the new file should be generated 
	/// - conversion: String specifying the conversion applied to the original file. If conversion is "#url#" than original_path contains a HTTP/HTTPS URL of a file, which should be downloaded by the client
	case fileGenerationStart(generationId: TDInt64, originalPath: String, destinationPath: String, conversion: String)
	///  File generation is no longer needed 
	/// - generationId: Unique identifier for the generation process
	case fileGenerationStop(generationId: TDInt64)
	///  New call was created or information about a call was updated 
	/// - call: New data about a call
	case call(call: Call)
	///  Some privacy setting rules have been changed 
	/// - setting: The privacy setting 
	/// - rules: New privacy rules
	case userPrivacySettingRules(setting: UserPrivacySetting, rules: UserPrivacySettingRules)
	///  Number of unread messages has changed. This update is sent only if a message database is used 
	/// - unreadCount: Total number of unread messages 
	/// - unreadUnmutedCount: Total number of unread messages in unmuted chats
	case unreadMessageCount(unreadCount: Int32, unreadUnmutedCount: Int32)
	///  An option changed its value 
	/// - name: The option name 
	/// - value: The new option value
	case option(name: String, value: OptionValue)
	///  The list of installed sticker sets was updated 
	/// - isMasks: True, if the list of installed mask sticker sets was updated 
	/// - stickerSetIds: The new list of installed ordinary sticker sets
	case installedStickerSets(isMasks: Bool, stickerSetIds: [Int64])
	///  The list of trending sticker sets was updated or some of them were viewed 
	/// - stickerSets: The new list of trending sticker sets
	case trendingStickerSets(stickerSets: StickerSets)
	///  The list of recently used stickers was updated 
	/// - isAttached: True, if the list of stickers attached to photo or video files was updated, otherwise the list of sent stickers is updated 
	/// - stickerIds: The new list of file identifiers of recently used stickers
	case recentStickers(isAttached: Bool, stickerIds: [Int32])
	///  The list of favorite stickers was updated 
	/// - stickerIds: The new list of file identifiers of favorite stickers
	case favoriteStickers(stickerIds: [Int32])
	///  The list of saved animations was updated 
	/// - animationIds: The new list of file identifiers of saved animations
	case savedAnimations(animationIds: [Int32])
	///  The connection state has changed 
	/// - state: The new connection state
	case connectionState(state: ConnectionState)
	///  A new incoming inline query; for bots only 
	/// - id: Unique query identifier 
	/// - senderUserId: Identifier of the user who sent the query 
	/// - userLocation: User location, provided by the client; may be null 
	/// - query: Text of the query 
	/// - offset: Offset of the first entry to return
	case newInlineQuery(id: TDInt64, senderUserId: Int32, userLocation: Location?, query: String, offset: String)
	///  The user has chosen a result of an inline query; for bots only 
	/// - senderUserId: Identifier of the user who sent the query 
	/// - userLocation: User location, provided by the client; may be null 
	/// - query: Text of the query 
	/// - resultId: Identifier of the chosen result 
	/// - inlineMessageId: Identifier of the sent inline message, if known
	case newChosenInlineResult(senderUserId: Int32, userLocation: Location?, query: String, resultId: String, inlineMessageId: String)
	///  A new incoming callback query; for bots only 
	/// - id: Unique query identifier 
	/// - senderUserId: Identifier of the user who sent the query 
	/// - chatId: Identifier of the chat, in which the query was sent 
	/// - messageId: Identifier of the message, from which the query originated 
	/// - chatInstance: Identifier that uniquely corresponds to the chat to which the message was sent 
	/// - payload: Query payload
	case newCallbackQuery(id: TDInt64, senderUserId: Int32, chatId: Int53, messageId: Int53, chatInstance: TDInt64, payload: CallbackQueryPayload)
	///  A new incoming callback query from a message sent via a bot; for bots only 
	/// - id: Unique query identifier 
	/// - senderUserId: Identifier of the user who sent the query 
	/// - inlineMessageId: Identifier of the inline message, from which the query originated 
	/// - chatInstance: An identifier uniquely corresponding to the chat a message was sent to 
	/// - payload: Query payload
	case newInlineCallbackQuery(id: TDInt64, senderUserId: Int32, inlineMessageId: String, chatInstance: TDInt64, payload: CallbackQueryPayload)
	///  A new incoming shipping query; for bots only. Only for invoices with flexible price 
	/// - id: Unique query identifier 
	/// - senderUserId: Identifier of the user who sent the query 
	/// - invoicePayload: Invoice payload 
	/// - shippingAddress: User shipping address
	case newShippingQuery(id: TDInt64, senderUserId: Int32, invoicePayload: String, shippingAddress: ShippingAddress)
	///  A new incoming pre-checkout query; for bots only. Contains full information about a checkout 
	/// - id: Unique query identifier 
	/// - senderUserId: Identifier of the user who sent the query 
	/// - currency: Currency for the product price 
	/// - totalAmount: Total price for the product, in the minimal quantity of the currency 
	/// - invoicePayload: Invoice payload 
	/// - shippingOptionId: Identifier of a shipping option chosen by the user; may be empty if not applicable 
	/// - orderInfo: Information about the order; may be null
	case newPreCheckoutQuery(id: TDInt64, senderUserId: Int32, currency: String, totalAmount: Int53, invoicePayload: Bytes, shippingOptionId: String, orderInfo: OrderInfo?)
	///  A new incoming event; for bots only 
	/// - event: A JSON-serialized event
	case newCustomEvent(event: String)
	///  A new incoming query; for bots only 
	/// - id: The query identifier 
	/// - data: JSON-serialized query data 
	/// - timeout: Query timeout
	case newCustomQuery(id: TDInt64, data: String, timeout: Int32)
}

///  A simple object containing a number; for testing only 
public struct TestInt: Codable, Equatable, FunctionResult {
	///  Number
	public let value: Int32
	/// A simple object containing a number; for testing only 
	/// - Parameters:
	///   - value: Number
	public init(value: Int32) {
		self.value = value
	}
}

///  A simple object containing a string; for testing only 
public struct TestString: Codable, Equatable, FunctionResult {
	///  String
	public let value: String
	/// A simple object containing a string; for testing only 
	/// - Parameters:
	///   - value: String
	public init(value: String) {
		self.value = value
	}
}

///  A simple object containing a sequence of bytes; for testing only 
public struct TestBytes: Codable, Equatable, FunctionResult {
	///  Bytes
	public let value: Bytes
	/// A simple object containing a sequence of bytes; for testing only 
	/// - Parameters:
	///   - value: Bytes
	public init(value: Bytes) {
		self.value = value
	}
}

///  A simple object containing a vector of numbers; for testing only 
public struct TestVectorInt: Codable, Equatable, FunctionResult {
	///  Vector of numbers
	public let value: [Int32]
	/// A simple object containing a vector of numbers; for testing only 
	/// - Parameters:
	///   - value: Vector of numbers
	public init(value: [Int32]) {
		self.value = value
	}
}

///  A simple object containing a vector of objects that hold a number; for testing only 
public struct TestVectorIntObject: Codable, Equatable, FunctionResult {
	///  Vector of objects
	public let value: [TestInt]
	/// A simple object containing a vector of objects that hold a number; for testing only 
	/// - Parameters:
	///   - value: Vector of objects
	public init(value: [TestInt]) {
		self.value = value
	}
}

///  A simple object containing a vector of strings; for testing only 
public struct TestVectorString: Codable, Equatable, FunctionResult {
	///  Vector of strings
	public let value: [String]
	/// A simple object containing a vector of strings; for testing only 
	/// - Parameters:
	///   - value: Vector of strings
	public init(value: [String]) {
		self.value = value
	}
}

///  A simple object containing a vector of objects that hold a string; for testing only 
public struct TestVectorStringObject: Codable, Equatable, FunctionResult {
	///  Vector of objects
	public let value: [TestString]
	/// A simple object containing a vector of objects that hold a string; for testing only 
	/// - Parameters:
	///   - value: Vector of objects
	public init(value: [TestString]) {
		self.value = value
	}
}

///  Returns the current authorization state; this is an offline request. For informational purposes only. Use updateAuthorizationState instead to maintain the current authorization state
public struct GetAuthorizationState: Codable, Equatable, TDFunction {
	public typealias Result = AuthorizationState
	/// Returns the current authorization state; this is an offline request. For informational purposes only. Use updateAuthorizationState instead to maintain the current authorization state
	public init() {
	}
}

///  Sets the parameters for TDLib initialization. Works only when the current authorization state is authorizationStateWaitTdlibParameters 
public struct SetTdlibParameters: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Parameters
	public let parameters: TdlibParameters
	/// Sets the parameters for TDLib initialization. Works only when the current authorization state is authorizationStateWaitTdlibParameters 
	/// - Parameters:
	///   - parameters: Parameters
	public init(parameters: TdlibParameters) {
		self.parameters = parameters
	}
}

///  Checks the database encryption key for correctness. Works only when the current authorization state is authorizationStateWaitEncryptionKey 
public struct CheckDatabaseEncryptionKey: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Encryption key to check or set up
	public let encryptionKey: Bytes
	/// Checks the database encryption key for correctness. Works only when the current authorization state is authorizationStateWaitEncryptionKey 
	/// - Parameters:
	///   - encryptionKey: Encryption key to check or set up
	public init(encryptionKey: Bytes) {
		self.encryptionKey = encryptionKey
	}
}

///  Sets the phone number of the user and sends an authentication code to the user. Works only when the current authorization state is authorizationStateWaitPhoneNumber 
public struct SetAuthenticationPhoneNumber: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  The phone number of the user, in international format 
	public let phoneNumber: String
	///  Pass true if the authentication code may be sent via flash call to the specified phone number 
	public let allowFlashCall: Bool
	///  Pass true if the phone number is used on the current device. Ignored if allow_flash_call is false
	public let isCurrentPhoneNumber: Bool
	/// Sets the phone number of the user and sends an authentication code to the user. Works only when the current authorization state is authorizationStateWaitPhoneNumber 
	/// - Parameters:
	///   - phoneNumber: The phone number of the user, in international format 
	///   - allowFlashCall: Pass true if the authentication code may be sent via flash call to the specified phone number 
	///   - isCurrentPhoneNumber: Pass true if the phone number is used on the current device. Ignored if allow_flash_call is false
	public init(phoneNumber: String, allowFlashCall: Bool, isCurrentPhoneNumber: Bool) {
		self.phoneNumber = phoneNumber
		self.allowFlashCall = allowFlashCall
		self.isCurrentPhoneNumber = isCurrentPhoneNumber
	}
}

///  Re-sends an authentication code to the user. Works only when the current authorization state is authorizationStateWaitCode and the next_code_type of the result is not null
public struct ResendAuthenticationCode: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	/// Re-sends an authentication code to the user. Works only when the current authorization state is authorizationStateWaitCode and the next_code_type of the result is not null
	public init() {
	}
}

///  Checks the authentication code. Works only when the current authorization state is authorizationStateWaitCode 
public struct CheckAuthenticationCode: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  The verification code received via SMS, Telegram message, phone call, or flash call 
	public let code: String
	///  If the user is not yet registered, the first name of the user; 1-255 characters 
	public let firstName: String
	///  If the user is not yet registered; the last name of the user; optional; 0-255 characters
	public let lastName: String
	/// Checks the authentication code. Works only when the current authorization state is authorizationStateWaitCode 
	/// - Parameters:
	///   - code: The verification code received via SMS, Telegram message, phone call, or flash call 
	///   - firstName: If the user is not yet registered, the first name of the user; 1-255 characters 
	///   - lastName: If the user is not yet registered; the last name of the user; optional; 0-255 characters
	public init(code: String, firstName: String, lastName: String) {
		self.code = code
		self.firstName = firstName
		self.lastName = lastName
	}
}

///  Checks the authentication password for correctness. Works only when the current authorization state is authorizationStateWaitPassword 
public struct CheckAuthenticationPassword: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  The password to check
	public let password: String
	/// Checks the authentication password for correctness. Works only when the current authorization state is authorizationStateWaitPassword 
	/// - Parameters:
	///   - password: The password to check
	public init(password: String) {
		self.password = password
	}
}

///  Requests to send a password recovery code to an email address that was previously set up. Works only when the current authorization state is authorizationStateWaitPassword
public struct RequestAuthenticationPasswordRecovery: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	/// Requests to send a password recovery code to an email address that was previously set up. Works only when the current authorization state is authorizationStateWaitPassword
	public init() {
	}
}

///  Recovers the password with a password recovery code sent to an email address that was previously set up. Works only when the current authorization state is authorizationStateWaitPassword 
public struct RecoverAuthenticationPassword: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Recovery code to check
	public let recoveryCode: String
	/// Recovers the password with a password recovery code sent to an email address that was previously set up. Works only when the current authorization state is authorizationStateWaitPassword 
	/// - Parameters:
	///   - recoveryCode: Recovery code to check
	public init(recoveryCode: String) {
		self.recoveryCode = recoveryCode
	}
}

///  Checks the authentication token of a bot; to log in as a bot. Works only when the current authorization state is authorizationStateWaitPhoneNumber. Can be used instead of setAuthenticationPhoneNumber and checkAuthenticationCode to log in 
public struct CheckAuthenticationBotToken: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  The bot token
	public let token: String
	/// Checks the authentication token of a bot; to log in as a bot. Works only when the current authorization state is authorizationStateWaitPhoneNumber. Can be used instead of setAuthenticationPhoneNumber and checkAuthenticationCode to log in 
	/// - Parameters:
	///   - token: The bot token
	public init(token: String) {
		self.token = token
	}
}

///  Closes the TDLib instance after a proper logout. Requires an available network connection. All local data will be destroyed. After the logout completes, updateAuthorizationState with authorizationStateClosed will be sent
public struct LogOut: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	/// Closes the TDLib instance after a proper logout. Requires an available network connection. All local data will be destroyed. After the logout completes, updateAuthorizationState with authorizationStateClosed will be sent
	public init() {
	}
}

///  Closes the TDLib instance. All databases will be flushed to disk and properly closed. After the close completes, updateAuthorizationState with authorizationStateClosed will be sent
public struct Close: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	/// Closes the TDLib instance. All databases will be flushed to disk and properly closed. After the close completes, updateAuthorizationState with authorizationStateClosed will be sent
	public init() {
	}
}

///  Closes the TDLib instance, destroying all local data without a proper logout. The current user session will remain in the list of all active sessions. All local data will be destroyed. After the destruction completes updateAuthorizationState with authorizationStateClosed will be sent
public struct Destroy: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	/// Closes the TDLib instance, destroying all local data without a proper logout. The current user session will remain in the list of all active sessions. All local data will be destroyed. After the destruction completes updateAuthorizationState with authorizationStateClosed will be sent
	public init() {
	}
}

///  Changes the database encryption key. Usually the encryption key is never changed and is stored in some OS keychain 
public struct SetDatabaseEncryptionKey: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  New encryption key
	public let newEncryptionKey: Bytes
	/// Changes the database encryption key. Usually the encryption key is never changed and is stored in some OS keychain 
	/// - Parameters:
	///   - newEncryptionKey: New encryption key
	public init(newEncryptionKey: Bytes) {
		self.newEncryptionKey = newEncryptionKey
	}
}

///  Returns the current state of 2-step verification
public struct GetPasswordState: Codable, Equatable, TDFunction {
	public typealias Result = PasswordState
	/// Returns the current state of 2-step verification
	public init() {
	}
}

///  Changes the password for the user. If a new recovery email address is specified, then the error EMAIL_UNCONFIRMED is returned and the password change will not be applied until the new recovery email address has been confirmed. The application should periodically call getPasswordState to check whether the new email address has been confirmed 
public struct SetPassword: Codable, Equatable, TDFunction {
	public typealias Result = PasswordState
	///  Previous password of the user 
	public let oldPassword: String
	///  New password of the user; may be empty to remove the password 
	public let newPassword: String
	///  New password hint; may be empty 
	public let newHint: String
	///  Pass true if the recovery email address should be changed 
	public let setRecoveryEmailAddress: Bool
	///  New recovery email address; may be empty
	public let newRecoveryEmailAddress: String
	/// Changes the password for the user. If a new recovery email address is specified, then the error EMAIL_UNCONFIRMED is returned and the password change will not be applied until the new recovery email address has been confirmed. The application should periodically call getPasswordState to check whether the new email address has been confirmed 
	/// - Parameters:
	///   - oldPassword: Previous password of the user 
	///   - newPassword: New password of the user; may be empty to remove the password 
	///   - newHint: New password hint; may be empty 
	///   - setRecoveryEmailAddress: Pass true if the recovery email address should be changed 
	///   - newRecoveryEmailAddress: New recovery email address; may be empty
	public init(oldPassword: String, newPassword: String, newHint: String, setRecoveryEmailAddress: Bool, newRecoveryEmailAddress: String) {
		self.oldPassword = oldPassword
		self.newPassword = newPassword
		self.newHint = newHint
		self.setRecoveryEmailAddress = setRecoveryEmailAddress
		self.newRecoveryEmailAddress = newRecoveryEmailAddress
	}
}

///  Returns a recovery email address that was previously set up. This method can be used to verify a password provided by the user 
public struct GetRecoveryEmailAddress: Codable, Equatable, TDFunction {
	public typealias Result = RecoveryEmailAddress
	///  The password for the current user
	public let password: String
	/// Returns a recovery email address that was previously set up. This method can be used to verify a password provided by the user 
	/// - Parameters:
	///   - password: The password for the current user
	public init(password: String) {
		self.password = password
	}
}

///  Changes the recovery email address of the user. If a new recovery email address is specified, then the error EMAIL_UNCONFIRMED is returned and the email address will not be changed until the new email has been confirmed. The application should periodically call getPasswordState to check whether the email address has been confirmed. -If new_recovery_email_address is the same as the email address that is currently set up, this call succeeds immediately and aborts all other requests waiting for an email confirmation 
public struct SetRecoveryEmailAddress: Codable, Equatable, TDFunction {
	public typealias Result = PasswordState
	///  Password of the current user 
	public let password: String
	///  New recovery email address
	public let newRecoveryEmailAddress: String
	/// Changes the recovery email address of the user. If a new recovery email address is specified, then the error EMAIL_UNCONFIRMED is returned and the email address will not be changed until the new email has been confirmed. The application should periodically call getPasswordState to check whether the email address has been confirmed. -If new_recovery_email_address is the same as the email address that is currently set up, this call succeeds immediately and aborts all other requests waiting for an email confirmation 
	/// - Parameters:
	///   - password: Password of the current user 
	///   - newRecoveryEmailAddress: New recovery email address
	public init(password: String, newRecoveryEmailAddress: String) {
		self.password = password
		self.newRecoveryEmailAddress = newRecoveryEmailAddress
	}
}

///  Requests to send a password recovery code to an email address that was previously set up
public struct RequestPasswordRecovery: Codable, Equatable, TDFunction {
	public typealias Result = PasswordRecoveryInfo
	/// Requests to send a password recovery code to an email address that was previously set up
	public init() {
	}
}

///  Recovers the password using a recovery code sent to an email address that was previously set up 
public struct RecoverPassword: Codable, Equatable, TDFunction {
	public typealias Result = PasswordState
	///  Recovery code to check
	public let recoveryCode: String
	/// Recovers the password using a recovery code sent to an email address that was previously set up 
	/// - Parameters:
	///   - recoveryCode: Recovery code to check
	public init(recoveryCode: String) {
		self.recoveryCode = recoveryCode
	}
}

///  Creates a new temporary password for processing payments 
public struct CreateTemporaryPassword: Codable, Equatable, TDFunction {
	public typealias Result = TemporaryPasswordState
	///  Persistent user password 
	public let password: String
	///  Time during which the temporary password will be valid, in seconds; should be between 60 and 86400
	public let validFor: Int32
	/// Creates a new temporary password for processing payments 
	/// - Parameters:
	///   - password: Persistent user password 
	///   - validFor: Time during which the temporary password will be valid, in seconds; should be between 60 and 86400
	public init(password: String, validFor: Int32) {
		self.password = password
		self.validFor = validFor
	}
}

///  Returns information about the current temporary password
public struct GetTemporaryPasswordState: Codable, Equatable, TDFunction {
	public typealias Result = TemporaryPasswordState
	/// Returns information about the current temporary password
	public init() {
	}
}

///  Handles a DC_UPDATE push service notification. Can be called before authorization 
public struct ProcessDcUpdate: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Value of the "dc" parameter of the notification 
	public let dc: String
	///  Value of the "addr" parameter of the notification
	public let addr: String
	/// Handles a DC_UPDATE push service notification. Can be called before authorization 
	/// - Parameters:
	///   - dc: Value of the "dc" parameter of the notification 
	///   - addr: Value of the "addr" parameter of the notification
	public init(dc: String, addr: String) {
		self.dc = dc
		self.addr = addr
	}
}

///  Returns the current user
public struct GetMe: Codable, Equatable, TDFunction {
	public typealias Result = User
	/// Returns the current user
	public init() {
	}
}

///  Returns information about a user by their identifier. This is an offline request if the current user is not a bot 
public struct GetUser: Codable, Equatable, TDFunction {
	public typealias Result = User
	///  User identifier
	public let userId: Int32
	/// Returns information about a user by their identifier. This is an offline request if the current user is not a bot 
	/// - Parameters:
	///   - userId: User identifier
	public init(userId: Int32) {
		self.userId = userId
	}
}

///  Returns full information about a user by their identifier 
public struct GetUserFullInfo: Codable, Equatable, TDFunction {
	public typealias Result = UserFullInfo
	///  User identifier
	public let userId: Int32
	/// Returns full information about a user by their identifier 
	/// - Parameters:
	///   - userId: User identifier
	public init(userId: Int32) {
		self.userId = userId
	}
}

///  Returns information about a basic group by its identifier. This is an offline request if the current user is not a bot 
public struct GetBasicGroup: Codable, Equatable, TDFunction {
	public typealias Result = BasicGroup
	///  Basic group identifier
	public let basicGroupId: Int32
	/// Returns information about a basic group by its identifier. This is an offline request if the current user is not a bot 
	/// - Parameters:
	///   - basicGroupId: Basic group identifier
	public init(basicGroupId: Int32) {
		self.basicGroupId = basicGroupId
	}
}

///  Returns full information about a basic group by its identifier 
public struct GetBasicGroupFullInfo: Codable, Equatable, TDFunction {
	public typealias Result = BasicGroupFullInfo
	///  Basic group identifier
	public let basicGroupId: Int32
	/// Returns full information about a basic group by its identifier 
	/// - Parameters:
	///   - basicGroupId: Basic group identifier
	public init(basicGroupId: Int32) {
		self.basicGroupId = basicGroupId
	}
}

///  Returns information about a supergroup or channel by its identifier. This is an offline request if the current user is not a bot 
public struct GetSupergroup: Codable, Equatable, TDFunction {
	public typealias Result = Supergroup
	///  Supergroup or channel identifier
	public let supergroupId: Int32
	/// Returns information about a supergroup or channel by its identifier. This is an offline request if the current user is not a bot 
	/// - Parameters:
	///   - supergroupId: Supergroup or channel identifier
	public init(supergroupId: Int32) {
		self.supergroupId = supergroupId
	}
}

///  Returns full information about a supergroup or channel by its identifier, cached for up to 1 minute 
public struct GetSupergroupFullInfo: Codable, Equatable, TDFunction {
	public typealias Result = SupergroupFullInfo
	///  Supergroup or channel identifier
	public let supergroupId: Int32
	/// Returns full information about a supergroup or channel by its identifier, cached for up to 1 minute 
	/// - Parameters:
	///   - supergroupId: Supergroup or channel identifier
	public init(supergroupId: Int32) {
		self.supergroupId = supergroupId
	}
}

///  Returns information about a secret chat by its identifier. This is an offline request 
public struct GetSecretChat: Codable, Equatable, TDFunction {
	public typealias Result = SecretChat
	///  Secret chat identifier
	public let secretChatId: Int32
	/// Returns information about a secret chat by its identifier. This is an offline request 
	/// - Parameters:
	///   - secretChatId: Secret chat identifier
	public init(secretChatId: Int32) {
		self.secretChatId = secretChatId
	}
}

///  Returns information about a chat by its identifier, this is an offline request if the current user is not a bot 
public struct GetChat: Codable, Equatable, TDFunction {
	public typealias Result = Chat
	///  Chat identifier
	public let chatId: Int53
	/// Returns information about a chat by its identifier, this is an offline request if the current user is not a bot 
	/// - Parameters:
	///   - chatId: Chat identifier
	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

///  Returns information about a message 
public struct GetMessage: Codable, Equatable, TDFunction {
	public typealias Result = Message
	///  Identifier of the chat the message belongs to 
	public let chatId: Int53
	///  Identifier of the message to get
	public let messageId: Int53
	/// Returns information about a message 
	/// - Parameters:
	///   - chatId: Identifier of the chat the message belongs to 
	///   - messageId: Identifier of the message to get
	public init(chatId: Int53, messageId: Int53) {
		self.chatId = chatId
		self.messageId = messageId
	}
}

///  Returns information about a message that is replied by given message 
public struct GetRepliedMessage: Codable, Equatable, TDFunction {
	public typealias Result = Message
	///  Identifier of the chat the message belongs to 
	public let chatId: Int53
	///  Identifier of the message reply to which get
	public let messageId: Int53
	/// Returns information about a message that is replied by given message 
	/// - Parameters:
	///   - chatId: Identifier of the chat the message belongs to 
	///   - messageId: Identifier of the message reply to which get
	public init(chatId: Int53, messageId: Int53) {
		self.chatId = chatId
		self.messageId = messageId
	}
}

///  Returns information about a pinned chat message 
public struct GetChatPinnedMessage: Codable, Equatable, TDFunction {
	public typealias Result = Message
	///  Identifier of the chat the message belongs to
	public let chatId: Int53
	/// Returns information about a pinned chat message 
	/// - Parameters:
	///   - chatId: Identifier of the chat the message belongs to
	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

///  Returns information about messages. If a message is not found, returns null on the corresponding position of the result 
public struct GetMessages: Codable, Equatable, TDFunction {
	public typealias Result = Messages
	///  Identifier of the chat the messages belong to 
	public let chatId: Int53
	///  Identifiers of the messages to get
	public let messageIds: [Int53]
	/// Returns information about messages. If a message is not found, returns null on the corresponding position of the result 
	/// - Parameters:
	///   - chatId: Identifier of the chat the messages belong to 
	///   - messageIds: Identifiers of the messages to get
	public init(chatId: Int53, messageIds: [Int53]) {
		self.chatId = chatId
		self.messageIds = messageIds
	}
}

///  Returns information about a file; this is an offline request 
public struct GetFile: Codable, Equatable, TDFunction {
	public typealias Result = File
	///  Identifier of the file to get
	public let fileId: Int32
	/// Returns information about a file; this is an offline request 
	/// - Parameters:
	///   - fileId: Identifier of the file to get
	public init(fileId: Int32) {
		self.fileId = fileId
	}
}

///  Returns information about a file by its remote ID; this is an offline request. Can be used to register a URL as a file for further uploading, or sending as a message 
public struct GetRemoteFile: Codable, Equatable, TDFunction {
	public typealias Result = File
	///  Remote identifier of the file to get 
	public let remoteFileId: String
	///  File type, if known
	public let fileType: FileType
	/// Returns information about a file by its remote ID; this is an offline request. Can be used to register a URL as a file for further uploading, or sending as a message 
	/// - Parameters:
	///   - remoteFileId: Remote identifier of the file to get 
	///   - fileType: File type, if known
	public init(remoteFileId: String, fileType: FileType) {
		self.remoteFileId = remoteFileId
		self.fileType = fileType
	}
}

///  Returns an ordered list of chats. Chats are sorted by the pair (order, chat_id) in decreasing order. (For example, to get a list of chats from the beginning, the offset_order should be equal to 2^63 - 1). -For optimal performance the number of returned chats is chosen by the library. 
public struct GetChats: Codable, Equatable, TDFunction {
	public typealias Result = Chats
	///  Chat order to return chats from 
	public let offsetOrder: TDInt64
	///  Chat identifier to return chats from 
	public let offsetChatId: Int53
	///  The maximum number of chats to be returned. It is possible that fewer chats than the limit are returned even if the end of the list is not reached
	public let limit: Int32
	/// Returns an ordered list of chats. Chats are sorted by the pair (order, chat_id) in decreasing order. (For example, to get a list of chats from the beginning, the offset_order should be equal to 2^63 - 1). -For optimal performance the number of returned chats is chosen by the library. 
	/// - Parameters:
	///   - offsetOrder: Chat order to return chats from 
	///   - offsetChatId: Chat identifier to return chats from 
	///   - limit: The maximum number of chats to be returned. It is possible that fewer chats than the limit are returned even if the end of the list is not reached
	public init(offsetOrder: TDInt64, offsetChatId: Int53, limit: Int32) {
		self.offsetOrder = offsetOrder
		self.offsetChatId = offsetChatId
		self.limit = limit
	}
}

///  Searches a public chat by its username. Currently only private chats, supergroups and channels can be public. Returns the chat if found; otherwise an error is returned 
public struct SearchPublicChat: Codable, Equatable, TDFunction {
	public typealias Result = Chat
	///  Username to be resolved
	public let username: String
	/// Searches a public chat by its username. Currently only private chats, supergroups and channels can be public. Returns the chat if found; otherwise an error is returned 
	/// - Parameters:
	///   - username: Username to be resolved
	public init(username: String) {
		self.username = username
	}
}

///  Searches public chats by looking for specified query in their username and title. Currently only private chats, supergroups and channels can be public. Returns a meaningful number of results. Returns nothing if the length of the searched username prefix is less than 5. Excludes private chats with contacts and chats from the chat list from the results 
public struct SearchPublicChats: Codable, Equatable, TDFunction {
	public typealias Result = Chats
	///  Query to search for
	public let query: String
	/// Searches public chats by looking for specified query in their username and title. Currently only private chats, supergroups and channels can be public. Returns a meaningful number of results. Returns nothing if the length of the searched username prefix is less than 5. Excludes private chats with contacts and chats from the chat list from the results 
	/// - Parameters:
	///   - query: Query to search for
	public init(query: String) {
		self.query = query
	}
}

///  Searches for the specified query in the title and username of already known chats, this is an offline request. Returns chats in the order seen in the chat list 
public struct SearchChats: Codable, Equatable, TDFunction {
	public typealias Result = Chats
	///  Query to search for. If the query is empty, returns up to 20 recently found chats 
	public let query: String
	///  Maximum number of chats to be returned
	public let limit: Int32
	/// Searches for the specified query in the title and username of already known chats, this is an offline request. Returns chats in the order seen in the chat list 
	/// - Parameters:
	///   - query: Query to search for. If the query is empty, returns up to 20 recently found chats 
	///   - limit: Maximum number of chats to be returned
	public init(query: String, limit: Int32) {
		self.query = query
		self.limit = limit
	}
}

///  Searches for the specified query in the title and username of already known chats via request to the server. Returns chats in the order seen in the chat list 
public struct SearchChatsOnServer: Codable, Equatable, TDFunction {
	public typealias Result = Chats
	///  Query to search for 
	public let query: String
	///  Maximum number of chats to be returned
	public let limit: Int32
	/// Searches for the specified query in the title and username of already known chats via request to the server. Returns chats in the order seen in the chat list 
	/// - Parameters:
	///   - query: Query to search for 
	///   - limit: Maximum number of chats to be returned
	public init(query: String, limit: Int32) {
		self.query = query
		self.limit = limit
	}
}

///  Returns a list of frequently used chats. Supported only if the chat info database is enabled 
public struct GetTopChats: Codable, Equatable, TDFunction {
	public typealias Result = Chats
	///  Category of chats to be returned 
	public let category: TopChatCategory
	///  Maximum number of chats to be returned; up to 30
	public let limit: Int32
	/// Returns a list of frequently used chats. Supported only if the chat info database is enabled 
	/// - Parameters:
	///   - category: Category of chats to be returned 
	///   - limit: Maximum number of chats to be returned; up to 30
	public init(category: TopChatCategory, limit: Int32) {
		self.category = category
		self.limit = limit
	}
}

///  Removes a chat from the list of frequently used chats. Supported only if the chat info database is enabled 
public struct RemoveTopChat: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Category of frequently used chats 
	public let category: TopChatCategory
	///  Chat identifier
	public let chatId: Int53
	/// Removes a chat from the list of frequently used chats. Supported only if the chat info database is enabled 
	/// - Parameters:
	///   - category: Category of frequently used chats 
	///   - chatId: Chat identifier
	public init(category: TopChatCategory, chatId: Int53) {
		self.category = category
		self.chatId = chatId
	}
}

///  Adds a chat to the list of recently found chats. The chat is added to the beginning of the list. If the chat is already in the list, it will be removed from the list first 
public struct AddRecentlyFoundChat: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Identifier of the chat to add
	public let chatId: Int53
	/// Adds a chat to the list of recently found chats. The chat is added to the beginning of the list. If the chat is already in the list, it will be removed from the list first 
	/// - Parameters:
	///   - chatId: Identifier of the chat to add
	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

///  Removes a chat from the list of recently found chats 
public struct RemoveRecentlyFoundChat: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Identifier of the chat to be removed
	public let chatId: Int53
	/// Removes a chat from the list of recently found chats 
	/// - Parameters:
	///   - chatId: Identifier of the chat to be removed
	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

///  Clears the list of recently found chats
public struct ClearRecentlyFoundChats: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	/// Clears the list of recently found chats
	public init() {
	}
}

///  Checks whether a username can be set for a chat 
public struct CheckChatUsername: Codable, Equatable, TDFunction {
	public typealias Result = CheckChatUsernameResult
	///  Chat identifier; should be identifier of a supergroup chat, or a channel chat, or a private chat with self, or zero if chat is being created 
	public let chatId: TDInt64
	///  Username to be checked
	public let username: String
	/// Checks whether a username can be set for a chat 
	/// - Parameters:
	///   - chatId: Chat identifier; should be identifier of a supergroup chat, or a channel chat, or a private chat with self, or zero if chat is being created 
	///   - username: Username to be checked
	public init(chatId: TDInt64, username: String) {
		self.chatId = chatId
		self.username = username
	}
}

///  Returns a list of public chats created by the user
public struct GetCreatedPublicChats: Codable, Equatable, TDFunction {
	public typealias Result = Chats
	/// Returns a list of public chats created by the user
	public init() {
	}
}

///  Returns a list of common chats with a given user. Chats are sorted by their type and creation date 
public struct GetGroupsInCommon: Codable, Equatable, TDFunction {
	public typealias Result = Chats
	///  User identifier 
	public let userId: Int32
	///  Chat identifier starting from which to return chats; use 0 for the first request 
	public let offsetChatId: Int53
	///  Maximum number of chats to be returned; up to 100
	public let limit: Int32
	/// Returns a list of common chats with a given user. Chats are sorted by their type and creation date 
	/// - Parameters:
	///   - userId: User identifier 
	///   - offsetChatId: Chat identifier starting from which to return chats; use 0 for the first request 
	///   - limit: Maximum number of chats to be returned; up to 100
	public init(userId: Int32, offsetChatId: Int53, limit: Int32) {
		self.userId = userId
		self.offsetChatId = offsetChatId
		self.limit = limit
	}
}

///  Returns messages in a chat. The messages are returned in a reverse chronological order (i.e., in order of decreasing message_id). -For optimal performance the number of returned messages is chosen by the library. This is an offline request if only_local is true 
public struct GetChatHistory: Codable, Equatable, TDFunction {
	public typealias Result = Messages
	///  Chat identifier 
	public let chatId: Int53
	///  Identifier of the message starting from which history must be fetched; use 0 to get results from the beginning (i.e., from oldest to newest) 
	public let fromMessageId: Int53
	///  Specify 0 to get results from exactly the from_message_id or a negative offset to get the specified message and some newer messages 
	public let offset: Int32
	///  The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than -offset. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached 
	public let limit: Int32
	///  If true, returns only messages that are available locally without sending network requests
	public let onlyLocal: Bool
	/// Returns messages in a chat. The messages are returned in a reverse chronological order (i.e., in order of decreasing message_id). -For optimal performance the number of returned messages is chosen by the library. This is an offline request if only_local is true 
	/// - Parameters:
	///   - chatId: Chat identifier 
	///   - fromMessageId: Identifier of the message starting from which history must be fetched; use 0 to get results from the beginning (i.e., from oldest to newest) 
	///   - offset: Specify 0 to get results from exactly the from_message_id or a negative offset to get the specified message and some newer messages 
	///   - limit: The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than -offset. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached 
	///   - onlyLocal: If true, returns only messages that are available locally without sending network requests
	public init(chatId: Int53, fromMessageId: Int53, offset: Int32, limit: Int32, onlyLocal: Bool) {
		self.chatId = chatId
		self.fromMessageId = fromMessageId
		self.offset = offset
		self.limit = limit
		self.onlyLocal = onlyLocal
	}
}

///  Deletes all messages in the chat only for the user. Cannot be used in channels and public supergroups 
public struct DeleteChatHistory: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Chat identifier 
	public let chatId: Int53
	///  Pass true if the chat should be removed from the chats list
	public let removeFromChatList: Bool
	/// Deletes all messages in the chat only for the user. Cannot be used in channels and public supergroups 
	/// - Parameters:
	///   - chatId: Chat identifier 
	///   - removeFromChatList: Pass true if the chat should be removed from the chats list
	public init(chatId: Int53, removeFromChatList: Bool) {
		self.chatId = chatId
		self.removeFromChatList = removeFromChatList
	}
}

///  Searches for messages with given words in the chat. Returns the results in reverse chronological order, i.e. in order of decreasing message_id. Cannot be used in secret chats with a non-empty query -(searchSecretMessages should be used instead), or without an enabled message database. For optimal performance the number of returned messages is chosen by the library 
public struct SearchChatMessages: Codable, Equatable, TDFunction {
	public typealias Result = Messages
	///  Identifier of the chat in which to search messages 
	public let chatId: Int53
	///  Query to search for 
	public let query: String
	///  If not 0, only messages sent by the specified user will be returned. Not supported in secret chats 
	public let senderUserId: Int32
	///  Identifier of the message starting from which history must be fetched; use 0 to get results from the beginning 
	public let fromMessageId: Int53
	///  Specify 0 to get results from exactly the from_message_id or a negative offset to get the specified message and some newer messages 
	public let offset: Int32
	///  The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than -offset. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached 
	public let limit: Int32
	///  Filter for message content in the search results
	public let filter: SearchMessagesFilter
	/// Searches for messages with given words in the chat. Returns the results in reverse chronological order, i.e. in order of decreasing message_id. Cannot be used in secret chats with a non-empty query -(searchSecretMessages should be used instead), or without an enabled message database. For optimal performance the number of returned messages is chosen by the library 
	/// - Parameters:
	///   - chatId: Identifier of the chat in which to search messages 
	///   - query: Query to search for 
	///   - senderUserId: If not 0, only messages sent by the specified user will be returned. Not supported in secret chats 
	///   - fromMessageId: Identifier of the message starting from which history must be fetched; use 0 to get results from the beginning 
	///   - offset: Specify 0 to get results from exactly the from_message_id or a negative offset to get the specified message and some newer messages 
	///   - limit: The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than -offset. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached 
	///   - filter: Filter for message content in the search results
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

///  Searches for messages in all chats except secret chats. Returns the results in reverse chronological order (i.e., in order of decreasing (date, chat_id, message_id)). -For optimal performance the number of returned messages is chosen by the library 
public struct SearchMessages: Codable, Equatable, TDFunction {
	public typealias Result = Messages
	///  Query to search for 
	public let query: String
	///  The date of the message starting from which the results should be fetched. Use 0 or any date in the future to get results from the beginning 
	public let offsetDate: Int32
	///  The chat identifier of the last found message, or 0 for the first request 
	public let offsetChatId: Int53
	///  The message identifier of the last found message, or 0 for the first request 
	public let offsetMessageId: Int53
	///  The maximum number of messages to be returned, up to 100. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached
	public let limit: Int32
	/// Searches for messages in all chats except secret chats. Returns the results in reverse chronological order (i.e., in order of decreasing (date, chat_id, message_id)). -For optimal performance the number of returned messages is chosen by the library 
	/// - Parameters:
	///   - query: Query to search for 
	///   - offsetDate: The date of the message starting from which the results should be fetched. Use 0 or any date in the future to get results from the beginning 
	///   - offsetChatId: The chat identifier of the last found message, or 0 for the first request 
	///   - offsetMessageId: The message identifier of the last found message, or 0 for the first request 
	///   - limit: The maximum number of messages to be returned, up to 100. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached
	public init(query: String, offsetDate: Int32, offsetChatId: Int53, offsetMessageId: Int53, limit: Int32) {
		self.query = query
		self.offsetDate = offsetDate
		self.offsetChatId = offsetChatId
		self.offsetMessageId = offsetMessageId
		self.limit = limit
	}
}

///  Searches for messages in secret chats. Returns the results in reverse chronological order. For optimal performance the number of returned messages is chosen by the library 
public struct SearchSecretMessages: Codable, Equatable, TDFunction {
	public typealias Result = FoundMessages
	///  Identifier of the chat in which to search. Specify 0 to search in all secret chats 
	public let chatId: Int53
	///  Query to search for. If empty, searchChatMessages should be used instead 
	public let query: String
	///  The identifier from the result of a previous request, use 0 to get results from the beginning 
	public let fromSearchId: TDInt64
	///  Maximum number of messages to be returned; up to 100. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached 
	public let limit: Int32
	///  A filter for the content of messages in the search results
	public let filter: SearchMessagesFilter
	/// Searches for messages in secret chats. Returns the results in reverse chronological order. For optimal performance the number of returned messages is chosen by the library 
	/// - Parameters:
	///   - chatId: Identifier of the chat in which to search. Specify 0 to search in all secret chats 
	///   - query: Query to search for. If empty, searchChatMessages should be used instead 
	///   - fromSearchId: The identifier from the result of a previous request, use 0 to get results from the beginning 
	///   - limit: Maximum number of messages to be returned; up to 100. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached 
	///   - filter: A filter for the content of messages in the search results
	public init(chatId: Int53, query: String, fromSearchId: TDInt64, limit: Int32, filter: SearchMessagesFilter) {
		self.chatId = chatId
		self.query = query
		self.fromSearchId = fromSearchId
		self.limit = limit
		self.filter = filter
	}
}

///  Searches for call messages. Returns the results in reverse chronological order (i. e., in order of decreasing message_id). For optimal performance the number of returned messages is chosen by the library 
public struct SearchCallMessages: Codable, Equatable, TDFunction {
	public typealias Result = Messages
	///  Identifier of the message from which to search; use 0 to get results from the beginning 
	public let fromMessageId: Int53
	///  The maximum number of messages to be returned; up to 100. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached 
	public let limit: Int32
	///  If true, returns only messages with missed calls
	public let onlyMissed: Bool
	/// Searches for call messages. Returns the results in reverse chronological order (i. e., in order of decreasing message_id). For optimal performance the number of returned messages is chosen by the library 
	/// - Parameters:
	///   - fromMessageId: Identifier of the message from which to search; use 0 to get results from the beginning 
	///   - limit: The maximum number of messages to be returned; up to 100. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached 
	///   - onlyMissed: If true, returns only messages with missed calls
	public init(fromMessageId: Int53, limit: Int32, onlyMissed: Bool) {
		self.fromMessageId = fromMessageId
		self.limit = limit
		self.onlyMissed = onlyMissed
	}
}

///  Returns information about the recent locations of chat members that were sent to the chat. Returns up to 1 location message per user 
public struct SearchChatRecentLocationMessages: Codable, Equatable, TDFunction {
	public typealias Result = Messages
	///  Chat identifier 
	public let chatId: Int53
	///  Maximum number of messages to be returned
	public let limit: Int32
	/// Returns information about the recent locations of chat members that were sent to the chat. Returns up to 1 location message per user 
	/// - Parameters:
	///   - chatId: Chat identifier 
	///   - limit: Maximum number of messages to be returned
	public init(chatId: Int53, limit: Int32) {
		self.chatId = chatId
		self.limit = limit
	}
}

///  Returns all active live locations that should be updated by the client. The list is persistent across application restarts only if the message database is used
public struct GetActiveLiveLocationMessages: Codable, Equatable, TDFunction {
	public typealias Result = Messages
	/// Returns all active live locations that should be updated by the client. The list is persistent across application restarts only if the message database is used
	public init() {
	}
}

///  Returns the last message sent in a chat no later than the specified date 
public struct GetChatMessageByDate: Codable, Equatable, TDFunction {
	public typealias Result = Message
	///  Chat identifier 
	public let chatId: Int53
	///  Point in time (Unix timestamp) relative to which to search for messages
	public let date: Int32
	/// Returns the last message sent in a chat no later than the specified date 
	/// - Parameters:
	///   - chatId: Chat identifier 
	///   - date: Point in time (Unix timestamp) relative to which to search for messages
	public init(chatId: Int53, date: Int32) {
		self.chatId = chatId
		self.date = date
	}
}

///  Returns a public HTTPS link to a message. Available only for messages in public supergroups and channels 
public struct GetPublicMessageLink: Codable, Equatable, TDFunction {
	public typealias Result = PublicMessageLink
	///  Identifier of the chat to which the message belongs 
	public let chatId: Int53
	///  Identifier of the message 
	public let messageId: Int53
	///  Pass true if a link for a whole media album should be returned
	public let forAlbum: Bool
	/// Returns a public HTTPS link to a message. Available only for messages in public supergroups and channels 
	/// - Parameters:
	///   - chatId: Identifier of the chat to which the message belongs 
	///   - messageId: Identifier of the message 
	///   - forAlbum: Pass true if a link for a whole media album should be returned
	public init(chatId: Int53, messageId: Int53, forAlbum: Bool) {
		self.chatId = chatId
		self.messageId = messageId
		self.forAlbum = forAlbum
	}
}

///  Sends a message. Returns the sent message 
public struct SendMessage: Codable, Equatable, TDFunction {
	public typealias Result = Message
	///  Target chat 
	public let chatId: Int53
	///  Identifier of the message to reply to or 0 
	public let replyToMessageId: Int53
	///  Pass true to disable notification for the message. Not supported in secret chats 
	public let disableNotification: Bool
	///  Pass true if the message is sent from the background 
	public let fromBackground: Bool
	///  Markup for replying to the message; for bots only 
	public let replyMarkup: ReplyMarkup?
	///  The content of the message to be sent
	public let inputMessageContent: InputMessageContent
	/// Sends a message. Returns the sent message 
	/// - Parameters:
	///   - chatId: Target chat 
	///   - replyToMessageId: Identifier of the message to reply to or 0 
	///   - disableNotification: Pass true to disable notification for the message. Not supported in secret chats 
	///   - fromBackground: Pass true if the message is sent from the background 
	///   - replyMarkup: Markup for replying to the message; for bots only 
	///   - inputMessageContent: The content of the message to be sent
	public init(chatId: Int53, replyToMessageId: Int53, disableNotification: Bool, fromBackground: Bool, replyMarkup: ReplyMarkup?, inputMessageContent: InputMessageContent) {
		self.chatId = chatId
		self.replyToMessageId = replyToMessageId
		self.disableNotification = disableNotification
		self.fromBackground = fromBackground
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
	}
}

///  Sends messages grouped together into an album. Currently only photo and video messages can be grouped into an album. Returns sent messages 
public struct SendMessageAlbum: Codable, Equatable, TDFunction {
	public typealias Result = Messages
	///  Target chat 
	public let chatId: Int53
	///  Identifier of a message to reply to or 0 
	public let replyToMessageId: Int53
	///  Pass true to disable notification for the messages. Not supported in secret chats 
	public let disableNotification: Bool
	///  Pass true if the messages are sent from the background 
	public let fromBackground: Bool
	///  Contents of messages to be sent
	public let inputMessageContents: [InputMessageContent]
	/// Sends messages grouped together into an album. Currently only photo and video messages can be grouped into an album. Returns sent messages 
	/// - Parameters:
	///   - chatId: Target chat 
	///   - replyToMessageId: Identifier of a message to reply to or 0 
	///   - disableNotification: Pass true to disable notification for the messages. Not supported in secret chats 
	///   - fromBackground: Pass true if the messages are sent from the background 
	///   - inputMessageContents: Contents of messages to be sent
	public init(chatId: Int53, replyToMessageId: Int53, disableNotification: Bool, fromBackground: Bool, inputMessageContents: [InputMessageContent]) {
		self.chatId = chatId
		self.replyToMessageId = replyToMessageId
		self.disableNotification = disableNotification
		self.fromBackground = fromBackground
		self.inputMessageContents = inputMessageContents
	}
}

///  Invites a bot to a chat (if it is not yet a member) and sends it the /start command. Bots can't be invited to a private chat other than the chat with the bot. Bots can't be invited to channels (although they can be added as admins) and secret chats. Returns the sent message 
public struct SendBotStartMessage: Codable, Equatable, TDFunction {
	public typealias Result = Message
	///  Identifier of the bot 
	public let botUserId: Int32
	///  Identifier of the target chat 
	public let chatId: Int53
	///  A hidden parameter sent to the bot for deep linking purposes (https://api.telegram.org/bots#deep-linking)
	public let parameter: String
	/// Invites a bot to a chat (if it is not yet a member) and sends it the /start command. Bots can't be invited to a private chat other than the chat with the bot. Bots can't be invited to channels (although they can be added as admins) and secret chats. Returns the sent message 
	/// - Parameters:
	///   - botUserId: Identifier of the bot 
	///   - chatId: Identifier of the target chat 
	///   - parameter: A hidden parameter sent to the bot for deep linking purposes (https://api.telegram.org/bots#deep-linking)
	public init(botUserId: Int32, chatId: Int53, parameter: String) {
		self.botUserId = botUserId
		self.chatId = chatId
		self.parameter = parameter
	}
}

///  Sends the result of an inline query as a message. Returns the sent message. Always clears a chat draft message 
public struct SendInlineQueryResultMessage: Codable, Equatable, TDFunction {
	public typealias Result = Message
	///  Target chat 
	public let chatId: Int53
	///  Identifier of a message to reply to or 0 
	public let replyToMessageId: Int53
	///  Pass true to disable notification for the message. Not supported in secret chats 
	public let disableNotification: Bool
	///  Pass true if the message is sent from background 
	public let fromBackground: Bool
	///  Identifier of the inline query 
	public let queryId: TDInt64
	///  Identifier of the inline result
	public let resultId: String
	/// Sends the result of an inline query as a message. Returns the sent message. Always clears a chat draft message 
	/// - Parameters:
	///   - chatId: Target chat 
	///   - replyToMessageId: Identifier of a message to reply to or 0 
	///   - disableNotification: Pass true to disable notification for the message. Not supported in secret chats 
	///   - fromBackground: Pass true if the message is sent from background 
	///   - queryId: Identifier of the inline query 
	///   - resultId: Identifier of the inline result
	public init(chatId: Int53, replyToMessageId: Int53, disableNotification: Bool, fromBackground: Bool, queryId: TDInt64, resultId: String) {
		self.chatId = chatId
		self.replyToMessageId = replyToMessageId
		self.disableNotification = disableNotification
		self.fromBackground = fromBackground
		self.queryId = queryId
		self.resultId = resultId
	}
}

///  Forwards previously sent messages. Returns the forwarded messages in the same order as the message identifiers passed in message_ids. If a message can't be forwarded, null will be returned instead of the message 
public struct ForwardMessages: Codable, Equatable, TDFunction {
	public typealias Result = Messages
	///  Identifier of the chat to which to forward messages 
	public let chatId: Int53
	///  Identifier of the chat from which to forward messages 
	public let fromChatId: Int53
	///  Identifiers of the messages to forward 
	public let messageIds: [Int53]
	///  Pass true to disable notification for the message, doesn't work if messages are forwarded to a secret chat 
	public let disableNotification: Bool
	///  Pass true if the message is sent from the background 
	public let fromBackground: Bool
	///  True, if the messages should be grouped into an album after forwarding. For this to work, no more than 10 messages may be forwarded, and all of them must be photo or video messages
	public let asAlbum: Bool
	/// Forwards previously sent messages. Returns the forwarded messages in the same order as the message identifiers passed in message_ids. If a message can't be forwarded, null will be returned instead of the message 
	/// - Parameters:
	///   - chatId: Identifier of the chat to which to forward messages 
	///   - fromChatId: Identifier of the chat from which to forward messages 
	///   - messageIds: Identifiers of the messages to forward 
	///   - disableNotification: Pass true to disable notification for the message, doesn't work if messages are forwarded to a secret chat 
	///   - fromBackground: Pass true if the message is sent from the background 
	///   - asAlbum: True, if the messages should be grouped into an album after forwarding. For this to work, no more than 10 messages may be forwarded, and all of them must be photo or video messages
	public init(chatId: Int53, fromChatId: Int53, messageIds: [Int53], disableNotification: Bool, fromBackground: Bool, asAlbum: Bool) {
		self.chatId = chatId
		self.fromChatId = fromChatId
		self.messageIds = messageIds
		self.disableNotification = disableNotification
		self.fromBackground = fromBackground
		self.asAlbum = asAlbum
	}
}

///  Changes the current TTL setting (sets a new self-destruct timer) in a secret chat and sends the corresponding message 
public struct SendChatSetTtlMessage: Codable, Equatable, TDFunction {
	public typealias Result = Message
	///  Chat identifier 
	public let chatId: Int53
	///  New TTL value, in seconds
	public let ttl: Int32
	/// Changes the current TTL setting (sets a new self-destruct timer) in a secret chat and sends the corresponding message 
	/// - Parameters:
	///   - chatId: Chat identifier 
	///   - ttl: New TTL value, in seconds
	public init(chatId: Int53, ttl: Int32) {
		self.chatId = chatId
		self.ttl = ttl
	}
}

///  Sends a notification about a screenshot taken in a chat. Supported only in private and secret chats 
public struct SendChatScreenshotTakenNotification: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Chat identifier
	public let chatId: Int53
	/// Sends a notification about a screenshot taken in a chat. Supported only in private and secret chats 
	/// - Parameters:
	///   - chatId: Chat identifier
	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

///  Deletes messages 
public struct DeleteMessages: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Chat identifier 
	public let chatId: Int53
	///  Identifiers of the messages to be deleted 
	public let messageIds: [Int53]
	///  Pass true to try to delete outgoing messages for all chat members (may fail if messages are too old). Always true for supergroups, channels and secret chats
	public let revoke: Bool
	/// Deletes messages 
	/// - Parameters:
	///   - chatId: Chat identifier 
	///   - messageIds: Identifiers of the messages to be deleted 
	///   - revoke: Pass true to try to delete outgoing messages for all chat members (may fail if messages are too old). Always true for supergroups, channels and secret chats
	public init(chatId: Int53, messageIds: [Int53], revoke: Bool) {
		self.chatId = chatId
		self.messageIds = messageIds
		self.revoke = revoke
	}
}

///  Deletes all messages sent by the specified user to a chat. Supported only in supergroups; requires can_delete_messages administrator privileges 
public struct DeleteChatMessagesFromUser: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Chat identifier 
	public let chatId: Int53
	///  User identifier
	public let userId: Int32
	/// Deletes all messages sent by the specified user to a chat. Supported only in supergroups; requires can_delete_messages administrator privileges 
	/// - Parameters:
	///   - chatId: Chat identifier 
	///   - userId: User identifier
	public init(chatId: Int53, userId: Int32) {
		self.chatId = chatId
		self.userId = userId
	}
}

///  Edits the text of a message (or a text of a game message). Non-bot users can edit messages for a limited period of time. Returns the edited message after the edit is completed on the server side 
public struct EditMessageText: Codable, Equatable, TDFunction {
	public typealias Result = Message
	///  The chat the message belongs to 
	public let chatId: Int53
	///  Identifier of the message 
	public let messageId: Int53
	///  The new message reply markup; for bots only 
	public let replyMarkup: ReplyMarkup?
	///  New text content of the message. Should be of type InputMessageText
	public let inputMessageContent: InputMessageContent
	/// Edits the text of a message (or a text of a game message). Non-bot users can edit messages for a limited period of time. Returns the edited message after the edit is completed on the server side 
	/// - Parameters:
	///   - chatId: The chat the message belongs to 
	///   - messageId: Identifier of the message 
	///   - replyMarkup: The new message reply markup; for bots only 
	///   - inputMessageContent: New text content of the message. Should be of type InputMessageText
	public init(chatId: Int53, messageId: Int53, replyMarkup: ReplyMarkup?, inputMessageContent: InputMessageContent) {
		self.chatId = chatId
		self.messageId = messageId
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
	}
}

///  Edits the message content of a live location. Messages can be edited for a limited period of time specified in the live location. Returns the edited message after the edit is completed server-side 
public struct EditMessageLiveLocation: Codable, Equatable, TDFunction {
	public typealias Result = Message
	///  The chat the message belongs to 
	public let chatId: Int53
	///  Identifier of the message 
	public let messageId: Int53
	///  Tew message reply markup; for bots only 
	public let replyMarkup: ReplyMarkup?
	///  New location content of the message; may be null. Pass null to stop sharing the live location
	public let location: Location?
	/// Edits the message content of a live location. Messages can be edited for a limited period of time specified in the live location. Returns the edited message after the edit is completed server-side 
	/// - Parameters:
	///   - chatId: The chat the message belongs to 
	///   - messageId: Identifier of the message 
	///   - replyMarkup: Tew message reply markup; for bots only 
	///   - location: New location content of the message; may be null. Pass null to stop sharing the live location
	public init(chatId: Int53, messageId: Int53, replyMarkup: ReplyMarkup?, location: Location?) {
		self.chatId = chatId
		self.messageId = messageId
		self.replyMarkup = replyMarkup
		self.location = location
	}
}

///  Edits the message content caption. Non-bots can edit messages for a limited period of time. Returns the edited message after the edit is completed server-side 
public struct EditMessageCaption: Codable, Equatable, TDFunction {
	public typealias Result = Message
	///  The chat the message belongs to 
	public let chatId: Int53
	///  Identifier of the message 
	public let messageId: Int53
	///  The new message reply markup; for bots only 
	public let replyMarkup: ReplyMarkup?
	///  New message content caption; 0-200 characters
	public let caption: FormattedText
	/// Edits the message content caption. Non-bots can edit messages for a limited period of time. Returns the edited message after the edit is completed server-side 
	/// - Parameters:
	///   - chatId: The chat the message belongs to 
	///   - messageId: Identifier of the message 
	///   - replyMarkup: The new message reply markup; for bots only 
	///   - caption: New message content caption; 0-200 characters
	public init(chatId: Int53, messageId: Int53, replyMarkup: ReplyMarkup?, caption: FormattedText) {
		self.chatId = chatId
		self.messageId = messageId
		self.replyMarkup = replyMarkup
		self.caption = caption
	}
}

///  Edits the message reply markup; for bots only. Returns the edited message after the edit is completed server-side 
public struct EditMessageReplyMarkup: Codable, Equatable, TDFunction {
	public typealias Result = Message
	///  The chat the message belongs to 
	public let chatId: Int53
	///  Identifier of the message 
	public let messageId: Int53
	///  New message reply markup
	public let replyMarkup: ReplyMarkup
	/// Edits the message reply markup; for bots only. Returns the edited message after the edit is completed server-side 
	/// - Parameters:
	///   - chatId: The chat the message belongs to 
	///   - messageId: Identifier of the message 
	///   - replyMarkup: New message reply markup
	public init(chatId: Int53, messageId: Int53, replyMarkup: ReplyMarkup) {
		self.chatId = chatId
		self.messageId = messageId
		self.replyMarkup = replyMarkup
	}
}

///  Edits the text of an inline text or game message sent via a bot; for bots only 
public struct EditInlineMessageText: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Inline message identifier 
	public let inlineMessageId: String
	///  New message reply markup 
	public let replyMarkup: ReplyMarkup
	///  New text content of the message. Should be of type InputMessageText
	public let inputMessageContent: InputMessageContent
	/// Edits the text of an inline text or game message sent via a bot; for bots only 
	/// - Parameters:
	///   - inlineMessageId: Inline message identifier 
	///   - replyMarkup: New message reply markup 
	///   - inputMessageContent: New text content of the message. Should be of type InputMessageText
	public init(inlineMessageId: String, replyMarkup: ReplyMarkup, inputMessageContent: InputMessageContent) {
		self.inlineMessageId = inlineMessageId
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
	}
}

///  Edits the content of a live location in an inline message sent via a bot; for bots only 
public struct EditInlineMessageLiveLocation: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Inline message identifier 
	public let inlineMessageId: String
	///  New message reply markup 
	public let replyMarkup: ReplyMarkup
	///  New location content of the message; may be null. Pass null to stop sharing the live location
	public let location: Location?
	/// Edits the content of a live location in an inline message sent via a bot; for bots only 
	/// - Parameters:
	///   - inlineMessageId: Inline message identifier 
	///   - replyMarkup: New message reply markup 
	///   - location: New location content of the message; may be null. Pass null to stop sharing the live location
	public init(inlineMessageId: String, replyMarkup: ReplyMarkup, location: Location?) {
		self.inlineMessageId = inlineMessageId
		self.replyMarkup = replyMarkup
		self.location = location
	}
}

///  Edits the caption of an inline message sent via a bot; for bots only 
public struct EditInlineMessageCaption: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Inline message identifier 
	public let inlineMessageId: String
	///  New message reply markup 
	public let replyMarkup: ReplyMarkup
	///  New message content caption; 0-200 characters
	public let caption: FormattedText
	/// Edits the caption of an inline message sent via a bot; for bots only 
	/// - Parameters:
	///   - inlineMessageId: Inline message identifier 
	///   - replyMarkup: New message reply markup 
	///   - caption: New message content caption; 0-200 characters
	public init(inlineMessageId: String, replyMarkup: ReplyMarkup, caption: FormattedText) {
		self.inlineMessageId = inlineMessageId
		self.replyMarkup = replyMarkup
		self.caption = caption
	}
}

///  Edits the reply markup of an inline message sent via a bot; for bots only 
public struct EditInlineMessageReplyMarkup: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Inline message identifier 
	public let inlineMessageId: String
	///  New message reply markup
	public let replyMarkup: ReplyMarkup
	/// Edits the reply markup of an inline message sent via a bot; for bots only 
	/// - Parameters:
	///   - inlineMessageId: Inline message identifier 
	///   - replyMarkup: New message reply markup
	public init(inlineMessageId: String, replyMarkup: ReplyMarkup) {
		self.inlineMessageId = inlineMessageId
		self.replyMarkup = replyMarkup
	}
}

///  Returns all entities (mentions, hashtags, cashtags, bot commands, URLs, and email addresses) contained in the text. This is an offline method. Can be called before authorization. Can be called synchronously 
public struct GetTextEntities: Codable, Equatable, TDFunction {
	public typealias Result = TextEntities
	///  The text in which to look for entites
	public let text: String
	/// Returns all entities (mentions, hashtags, cashtags, bot commands, URLs, and email addresses) contained in the text. This is an offline method. Can be called before authorization. Can be called synchronously 
	/// - Parameters:
	///   - text: The text in which to look for entites
	public init(text: String) {
		self.text = text
	}
}

///  Parses Bold, Italic, Code, Pre, PreCode and TextUrl entities contained in the text. This is an offline method. Can be called before authorization. Can be called synchronously 
public struct ParseTextEntities: Codable, Equatable, TDFunction {
	public typealias Result = FormattedText
	///  The text which should be parsed 
	public let text: String
	///  Text parse mode
	public let parseMode: TextParseMode
	/// Parses Bold, Italic, Code, Pre, PreCode and TextUrl entities contained in the text. This is an offline method. Can be called before authorization. Can be called synchronously 
	/// - Parameters:
	///   - text: The text which should be parsed 
	///   - parseMode: Text parse mode
	public init(text: String, parseMode: TextParseMode) {
		self.text = text
		self.parseMode = parseMode
	}
}

///  Returns the MIME type of a file, guessed by its extension. Returns an empty string on failure. This is an offline method. Can be called before authorization. Can be called synchronously 
public struct GetFileMimeType: Codable, Equatable, TDFunction {
	public typealias Result = Text
	///  The name of the file or path to the file
	public let fileName: String
	/// Returns the MIME type of a file, guessed by its extension. Returns an empty string on failure. This is an offline method. Can be called before authorization. Can be called synchronously 
	/// - Parameters:
	///   - fileName: The name of the file or path to the file
	public init(fileName: String) {
		self.fileName = fileName
	}
}

///  Returns the extension of a file, guessed by its MIME type. Returns an empty string on failure. This is an offline method. Can be called before authorization. Can be called synchronously 
public struct GetFileExtension: Codable, Equatable, TDFunction {
	public typealias Result = Text
	///  The MIME type of the file
	public let mimeType: String
	/// Returns the extension of a file, guessed by its MIME type. Returns an empty string on failure. This is an offline method. Can be called before authorization. Can be called synchronously 
	/// - Parameters:
	///   - mimeType: The MIME type of the file
	public init(mimeType: String) {
		self.mimeType = mimeType
	}
}

///  Sends an inline query to a bot and returns its results. Returns an error with code 502 if the bot fails to answer the query before the query timeout expires 
public struct GetInlineQueryResults: Codable, Equatable, TDFunction {
	public typealias Result = InlineQueryResults
	///  The identifier of the target bot 
	public let botUserId: Int32
	///  Identifier of the chat, where the query was sent 
	public let chatId: Int53
	///  Location of the user, only if needed 
	public let userLocation: Location
	///  Text of the query 
	public let query: String
	///  Offset of the first entry to return
	public let offset: String
	/// Sends an inline query to a bot and returns its results. Returns an error with code 502 if the bot fails to answer the query before the query timeout expires 
	/// - Parameters:
	///   - botUserId: The identifier of the target bot 
	///   - chatId: Identifier of the chat, where the query was sent 
	///   - userLocation: Location of the user, only if needed 
	///   - query: Text of the query 
	///   - offset: Offset of the first entry to return
	public init(botUserId: Int32, chatId: Int53, userLocation: Location, query: String, offset: String) {
		self.botUserId = botUserId
		self.chatId = chatId
		self.userLocation = userLocation
		self.query = query
		self.offset = offset
	}
}

///  Sets the result of an inline query; for bots only 
public struct AnswerInlineQuery: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Identifier of the inline query 
	public let inlineQueryId: TDInt64
	///  True, if the result of the query can be cached for the specified user 
	public let isPersonal: Bool
	///  The results of the query 
	public let results: [InputInlineQueryResult]
	///  Allowed time to cache the results of the query, in seconds 
	public let cacheTime: Int32
	///  Offset for the next inline query; pass an empty string if there are no more results 
	public let nextOffset: String
	///  If non-empty, this text should be shown on the button that opens a private chat with the bot and sends a start message to the bot with the parameter switch_pm_parameter 
	public let switchPmText: String
	///  The parameter for the bot start message
	public let switchPmParameter: String
	/// Sets the result of an inline query; for bots only 
	/// - Parameters:
	///   - inlineQueryId: Identifier of the inline query 
	///   - isPersonal: True, if the result of the query can be cached for the specified user 
	///   - results: The results of the query 
	///   - cacheTime: Allowed time to cache the results of the query, in seconds 
	///   - nextOffset: Offset for the next inline query; pass an empty string if there are no more results 
	///   - switchPmText: If non-empty, this text should be shown on the button that opens a private chat with the bot and sends a start message to the bot with the parameter switch_pm_parameter 
	///   - switchPmParameter: The parameter for the bot start message
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

///  Sends a callback query to a bot and returns an answer. Returns an error with code 502 if the bot fails to answer the query before the query timeout expires 
public struct GetCallbackQueryAnswer: Codable, Equatable, TDFunction {
	public typealias Result = CallbackQueryAnswer
	///  Identifier of the chat with the message 
	public let chatId: Int53
	///  Identifier of the message from which the query originated 
	public let messageId: Int53
	///  Query payload
	public let payload: CallbackQueryPayload
	/// Sends a callback query to a bot and returns an answer. Returns an error with code 502 if the bot fails to answer the query before the query timeout expires 
	/// - Parameters:
	///   - chatId: Identifier of the chat with the message 
	///   - messageId: Identifier of the message from which the query originated 
	///   - payload: Query payload
	public init(chatId: Int53, messageId: Int53, payload: CallbackQueryPayload) {
		self.chatId = chatId
		self.messageId = messageId
		self.payload = payload
	}
}

///  Sets the result of a callback query; for bots only 
public struct AnswerCallbackQuery: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Identifier of the callback query 
	public let callbackQueryId: TDInt64
	///  Text of the answer 
	public let text: String
	///  If true, an alert should be shown to the user instead of a toast notification 
	public let showAlert: Bool
	///  URL to be opened 
	public let url: String
	///  Time during which the result of the query can be cached, in seconds
	public let cacheTime: Int32
	/// Sets the result of a callback query; for bots only 
	/// - Parameters:
	///   - callbackQueryId: Identifier of the callback query 
	///   - text: Text of the answer 
	///   - showAlert: If true, an alert should be shown to the user instead of a toast notification 
	///   - url: URL to be opened 
	///   - cacheTime: Time during which the result of the query can be cached, in seconds
	public init(callbackQueryId: TDInt64, text: String, showAlert: Bool, url: String, cacheTime: Int32) {
		self.callbackQueryId = callbackQueryId
		self.text = text
		self.showAlert = showAlert
		self.url = url
		self.cacheTime = cacheTime
	}
}

///  Sets the result of a shipping query; for bots only 
public struct AnswerShippingQuery: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Identifier of the shipping query 
	public let shippingQueryId: TDInt64
	///  Available shipping options 
	public let shippingOptions: [ShippingOption]
	///  An error message, empty on success
	public let errorMessage: String
	/// Sets the result of a shipping query; for bots only 
	/// - Parameters:
	///   - shippingQueryId: Identifier of the shipping query 
	///   - shippingOptions: Available shipping options 
	///   - errorMessage: An error message, empty on success
	public init(shippingQueryId: TDInt64, shippingOptions: [ShippingOption], errorMessage: String) {
		self.shippingQueryId = shippingQueryId
		self.shippingOptions = shippingOptions
		self.errorMessage = errorMessage
	}
}

///  Sets the result of a pre-checkout query; for bots only 
public struct AnswerPreCheckoutQuery: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Identifier of the pre-checkout query 
	public let preCheckoutQueryId: TDInt64
	///  An error message, empty on success
	public let errorMessage: String
	/// Sets the result of a pre-checkout query; for bots only 
	/// - Parameters:
	///   - preCheckoutQueryId: Identifier of the pre-checkout query 
	///   - errorMessage: An error message, empty on success
	public init(preCheckoutQueryId: TDInt64, errorMessage: String) {
		self.preCheckoutQueryId = preCheckoutQueryId
		self.errorMessage = errorMessage
	}
}

///  Updates the game score of the specified user in the game; for bots only 
public struct SetGameScore: Codable, Equatable, TDFunction {
	public typealias Result = Message
	///  The chat to which the message with the game 
	public let chatId: Int53
	///  Identifier of the message 
	public let messageId: Int53
	///  True, if the message should be edited 
	public let editMessage: Bool
	///  User identifier 
	public let userId: Int32
	///  The new score 
	public let score: Int32
	///  Pass true to update the score even if it decreases. If the score is 0, the user will be deleted from the high score table
	public let force: Bool
	/// Updates the game score of the specified user in the game; for bots only 
	/// - Parameters:
	///   - chatId: The chat to which the message with the game 
	///   - messageId: Identifier of the message 
	///   - editMessage: True, if the message should be edited 
	///   - userId: User identifier 
	///   - score: The new score 
	///   - force: Pass true to update the score even if it decreases. If the score is 0, the user will be deleted from the high score table
	public init(chatId: Int53, messageId: Int53, editMessage: Bool, userId: Int32, score: Int32, force: Bool) {
		self.chatId = chatId
		self.messageId = messageId
		self.editMessage = editMessage
		self.userId = userId
		self.score = score
		self.force = force
	}
}

///  Updates the game score of the specified user in a game; for bots only 
public struct SetInlineGameScore: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Inline message identifier 
	public let inlineMessageId: String
	///  True, if the message should be edited 
	public let editMessage: Bool
	///  User identifier 
	public let userId: Int32
	///  The new score 
	public let score: Int32
	///  Pass true to update the score even if it decreases. If the score is 0, the user will be deleted from the high score table
	public let force: Bool
	/// Updates the game score of the specified user in a game; for bots only 
	/// - Parameters:
	///   - inlineMessageId: Inline message identifier 
	///   - editMessage: True, if the message should be edited 
	///   - userId: User identifier 
	///   - score: The new score 
	///   - force: Pass true to update the score even if it decreases. If the score is 0, the user will be deleted from the high score table
	public init(inlineMessageId: String, editMessage: Bool, userId: Int32, score: Int32, force: Bool) {
		self.inlineMessageId = inlineMessageId
		self.editMessage = editMessage
		self.userId = userId
		self.score = score
		self.force = force
	}
}

///  Returns the high scores for a game and some part of the high score table in the range of the specified user; for bots only 
public struct GetGameHighScores: Codable, Equatable, TDFunction {
	public typealias Result = GameHighScores
	///  The chat that contains the message with the game 
	public let chatId: Int53
	///  Identifier of the message 
	public let messageId: Int53
	///  User identifier
	public let userId: Int32
	/// Returns the high scores for a game and some part of the high score table in the range of the specified user; for bots only 
	/// - Parameters:
	///   - chatId: The chat that contains the message with the game 
	///   - messageId: Identifier of the message 
	///   - userId: User identifier
	public init(chatId: Int53, messageId: Int53, userId: Int32) {
		self.chatId = chatId
		self.messageId = messageId
		self.userId = userId
	}
}

///  Returns game high scores and some part of the high score table in the range of the specified user; for bots only 
public struct GetInlineGameHighScores: Codable, Equatable, TDFunction {
	public typealias Result = GameHighScores
	///  Inline message identifier 
	public let inlineMessageId: String
	///  User identifier
	public let userId: Int32
	/// Returns game high scores and some part of the high score table in the range of the specified user; for bots only 
	/// - Parameters:
	///   - inlineMessageId: Inline message identifier 
	///   - userId: User identifier
	public init(inlineMessageId: String, userId: Int32) {
		self.inlineMessageId = inlineMessageId
		self.userId = userId
	}
}

///  Deletes the default reply markup from a chat. Must be called after a one-time keyboard or a ForceReply reply markup has been used. UpdateChatReplyMarkup will be sent if the reply markup will be changed 
public struct DeleteChatReplyMarkup: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Chat identifier 
	public let chatId: Int53
	///  The message identifier of the used keyboard
	public let messageId: Int53
	/// Deletes the default reply markup from a chat. Must be called after a one-time keyboard or a ForceReply reply markup has been used. UpdateChatReplyMarkup will be sent if the reply markup will be changed 
	/// - Parameters:
	///   - chatId: Chat identifier 
	///   - messageId: The message identifier of the used keyboard
	public init(chatId: Int53, messageId: Int53) {
		self.chatId = chatId
		self.messageId = messageId
	}
}

///  Sends a notification about user activity in a chat 
public struct SendChatAction: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Chat identifier 
	public let chatId: Int53
	///  The action description
	public let action: ChatAction
	/// Sends a notification about user activity in a chat 
	/// - Parameters:
	///   - chatId: Chat identifier 
	///   - action: The action description
	public init(chatId: Int53, action: ChatAction) {
		self.chatId = chatId
		self.action = action
	}
}

///  This method should be called if the chat is opened by the user. Many useful activities depend on the chat being opened or closed (e.g., in supergroups and channels all updates are received only for opened chats) 
public struct OpenChat: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Chat identifier
	public let chatId: Int53
	/// This method should be called if the chat is opened by the user. Many useful activities depend on the chat being opened or closed (e.g., in supergroups and channels all updates are received only for opened chats) 
	/// - Parameters:
	///   - chatId: Chat identifier
	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

///  This method should be called if the chat is closed by the user. Many useful activities depend on the chat being opened or closed 
public struct CloseChat: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Chat identifier
	public let chatId: Int53
	/// This method should be called if the chat is closed by the user. Many useful activities depend on the chat being opened or closed 
	/// - Parameters:
	///   - chatId: Chat identifier
	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

///  This method should be called if messages are being viewed by the user. Many useful activities depend on whether the messages are currently being viewed or not (e.g., marking messages as read, incrementing a view counter, updating a view counter, removing deleted messages in supergroups and channels) 
public struct ViewMessages: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Chat identifier 
	public let chatId: Int53
	///  The identifiers of the messages being viewed 
	public let messageIds: [Int53]
	///  True, if messages in closed chats should be marked as read
	public let forceRead: Bool
	/// This method should be called if messages are being viewed by the user. Many useful activities depend on whether the messages are currently being viewed or not (e.g., marking messages as read, incrementing a view counter, updating a view counter, removing deleted messages in supergroups and channels) 
	/// - Parameters:
	///   - chatId: Chat identifier 
	///   - messageIds: The identifiers of the messages being viewed 
	///   - forceRead: True, if messages in closed chats should be marked as read
	public init(chatId: Int53, messageIds: [Int53], forceRead: Bool) {
		self.chatId = chatId
		self.messageIds = messageIds
		self.forceRead = forceRead
	}
}

///  This method should be called if the message content has been opened (e.g., the user has opened a photo, video, document, location or venue, or has listened to an audio file or voice note message). An updateMessageContentOpened update will be generated if something has changed 
public struct OpenMessageContent: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Chat identifier of the message 
	public let chatId: Int53
	///  Identifier of the message with the opened content
	public let messageId: Int53
	/// This method should be called if the message content has been opened (e.g., the user has opened a photo, video, document, location or venue, or has listened to an audio file or voice note message). An updateMessageContentOpened update will be generated if something has changed 
	/// - Parameters:
	///   - chatId: Chat identifier of the message 
	///   - messageId: Identifier of the message with the opened content
	public init(chatId: Int53, messageId: Int53) {
		self.chatId = chatId
		self.messageId = messageId
	}
}

///  Marks all mentions in a chat as read 
public struct ReadAllChatMentions: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Chat identifier
	public let chatId: Int53
	/// Marks all mentions in a chat as read 
	/// - Parameters:
	///   - chatId: Chat identifier
	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

///  Returns an existing chat corresponding to a given user 
public struct CreatePrivateChat: Codable, Equatable, TDFunction {
	public typealias Result = Chat
	///  User identifier 
	public let userId: Int32
	///  If true, the chat will be created without network request. In this case all information about the chat except its type, title and photo can be incorrect
	public let force: Bool
	/// Returns an existing chat corresponding to a given user 
	/// - Parameters:
	///   - userId: User identifier 
	///   - force: If true, the chat will be created without network request. In this case all information about the chat except its type, title and photo can be incorrect
	public init(userId: Int32, force: Bool) {
		self.userId = userId
		self.force = force
	}
}

///  Returns an existing chat corresponding to a known basic group 
public struct CreateBasicGroupChat: Codable, Equatable, TDFunction {
	public typealias Result = Chat
	///  Basic group identifier 
	public let basicGroupId: Int32
	///  If true, the chat will be created without network request. In this case all information about the chat except its type, title and photo can be incorrect
	public let force: Bool
	/// Returns an existing chat corresponding to a known basic group 
	/// - Parameters:
	///   - basicGroupId: Basic group identifier 
	///   - force: If true, the chat will be created without network request. In this case all information about the chat except its type, title and photo can be incorrect
	public init(basicGroupId: Int32, force: Bool) {
		self.basicGroupId = basicGroupId
		self.force = force
	}
}

///  Returns an existing chat corresponding to a known supergroup or channel 
public struct CreateSupergroupChat: Codable, Equatable, TDFunction {
	public typealias Result = Chat
	///  Supergroup or channel identifier 
	public let supergroupId: Int32
	///  If true, the chat will be created without network request. In this case all information about the chat except its type, title and photo can be incorrect
	public let force: Bool
	/// Returns an existing chat corresponding to a known supergroup or channel 
	/// - Parameters:
	///   - supergroupId: Supergroup or channel identifier 
	///   - force: If true, the chat will be created without network request. In this case all information about the chat except its type, title and photo can be incorrect
	public init(supergroupId: Int32, force: Bool) {
		self.supergroupId = supergroupId
		self.force = force
	}
}

///  Returns an existing chat corresponding to a known secret chat 
public struct CreateSecretChat: Codable, Equatable, TDFunction {
	public typealias Result = Chat
	///  Secret chat identifier
	public let secretChatId: Int32
	/// Returns an existing chat corresponding to a known secret chat 
	/// - Parameters:
	///   - secretChatId: Secret chat identifier
	public init(secretChatId: Int32) {
		self.secretChatId = secretChatId
	}
}

///  Creates a new basic group and sends a corresponding messageBasicGroupChatCreate. Returns the newly created chat 
public struct CreateNewBasicGroupChat: Codable, Equatable, TDFunction {
	public typealias Result = Chat
	///  Identifiers of users to be added to the basic group 
	public let userIds: [Int32]
	///  Title of the new basic group; 1-255 characters
	public let title: String
	/// Creates a new basic group and sends a corresponding messageBasicGroupChatCreate. Returns the newly created chat 
	/// - Parameters:
	///   - userIds: Identifiers of users to be added to the basic group 
	///   - title: Title of the new basic group; 1-255 characters
	public init(userIds: [Int32], title: String) {
		self.userIds = userIds
		self.title = title
	}
}

///  Creates a new supergroup or channel and sends a corresponding messageSupergroupChatCreate. Returns the newly created chat 
public struct CreateNewSupergroupChat: Codable, Equatable, TDFunction {
	public typealias Result = Chat
	///  Title of the new chat; 1-255 characters 
	public let title: String
	///  True, if a channel chat should be created 
	public let isChannel: Bool
	///  Chat description; 0-255 characters
	public let description: String
	/// Creates a new supergroup or channel and sends a corresponding messageSupergroupChatCreate. Returns the newly created chat 
	/// - Parameters:
	///   - title: Title of the new chat; 1-255 characters 
	///   - isChannel: True, if a channel chat should be created 
	///   - description: Chat description; 0-255 characters
	public init(title: String, isChannel: Bool, description: String) {
		self.title = title
		self.isChannel = isChannel
		self.description = description
	}
}

///  Creates a new secret chat. Returns the newly created chat 
public struct CreateNewSecretChat: Codable, Equatable, TDFunction {
	public typealias Result = Chat
	///  Identifier of the target user
	public let userId: Int32
	/// Creates a new secret chat. Returns the newly created chat 
	/// - Parameters:
	///   - userId: Identifier of the target user
	public init(userId: Int32) {
		self.userId = userId
	}
}

///  Creates a new supergroup from an existing basic group and sends a corresponding messageChatUpgradeTo and messageChatUpgradeFrom. Deactivates the original basic group 
public struct UpgradeBasicGroupChatToSupergroupChat: Codable, Equatable, TDFunction {
	public typealias Result = Chat
	///  Identifier of the chat to upgrade
	public let chatId: Int53
	/// Creates a new supergroup from an existing basic group and sends a corresponding messageChatUpgradeTo and messageChatUpgradeFrom. Deactivates the original basic group 
	/// - Parameters:
	///   - chatId: Identifier of the chat to upgrade
	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

///  Changes the chat title. Supported only for basic groups, supergroups and channels. Requires administrator rights in basic groups and the appropriate administrator rights in supergroups and channels. The title will not be changed until the request to the server has been completed 
public struct SetChatTitle: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Chat identifier 
	public let chatId: Int53
	///  New title of the chat; 1-255 characters
	public let title: String
	/// Changes the chat title. Supported only for basic groups, supergroups and channels. Requires administrator rights in basic groups and the appropriate administrator rights in supergroups and channels. The title will not be changed until the request to the server has been completed 
	/// - Parameters:
	///   - chatId: Chat identifier 
	///   - title: New title of the chat; 1-255 characters
	public init(chatId: Int53, title: String) {
		self.chatId = chatId
		self.title = title
	}
}

///  Changes the photo of a chat. Supported only for basic groups, supergroups and channels. Requires administrator rights in basic groups and the appropriate administrator rights in supergroups and channels. The photo will not be changed before request to the server has been completed 
public struct SetChatPhoto: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Chat identifier 
	public let chatId: Int53
	///  New chat photo. You can use a zero InputFileId to delete the chat photo. Files that are accessible only by HTTP URL are not acceptable
	public let photo: InputFile
	/// Changes the photo of a chat. Supported only for basic groups, supergroups and channels. Requires administrator rights in basic groups and the appropriate administrator rights in supergroups and channels. The photo will not be changed before request to the server has been completed 
	/// - Parameters:
	///   - chatId: Chat identifier 
	///   - photo: New chat photo. You can use a zero InputFileId to delete the chat photo. Files that are accessible only by HTTP URL are not acceptable
	public init(chatId: Int53, photo: InputFile) {
		self.chatId = chatId
		self.photo = photo
	}
}

///  Changes the draft message in a chat 
public struct SetChatDraftMessage: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Chat identifier 
	public let chatId: Int53
	///  New draft message; may be null
	public let draftMessage: DraftMessage?
	/// Changes the draft message in a chat 
	/// - Parameters:
	///   - chatId: Chat identifier 
	///   - draftMessage: New draft message; may be null
	public init(chatId: Int53, draftMessage: DraftMessage?) {
		self.chatId = chatId
		self.draftMessage = draftMessage
	}
}

///  Changes the pinned state of a chat. You can pin up to GetOption("pinned_chat_count_max") non-secret chats and the same number of secret chats 
public struct ToggleChatIsPinned: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Chat identifier 
	public let chatId: Int53
	///  New value of is_pinned
	public let isPinned: Bool
	/// Changes the pinned state of a chat. You can pin up to GetOption("pinned_chat_count_max") non-secret chats and the same number of secret chats 
	/// - Parameters:
	///   - chatId: Chat identifier 
	///   - isPinned: New value of is_pinned
	public init(chatId: Int53, isPinned: Bool) {
		self.chatId = chatId
		self.isPinned = isPinned
	}
}

///  Changes client data associated with a chat 
public struct SetChatClientData: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Chat identifier 
	public let chatId: Int53
	///  New value of client_data
	public let clientData: String
	/// Changes client data associated with a chat 
	/// - Parameters:
	///   - chatId: Chat identifier 
	///   - clientData: New value of client_data
	public init(chatId: Int53, clientData: String) {
		self.chatId = chatId
		self.clientData = clientData
	}
}

///  Adds a new member to a chat. Members can't be added to private or secret chats. Members will not be added until the chat state has been synchronized with the server 
public struct AddChatMember: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Chat identifier 
	public let chatId: Int53
	///  Identifier of the user 
	public let userId: Int32
	///  The number of earlier messages from the chat to be forwarded to the new member; up to 300. Ignored for supergroups and channels
	public let forwardLimit: Int32
	/// Adds a new member to a chat. Members can't be added to private or secret chats. Members will not be added until the chat state has been synchronized with the server 
	/// - Parameters:
	///   - chatId: Chat identifier 
	///   - userId: Identifier of the user 
	///   - forwardLimit: The number of earlier messages from the chat to be forwarded to the new member; up to 300. Ignored for supergroups and channels
	public init(chatId: Int53, userId: Int32, forwardLimit: Int32) {
		self.chatId = chatId
		self.userId = userId
		self.forwardLimit = forwardLimit
	}
}

///  Adds multiple new members to a chat. Currently this option is only available for supergroups and channels. This option can't be used to join a chat. Members can't be added to a channel if it has more than 200 members. Members will not be added until the chat state has been synchronized with the server 
public struct AddChatMembers: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Chat identifier 
	public let chatId: Int53
	///  Identifiers of the users to be added to the chat
	public let userIds: [Int32]
	/// Adds multiple new members to a chat. Currently this option is only available for supergroups and channels. This option can't be used to join a chat. Members can't be added to a channel if it has more than 200 members. Members will not be added until the chat state has been synchronized with the server 
	/// - Parameters:
	///   - chatId: Chat identifier 
	///   - userIds: Identifiers of the users to be added to the chat
	public init(chatId: Int53, userIds: [Int32]) {
		self.chatId = chatId
		self.userIds = userIds
	}
}

///  Changes the status of a chat member, needs appropriate privileges. This function is currently not suitable for adding new members to the chat; instead, use addChatMember. The chat member status will not be changed until it has been synchronized with the server 
public struct SetChatMemberStatus: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Chat identifier 
	public let chatId: Int53
	///  User identifier 
	public let userId: Int32
	///  The new status of the member in the chat
	public let status: ChatMemberStatus
	/// Changes the status of a chat member, needs appropriate privileges. This function is currently not suitable for adding new members to the chat; instead, use addChatMember. The chat member status will not be changed until it has been synchronized with the server 
	/// - Parameters:
	///   - chatId: Chat identifier 
	///   - userId: User identifier 
	///   - status: The new status of the member in the chat
	public init(chatId: Int53, userId: Int32, status: ChatMemberStatus) {
		self.chatId = chatId
		self.userId = userId
		self.status = status
	}
}

///  Returns information about a single member of a chat 
public struct GetChatMember: Codable, Equatable, TDFunction {
	public typealias Result = ChatMember
	///  Chat identifier 
	public let chatId: Int53
	///  User identifier
	public let userId: Int32
	/// Returns information about a single member of a chat 
	/// - Parameters:
	///   - chatId: Chat identifier 
	///   - userId: User identifier
	public init(chatId: Int53, userId: Int32) {
		self.chatId = chatId
		self.userId = userId
	}
}

///  Searches for a specified query in the first name, last name and username of the members of a specified chat. Requires administrator rights in channels 
public struct SearchChatMembers: Codable, Equatable, TDFunction {
	public typealias Result = ChatMembers
	///  Chat identifier 
	public let chatId: Int53
	///  Query to search for 
	public let query: String
	///  The maximum number of users to be returned
	public let limit: Int32
	/// Searches for a specified query in the first name, last name and username of the members of a specified chat. Requires administrator rights in channels 
	/// - Parameters:
	///   - chatId: Chat identifier 
	///   - query: Query to search for 
	///   - limit: The maximum number of users to be returned
	public init(chatId: Int53, query: String, limit: Int32) {
		self.chatId = chatId
		self.query = query
		self.limit = limit
	}
}

///  Returns a list of users who are administrators of the chat 
public struct GetChatAdministrators: Codable, Equatable, TDFunction {
	public typealias Result = Users
	///  Chat identifier
	public let chatId: Int53
	/// Returns a list of users who are administrators of the chat 
	/// - Parameters:
	///   - chatId: Chat identifier
	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

///  Changes the order of pinned chats 
public struct SetPinnedChats: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  The new list of pinned chats
	public let chatIds: [Int53]
	/// Changes the order of pinned chats 
	/// - Parameters:
	///   - chatIds: The new list of pinned chats
	public init(chatIds: [Int53]) {
		self.chatIds = chatIds
	}
}

///  Asynchronously downloads a file from the cloud. updateFile will be used to notify about the download progress and successful completion of the download. Returns file state just after the download has been started 
public struct DownloadFile: Codable, Equatable, TDFunction {
	public typealias Result = File
	///  Identifier of the file to download 
	public let fileId: Int32
	///  Priority of the download (1-32). The higher the priority, the earlier the file will be downloaded. If the priorities of two files are equal, then the last one for which downloadFile was called will be downloaded first
	public let priority: Int32
	/// Asynchronously downloads a file from the cloud. updateFile will be used to notify about the download progress and successful completion of the download. Returns file state just after the download has been started 
	/// - Parameters:
	///   - fileId: Identifier of the file to download 
	///   - priority: Priority of the download (1-32). The higher the priority, the earlier the file will be downloaded. If the priorities of two files are equal, then the last one for which downloadFile was called will be downloaded first
	public init(fileId: Int32, priority: Int32) {
		self.fileId = fileId
		self.priority = priority
	}
}

///  Stops the downloading of a file. If a file has already been downloaded, does nothing 
public struct CancelDownloadFile: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Identifier of a file to stop downloading 
	public let fileId: Int32
	///  Pass true to stop downloading only if it hasn't been started, i.e. request hasn't been sent to server
	public let onlyIfPending: Bool
	/// Stops the downloading of a file. If a file has already been downloaded, does nothing 
	/// - Parameters:
	///   - fileId: Identifier of a file to stop downloading 
	///   - onlyIfPending: Pass true to stop downloading only if it hasn't been started, i.e. request hasn't been sent to server
	public init(fileId: Int32, onlyIfPending: Bool) {
		self.fileId = fileId
		self.onlyIfPending = onlyIfPending
	}
}

///  Asynchronously uploads a file to the cloud without sending it in a message. updateFile will be used to notify about upload progress and successful completion of the upload. The file will not have a persistent remote identifier until it will be sent in a message 
public struct UploadFile: Codable, Equatable, TDFunction {
	public typealias Result = File
	///  File to upload 
	public let file: InputFile
	///  File type 
	public let fileType: FileType
	///  Priority of the upload (1-32). The higher the priority, the earlier the file will be uploaded. If the priorities of two files are equal, then the first one for which uploadFile was called will be uploaded first
	public let priority: Int32
	/// Asynchronously uploads a file to the cloud without sending it in a message. updateFile will be used to notify about upload progress and successful completion of the upload. The file will not have a persistent remote identifier until it will be sent in a message 
	/// - Parameters:
	///   - file: File to upload 
	///   - fileType: File type 
	///   - priority: Priority of the upload (1-32). The higher the priority, the earlier the file will be uploaded. If the priorities of two files are equal, then the first one for which uploadFile was called will be uploaded first
	public init(file: InputFile, fileType: FileType, priority: Int32) {
		self.file = file
		self.fileType = fileType
		self.priority = priority
	}
}

///  Stops the uploading of a file. Supported only for files uploaded by using uploadFile. For other files the behavior is undefined 
public struct CancelUploadFile: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Identifier of the file to stop uploading
	public let fileId: Int32
	/// Stops the uploading of a file. Supported only for files uploaded by using uploadFile. For other files the behavior is undefined 
	/// - Parameters:
	///   - fileId: Identifier of the file to stop uploading
	public init(fileId: Int32) {
		self.fileId = fileId
	}
}

///  The next part of a file was generated 
public struct SetFileGenerationProgress: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  The identifier of the generation process 
	public let generationId: TDInt64
	///  Expected size of the generated file, in bytes; 0 if unknown 
	public let expectedSize: Int32
	///  The number of bytes already generated
	public let localPrefixSize: Int32
	/// The next part of a file was generated 
	/// - Parameters:
	///   - generationId: The identifier of the generation process 
	///   - expectedSize: Expected size of the generated file, in bytes; 0 if unknown 
	///   - localPrefixSize: The number of bytes already generated
	public init(generationId: TDInt64, expectedSize: Int32, localPrefixSize: Int32) {
		self.generationId = generationId
		self.expectedSize = expectedSize
		self.localPrefixSize = localPrefixSize
	}
}

///  Finishes the file generation 
public struct FinishFileGeneration: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  The identifier of the generation process 
	public let generationId: TDInt64
	///  If set, means that file generation has failed and should be terminated
	public let error: Error
	/// Finishes the file generation 
	/// - Parameters:
	///   - generationId: The identifier of the generation process 
	///   - error: If set, means that file generation has failed and should be terminated
	public init(generationId: TDInt64, error: Error) {
		self.generationId = generationId
		self.error = error
	}
}

///  Deletes a file from the TDLib file cache 
public struct DeleteFile: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Identifier of the file to delete
	public let fileId: Int32
	/// Deletes a file from the TDLib file cache 
	/// - Parameters:
	///   - fileId: Identifier of the file to delete
	public init(fileId: Int32) {
		self.fileId = fileId
	}
}

///  Generates a new invite link for a chat; the previously generated link is revoked. Available for basic groups, supergroups, and channels. In basic groups this can be called only by the group's creator; in supergroups and channels this requires appropriate administrator rights 
public struct GenerateChatInviteLink: Codable, Equatable, TDFunction {
	public typealias Result = ChatInviteLink
	///  Chat identifier
	public let chatId: Int53
	/// Generates a new invite link for a chat; the previously generated link is revoked. Available for basic groups, supergroups, and channels. In basic groups this can be called only by the group's creator; in supergroups and channels this requires appropriate administrator rights 
	/// - Parameters:
	///   - chatId: Chat identifier
	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

///  Checks the validity of an invite link for a chat and returns information about the corresponding chat 
public struct CheckChatInviteLink: Codable, Equatable, TDFunction {
	public typealias Result = ChatInviteLinkInfo
	///  Invite link to be checked; should begin with "https://t.me/joinchat/", "https://telegram.me/joinchat/", or "https://telegram.dog/joinchat/"
	public let inviteLink: String
	/// Checks the validity of an invite link for a chat and returns information about the corresponding chat 
	/// - Parameters:
	///   - inviteLink: Invite link to be checked; should begin with "https://t.me/joinchat/", "https://telegram.me/joinchat/", or "https://telegram.dog/joinchat/"
	public init(inviteLink: String) {
		self.inviteLink = inviteLink
	}
}

///  Uses an invite link to add the current user to the chat if possible. The new member will not be added until the chat state has been synchronized with the server 
public struct JoinChatByInviteLink: Codable, Equatable, TDFunction {
	public typealias Result = Chat
	///  Invite link to import; should begin with "https://t.me/joinchat/", "https://telegram.me/joinchat/", or "https://telegram.dog/joinchat/"
	public let inviteLink: String
	/// Uses an invite link to add the current user to the chat if possible. The new member will not be added until the chat state has been synchronized with the server 
	/// - Parameters:
	///   - inviteLink: Invite link to import; should begin with "https://t.me/joinchat/", "https://telegram.me/joinchat/", or "https://telegram.dog/joinchat/"
	public init(inviteLink: String) {
		self.inviteLink = inviteLink
	}
}

///  Creates a new call 
public struct CreateCall: Codable, Equatable, TDFunction {
	public typealias Result = CallId
	///  Identifier of the user to be called 
	public let userId: Int32
	///  Description of the call protocols supported by the client
	public let `protocol`: CallProtocol
	/// Creates a new call 
	/// - Parameters:
	///   - userId: Identifier of the user to be called 
	///   - protocol: Description of the call protocols supported by the client
	public init(userId: Int32, protocol: CallProtocol) {
		self.userId = userId
		self.protocol = `protocol`
	}
}

///  Accepts an incoming call 
public struct AcceptCall: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Call identifier 
	public let callId: Int32
	///  Description of the call protocols supported by the client
	public let `protocol`: CallProtocol
	/// Accepts an incoming call 
	/// - Parameters:
	///   - callId: Call identifier 
	///   - protocol: Description of the call protocols supported by the client
	public init(callId: Int32, protocol: CallProtocol) {
		self.callId = callId
		self.protocol = `protocol`
	}
}

///  Discards a call 
public struct DiscardCall: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Call identifier 
	public let callId: Int32
	///  True, if the user was disconnected 
	public let isDisconnected: Bool
	///  The call duration, in seconds 
	public let duration: Int32
	///  Identifier of the connection used during the call
	public let connectionId: TDInt64
	/// Discards a call 
	/// - Parameters:
	///   - callId: Call identifier 
	///   - isDisconnected: True, if the user was disconnected 
	///   - duration: The call duration, in seconds 
	///   - connectionId: Identifier of the connection used during the call
	public init(callId: Int32, isDisconnected: Bool, duration: Int32, connectionId: TDInt64) {
		self.callId = callId
		self.isDisconnected = isDisconnected
		self.duration = duration
		self.connectionId = connectionId
	}
}

///  Sends a call rating 
public struct SendCallRating: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Call identifier 
	public let callId: Int32
	///  Call rating; 1-5 
	public let rating: Int32
	///  An optional user comment if the rating is less than 5
	public let comment: String
	/// Sends a call rating 
	/// - Parameters:
	///   - callId: Call identifier 
	///   - rating: Call rating; 1-5 
	///   - comment: An optional user comment if the rating is less than 5
	public init(callId: Int32, rating: Int32, comment: String) {
		self.callId = callId
		self.rating = rating
		self.comment = comment
	}
}

///  Sends debug information for a call 
public struct SendCallDebugInformation: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Call identifier 
	public let callId: Int32
	///  Debug information in application-specific format
	public let debugInformation: String
	/// Sends debug information for a call 
	/// - Parameters:
	///   - callId: Call identifier 
	///   - debugInformation: Debug information in application-specific format
	public init(callId: Int32, debugInformation: String) {
		self.callId = callId
		self.debugInformation = debugInformation
	}
}

///  Adds a user to the blacklist 
public struct BlockUser: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  User identifier
	public let userId: Int32
	/// Adds a user to the blacklist 
	/// - Parameters:
	///   - userId: User identifier
	public init(userId: Int32) {
		self.userId = userId
	}
}

///  Removes a user from the blacklist 
public struct UnblockUser: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  User identifier
	public let userId: Int32
	/// Removes a user from the blacklist 
	/// - Parameters:
	///   - userId: User identifier
	public init(userId: Int32) {
		self.userId = userId
	}
}

///  Returns users that were blocked by the current user 
public struct GetBlockedUsers: Codable, Equatable, TDFunction {
	public typealias Result = Users
	///  Number of users to skip in the result; must be non-negative 
	public let offset: Int32
	///  Maximum number of users to return; up to 100
	public let limit: Int32
	/// Returns users that were blocked by the current user 
	/// - Parameters:
	///   - offset: Number of users to skip in the result; must be non-negative 
	///   - limit: Maximum number of users to return; up to 100
	public init(offset: Int32, limit: Int32) {
		self.offset = offset
		self.limit = limit
	}
}

///  Adds new contacts or edits existing contacts; contacts' user identifiers are ignored 
public struct ImportContacts: Codable, Equatable, TDFunction {
	public typealias Result = ImportedContacts
	///  The list of contacts to import or edit
	public let contacts: [Contact]
	/// Adds new contacts or edits existing contacts; contacts' user identifiers are ignored 
	/// - Parameters:
	///   - contacts: The list of contacts to import or edit
	public init(contacts: [Contact]) {
		self.contacts = contacts
	}
}

///  Searches for the specified query in the first names, last names and usernames of the known user contacts 
public struct SearchContacts: Codable, Equatable, TDFunction {
	public typealias Result = Users
	///  Query to search for; can be empty to return all contacts 
	public let query: String
	///  Maximum number of users to be returned
	public let limit: Int32
	/// Searches for the specified query in the first names, last names and usernames of the known user contacts 
	/// - Parameters:
	///   - query: Query to search for; can be empty to return all contacts 
	///   - limit: Maximum number of users to be returned
	public init(query: String, limit: Int32) {
		self.query = query
		self.limit = limit
	}
}

///  Removes users from the contacts list 
public struct RemoveContacts: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Identifiers of users to be deleted
	public let userIds: [Int32]
	/// Removes users from the contacts list 
	/// - Parameters:
	///   - userIds: Identifiers of users to be deleted
	public init(userIds: [Int32]) {
		self.userIds = userIds
	}
}

///  Returns the total number of imported contacts
public struct GetImportedContactCount: Codable, Equatable, TDFunction {
	public typealias Result = Count
	/// Returns the total number of imported contacts
	public init() {
	}
}

///  Changes imported contacts using the list of current user contacts saved on the device. Imports newly added contacts and, if at least the file database is enabled, deletes recently deleted contacts. -Query result depends on the result of the previous query, so only one query is possible at the same time 
public struct ChangeImportedContacts: Codable, Equatable, TDFunction {
	public typealias Result = ImportedContacts
	///  The new list of contacts
	public let contacts: [Contact]
	/// Changes imported contacts using the list of current user contacts saved on the device. Imports newly added contacts and, if at least the file database is enabled, deletes recently deleted contacts. -Query result depends on the result of the previous query, so only one query is possible at the same time 
	/// - Parameters:
	///   - contacts: The new list of contacts
	public init(contacts: [Contact]) {
		self.contacts = contacts
	}
}

///  Clears all imported contacts
public struct ClearImportedContacts: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	/// Clears all imported contacts
	public init() {
	}
}

///  Returns the profile photos of a user. The result of this query may be outdated: some photos might have been deleted already 
public struct GetUserProfilePhotos: Codable, Equatable, TDFunction {
	public typealias Result = UserProfilePhotos
	///  User identifier 
	public let userId: Int32
	///  The number of photos to skip; must be non-negative 
	public let offset: Int32
	///  Maximum number of photos to be returned; up to 100
	public let limit: Int32
	/// Returns the profile photos of a user. The result of this query may be outdated: some photos might have been deleted already 
	/// - Parameters:
	///   - userId: User identifier 
	///   - offset: The number of photos to skip; must be non-negative 
	///   - limit: Maximum number of photos to be returned; up to 100
	public init(userId: Int32, offset: Int32, limit: Int32) {
		self.userId = userId
		self.offset = offset
		self.limit = limit
	}
}

///  Returns stickers from the installed sticker sets that correspond to a given emoji. If the emoji is not empty, favorite and recently used stickers may also be returned 
public struct GetStickers: Codable, Equatable, TDFunction {
	public typealias Result = Stickers
	///  String representation of emoji. If empty, returns all known installed stickers 
	public let emoji: String
	///  Maximum number of stickers to be returned
	public let limit: Int32
	/// Returns stickers from the installed sticker sets that correspond to a given emoji. If the emoji is not empty, favorite and recently used stickers may also be returned 
	/// - Parameters:
	///   - emoji: String representation of emoji. If empty, returns all known installed stickers 
	///   - limit: Maximum number of stickers to be returned
	public init(emoji: String, limit: Int32) {
		self.emoji = emoji
		self.limit = limit
	}
}

///  Searches for stickers from public sticker sets that correspond to a given emoji 
public struct SearchStickers: Codable, Equatable, TDFunction {
	public typealias Result = Stickers
	///  String representation of emoji; must be non-empty 
	public let emoji: String
	///  Maximum number of stickers to be returned
	public let limit: Int32
	/// Searches for stickers from public sticker sets that correspond to a given emoji 
	/// - Parameters:
	///   - emoji: String representation of emoji; must be non-empty 
	///   - limit: Maximum number of stickers to be returned
	public init(emoji: String, limit: Int32) {
		self.emoji = emoji
		self.limit = limit
	}
}

///  Returns a list of installed sticker sets 
public struct GetInstalledStickerSets: Codable, Equatable, TDFunction {
	public typealias Result = StickerSets
	///  Pass true to return mask sticker sets; pass false to return ordinary sticker sets
	public let isMasks: Bool
	/// Returns a list of installed sticker sets 
	/// - Parameters:
	///   - isMasks: Pass true to return mask sticker sets; pass false to return ordinary sticker sets
	public init(isMasks: Bool) {
		self.isMasks = isMasks
	}
}

///  Returns a list of archived sticker sets 
public struct GetArchivedStickerSets: Codable, Equatable, TDFunction {
	public typealias Result = StickerSets
	///  Pass true to return mask stickers sets; pass false to return ordinary sticker sets 
	public let isMasks: Bool
	///  Identifier of the sticker set from which to return the result 
	public let offsetStickerSetId: TDInt64
	///  Maximum number of sticker sets to return
	public let limit: Int32
	/// Returns a list of archived sticker sets 
	/// - Parameters:
	///   - isMasks: Pass true to return mask stickers sets; pass false to return ordinary sticker sets 
	///   - offsetStickerSetId: Identifier of the sticker set from which to return the result 
	///   - limit: Maximum number of sticker sets to return
	public init(isMasks: Bool, offsetStickerSetId: TDInt64, limit: Int32) {
		self.isMasks = isMasks
		self.offsetStickerSetId = offsetStickerSetId
		self.limit = limit
	}
}

///  Returns a list of trending sticker sets
public struct GetTrendingStickerSets: Codable, Equatable, TDFunction {
	public typealias Result = StickerSets
	/// Returns a list of trending sticker sets
	public init() {
	}
}

///  Returns a list of sticker sets attached to a file. Currently only photos and videos can have attached sticker sets 
public struct GetAttachedStickerSets: Codable, Equatable, TDFunction {
	public typealias Result = StickerSets
	///  File identifier
	public let fileId: Int32
	/// Returns a list of sticker sets attached to a file. Currently only photos and videos can have attached sticker sets 
	/// - Parameters:
	///   - fileId: File identifier
	public init(fileId: Int32) {
		self.fileId = fileId
	}
}

///  Returns information about a sticker set by its identifier 
public struct GetStickerSet: Codable, Equatable, TDFunction {
	public typealias Result = StickerSet
	///  Identifier of the sticker set
	public let setId: TDInt64
	/// Returns information about a sticker set by its identifier 
	/// - Parameters:
	///   - setId: Identifier of the sticker set
	public init(setId: TDInt64) {
		self.setId = setId
	}
}

///  Searches for a sticker set by its name 
public struct SearchStickerSet: Codable, Equatable, TDFunction {
	public typealias Result = StickerSet
	///  Name of the sticker set
	public let name: String
	/// Searches for a sticker set by its name 
	/// - Parameters:
	///   - name: Name of the sticker set
	public init(name: String) {
		self.name = name
	}
}

///  Searches for installed sticker sets by looking for specified query in their title and name 
public struct SearchInstalledStickerSets: Codable, Equatable, TDFunction {
	public typealias Result = StickerSets
	///  Pass true to return mask sticker sets; pass false to return ordinary sticker sets 
	public let isMasks: Bool
	///  Query to search for 
	public let query: String
	///  Maximum number of sticker sets to return
	public let limit: Int32
	/// Searches for installed sticker sets by looking for specified query in their title and name 
	/// - Parameters:
	///   - isMasks: Pass true to return mask sticker sets; pass false to return ordinary sticker sets 
	///   - query: Query to search for 
	///   - limit: Maximum number of sticker sets to return
	public init(isMasks: Bool, query: String, limit: Int32) {
		self.isMasks = isMasks
		self.query = query
		self.limit = limit
	}
}

///  Searches for ordinary sticker sets by looking for specified query in their title and name. Excludes installed sticker sets from the results 
public struct SearchStickerSets: Codable, Equatable, TDFunction {
	public typealias Result = StickerSets
	///  Query to search for
	public let query: String
	/// Searches for ordinary sticker sets by looking for specified query in their title and name. Excludes installed sticker sets from the results 
	/// - Parameters:
	///   - query: Query to search for
	public init(query: String) {
		self.query = query
	}
}

///  Installs/uninstalls or activates/archives a sticker set 
public struct ChangeStickerSet: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Identifier of the sticker set 
	public let setId: TDInt64
	///  The new value of is_installed 
	public let isInstalled: Bool
	///  The new value of is_archived. A sticker set can't be installed and archived simultaneously
	public let isArchived: Bool
	/// Installs/uninstalls or activates/archives a sticker set 
	/// - Parameters:
	///   - setId: Identifier of the sticker set 
	///   - isInstalled: The new value of is_installed 
	///   - isArchived: The new value of is_archived. A sticker set can't be installed and archived simultaneously
	public init(setId: TDInt64, isInstalled: Bool, isArchived: Bool) {
		self.setId = setId
		self.isInstalled = isInstalled
		self.isArchived = isArchived
	}
}

///  Informs the server that some trending sticker sets have been viewed by the user 
public struct ViewTrendingStickerSets: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Identifiers of viewed trending sticker sets
	public let stickerSetIds: [Int64]
	/// Informs the server that some trending sticker sets have been viewed by the user 
	/// - Parameters:
	///   - stickerSetIds: Identifiers of viewed trending sticker sets
	public init(stickerSetIds: [Int64]) {
		self.stickerSetIds = stickerSetIds
	}
}

///  Changes the order of installed sticker sets 
public struct ReorderInstalledStickerSets: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Pass true to change the order of mask sticker sets; pass false to change the order of ordinary sticker sets 
	public let isMasks: Bool
	///  Identifiers of installed sticker sets in the new correct order
	public let stickerSetIds: [Int64]
	/// Changes the order of installed sticker sets 
	/// - Parameters:
	///   - isMasks: Pass true to change the order of mask sticker sets; pass false to change the order of ordinary sticker sets 
	///   - stickerSetIds: Identifiers of installed sticker sets in the new correct order
	public init(isMasks: Bool, stickerSetIds: [Int64]) {
		self.isMasks = isMasks
		self.stickerSetIds = stickerSetIds
	}
}

///  Returns a list of recently used stickers 
public struct GetRecentStickers: Codable, Equatable, TDFunction {
	public typealias Result = Stickers
	///  Pass true to return stickers and masks that were recently attached to photos or video files; pass false to return recently sent stickers
	public let isAttached: Bool
	/// Returns a list of recently used stickers 
	/// - Parameters:
	///   - isAttached: Pass true to return stickers and masks that were recently attached to photos or video files; pass false to return recently sent stickers
	public init(isAttached: Bool) {
		self.isAttached = isAttached
	}
}

///  Manually adds a new sticker to the list of recently used stickers. The new sticker is added to the top of the list. If the sticker was already in the list, it is removed from the list first. Only stickers belonging to a sticker set can be added to this list 
public struct AddRecentSticker: Codable, Equatable, TDFunction {
	public typealias Result = Stickers
	///  Pass true to add the sticker to the list of stickers recently attached to photo or video files; pass false to add the sticker to the list of recently sent stickers 
	public let isAttached: Bool
	///  Sticker file to add
	public let sticker: InputFile
	/// Manually adds a new sticker to the list of recently used stickers. The new sticker is added to the top of the list. If the sticker was already in the list, it is removed from the list first. Only stickers belonging to a sticker set can be added to this list 
	/// - Parameters:
	///   - isAttached: Pass true to add the sticker to the list of stickers recently attached to photo or video files; pass false to add the sticker to the list of recently sent stickers 
	///   - sticker: Sticker file to add
	public init(isAttached: Bool, sticker: InputFile) {
		self.isAttached = isAttached
		self.sticker = sticker
	}
}

///  Removes a sticker from the list of recently used stickers 
public struct RemoveRecentSticker: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Pass true to remove the sticker from the list of stickers recently attached to photo or video files; pass false to remove the sticker from the list of recently sent stickers 
	public let isAttached: Bool
	///  Sticker file to delete
	public let sticker: InputFile
	/// Removes a sticker from the list of recently used stickers 
	/// - Parameters:
	///   - isAttached: Pass true to remove the sticker from the list of stickers recently attached to photo or video files; pass false to remove the sticker from the list of recently sent stickers 
	///   - sticker: Sticker file to delete
	public init(isAttached: Bool, sticker: InputFile) {
		self.isAttached = isAttached
		self.sticker = sticker
	}
}

///  Clears the list of recently used stickers 
public struct ClearRecentStickers: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Pass true to clear the list of stickers recently attached to photo or video files; pass false to clear the list of recently sent stickers
	public let isAttached: Bool
	/// Clears the list of recently used stickers 
	/// - Parameters:
	///   - isAttached: Pass true to clear the list of stickers recently attached to photo or video files; pass false to clear the list of recently sent stickers
	public init(isAttached: Bool) {
		self.isAttached = isAttached
	}
}

///  Returns favorite stickers
public struct GetFavoriteStickers: Codable, Equatable, TDFunction {
	public typealias Result = Stickers
	/// Returns favorite stickers
	public init() {
	}
}

///  Adds a new sticker to the list of favorite stickers. The new sticker is added to the top of the list. If the sticker was already in the list, it is removed from the list first. Only stickers belonging to a sticker set can be added to this list 
public struct AddFavoriteSticker: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Sticker file to add
	public let sticker: InputFile
	/// Adds a new sticker to the list of favorite stickers. The new sticker is added to the top of the list. If the sticker was already in the list, it is removed from the list first. Only stickers belonging to a sticker set can be added to this list 
	/// - Parameters:
	///   - sticker: Sticker file to add
	public init(sticker: InputFile) {
		self.sticker = sticker
	}
}

///  Removes a sticker from the list of favorite stickers 
public struct RemoveFavoriteSticker: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Sticker file to delete from the list
	public let sticker: InputFile
	/// Removes a sticker from the list of favorite stickers 
	/// - Parameters:
	///   - sticker: Sticker file to delete from the list
	public init(sticker: InputFile) {
		self.sticker = sticker
	}
}

///  Returns emoji corresponding to a sticker 
public struct GetStickerEmojis: Codable, Equatable, TDFunction {
	public typealias Result = StickerEmojis
	///  Sticker file identifier
	public let sticker: InputFile
	/// Returns emoji corresponding to a sticker 
	/// - Parameters:
	///   - sticker: Sticker file identifier
	public init(sticker: InputFile) {
		self.sticker = sticker
	}
}

///  Returns saved animations
public struct GetSavedAnimations: Codable, Equatable, TDFunction {
	public typealias Result = Animations
	/// Returns saved animations
	public init() {
	}
}

///  Manually adds a new animation to the list of saved animations. The new animation is added to the beginning of the list. If the animation was already in the list, it is removed first. Only non-secret video animations with MIME type "video/mp4" can be added to the list 
public struct AddSavedAnimation: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  The animation file to be added. Only animations known to the server (i.e. successfully sent via a message) can be added to the list
	public let animation: InputFile
	/// Manually adds a new animation to the list of saved animations. The new animation is added to the beginning of the list. If the animation was already in the list, it is removed first. Only non-secret video animations with MIME type "video/mp4" can be added to the list 
	/// - Parameters:
	///   - animation: The animation file to be added. Only animations known to the server (i.e. successfully sent via a message) can be added to the list
	public init(animation: InputFile) {
		self.animation = animation
	}
}

///  Removes an animation from the list of saved animations 
public struct RemoveSavedAnimation: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Animation file to be removed
	public let animation: InputFile
	/// Removes an animation from the list of saved animations 
	/// - Parameters:
	///   - animation: Animation file to be removed
	public init(animation: InputFile) {
		self.animation = animation
	}
}

///  Returns up to 20 recently used inline bots in the order of their last usage
public struct GetRecentInlineBots: Codable, Equatable, TDFunction {
	public typealias Result = Users
	/// Returns up to 20 recently used inline bots in the order of their last usage
	public init() {
	}
}

///  Searches for recently used hashtags by their prefix 
public struct SearchHashtags: Codable, Equatable, TDFunction {
	public typealias Result = Hashtags
	///  Hashtag prefix to search for 
	public let prefix: String
	///  Maximum number of hashtags to be returned
	public let limit: Int32
	/// Searches for recently used hashtags by their prefix 
	/// - Parameters:
	///   - prefix: Hashtag prefix to search for 
	///   - limit: Maximum number of hashtags to be returned
	public init(prefix: String, limit: Int32) {
		self.prefix = prefix
		self.limit = limit
	}
}

///  Removes a hashtag from the list of recently used hashtags 
public struct RemoveRecentHashtag: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Hashtag to delete
	public let hashtag: String
	/// Removes a hashtag from the list of recently used hashtags 
	/// - Parameters:
	///   - hashtag: Hashtag to delete
	public init(hashtag: String) {
		self.hashtag = hashtag
	}
}

///  Returns a web page preview by the text of the message. Do not call this function too often. Returns a 404 error if the web page has no preview 
public struct GetWebPagePreview: Codable, Equatable, TDFunction {
	public typealias Result = WebPage
	///  Message text with formatting
	public let text: FormattedText
	/// Returns a web page preview by the text of the message. Do not call this function too often. Returns a 404 error if the web page has no preview 
	/// - Parameters:
	///   - text: Message text with formatting
	public init(text: FormattedText) {
		self.text = text
	}
}

///  Returns an instant view version of a web page if available. Returns a 404 error if the web page has no instant view page 
public struct GetWebPageInstantView: Codable, Equatable, TDFunction {
	public typealias Result = WebPageInstantView
	///  The web page URL 
	public let url: String
	///  If true, the full instant view for the web page will be returned
	public let forceFull: Bool
	/// Returns an instant view version of a web page if available. Returns a 404 error if the web page has no instant view page 
	/// - Parameters:
	///   - url: The web page URL 
	///   - forceFull: If true, the full instant view for the web page will be returned
	public init(url: String, forceFull: Bool) {
		self.url = url
		self.forceFull = forceFull
	}
}

///  Returns the notification settings for a given scope 
public struct GetNotificationSettings: Codable, Equatable, TDFunction {
	public typealias Result = NotificationSettings
	///  Scope for which to return the notification settings information
	public let scope: NotificationSettingsScope
	/// Returns the notification settings for a given scope 
	/// - Parameters:
	///   - scope: Scope for which to return the notification settings information
	public init(scope: NotificationSettingsScope) {
		self.scope = scope
	}
}

///  Changes notification settings for a given scope 
public struct SetNotificationSettings: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Scope for which to change the notification settings 
	public let scope: NotificationSettingsScope
	///  The new notification settings for the given scope
	public let notificationSettings: NotificationSettings
	/// Changes notification settings for a given scope 
	/// - Parameters:
	///   - scope: Scope for which to change the notification settings 
	///   - notificationSettings: The new notification settings for the given scope
	public init(scope: NotificationSettingsScope, notificationSettings: NotificationSettings) {
		self.scope = scope
		self.notificationSettings = notificationSettings
	}
}

///  Resets all notification settings to their default values. By default, the only muted chats are supergroups, the sound is set to "default" and message previews are shown
public struct ResetAllNotificationSettings: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	/// Resets all notification settings to their default values. By default, the only muted chats are supergroups, the sound is set to "default" and message previews are shown
	public init() {
	}
}

///  Uploads a new profile photo for the current user. If something changes, updateUser will be sent 
public struct SetProfilePhoto: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Profile photo to set. inputFileId and inputFileRemote may still be unsupported
	public let photo: InputFile
	/// Uploads a new profile photo for the current user. If something changes, updateUser will be sent 
	/// - Parameters:
	///   - photo: Profile photo to set. inputFileId and inputFileRemote may still be unsupported
	public init(photo: InputFile) {
		self.photo = photo
	}
}

///  Deletes a profile photo. If something changes, updateUser will be sent 
public struct DeleteProfilePhoto: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Identifier of the profile photo to delete
	public let profilePhotoId: TDInt64
	/// Deletes a profile photo. If something changes, updateUser will be sent 
	/// - Parameters:
	///   - profilePhotoId: Identifier of the profile photo to delete
	public init(profilePhotoId: TDInt64) {
		self.profilePhotoId = profilePhotoId
	}
}

///  Changes the first and last name of the current user. If something changes, updateUser will be sent 
public struct SetName: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  The new value of the first name for the user; 1-255 characters 
	public let firstName: String
	///  The new value of the optional last name for the user; 0-255 characters
	public let lastName: String
	/// Changes the first and last name of the current user. If something changes, updateUser will be sent 
	/// - Parameters:
	///   - firstName: The new value of the first name for the user; 1-255 characters 
	///   - lastName: The new value of the optional last name for the user; 0-255 characters
	public init(firstName: String, lastName: String) {
		self.firstName = firstName
		self.lastName = lastName
	}
}

///  Changes the bio of the current user 
public struct SetBio: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  The new value of the user bio; 0-70 characters without line feeds
	public let bio: String
	/// Changes the bio of the current user 
	/// - Parameters:
	///   - bio: The new value of the user bio; 0-70 characters without line feeds
	public init(bio: String) {
		self.bio = bio
	}
}

///  Changes the username of the current user. If something changes, updateUser will be sent 
public struct SetUsername: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  The new value of the username. Use an empty string to remove the username
	public let username: String
	/// Changes the username of the current user. If something changes, updateUser will be sent 
	/// - Parameters:
	///   - username: The new value of the username. Use an empty string to remove the username
	public init(username: String) {
		self.username = username
	}
}

///  Changes the phone number of the user and sends an authentication code to the user's new phone number. On success, returns information about the sent code 
public struct ChangePhoneNumber: Codable, Equatable, TDFunction {
	public typealias Result = AuthenticationCodeInfo
	///  The new phone number of the user in international format 
	public let phoneNumber: String
	///  Pass true if the code can be sent via flash call to the specified phone number 
	public let allowFlashCall: Bool
	///  Pass true if the phone number is used on the current device. Ignored if allow_flash_call is false
	public let isCurrentPhoneNumber: Bool
	/// Changes the phone number of the user and sends an authentication code to the user's new phone number. On success, returns information about the sent code 
	/// - Parameters:
	///   - phoneNumber: The new phone number of the user in international format 
	///   - allowFlashCall: Pass true if the code can be sent via flash call to the specified phone number 
	///   - isCurrentPhoneNumber: Pass true if the phone number is used on the current device. Ignored if allow_flash_call is false
	public init(phoneNumber: String, allowFlashCall: Bool, isCurrentPhoneNumber: Bool) {
		self.phoneNumber = phoneNumber
		self.allowFlashCall = allowFlashCall
		self.isCurrentPhoneNumber = isCurrentPhoneNumber
	}
}

///  Re-sends the authentication code sent to confirm a new phone number for the user. Works only if the previously received authenticationCodeInfo next_code_type was not null
public struct ResendChangePhoneNumberCode: Codable, Equatable, TDFunction {
	public typealias Result = AuthenticationCodeInfo
	/// Re-sends the authentication code sent to confirm a new phone number for the user. Works only if the previously received authenticationCodeInfo next_code_type was not null
	public init() {
	}
}

///  Checks the authentication code sent to confirm a new phone number of the user 
public struct CheckChangePhoneNumberCode: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Verification code received by SMS, phone call or flash call
	public let code: String
	/// Checks the authentication code sent to confirm a new phone number of the user 
	/// - Parameters:
	///   - code: Verification code received by SMS, phone call or flash call
	public init(code: String) {
		self.code = code
	}
}

///  Returns all active sessions of the current user
public struct GetActiveSessions: Codable, Equatable, TDFunction {
	public typealias Result = Sessions
	/// Returns all active sessions of the current user
	public init() {
	}
}

///  Terminates a session of the current user 
public struct TerminateSession: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Session identifier
	public let sessionId: TDInt64
	/// Terminates a session of the current user 
	/// - Parameters:
	///   - sessionId: Session identifier
	public init(sessionId: TDInt64) {
		self.sessionId = sessionId
	}
}

///  Terminates all other sessions of the current user
public struct TerminateAllOtherSessions: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	/// Terminates all other sessions of the current user
	public init() {
	}
}

///  Returns all website where the current user used Telegram to log in
public struct GetConnectedWebsites: Codable, Equatable, TDFunction {
	public typealias Result = ConnectedWebsites
	/// Returns all website where the current user used Telegram to log in
	public init() {
	}
}

///  Disconnects website from the current user's Telegram account 
public struct DisconnectWebsite: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Website identifier
	public let websiteId: TDInt64
	/// Disconnects website from the current user's Telegram account 
	/// - Parameters:
	///   - websiteId: Website identifier
	public init(websiteId: TDInt64) {
		self.websiteId = websiteId
	}
}

///  Disconnects all websites from the current user's Telegram account
public struct DisconnectAllWebsites: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	/// Disconnects all websites from the current user's Telegram account
	public init() {
	}
}

///  Toggles the "All members are admins" setting in basic groups; requires creator privileges in the group 
public struct ToggleBasicGroupAdministrators: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Identifier of the basic group 
	public let basicGroupId: Int32
	///  New value of everyone_is_administrator
	public let everyoneIsAdministrator: Bool
	/// Toggles the "All members are admins" setting in basic groups; requires creator privileges in the group 
	/// - Parameters:
	///   - basicGroupId: Identifier of the basic group 
	///   - everyoneIsAdministrator: New value of everyone_is_administrator
	public init(basicGroupId: Int32, everyoneIsAdministrator: Bool) {
		self.basicGroupId = basicGroupId
		self.everyoneIsAdministrator = everyoneIsAdministrator
	}
}

///  Changes the username of a supergroup or channel, requires creator privileges in the supergroup or channel 
public struct SetSupergroupUsername: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Identifier of the supergroup or channel 
	public let supergroupId: Int32
	///  New value of the username. Use an empty string to remove the username
	public let username: String
	/// Changes the username of a supergroup or channel, requires creator privileges in the supergroup or channel 
	/// - Parameters:
	///   - supergroupId: Identifier of the supergroup or channel 
	///   - username: New value of the username. Use an empty string to remove the username
	public init(supergroupId: Int32, username: String) {
		self.supergroupId = supergroupId
		self.username = username
	}
}

///  Changes the sticker set of a supergroup; requires appropriate rights in the supergroup 
public struct SetSupergroupStickerSet: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Identifier of the supergroup 
	public let supergroupId: Int32
	///  New value of the supergroup sticker set identifier. Use 0 to remove the supergroup sticker set
	public let stickerSetId: TDInt64
	/// Changes the sticker set of a supergroup; requires appropriate rights in the supergroup 
	/// - Parameters:
	///   - supergroupId: Identifier of the supergroup 
	///   - stickerSetId: New value of the supergroup sticker set identifier. Use 0 to remove the supergroup sticker set
	public init(supergroupId: Int32, stickerSetId: TDInt64) {
		self.supergroupId = supergroupId
		self.stickerSetId = stickerSetId
	}
}

///  Toggles whether all members of a supergroup can add new members; requires appropriate administrator rights in the supergroup. 
public struct ToggleSupergroupInvites: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Identifier of the supergroup 
	public let supergroupId: Int32
	///  New value of anyone_can_invite
	public let anyoneCanInvite: Bool
	/// Toggles whether all members of a supergroup can add new members; requires appropriate administrator rights in the supergroup. 
	/// - Parameters:
	///   - supergroupId: Identifier of the supergroup 
	///   - anyoneCanInvite: New value of anyone_can_invite
	public init(supergroupId: Int32, anyoneCanInvite: Bool) {
		self.supergroupId = supergroupId
		self.anyoneCanInvite = anyoneCanInvite
	}
}

///  Toggles sender signatures messages sent in a channel; requires appropriate administrator rights in the channel. 
public struct ToggleSupergroupSignMessages: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Identifier of the channel 
	public let supergroupId: Int32
	///  New value of sign_messages
	public let signMessages: Bool
	/// Toggles sender signatures messages sent in a channel; requires appropriate administrator rights in the channel. 
	/// - Parameters:
	///   - supergroupId: Identifier of the channel 
	///   - signMessages: New value of sign_messages
	public init(supergroupId: Int32, signMessages: Bool) {
		self.supergroupId = supergroupId
		self.signMessages = signMessages
	}
}

///  Toggles whether the message history of a supergroup is available to new members; requires appropriate administrator rights in the supergroup. 
public struct ToggleSupergroupIsAllHistoryAvailable: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  The identifier of the supergroup 
	public let supergroupId: Int32
	///  The new value of is_all_history_available
	public let isAllHistoryAvailable: Bool
	/// Toggles whether the message history of a supergroup is available to new members; requires appropriate administrator rights in the supergroup. 
	/// - Parameters:
	///   - supergroupId: The identifier of the supergroup 
	///   - isAllHistoryAvailable: The new value of is_all_history_available
	public init(supergroupId: Int32, isAllHistoryAvailable: Bool) {
		self.supergroupId = supergroupId
		self.isAllHistoryAvailable = isAllHistoryAvailable
	}
}

///  Changes information about a supergroup or channel; requires appropriate administrator rights 
public struct SetSupergroupDescription: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Identifier of the supergroup or channel 
	public let supergroupId: Int32
	///  New supergroup or channel description; 0-255 characters
	public let description: String
	/// Changes information about a supergroup or channel; requires appropriate administrator rights 
	/// - Parameters:
	///   - supergroupId: Identifier of the supergroup or channel 
	///   - description: New supergroup or channel description; 0-255 characters
	public init(supergroupId: Int32, description: String) {
		self.supergroupId = supergroupId
		self.description = description
	}
}

///  Pins a message in a supergroup or channel; requires appropriate administrator rights in the supergroup or channel 
public struct PinSupergroupMessage: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Identifier of the supergroup or channel 
	public let supergroupId: Int32
	///  Identifier of the new pinned message 
	public let messageId: Int53
	///  True, if there should be no notification about the pinned message
	public let disableNotification: Bool
	/// Pins a message in a supergroup or channel; requires appropriate administrator rights in the supergroup or channel 
	/// - Parameters:
	///   - supergroupId: Identifier of the supergroup or channel 
	///   - messageId: Identifier of the new pinned message 
	///   - disableNotification: True, if there should be no notification about the pinned message
	public init(supergroupId: Int32, messageId: Int53, disableNotification: Bool) {
		self.supergroupId = supergroupId
		self.messageId = messageId
		self.disableNotification = disableNotification
	}
}

///  Removes the pinned message from a supergroup or channel; requires appropriate administrator rights in the supergroup or channel 
public struct UnpinSupergroupMessage: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Identifier of the supergroup or channel
	public let supergroupId: Int32
	/// Removes the pinned message from a supergroup or channel; requires appropriate administrator rights in the supergroup or channel 
	/// - Parameters:
	///   - supergroupId: Identifier of the supergroup or channel
	public init(supergroupId: Int32) {
		self.supergroupId = supergroupId
	}
}

///  Reports some messages from a user in a supergroup as spam 
public struct ReportSupergroupSpam: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Supergroup identifier 
	public let supergroupId: Int32
	///  User identifier 
	public let userId: Int32
	///  Identifiers of messages sent in the supergroup by the user. This list must be non-empty
	public let messageIds: [Int53]
	/// Reports some messages from a user in a supergroup as spam 
	/// - Parameters:
	///   - supergroupId: Supergroup identifier 
	///   - userId: User identifier 
	///   - messageIds: Identifiers of messages sent in the supergroup by the user. This list must be non-empty
	public init(supergroupId: Int32, userId: Int32, messageIds: [Int53]) {
		self.supergroupId = supergroupId
		self.userId = userId
		self.messageIds = messageIds
	}
}

///  Returns information about members or banned users in a supergroup or channel. Can be used only if SupergroupFullInfo.can_get_members == true; additionally, administrator privileges may be required for some filters 
public struct GetSupergroupMembers: Codable, Equatable, TDFunction {
	public typealias Result = ChatMembers
	///  Identifier of the supergroup or channel 
	public let supergroupId: Int32
	///  The type of users to return. By default, supergroupMembersRecent 
	public let filter: SupergroupMembersFilter
	///  Number of users to skip 
	public let offset: Int32
	///  The maximum number of users be returned; up to 200
	public let limit: Int32
	/// Returns information about members or banned users in a supergroup or channel. Can be used only if SupergroupFullInfo.can_get_members == true; additionally, administrator privileges may be required for some filters 
	/// - Parameters:
	///   - supergroupId: Identifier of the supergroup or channel 
	///   - filter: The type of users to return. By default, supergroupMembersRecent 
	///   - offset: Number of users to skip 
	///   - limit: The maximum number of users be returned; up to 200
	public init(supergroupId: Int32, filter: SupergroupMembersFilter, offset: Int32, limit: Int32) {
		self.supergroupId = supergroupId
		self.filter = filter
		self.offset = offset
		self.limit = limit
	}
}

///  Deletes a supergroup or channel along with all messages in the corresponding chat. This will release the supergroup or channel username and remove all members; requires creator privileges in the supergroup or channel. Chats with more than 1000 members can't be deleted using this method 
public struct DeleteSupergroup: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Identifier of the supergroup or channel
	public let supergroupId: Int32
	/// Deletes a supergroup or channel along with all messages in the corresponding chat. This will release the supergroup or channel username and remove all members; requires creator privileges in the supergroup or channel. Chats with more than 1000 members can't be deleted using this method 
	/// - Parameters:
	///   - supergroupId: Identifier of the supergroup or channel
	public init(supergroupId: Int32) {
		self.supergroupId = supergroupId
	}
}

///  Closes a secret chat, effectively transfering its state to secretChatStateClosed 
public struct CloseSecretChat: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Secret chat identifier
	public let secretChatId: Int32
	/// Closes a secret chat, effectively transfering its state to secretChatStateClosed 
	/// - Parameters:
	///   - secretChatId: Secret chat identifier
	public init(secretChatId: Int32) {
		self.secretChatId = secretChatId
	}
}

///  Returns a list of service actions taken by chat members and administrators in the last 48 hours. Available only in supergroups and channels. Requires administrator rights. Returns results in reverse chronological order (i. e., in order of decreasing event_id) 
public struct GetChatEventLog: Codable, Equatable, TDFunction {
	public typealias Result = ChatEvents
	///  Chat identifier 
	public let chatId: Int53
	///  Search query by which to filter events 
	public let query: String
	///  Identifier of an event from which to return results. Use 0 to get results from the latest events 
	public let fromEventId: TDInt64
	///  Maximum number of events to return; up to 100 
	public let limit: Int32
	///  The types of events to return. By default, all types will be returned 
	public let filters: ChatEventLogFilters
	///  User identifiers by which to filter events. By default, events relating to all users will be returned
	public let userIds: [Int32]
	/// Returns a list of service actions taken by chat members and administrators in the last 48 hours. Available only in supergroups and channels. Requires administrator rights. Returns results in reverse chronological order (i. e., in order of decreasing event_id) 
	/// - Parameters:
	///   - chatId: Chat identifier 
	///   - query: Search query by which to filter events 
	///   - fromEventId: Identifier of an event from which to return results. Use 0 to get results from the latest events 
	///   - limit: Maximum number of events to return; up to 100 
	///   - filters: The types of events to return. By default, all types will be returned 
	///   - userIds: User identifiers by which to filter events. By default, events relating to all users will be returned
	public init(chatId: Int53, query: String, fromEventId: TDInt64, limit: Int32, filters: ChatEventLogFilters, userIds: [Int32]) {
		self.chatId = chatId
		self.query = query
		self.fromEventId = fromEventId
		self.limit = limit
		self.filters = filters
		self.userIds = userIds
	}
}

///  Returns an invoice payment form. This method should be called when the user presses inlineKeyboardButtonBuy 
public struct GetPaymentForm: Codable, Equatable, TDFunction {
	public typealias Result = PaymentForm
	///  Chat identifier of the Invoice message 
	public let chatId: Int53
	///  Message identifier
	public let messageId: Int53
	/// Returns an invoice payment form. This method should be called when the user presses inlineKeyboardButtonBuy 
	/// - Parameters:
	///   - chatId: Chat identifier of the Invoice message 
	///   - messageId: Message identifier
	public init(chatId: Int53, messageId: Int53) {
		self.chatId = chatId
		self.messageId = messageId
	}
}

///  Validates the order information provided by a user and returns the available shipping options for a flexible invoice 
public struct ValidateOrderInfo: Codable, Equatable, TDFunction {
	public typealias Result = ValidatedOrderInfo
	///  Chat identifier of the Invoice message 
	public let chatId: Int53
	///  Message identifier 
	public let messageId: Int53
	///  The order information, provided by the user 
	public let orderInfo: OrderInfo
	///  True, if the order information can be saved
	public let allowSave: Bool
	/// Validates the order information provided by a user and returns the available shipping options for a flexible invoice 
	/// - Parameters:
	///   - chatId: Chat identifier of the Invoice message 
	///   - messageId: Message identifier 
	///   - orderInfo: The order information, provided by the user 
	///   - allowSave: True, if the order information can be saved
	public init(chatId: Int53, messageId: Int53, orderInfo: OrderInfo, allowSave: Bool) {
		self.chatId = chatId
		self.messageId = messageId
		self.orderInfo = orderInfo
		self.allowSave = allowSave
	}
}

///  Sends a filled-out payment form to the bot for final verification 
public struct SendPaymentForm: Codable, Equatable, TDFunction {
	public typealias Result = PaymentResult
	///  Chat identifier of the Invoice message 
	public let chatId: Int53
	///  Message identifier 
	public let messageId: Int53
	///  Identifier returned by ValidateOrderInfo, or an empty string 
	public let orderInfoId: String
	///  Identifier of a chosen shipping option, if applicable 
	public let shippingOptionId: String
	///  The credentials chosen by user for payment
	public let credentials: InputCredentials
	/// Sends a filled-out payment form to the bot for final verification 
	/// - Parameters:
	///   - chatId: Chat identifier of the Invoice message 
	///   - messageId: Message identifier 
	///   - orderInfoId: Identifier returned by ValidateOrderInfo, or an empty string 
	///   - shippingOptionId: Identifier of a chosen shipping option, if applicable 
	///   - credentials: The credentials chosen by user for payment
	public init(chatId: Int53, messageId: Int53, orderInfoId: String, shippingOptionId: String, credentials: InputCredentials) {
		self.chatId = chatId
		self.messageId = messageId
		self.orderInfoId = orderInfoId
		self.shippingOptionId = shippingOptionId
		self.credentials = credentials
	}
}

///  Returns information about a successful payment 
public struct GetPaymentReceipt: Codable, Equatable, TDFunction {
	public typealias Result = PaymentReceipt
	///  Chat identifier of the PaymentSuccessful message 
	public let chatId: Int53
	///  Message identifier
	public let messageId: Int53
	/// Returns information about a successful payment 
	/// - Parameters:
	///   - chatId: Chat identifier of the PaymentSuccessful message 
	///   - messageId: Message identifier
	public init(chatId: Int53, messageId: Int53) {
		self.chatId = chatId
		self.messageId = messageId
	}
}

///  Returns saved order info, if any
public struct GetSavedOrderInfo: Codable, Equatable, TDFunction {
	public typealias Result = OrderInfo
	/// Returns saved order info, if any
	public init() {
	}
}

///  Deletes saved order info
public struct DeleteSavedOrderInfo: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	/// Deletes saved order info
	public init() {
	}
}

///  Deletes saved credentials for all payment provider bots
public struct DeleteSavedCredentials: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	/// Deletes saved credentials for all payment provider bots
	public init() {
	}
}

///  Returns a user that can be contacted to get support
public struct GetSupportUser: Codable, Equatable, TDFunction {
	public typealias Result = User
	/// Returns a user that can be contacted to get support
	public init() {
	}
}

///  Returns background wallpapers
public struct GetWallpapers: Codable, Equatable, TDFunction {
	public typealias Result = Wallpapers
	/// Returns background wallpapers
	public init() {
	}
}

///  Registers the currently used device for receiving push notifications 
public struct RegisterDevice: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Device token 
	public let deviceToken: DeviceToken
	///  List of at most 100 user identifiers of other users currently using the client
	public let otherUserIds: [Int32]
	/// Registers the currently used device for receiving push notifications 
	/// - Parameters:
	///   - deviceToken: Device token 
	///   - otherUserIds: List of at most 100 user identifiers of other users currently using the client
	public init(deviceToken: DeviceToken, otherUserIds: [Int32]) {
		self.deviceToken = deviceToken
		self.otherUserIds = otherUserIds
	}
}

///  Returns t.me URLs recently visited by a newly registered user 
public struct GetRecentlyVisitedTMeUrls: Codable, Equatable, TDFunction {
	public typealias Result = TMeUrls
	///  Google Play referrer to identify the user
	public let referrer: String
	/// Returns t.me URLs recently visited by a newly registered user 
	/// - Parameters:
	///   - referrer: Google Play referrer to identify the user
	public init(referrer: String) {
		self.referrer = referrer
	}
}

///  Changes user privacy settings 
public struct SetUserPrivacySettingRules: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  The privacy setting 
	public let setting: UserPrivacySetting
	///  The new privacy rules
	public let rules: UserPrivacySettingRules
	/// Changes user privacy settings 
	/// - Parameters:
	///   - setting: The privacy setting 
	///   - rules: The new privacy rules
	public init(setting: UserPrivacySetting, rules: UserPrivacySettingRules) {
		self.setting = setting
		self.rules = rules
	}
}

///  Returns the current privacy settings 
public struct GetUserPrivacySettingRules: Codable, Equatable, TDFunction {
	public typealias Result = UserPrivacySettingRules
	///  The privacy setting
	public let setting: UserPrivacySetting
	/// Returns the current privacy settings 
	/// - Parameters:
	///   - setting: The privacy setting
	public init(setting: UserPrivacySetting) {
		self.setting = setting
	}
}

///  Returns the value of an option by its name. (Check the list of available options on https://core.telegram.org/tdlib/options.) Can be called before authorization 
public struct GetOption: Codable, Equatable, TDFunction {
	public typealias Result = OptionValue
	///  The name of the option
	public let name: String
	/// Returns the value of an option by its name. (Check the list of available options on https://core.telegram.org/tdlib/options.) Can be called before authorization 
	/// - Parameters:
	///   - name: The name of the option
	public init(name: String) {
		self.name = name
	}
}

///  Sets the value of an option. (Check the list of available options on https://core.telegram.org/tdlib/options.) Only writable options can be set. Can be called before authorization 
public struct SetOption: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  The name of the option 
	public let name: String
	///  The new value of the option
	public let value: OptionValue
	/// Sets the value of an option. (Check the list of available options on https://core.telegram.org/tdlib/options.) Only writable options can be set. Can be called before authorization 
	/// - Parameters:
	///   - name: The name of the option 
	///   - value: The new value of the option
	public init(name: String, value: OptionValue) {
		self.name = name
		self.value = value
	}
}

///  Changes the period of inactivity after which the account of the current user will automatically be deleted 
public struct SetAccountTtl: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  New account TTL
	public let ttl: AccountTtl
	/// Changes the period of inactivity after which the account of the current user will automatically be deleted 
	/// - Parameters:
	///   - ttl: New account TTL
	public init(ttl: AccountTtl) {
		self.ttl = ttl
	}
}

///  Returns the period of inactivity after which the account of the current user will automatically be deleted
public struct GetAccountTtl: Codable, Equatable, TDFunction {
	public typealias Result = AccountTtl
	/// Returns the period of inactivity after which the account of the current user will automatically be deleted
	public init() {
	}
}

///  Deletes the account of the current user, deleting all information associated with the user from the server. The phone number of the account can be used to create a new account 
public struct DeleteAccount: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  The reason why the account was deleted; optional
	public let reason: String
	/// Deletes the account of the current user, deleting all information associated with the user from the server. The phone number of the account can be used to create a new account 
	/// - Parameters:
	///   - reason: The reason why the account was deleted; optional
	public init(reason: String) {
		self.reason = reason
	}
}

///  Returns information on whether the current chat can be reported as spam 
public struct GetChatReportSpamState: Codable, Equatable, TDFunction {
	public typealias Result = ChatReportSpamState
	///  Chat identifier
	public let chatId: Int53
	/// Returns information on whether the current chat can be reported as spam 
	/// - Parameters:
	///   - chatId: Chat identifier
	public init(chatId: Int53) {
		self.chatId = chatId
	}
}

///  Used to let the server know whether a chat is spam or not. Can be used only if ChatReportSpamState.can_report_spam is true. After this request, ChatReportSpamState.can_report_spam becomes false forever 
public struct ChangeChatReportSpamState: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Chat identifier 
	public let chatId: Int53
	///  If true, the chat will be reported as spam; otherwise it will be marked as not spam
	public let isSpamChat: Bool
	/// Used to let the server know whether a chat is spam or not. Can be used only if ChatReportSpamState.can_report_spam is true. After this request, ChatReportSpamState.can_report_spam becomes false forever 
	/// - Parameters:
	///   - chatId: Chat identifier 
	///   - isSpamChat: If true, the chat will be reported as spam; otherwise it will be marked as not spam
	public init(chatId: Int53, isSpamChat: Bool) {
		self.chatId = chatId
		self.isSpamChat = isSpamChat
	}
}

///  Reports a chat to the Telegram moderators. Supported only for supergroups, channels, or private chats with bots, since other chats can't be checked by moderators 
public struct ReportChat: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Chat identifier 
	public let chatId: Int53
	///  The reason for reporting the chat 
	public let reason: ChatReportReason
	///  Identifiers of reported messages, if any
	public let messageIds: [Int53]
	/// Reports a chat to the Telegram moderators. Supported only for supergroups, channels, or private chats with bots, since other chats can't be checked by moderators 
	/// - Parameters:
	///   - chatId: Chat identifier 
	///   - reason: The reason for reporting the chat 
	///   - messageIds: Identifiers of reported messages, if any
	public init(chatId: Int53, reason: ChatReportReason, messageIds: [Int53]) {
		self.chatId = chatId
		self.reason = reason
		self.messageIds = messageIds
	}
}

///  Returns storage usage statistics 
public struct GetStorageStatistics: Codable, Equatable, TDFunction {
	public typealias Result = StorageStatistics
	///  Maximum number of chats with the largest storage usage for which separate statistics should be returned. All other chats will be grouped in entries with chat_id == 0. If the chat info database is not used, the chat_limit is ignored and is always set to 0
	public let chatLimit: Int32
	/// Returns storage usage statistics 
	/// - Parameters:
	///   - chatLimit: Maximum number of chats with the largest storage usage for which separate statistics should be returned. All other chats will be grouped in entries with chat_id == 0. If the chat info database is not used, the chat_limit is ignored and is always set to 0
	public init(chatLimit: Int32) {
		self.chatLimit = chatLimit
	}
}

///  Quickly returns approximate storage usage statistics
public struct GetStorageStatisticsFast: Codable, Equatable, TDFunction {
	public typealias Result = StorageStatisticsFast
	/// Quickly returns approximate storage usage statistics
	public init() {
	}
}

///  Optimizes storage usage, i.e. deletes some files and returns new storage usage statistics. Secret thumbnails can't be deleted 
public struct OptimizeStorage: Codable, Equatable, TDFunction {
	public typealias Result = StorageStatistics
	///  Limit on the total size of files after deletion. Pass -1 to use the default limit 
	public let size: Int53
	///  Limit on the time that has passed since the last time a file was accessed (or creation time for some filesystems). Pass -1 to use the default limit 
	public let ttl: Int32
	///  Limit on the total count of files after deletion. Pass -1 to use the default limit 
	public let count: Int32
	///  The amount of time after the creation of a file during which it can't be deleted, in seconds. Pass -1 to use the default value 
	public let immunityDelay: Int32
	///  If not empty, only files with the given type(s) are considered. By default, all types except thumbnails, profile photos, stickers and wallpapers are deleted 
	public let fileTypes: [FileType]
	///  If not empty, only files from the given chats are considered. Use 0 as chat identifier to delete files not belonging to any chat (e.g., profile photos) 
	public let chatIds: [Int53]
	///  If not empty, files from the given chats are excluded. Use 0 as chat identifier to exclude all files not belonging to any chat (e.g., profile photos) 
	public let excludeChatIds: [Int53]
	///  Same as in getStorageStatistics. Affects only returned statistics
	public let chatLimit: Int32
	/// Optimizes storage usage, i.e. deletes some files and returns new storage usage statistics. Secret thumbnails can't be deleted 
	/// - Parameters:
	///   - size: Limit on the total size of files after deletion. Pass -1 to use the default limit 
	///   - ttl: Limit on the time that has passed since the last time a file was accessed (or creation time for some filesystems). Pass -1 to use the default limit 
	///   - count: Limit on the total count of files after deletion. Pass -1 to use the default limit 
	///   - immunityDelay: The amount of time after the creation of a file during which it can't be deleted, in seconds. Pass -1 to use the default value 
	///   - fileTypes: If not empty, only files with the given type(s) are considered. By default, all types except thumbnails, profile photos, stickers and wallpapers are deleted 
	///   - chatIds: If not empty, only files from the given chats are considered. Use 0 as chat identifier to delete files not belonging to any chat (e.g., profile photos) 
	///   - excludeChatIds: If not empty, files from the given chats are excluded. Use 0 as chat identifier to exclude all files not belonging to any chat (e.g., profile photos) 
	///   - chatLimit: Same as in getStorageStatistics. Affects only returned statistics
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

///  Sets the current network type. Can be called before authorization. Calling this method forces all network connections to reopen, mitigating the delay in switching between different networks, so it should be called whenever the network is changed, even if the network type remains the same. -Network type is used to check whether the library can use the network at all and also for collecting detailed network data usage statistics 
public struct SetNetworkType: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  The new network type. By default, networkTypeOther
	public let type: NetworkType
	/// Sets the current network type. Can be called before authorization. Calling this method forces all network connections to reopen, mitigating the delay in switching between different networks, so it should be called whenever the network is changed, even if the network type remains the same. -Network type is used to check whether the library can use the network at all and also for collecting detailed network data usage statistics 
	/// - Parameters:
	///   - type: The new network type. By default, networkTypeOther
	public init(type: NetworkType) {
		self.type = type
	}
}

///  Returns network data usage statistics. Can be called before authorization 
public struct GetNetworkStatistics: Codable, Equatable, TDFunction {
	public typealias Result = NetworkStatistics
	///  If true, returns only data for the current library launch
	public let onlyCurrent: Bool
	/// Returns network data usage statistics. Can be called before authorization 
	/// - Parameters:
	///   - onlyCurrent: If true, returns only data for the current library launch
	public init(onlyCurrent: Bool) {
		self.onlyCurrent = onlyCurrent
	}
}

///  Adds the specified data to data usage statistics. Can be called before authorization 
public struct AddNetworkStatistics: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  The network statistics entry with the data to be added to statistics
	public let entry: NetworkStatisticsEntry
	/// Adds the specified data to data usage statistics. Can be called before authorization 
	/// - Parameters:
	///   - entry: The network statistics entry with the data to be added to statistics
	public init(entry: NetworkStatisticsEntry) {
		self.entry = entry
	}
}

///  Resets all network data usage statistics to zero. Can be called before authorization
public struct ResetNetworkStatistics: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	/// Resets all network data usage statistics to zero. Can be called before authorization
	public init() {
	}
}

///  Informs the server about the number of pending bot updates if they haven't been processed for a long time; for bots only 
public struct SetBotUpdatesStatus: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  The number of pending updates 
	public let pendingUpdateCount: Int32
	///  The last error message
	public let errorMessage: String
	/// Informs the server about the number of pending bot updates if they haven't been processed for a long time; for bots only 
	/// - Parameters:
	///   - pendingUpdateCount: The number of pending updates 
	///   - errorMessage: The last error message
	public init(pendingUpdateCount: Int32, errorMessage: String) {
		self.pendingUpdateCount = pendingUpdateCount
		self.errorMessage = errorMessage
	}
}

///  Uploads a PNG image with a sticker; for bots only; returns the uploaded file 
public struct UploadStickerFile: Codable, Equatable, TDFunction {
	public typealias Result = File
	///  Sticker file owner 
	public let userId: Int32
	///  PNG image with the sticker; must be up to 512 kB in size and fit in 512x512 square
	public let pngSticker: InputFile
	/// Uploads a PNG image with a sticker; for bots only; returns the uploaded file 
	/// - Parameters:
	///   - userId: Sticker file owner 
	///   - pngSticker: PNG image with the sticker; must be up to 512 kB in size and fit in 512x512 square
	public init(userId: Int32, pngSticker: InputFile) {
		self.userId = userId
		self.pngSticker = pngSticker
	}
}

///  Creates a new sticker set; for bots only. Returns the newly created sticker set 
public struct CreateNewStickerSet: Codable, Equatable, TDFunction {
	public typealias Result = StickerSet
	///  Sticker set owner 
	public let userId: Int32
	///  Sticker set title; 1-64 characters 
	public let title: String
	///  Sticker set name. Can contain only English letters, digits and underscores. Must end with *"_by_<bot username>"* (*<bot_username>* is case insensitive); 1-64 characters 
	public let name: String
	///  True, if stickers are masks 
	public let isMasks: Bool
	///  List of stickers to be added to the set
	public let stickers: [InputSticker]
	/// Creates a new sticker set; for bots only. Returns the newly created sticker set 
	/// - Parameters:
	///   - userId: Sticker set owner 
	///   - title: Sticker set title; 1-64 characters 
	///   - name: Sticker set name. Can contain only English letters, digits and underscores. Must end with *"_by_<bot username>"* (*<bot_username>* is case insensitive); 1-64 characters 
	///   - isMasks: True, if stickers are masks 
	///   - stickers: List of stickers to be added to the set
	public init(userId: Int32, title: String, name: String, isMasks: Bool, stickers: [InputSticker]) {
		self.userId = userId
		self.title = title
		self.name = name
		self.isMasks = isMasks
		self.stickers = stickers
	}
}

///  Adds a new sticker to a set; for bots only. Returns the sticker set 
public struct AddStickerToSet: Codable, Equatable, TDFunction {
	public typealias Result = StickerSet
	///  Sticker set owner 
	public let userId: Int32
	///  Sticker set name 
	public let name: String
	///  Sticker to add to the set
	public let sticker: InputSticker
	/// Adds a new sticker to a set; for bots only. Returns the sticker set 
	/// - Parameters:
	///   - userId: Sticker set owner 
	///   - name: Sticker set name 
	///   - sticker: Sticker to add to the set
	public init(userId: Int32, name: String, sticker: InputSticker) {
		self.userId = userId
		self.name = name
		self.sticker = sticker
	}
}

///  Changes the position of a sticker in the set to which it belongs; for bots only. The sticker set must have been created by the bot 
public struct SetStickerPositionInSet: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Sticker 
	public let sticker: InputFile
	///  New position of the sticker in the set, zero-based
	public let position: Int32
	/// Changes the position of a sticker in the set to which it belongs; for bots only. The sticker set must have been created by the bot 
	/// - Parameters:
	///   - sticker: Sticker 
	///   - position: New position of the sticker in the set, zero-based
	public init(sticker: InputFile, position: Int32) {
		self.sticker = sticker
		self.position = position
	}
}

///  Removes a sticker from the set to which it belongs; for bots only. The sticker set must have been created by the bot 
public struct RemoveStickerFromSet: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Sticker
	public let sticker: InputFile
	/// Removes a sticker from the set to which it belongs; for bots only. The sticker set must have been created by the bot 
	/// - Parameters:
	///   - sticker: Sticker
	public init(sticker: InputFile) {
		self.sticker = sticker
	}
}

///  Sends a custom request; for bots only 
public struct SendCustomRequest: Codable, Equatable, TDFunction {
	public typealias Result = CustomRequestResult
	///  The method name 
	public let method: String
	///  JSON-serialized method parameters
	public let parameters: String
	/// Sends a custom request; for bots only 
	/// - Parameters:
	///   - method: The method name 
	///   - parameters: JSON-serialized method parameters
	public init(method: String, parameters: String) {
		self.method = method
		self.parameters = parameters
	}
}

///  Answers a custom query; for bots only 
public struct AnswerCustomQuery: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Identifier of a custom query 
	public let customQueryId: TDInt64
	///  JSON-serialized answer to the query
	public let data: String
	/// Answers a custom query; for bots only 
	/// - Parameters:
	///   - customQueryId: Identifier of a custom query 
	///   - data: JSON-serialized answer to the query
	public init(customQueryId: TDInt64, data: String) {
		self.customQueryId = customQueryId
		self.data = data
	}
}

///  Succeeds after a specified amount of time has passed. Can be called before authorization 
public struct SetAlarm: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Number of seconds before the function returns
	public let seconds: Double
	/// Succeeds after a specified amount of time has passed. Can be called before authorization 
	/// - Parameters:
	///   - seconds: Number of seconds before the function returns
	public init(seconds: Double) {
		self.seconds = seconds
	}
}

///  Uses current user IP to found his country. Returns two-letter ISO 3166-1 alpha-2 country code. Can be called before authorization
public struct GetCountryCode: Codable, Equatable, TDFunction {
	public typealias Result = Text
	/// Uses current user IP to found his country. Returns two-letter ISO 3166-1 alpha-2 country code. Can be called before authorization
	public init() {
	}
}

///  Returns the default text for invitation messages to be used as a placeholder when the current user invites friends to Telegram
public struct GetInviteText: Codable, Equatable, TDFunction {
	public typealias Result = Text
	/// Returns the default text for invitation messages to be used as a placeholder when the current user invites friends to Telegram
	public init() {
	}
}

///  Returns the terms of service. Can be called before authorization
public struct GetTermsOfService: Codable, Equatable, TDFunction {
	public typealias Result = Text
	/// Returns the terms of service. Can be called before authorization
	public init() {
	}
}

///  Sets the proxy server for network requests. Can be called before authorization 
public struct SetProxy: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	///  Proxy server to use. Specify null to remove the proxy server
	public let proxy: Proxy
	/// Sets the proxy server for network requests. Can be called before authorization 
	/// - Parameters:
	///   - proxy: Proxy server to use. Specify null to remove the proxy server
	public init(proxy: Proxy) {
		self.proxy = proxy
	}
}

///  Returns the proxy that is currently set up. Can be called before authorization
public struct GetProxy: Codable, Equatable, TDFunction {
	public typealias Result = Proxy
	/// Returns the proxy that is currently set up. Can be called before authorization
	public init() {
	}
}

///  Does nothing; for testing only
public struct TestCallEmpty: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	/// Does nothing; for testing only
	public init() {
	}
}

///  Returns the received string; for testing only 
public struct TestCallString: Codable, Equatable, TDFunction {
	public typealias Result = TestString
	///  String to return
	public let x: String
	/// Returns the received string; for testing only 
	/// - Parameters:
	///   - x: String to return
	public init(x: String) {
		self.x = x
	}
}

///  Returns the received bytes; for testing only 
public struct TestCallBytes: Codable, Equatable, TDFunction {
	public typealias Result = TestBytes
	///  Bytes to return
	public let x: Bytes
	/// Returns the received bytes; for testing only 
	/// - Parameters:
	///   - x: Bytes to return
	public init(x: Bytes) {
		self.x = x
	}
}

///  Returns the received vector of numbers; for testing only 
public struct TestCallVectorInt: Codable, Equatable, TDFunction {
	public typealias Result = TestVectorInt
	///  Vector of numbers to return
	public let x: [Int32]
	/// Returns the received vector of numbers; for testing only 
	/// - Parameters:
	///   - x: Vector of numbers to return
	public init(x: [Int32]) {
		self.x = x
	}
}

///  Returns the received vector of objects containing a number; for testing only 
public struct TestCallVectorIntObject: Codable, Equatable, TDFunction {
	public typealias Result = TestVectorIntObject
	///  Vector of objects to return
	public let x: [TestInt]
	/// Returns the received vector of objects containing a number; for testing only 
	/// - Parameters:
	///   - x: Vector of objects to return
	public init(x: [TestInt]) {
		self.x = x
	}
}

///  For testing only request. Returns the received vector of strings; for testing only 
public struct TestCallVectorString: Codable, Equatable, TDFunction {
	public typealias Result = TestVectorString
	///  Vector of strings to return
	public let x: [String]
	/// For testing only request. Returns the received vector of strings; for testing only 
	/// - Parameters:
	///   - x: Vector of strings to return
	public init(x: [String]) {
		self.x = x
	}
}

///  Returns the received vector of objects containing a string; for testing only 
public struct TestCallVectorStringObject: Codable, Equatable, TDFunction {
	public typealias Result = TestVectorStringObject
	///  Vector of objects to return
	public let x: [TestString]
	/// Returns the received vector of objects containing a string; for testing only 
	/// - Parameters:
	///   - x: Vector of objects to return
	public init(x: [TestString]) {
		self.x = x
	}
}

///  Returns the squared received number; for testing only 
public struct TestSquareInt: Codable, Equatable, TDFunction {
	public typealias Result = TestInt
	///  Number to square
	public let x: Int32
	/// Returns the squared received number; for testing only 
	/// - Parameters:
	///   - x: Number to square
	public init(x: Int32) {
		self.x = x
	}
}

///  Sends a simple network request to the Telegram servers; for testing only
public struct TestNetwork: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	/// Sends a simple network request to the Telegram servers; for testing only
	public init() {
	}
}

///  Forces an updates.getDifference call to the Telegram servers; for testing only
public struct TestGetDifference: Codable, Equatable, TDFunction {
	public typealias Result = Ok
	/// Forces an updates.getDifference call to the Telegram servers; for testing only
	public init() {
	}
}

///  Does nothing and ensures that the Update object is used; for testing only
public struct TestUseUpdate: Codable, Equatable, TDFunction {
	public typealias Result = Update
	/// Does nothing and ensures that the Update object is used; for testing only
	public init() {
	}
}

///  Does nothing and ensures that the Error object is used; for testing only
public struct TestUseError: Codable, Equatable, TDFunction {
	public typealias Result = Error
	/// Does nothing and ensures that the Error object is used; for testing only
	public init() {
	}
}

