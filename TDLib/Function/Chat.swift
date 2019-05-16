extension GetChats {
    public static func create(offsetOrder: TDInt64 = TDInt64(Int64.max), offsetChatId: Int64 = 0, limit: Int32) -> GetChats {
        return GetChats(offsetOrder: offsetOrder, offsetChatId: offsetChatId, limit: limit)
    }
}

extension Chat {
    public func set(clientData: String) -> Chat {
        return Chat(id: self.id,
                    type: self.type,
                    title: self.title,
                    photo: self.photo,
                    lastMessage: self.lastMessage,
                    order: self.order,
                    isPinned: self.isPinned,
                    isMarkedAsUnread: self.isMarkedAsUnread,
                    isSponsored: self.isSponsored,
                    canBeDeletedOnlyForSelf: self.canBeDeletedOnlyForSelf,
                    canBeDeletedForAllUsers: self.canBeDeletedForAllUsers,
                    canBeReported: self.canBeReported,
                    defaultDisableNotification: self.defaultDisableNotification,
                    unreadCount: self.unreadCount,
                    lastReadInboxMessageId: self.lastReadInboxMessageId,
                    lastReadOutboxMessageId: self.lastReadOutboxMessageId,
                    unreadMentionCount: self.unreadMentionCount,
                    notificationSettings: self.notificationSettings,
                    pinnedMessageId: self.pinnedMessageId,
                    replyMarkupMessageId: self.replyMarkupMessageId,
                    draftMessage: self.draftMessage ,
                    clientData: clientData)
    }
}
