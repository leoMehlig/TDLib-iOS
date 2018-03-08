public struct CheckDatabaseEncryptionKey: TDFunction {
    public typealias T = Ok
    enum CodingKeys: String, CodingKey {
        case encryptionKey = "encryption_key"
    }
    
    public let type: String = "checkDatabaseEncryptionKey"
    
    public let encryptionKey: Data
   
    public init(encryptionKey: Data) {
        self.encryptionKey = encryptionKey
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(encryptionKey, forKey: .encryptionKey)
    }
}
