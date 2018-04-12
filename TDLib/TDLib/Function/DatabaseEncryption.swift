public struct CheckDatabaseEncryptionKey: TDFunction {
    public typealias Result = Ok
    
    public let encryptionKey: Data
   
    public init(encryptionKey: Data) {
        self.encryptionKey = encryptionKey
    }
}
