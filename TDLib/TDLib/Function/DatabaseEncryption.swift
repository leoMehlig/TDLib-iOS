public struct CheckDatabaseEncryptionKey: TDFunction {
    public typealias T = Ok
       
    public let type: String = "checkDatabaseEncryptionKey"
    
    public let encryptionKey: Data
   
    public init(encryptionKey: Data) {
        self.encryptionKey = encryptionKey
    }
}
