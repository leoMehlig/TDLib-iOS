public struct SetTDLibParameters: TDFunction {
    public typealias T = Ok
    enum CodingKeys: String, CodingKey {
        case parameters = "parameters"
    }
    
    public let type: String = "setTdlibParameters"
    
    public let parameters: TDLibParameters
    
    public init(parameters: TDLibParameters) {
        self.parameters = parameters
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.parameters, forKey: .parameters)
    }
}

public struct TDLibParameters: Codable {
    let useTestDc: Bool
    let databaseDirectory: String
    let filesDirectory: String
    let useFileDatabase: Bool
    let useChatInfoDatabase: Bool
    let useMessageDatabase: Bool
    let disableMessageUnload: Bool
    let useSecretChats: Bool
    let apiId: Int
    let apiHash: String
    let systemLanguageCode: String
    let deviceModel: String
    let systemVersion: String
    let applicationVersion: String
    let enableStorageOptimizer: Bool
    let ignoreFileNames: Bool
    
//    enum CodingKeys: String, CodingKey {
//        case useTestDc = "use_test_dc"
//        case databaseDirectory = "database_directory"
//        case filesDirectory = "files_directory"
//        case useFileDatabase = "use_file_database"
//        case useChatInfoDatabase = "use_chat_info_database"
//        case useMessageDatabase = "use_message_database"
//        case useSecretChats = "use_secret_chats"
//        case apiId = "api_id"
//        case apiHash = "api_hash"
//        case systemLanguageCode = "system_language_code"
//        case deviceModel = "device_model"
//        case systemVersion = "system_version"
//        case applicationVersion = "application_version"
//        case enableStorageOptimizer = "enable_storage_optimizer"
//        case ignoreFileNames = "ignore_file_names"
//    }
    
    public init(useTestDc: Bool = false,
                databaseDirectory: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!,
                filesDirectory: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!,
                useFileDatabase: Bool = true,
                useChatInfoDatabase: Bool = true,
                useMessageDatabase: Bool = true,
                disableMessageUnload: Bool = true,
                useSecretChats: Bool = false,
                apiId: Int,
                apiHash: String,
                systemLanguageCode: String = "en",
                deviceModel: String = "iPhone",
                systemVersion: String = "11.1",
                applicationVersion: String = "1.0",
                enableStorageOptimizer: Bool = false,
                ignoreFileNames: Bool = false) {
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
