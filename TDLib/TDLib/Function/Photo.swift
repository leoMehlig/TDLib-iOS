public struct Photo: Decodable, Equatable {
    public let id: String
    public let hasStickers: Bool
    public let sizes: [PhotoSize]
}

public struct PhotoSize: Decodable, Equatable {
    public let type: String
    public let photo: File
    public let width: Int32
    public let height: Int32
}

public struct File: Decodable, Equatable, FunctionResult {
    public static var type: String = "file"

    public let id: Int32
    public let size: Int32
    public let expectedSize: Int32
    public let local: LocalFile
    public let remote: RemoteFile
}

public struct LocalFile: Decodable, Equatable {
    public let path: String
    public let canBeDownloaded: Bool
    public let canBeDeleted: Bool
    public let isDownloadingActive: Bool
    public let isDownloadingCompleted: Bool
    public let downloadedPrefixSize: Int32
    public let downloadedSize: Int32
}

public struct RemoteFile: Decodable, Equatable {
    public let id: String
    public let isUploadingActive: Bool
    public let isUploadingCompleted: Bool
    public let uploadedSize: Int32
}

public struct DownloadFile: TDFunction, Equatable {
    public typealias Result = File
    
    public let fileId: Int32
    public let priority: Int32

    public init(fileId: Int32, priority: Int32) {
        self.fileId = fileId
        self.priority = priority
    }
    
}
