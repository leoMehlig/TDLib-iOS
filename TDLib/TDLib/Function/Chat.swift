extension GetChats {
    public static func create(offsetOrder: TDInt64 = TDInt64(Int64.max), offsetChatId: Int64 = 0, limit: Int32) -> GetChats {
        return GetChats(offsetOrder: offsetOrder, offsetChatId: offsetChatId, limit: limit)
    }
}
