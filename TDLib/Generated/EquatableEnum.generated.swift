// Generated using Sourcery 0.11.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



extension AuthenticationCodeType {
   public static func == (lhs: AuthenticationCodeType, rhs: AuthenticationCodeType) -> Bool {
        switch (lhs, rhs) {
            case (.telegramMessage(
                let lhslength),
              .telegramMessage(
                let rhslength)):
              return 
                lhslength == rhslength
            case (.sms(
                let lhslength),
              .sms(
                let rhslength)):
              return 
                lhslength == rhslength
            case (.call(
                let lhslength),
              .call(
                let rhslength)):
              return 
                lhslength == rhslength
            case (.flashCall(
                let lhspattern),
              .flashCall(
                let rhspattern)):
              return 
                lhspattern == rhspattern
        default:
            return false
        }
    }
}

extension AuthorizationState {
   public static func == (lhs: AuthorizationState, rhs: AuthorizationState) -> Bool {
        switch (lhs, rhs) {
            case (.waitTdlibParameters, .waitTdlibParameters):
                return true
            case (.waitEncryptionKey(
                let lhsisEncrypted),
              .waitEncryptionKey(
                let rhsisEncrypted)):
              return 
                lhsisEncrypted == rhsisEncrypted
            case (.waitPhoneNumber, .waitPhoneNumber):
                return true
            case (.waitCode(
                let lhsisRegistered,
                let lhscodeInfo),
              .waitCode(
                let rhsisRegistered,
                let rhscodeInfo)):
              return 
                lhsisRegistered == rhsisRegistered &&
                lhscodeInfo == rhscodeInfo
            case (.waitPassword(
                let lhspasswordHint,
                let lhshasRecoveryEmailAddress,
                let lhsrecoveryEmailAddressPattern),
              .waitPassword(
                let rhspasswordHint,
                let rhshasRecoveryEmailAddress,
                let rhsrecoveryEmailAddressPattern)):
              return 
                lhspasswordHint == rhspasswordHint &&
                lhshasRecoveryEmailAddress == rhshasRecoveryEmailAddress &&
                lhsrecoveryEmailAddressPattern == rhsrecoveryEmailAddressPattern
            case (.ready, .ready):
                return true
            case (.loggingOut, .loggingOut):
                return true
            case (.closing, .closing):
                return true
            case (.closed, .closed):
                return true
        default:
            return false
        }
    }
}

extension CallDiscardReason {
   public static func == (lhs: CallDiscardReason, rhs: CallDiscardReason) -> Bool {
        switch (lhs, rhs) {
            case (.empty, .empty):
                return true
            case (.missed, .missed):
                return true
            case (.declined, .declined):
                return true
            case (.disconnected, .disconnected):
                return true
            case (.hungUp, .hungUp):
                return true
        default:
            return false
        }
    }
}

extension CallState {
   public static func == (lhs: CallState, rhs: CallState) -> Bool {
        switch (lhs, rhs) {
            case (.pending(
                let lhsisCreated,
                let lhsisReceived),
              .pending(
                let rhsisCreated,
                let rhsisReceived)):
              return 
                lhsisCreated == rhsisCreated &&
                lhsisReceived == rhsisReceived
            case (.exchangingKeys, .exchangingKeys):
                return true
            case (.ready(
                let lhsprotocol,
                let lhsconnections,
                let lhsconfig,
                let lhsencryptionKey,
                let lhsemojis),
              .ready(
                let rhsprotocol,
                let rhsconnections,
                let rhsconfig,
                let rhsencryptionKey,
                let rhsemojis)):
              return 
                lhsprotocol == rhsprotocol &&
                lhsconnections == rhsconnections &&
                lhsconfig == rhsconfig &&
                lhsencryptionKey == rhsencryptionKey &&
                lhsemojis == rhsemojis
            case (.hangingUp, .hangingUp):
                return true
            case (.discarded(
                let lhsreason,
                let lhsneedRating,
                let lhsneedDebugInformation),
              .discarded(
                let rhsreason,
                let rhsneedRating,
                let rhsneedDebugInformation)):
              return 
                lhsreason == rhsreason &&
                lhsneedRating == rhsneedRating &&
                lhsneedDebugInformation == rhsneedDebugInformation
            case (.error(
                let lhserror),
              .error(
                let rhserror)):
              return 
                lhserror == rhserror
        default:
            return false
        }
    }
}

extension CallbackQueryPayload {
   public static func == (lhs: CallbackQueryPayload, rhs: CallbackQueryPayload) -> Bool {
        switch (lhs, rhs) {
            case (.data(
                let lhsdata),
              .data(
                let rhsdata)):
              return 
                lhsdata == rhsdata
            case (.game(
                let lhsgameShortName),
              .game(
                let rhsgameShortName)):
              return 
                lhsgameShortName == rhsgameShortName
        default:
            return false
        }
    }
}

extension ChatAction {
   public static func == (lhs: ChatAction, rhs: ChatAction) -> Bool {
        switch (lhs, rhs) {
            case (.typing, .typing):
                return true
            case (.recordingVideo, .recordingVideo):
                return true
            case (.uploadingVideo(
                let lhsprogress),
              .uploadingVideo(
                let rhsprogress)):
              return 
                lhsprogress == rhsprogress
            case (.recordingVoiceNote, .recordingVoiceNote):
                return true
            case (.uploadingVoiceNote(
                let lhsprogress),
              .uploadingVoiceNote(
                let rhsprogress)):
              return 
                lhsprogress == rhsprogress
            case (.uploadingPhoto(
                let lhsprogress),
              .uploadingPhoto(
                let rhsprogress)):
              return 
                lhsprogress == rhsprogress
            case (.uploadingDocument(
                let lhsprogress),
              .uploadingDocument(
                let rhsprogress)):
              return 
                lhsprogress == rhsprogress
            case (.choosingLocation, .choosingLocation):
                return true
            case (.choosingContact, .choosingContact):
                return true
            case (.startPlayingGame, .startPlayingGame):
                return true
            case (.recordingVideoNote, .recordingVideoNote):
                return true
            case (.uploadingVideoNote(
                let lhsprogress),
              .uploadingVideoNote(
                let rhsprogress)):
              return 
                lhsprogress == rhsprogress
            case (.cancel, .cancel):
                return true
        default:
            return false
        }
    }
}

extension ChatEventAction {
   public static func == (lhs: ChatEventAction, rhs: ChatEventAction) -> Bool {
        switch (lhs, rhs) {
            case (.chatEventMessageEdited(
                let lhsoldMessage,
                let lhsnewMessage),
              .chatEventMessageEdited(
                let rhsoldMessage,
                let rhsnewMessage)):
              return 
                lhsoldMessage == rhsoldMessage &&
                lhsnewMessage == rhsnewMessage
            case (.chatEventMessageDeleted(
                let lhsmessage),
              .chatEventMessageDeleted(
                let rhsmessage)):
              return 
                lhsmessage == rhsmessage
            case (.chatEventMessagePinned(
                let lhsmessage),
              .chatEventMessagePinned(
                let rhsmessage)):
              return 
                lhsmessage == rhsmessage
            case (.chatEventMessageUnpinned, .chatEventMessageUnpinned):
                return true
            case (.chatEventMemberJoined, .chatEventMemberJoined):
                return true
            case (.chatEventMemberLeft, .chatEventMemberLeft):
                return true
            case (.chatEventMemberInvited(
                let lhsuserId,
                let lhsstatus),
              .chatEventMemberInvited(
                let rhsuserId,
                let rhsstatus)):
              return 
                lhsuserId == rhsuserId &&
                lhsstatus == rhsstatus
            case (.chatEventMemberPromoted(
                let lhsuserId,
                let lhsoldStatus,
                let lhsnewStatus),
              .chatEventMemberPromoted(
                let rhsuserId,
                let rhsoldStatus,
                let rhsnewStatus)):
              return 
                lhsuserId == rhsuserId &&
                lhsoldStatus == rhsoldStatus &&
                lhsnewStatus == rhsnewStatus
            case (.chatEventMemberRestricted(
                let lhsuserId,
                let lhsoldStatus,
                let lhsnewStatus),
              .chatEventMemberRestricted(
                let rhsuserId,
                let rhsoldStatus,
                let rhsnewStatus)):
              return 
                lhsuserId == rhsuserId &&
                lhsoldStatus == rhsoldStatus &&
                lhsnewStatus == rhsnewStatus
            case (.chatEventTitleChanged(
                let lhsoldTitle,
                let lhsnewTitle),
              .chatEventTitleChanged(
                let rhsoldTitle,
                let rhsnewTitle)):
              return 
                lhsoldTitle == rhsoldTitle &&
                lhsnewTitle == rhsnewTitle
            case (.chatEventDescriptionChanged(
                let lhsoldDescription,
                let lhsnewDescription),
              .chatEventDescriptionChanged(
                let rhsoldDescription,
                let rhsnewDescription)):
              return 
                lhsoldDescription == rhsoldDescription &&
                lhsnewDescription == rhsnewDescription
            case (.chatEventUsernameChanged(
                let lhsoldUsername,
                let lhsnewUsername),
              .chatEventUsernameChanged(
                let rhsoldUsername,
                let rhsnewUsername)):
              return 
                lhsoldUsername == rhsoldUsername &&
                lhsnewUsername == rhsnewUsername
            case (.chatEventPhotoChanged(
                let lhsoldPhoto,
                let lhsnewPhoto),
              .chatEventPhotoChanged(
                let rhsoldPhoto,
                let rhsnewPhoto)):
              return 
                lhsoldPhoto == rhsoldPhoto &&
                lhsnewPhoto == rhsnewPhoto
            case (.chatEventInvitesToggled(
                let lhsanyoneCanInvite),
              .chatEventInvitesToggled(
                let rhsanyoneCanInvite)):
              return 
                lhsanyoneCanInvite == rhsanyoneCanInvite
            case (.chatEventSignMessagesToggled(
                let lhssignMessages),
              .chatEventSignMessagesToggled(
                let rhssignMessages)):
              return 
                lhssignMessages == rhssignMessages
            case (.chatEventStickerSetChanged(
                let lhsoldStickerSetId,
                let lhsnewStickerSetId),
              .chatEventStickerSetChanged(
                let rhsoldStickerSetId,
                let rhsnewStickerSetId)):
              return 
                lhsoldStickerSetId == rhsoldStickerSetId &&
                lhsnewStickerSetId == rhsnewStickerSetId
            case (.chatEventIsAllHistoryAvailableToggled(
                let lhsisAllHistoryAvailable),
              .chatEventIsAllHistoryAvailableToggled(
                let rhsisAllHistoryAvailable)):
              return 
                lhsisAllHistoryAvailable == rhsisAllHistoryAvailable
        default:
            return false
        }
    }
}

extension ChatMemberStatus {
   public static func == (lhs: ChatMemberStatus, rhs: ChatMemberStatus) -> Bool {
        switch (lhs, rhs) {
            case (.creator(
                let lhsisMember),
              .creator(
                let rhsisMember)):
              return 
                lhsisMember == rhsisMember
            case (.administrator(
                let lhscanBeEdited,
                let lhscanChangeInfo,
                let lhscanPostMessages,
                let lhscanEditMessages,
                let lhscanDeleteMessages,
                let lhscanInviteUsers,
                let lhscanRestrictMembers,
                let lhscanPinMessages,
                let lhscanPromoteMembers),
              .administrator(
                let rhscanBeEdited,
                let rhscanChangeInfo,
                let rhscanPostMessages,
                let rhscanEditMessages,
                let rhscanDeleteMessages,
                let rhscanInviteUsers,
                let rhscanRestrictMembers,
                let rhscanPinMessages,
                let rhscanPromoteMembers)):
              return 
                lhscanBeEdited == rhscanBeEdited &&
                lhscanChangeInfo == rhscanChangeInfo &&
                lhscanPostMessages == rhscanPostMessages &&
                lhscanEditMessages == rhscanEditMessages &&
                lhscanDeleteMessages == rhscanDeleteMessages &&
                lhscanInviteUsers == rhscanInviteUsers &&
                lhscanRestrictMembers == rhscanRestrictMembers &&
                lhscanPinMessages == rhscanPinMessages &&
                lhscanPromoteMembers == rhscanPromoteMembers
            case (.member, .member):
                return true
            case (.restricted(
                let lhsisMember,
                let lhsrestrictedUntilDate,
                let lhscanSendMessages,
                let lhscanSendMediaMessages,
                let lhscanSendOtherMessages,
                let lhscanAddWebPagePreviews),
              .restricted(
                let rhsisMember,
                let rhsrestrictedUntilDate,
                let rhscanSendMessages,
                let rhscanSendMediaMessages,
                let rhscanSendOtherMessages,
                let rhscanAddWebPagePreviews)):
              return 
                lhsisMember == rhsisMember &&
                lhsrestrictedUntilDate == rhsrestrictedUntilDate &&
                lhscanSendMessages == rhscanSendMessages &&
                lhscanSendMediaMessages == rhscanSendMediaMessages &&
                lhscanSendOtherMessages == rhscanSendOtherMessages &&
                lhscanAddWebPagePreviews == rhscanAddWebPagePreviews
            case (.left, .left):
                return true
            case (.banned(
                let lhsbannedUntilDate),
              .banned(
                let rhsbannedUntilDate)):
              return 
                lhsbannedUntilDate == rhsbannedUntilDate
        default:
            return false
        }
    }
}

extension ChatReportReason {
   public static func == (lhs: ChatReportReason, rhs: ChatReportReason) -> Bool {
        switch (lhs, rhs) {
            case (.spam, .spam):
                return true
            case (.violence, .violence):
                return true
            case (.pornography, .pornography):
                return true
            case (.custom(
                let lhstext),
              .custom(
                let rhstext)):
              return 
                lhstext == rhstext
        default:
            return false
        }
    }
}

extension ChatType {
   public static func == (lhs: ChatType, rhs: ChatType) -> Bool {
        switch (lhs, rhs) {
            case (.private(
                let lhsuserId),
              .private(
                let rhsuserId)):
              return 
                lhsuserId == rhsuserId
            case (.basicGroup(
                let lhsbasicGroupId),
              .basicGroup(
                let rhsbasicGroupId)):
              return 
                lhsbasicGroupId == rhsbasicGroupId
            case (.supergroup(
                let lhssupergroupId,
                let lhsisChannel),
              .supergroup(
                let rhssupergroupId,
                let rhsisChannel)):
              return 
                lhssupergroupId == rhssupergroupId &&
                lhsisChannel == rhsisChannel
            case (.secret(
                let lhssecretChatId,
                let lhsuserId),
              .secret(
                let rhssecretChatId,
                let rhsuserId)):
              return 
                lhssecretChatId == rhssecretChatId &&
                lhsuserId == rhsuserId
        default:
            return false
        }
    }
}

extension CheckChatUsernameResult {
   public static func == (lhs: CheckChatUsernameResult, rhs: CheckChatUsernameResult) -> Bool {
        switch (lhs, rhs) {
            case (.ok, .ok):
                return true
            case (.usernameInvalid, .usernameInvalid):
                return true
            case (.usernameOccupied, .usernameOccupied):
                return true
            case (.publicChatsTooMuch, .publicChatsTooMuch):
                return true
            case (.publicGroupsUnavailable, .publicGroupsUnavailable):
                return true
        default:
            return false
        }
    }
}

extension ConnectionState {
   public static func == (lhs: ConnectionState, rhs: ConnectionState) -> Bool {
        switch (lhs, rhs) {
            case (.waitingForNetwork, .waitingForNetwork):
                return true
            case (.connectingToProxy, .connectingToProxy):
                return true
            case (.connecting, .connecting):
                return true
            case (.updating, .updating):
                return true
            case (.ready, .ready):
                return true
        default:
            return false
        }
    }
}

extension DeviceToken {
   public static func == (lhs: DeviceToken, rhs: DeviceToken) -> Bool {
        switch (lhs, rhs) {
            case (.googleCloudMessaging(
                let lhstoken),
              .googleCloudMessaging(
                let rhstoken)):
              return 
                lhstoken == rhstoken
            case (.applePush(
                let lhsdeviceToken,
                let lhsisAppSandbox),
              .applePush(
                let rhsdeviceToken,
                let rhsisAppSandbox)):
              return 
                lhsdeviceToken == rhsdeviceToken &&
                lhsisAppSandbox == rhsisAppSandbox
            case (.applePushVoIP(
                let lhsdeviceToken,
                let lhsisAppSandbox),
              .applePushVoIP(
                let rhsdeviceToken,
                let rhsisAppSandbox)):
              return 
                lhsdeviceToken == rhsdeviceToken &&
                lhsisAppSandbox == rhsisAppSandbox
            case (.windowsPush(
                let lhsaccessToken),
              .windowsPush(
                let rhsaccessToken)):
              return 
                lhsaccessToken == rhsaccessToken
            case (.microsoftPush(
                let lhschannelUri),
              .microsoftPush(
                let rhschannelUri)):
              return 
                lhschannelUri == rhschannelUri
            case (.microsoftPushVoIP(
                let lhschannelUri),
              .microsoftPushVoIP(
                let rhschannelUri)):
              return 
                lhschannelUri == rhschannelUri
            case (.webPush(
                let lhsendpoint,
                let lhsp256dhBase64url,
                let lhsauthBase64url),
              .webPush(
                let rhsendpoint,
                let rhsp256dhBase64url,
                let rhsauthBase64url)):
              return 
                lhsendpoint == rhsendpoint &&
                lhsp256dhBase64url == rhsp256dhBase64url &&
                lhsauthBase64url == rhsauthBase64url
            case (.simplePush(
                let lhsendpoint),
              .simplePush(
                let rhsendpoint)):
              return 
                lhsendpoint == rhsendpoint
            case (.ubuntuPush(
                let lhstoken),
              .ubuntuPush(
                let rhstoken)):
              return 
                lhstoken == rhstoken
            case (.blackBerryPush(
                let lhstoken),
              .blackBerryPush(
                let rhstoken)):
              return 
                lhstoken == rhstoken
            case (.tizenPush(
                let lhsregId),
              .tizenPush(
                let rhsregId)):
              return 
                lhsregId == rhsregId
        default:
            return false
        }
    }
}

extension FileType {
   public static func == (lhs: FileType, rhs: FileType) -> Bool {
        switch (lhs, rhs) {
            case (.none, .none):
                return true
            case (.animation, .animation):
                return true
            case (.audio, .audio):
                return true
            case (.document, .document):
                return true
            case (.photo, .photo):
                return true
            case (.profilePhoto, .profilePhoto):
                return true
            case (.secret, .secret):
                return true
            case (.sticker, .sticker):
                return true
            case (.thumbnail, .thumbnail):
                return true
            case (.unknown, .unknown):
                return true
            case (.video, .video):
                return true
            case (.videoNote, .videoNote):
                return true
            case (.voiceNote, .voiceNote):
                return true
            case (.wallpaper, .wallpaper):
                return true
            case (.secretThumbnail, .secretThumbnail):
                return true
        default:
            return false
        }
    }
}

extension InlineKeyboardButtonType {
   public static func == (lhs: InlineKeyboardButtonType, rhs: InlineKeyboardButtonType) -> Bool {
        switch (lhs, rhs) {
            case (.url(
                let lhsurl),
              .url(
                let rhsurl)):
              return 
                lhsurl == rhsurl
            case (.callback(
                let lhsdata),
              .callback(
                let rhsdata)):
              return 
                lhsdata == rhsdata
            case (.callbackGame, .callbackGame):
                return true
            case (.switchInline(
                let lhsquery,
                let lhsinCurrentChat),
              .switchInline(
                let rhsquery,
                let rhsinCurrentChat)):
              return 
                lhsquery == rhsquery &&
                lhsinCurrentChat == rhsinCurrentChat
            case (.buy, .buy):
                return true
        default:
            return false
        }
    }
}

extension InlineQueryResult {
   public static func == (lhs: InlineQueryResult, rhs: InlineQueryResult) -> Bool {
        switch (lhs, rhs) {
            case (.article(
                let lhsid,
                let lhsurl,
                let lhshideUrl,
                let lhstitle,
                let lhsdescription,
                let lhsthumbnail),
              .article(
                let rhsid,
                let rhsurl,
                let rhshideUrl,
                let rhstitle,
                let rhsdescription,
                let rhsthumbnail)):
              return 
                lhsid == rhsid &&
                lhsurl == rhsurl &&
                lhshideUrl == rhshideUrl &&
                lhstitle == rhstitle &&
                lhsdescription == rhsdescription &&
                lhsthumbnail == rhsthumbnail
            case (.contact(
                let lhsid,
                let lhscontact,
                let lhsthumbnail),
              .contact(
                let rhsid,
                let rhscontact,
                let rhsthumbnail)):
              return 
                lhsid == rhsid &&
                lhscontact == rhscontact &&
                lhsthumbnail == rhsthumbnail
            case (.location(
                let lhsid,
                let lhslocation,
                let lhstitle,
                let lhsthumbnail),
              .location(
                let rhsid,
                let rhslocation,
                let rhstitle,
                let rhsthumbnail)):
              return 
                lhsid == rhsid &&
                lhslocation == rhslocation &&
                lhstitle == rhstitle &&
                lhsthumbnail == rhsthumbnail
            case (.venue(
                let lhsid,
                let lhsvenue,
                let lhsthumbnail),
              .venue(
                let rhsid,
                let rhsvenue,
                let rhsthumbnail)):
              return 
                lhsid == rhsid &&
                lhsvenue == rhsvenue &&
                lhsthumbnail == rhsthumbnail
            case (.game(
                let lhsid,
                let lhsgame),
              .game(
                let rhsid,
                let rhsgame)):
              return 
                lhsid == rhsid &&
                lhsgame == rhsgame
            case (.animation(
                let lhsid,
                let lhsanimation,
                let lhstitle),
              .animation(
                let rhsid,
                let rhsanimation,
                let rhstitle)):
              return 
                lhsid == rhsid &&
                lhsanimation == rhsanimation &&
                lhstitle == rhstitle
            case (.audio(
                let lhsid,
                let lhsaudio),
              .audio(
                let rhsid,
                let rhsaudio)):
              return 
                lhsid == rhsid &&
                lhsaudio == rhsaudio
            case (.document(
                let lhsid,
                let lhsdocument,
                let lhstitle,
                let lhsdescription),
              .document(
                let rhsid,
                let rhsdocument,
                let rhstitle,
                let rhsdescription)):
              return 
                lhsid == rhsid &&
                lhsdocument == rhsdocument &&
                lhstitle == rhstitle &&
                lhsdescription == rhsdescription
            case (.photo(
                let lhsid,
                let lhsphoto,
                let lhstitle,
                let lhsdescription),
              .photo(
                let rhsid,
                let rhsphoto,
                let rhstitle,
                let rhsdescription)):
              return 
                lhsid == rhsid &&
                lhsphoto == rhsphoto &&
                lhstitle == rhstitle &&
                lhsdescription == rhsdescription
            case (.sticker(
                let lhsid,
                let lhssticker),
              .sticker(
                let rhsid,
                let rhssticker)):
              return 
                lhsid == rhsid &&
                lhssticker == rhssticker
            case (.video(
                let lhsid,
                let lhsvideo,
                let lhstitle,
                let lhsdescription),
              .video(
                let rhsid,
                let rhsvideo,
                let rhstitle,
                let rhsdescription)):
              return 
                lhsid == rhsid &&
                lhsvideo == rhsvideo &&
                lhstitle == rhstitle &&
                lhsdescription == rhsdescription
            case (.voiceNote(
                let lhsid,
                let lhsvoiceNote,
                let lhstitle),
              .voiceNote(
                let rhsid,
                let rhsvoiceNote,
                let rhstitle)):
              return 
                lhsid == rhsid &&
                lhsvoiceNote == rhsvoiceNote &&
                lhstitle == rhstitle
        default:
            return false
        }
    }
}

extension InputCredentials {
   public static func == (lhs: InputCredentials, rhs: InputCredentials) -> Bool {
        switch (lhs, rhs) {
            case (.saved(
                let lhssavedCredentialsId),
              .saved(
                let rhssavedCredentialsId)):
              return 
                lhssavedCredentialsId == rhssavedCredentialsId
            case (.new(
                let lhsdata,
                let lhsallowSave),
              .new(
                let rhsdata,
                let rhsallowSave)):
              return 
                lhsdata == rhsdata &&
                lhsallowSave == rhsallowSave
            case (.androidPay(
                let lhsdata),
              .androidPay(
                let rhsdata)):
              return 
                lhsdata == rhsdata
            case (.applePay(
                let lhsdata),
              .applePay(
                let rhsdata)):
              return 
                lhsdata == rhsdata
        default:
            return false
        }
    }
}

extension InputFile {
   public static func == (lhs: InputFile, rhs: InputFile) -> Bool {
        switch (lhs, rhs) {
            case (.id(
                let lhsid),
              .id(
                let rhsid)):
              return 
                lhsid == rhsid
            case (.remote(
                let lhsid),
              .remote(
                let rhsid)):
              return 
                lhsid == rhsid
            case (.local(
                let lhspath),
              .local(
                let rhspath)):
              return 
                lhspath == rhspath
            case (.generated(
                let lhsoriginalPath,
                let lhsconversion,
                let lhsexpectedSize),
              .generated(
                let rhsoriginalPath,
                let rhsconversion,
                let rhsexpectedSize)):
              return 
                lhsoriginalPath == rhsoriginalPath &&
                lhsconversion == rhsconversion &&
                lhsexpectedSize == rhsexpectedSize
        default:
            return false
        }
    }
}

extension InputInlineQueryResult {
   public static func == (lhs: InputInlineQueryResult, rhs: InputInlineQueryResult) -> Bool {
        switch (lhs, rhs) {
            case (.animatedGif(
                let lhsid,
                let lhstitle,
                let lhsthumbnailUrl,
                let lhsgifUrl,
                let lhsgifDuration,
                let lhsgifWidth,
                let lhsgifHeight,
                let lhsreplyMarkup,
                let lhsinputMessageContent),
              .animatedGif(
                let rhsid,
                let rhstitle,
                let rhsthumbnailUrl,
                let rhsgifUrl,
                let rhsgifDuration,
                let rhsgifWidth,
                let rhsgifHeight,
                let rhsreplyMarkup,
                let rhsinputMessageContent)):
              return 
                lhsid == rhsid &&
                lhstitle == rhstitle &&
                lhsthumbnailUrl == rhsthumbnailUrl &&
                lhsgifUrl == rhsgifUrl &&
                lhsgifDuration == rhsgifDuration &&
                lhsgifWidth == rhsgifWidth &&
                lhsgifHeight == rhsgifHeight &&
                lhsreplyMarkup == rhsreplyMarkup &&
                lhsinputMessageContent == rhsinputMessageContent
            case (.animatedMpeg4(
                let lhsid,
                let lhstitle,
                let lhsthumbnailUrl,
                let lhsmpeg4Url,
                let lhsmpeg4Duration,
                let lhsmpeg4Width,
                let lhsmpeg4Height,
                let lhsreplyMarkup,
                let lhsinputMessageContent),
              .animatedMpeg4(
                let rhsid,
                let rhstitle,
                let rhsthumbnailUrl,
                let rhsmpeg4Url,
                let rhsmpeg4Duration,
                let rhsmpeg4Width,
                let rhsmpeg4Height,
                let rhsreplyMarkup,
                let rhsinputMessageContent)):
              return 
                lhsid == rhsid &&
                lhstitle == rhstitle &&
                lhsthumbnailUrl == rhsthumbnailUrl &&
                lhsmpeg4Url == rhsmpeg4Url &&
                lhsmpeg4Duration == rhsmpeg4Duration &&
                lhsmpeg4Width == rhsmpeg4Width &&
                lhsmpeg4Height == rhsmpeg4Height &&
                lhsreplyMarkup == rhsreplyMarkup &&
                lhsinputMessageContent == rhsinputMessageContent
            case (.article(
                let lhsid,
                let lhsurl,
                let lhshideUrl,
                let lhstitle,
                let lhsdescription,
                let lhsthumbnailUrl,
                let lhsthumbnailWidth,
                let lhsthumbnailHeight,
                let lhsreplyMarkup,
                let lhsinputMessageContent),
              .article(
                let rhsid,
                let rhsurl,
                let rhshideUrl,
                let rhstitle,
                let rhsdescription,
                let rhsthumbnailUrl,
                let rhsthumbnailWidth,
                let rhsthumbnailHeight,
                let rhsreplyMarkup,
                let rhsinputMessageContent)):
              return 
                lhsid == rhsid &&
                lhsurl == rhsurl &&
                lhshideUrl == rhshideUrl &&
                lhstitle == rhstitle &&
                lhsdescription == rhsdescription &&
                lhsthumbnailUrl == rhsthumbnailUrl &&
                lhsthumbnailWidth == rhsthumbnailWidth &&
                lhsthumbnailHeight == rhsthumbnailHeight &&
                lhsreplyMarkup == rhsreplyMarkup &&
                lhsinputMessageContent == rhsinputMessageContent
            case (.audio(
                let lhsid,
                let lhstitle,
                let lhsperformer,
                let lhsaudioUrl,
                let lhsaudioDuration,
                let lhsreplyMarkup,
                let lhsinputMessageContent),
              .audio(
                let rhsid,
                let rhstitle,
                let rhsperformer,
                let rhsaudioUrl,
                let rhsaudioDuration,
                let rhsreplyMarkup,
                let rhsinputMessageContent)):
              return 
                lhsid == rhsid &&
                lhstitle == rhstitle &&
                lhsperformer == rhsperformer &&
                lhsaudioUrl == rhsaudioUrl &&
                lhsaudioDuration == rhsaudioDuration &&
                lhsreplyMarkup == rhsreplyMarkup &&
                lhsinputMessageContent == rhsinputMessageContent
            case (.contact(
                let lhsid,
                let lhscontact,
                let lhsthumbnailUrl,
                let lhsthumbnailWidth,
                let lhsthumbnailHeight,
                let lhsreplyMarkup,
                let lhsinputMessageContent),
              .contact(
                let rhsid,
                let rhscontact,
                let rhsthumbnailUrl,
                let rhsthumbnailWidth,
                let rhsthumbnailHeight,
                let rhsreplyMarkup,
                let rhsinputMessageContent)):
              return 
                lhsid == rhsid &&
                lhscontact == rhscontact &&
                lhsthumbnailUrl == rhsthumbnailUrl &&
                lhsthumbnailWidth == rhsthumbnailWidth &&
                lhsthumbnailHeight == rhsthumbnailHeight &&
                lhsreplyMarkup == rhsreplyMarkup &&
                lhsinputMessageContent == rhsinputMessageContent
            case (.document(
                let lhsid,
                let lhstitle,
                let lhsdescription,
                let lhsdocumentUrl,
                let lhsmimeType,
                let lhsthumbnailUrl,
                let lhsthumbnailWidth,
                let lhsthumbnailHeight,
                let lhsreplyMarkup,
                let lhsinputMessageContent),
              .document(
                let rhsid,
                let rhstitle,
                let rhsdescription,
                let rhsdocumentUrl,
                let rhsmimeType,
                let rhsthumbnailUrl,
                let rhsthumbnailWidth,
                let rhsthumbnailHeight,
                let rhsreplyMarkup,
                let rhsinputMessageContent)):
              return 
                lhsid == rhsid &&
                lhstitle == rhstitle &&
                lhsdescription == rhsdescription &&
                lhsdocumentUrl == rhsdocumentUrl &&
                lhsmimeType == rhsmimeType &&
                lhsthumbnailUrl == rhsthumbnailUrl &&
                lhsthumbnailWidth == rhsthumbnailWidth &&
                lhsthumbnailHeight == rhsthumbnailHeight &&
                lhsreplyMarkup == rhsreplyMarkup &&
                lhsinputMessageContent == rhsinputMessageContent
            case (.game(
                let lhsid,
                let lhsgameShortName,
                let lhsreplyMarkup),
              .game(
                let rhsid,
                let rhsgameShortName,
                let rhsreplyMarkup)):
              return 
                lhsid == rhsid &&
                lhsgameShortName == rhsgameShortName &&
                lhsreplyMarkup == rhsreplyMarkup
            case (.location(
                let lhsid,
                let lhslocation,
                let lhslivePeriod,
                let lhstitle,
                let lhsthumbnailUrl,
                let lhsthumbnailWidth,
                let lhsthumbnailHeight,
                let lhsreplyMarkup,
                let lhsinputMessageContent),
              .location(
                let rhsid,
                let rhslocation,
                let rhslivePeriod,
                let rhstitle,
                let rhsthumbnailUrl,
                let rhsthumbnailWidth,
                let rhsthumbnailHeight,
                let rhsreplyMarkup,
                let rhsinputMessageContent)):
              return 
                lhsid == rhsid &&
                lhslocation == rhslocation &&
                lhslivePeriod == rhslivePeriod &&
                lhstitle == rhstitle &&
                lhsthumbnailUrl == rhsthumbnailUrl &&
                lhsthumbnailWidth == rhsthumbnailWidth &&
                lhsthumbnailHeight == rhsthumbnailHeight &&
                lhsreplyMarkup == rhsreplyMarkup &&
                lhsinputMessageContent == rhsinputMessageContent
            case (.photo(
                let lhsid,
                let lhstitle,
                let lhsdescription,
                let lhsthumbnailUrl,
                let lhsphotoUrl,
                let lhsphotoWidth,
                let lhsphotoHeight,
                let lhsreplyMarkup,
                let lhsinputMessageContent),
              .photo(
                let rhsid,
                let rhstitle,
                let rhsdescription,
                let rhsthumbnailUrl,
                let rhsphotoUrl,
                let rhsphotoWidth,
                let rhsphotoHeight,
                let rhsreplyMarkup,
                let rhsinputMessageContent)):
              return 
                lhsid == rhsid &&
                lhstitle == rhstitle &&
                lhsdescription == rhsdescription &&
                lhsthumbnailUrl == rhsthumbnailUrl &&
                lhsphotoUrl == rhsphotoUrl &&
                lhsphotoWidth == rhsphotoWidth &&
                lhsphotoHeight == rhsphotoHeight &&
                lhsreplyMarkup == rhsreplyMarkup &&
                lhsinputMessageContent == rhsinputMessageContent
            case (.sticker(
                let lhsid,
                let lhsthumbnailUrl,
                let lhsstickerUrl,
                let lhsstickerWidth,
                let lhsstickerHeight,
                let lhsreplyMarkup,
                let lhsinputMessageContent),
              .sticker(
                let rhsid,
                let rhsthumbnailUrl,
                let rhsstickerUrl,
                let rhsstickerWidth,
                let rhsstickerHeight,
                let rhsreplyMarkup,
                let rhsinputMessageContent)):
              return 
                lhsid == rhsid &&
                lhsthumbnailUrl == rhsthumbnailUrl &&
                lhsstickerUrl == rhsstickerUrl &&
                lhsstickerWidth == rhsstickerWidth &&
                lhsstickerHeight == rhsstickerHeight &&
                lhsreplyMarkup == rhsreplyMarkup &&
                lhsinputMessageContent == rhsinputMessageContent
            case (.venue(
                let lhsid,
                let lhsvenue,
                let lhsthumbnailUrl,
                let lhsthumbnailWidth,
                let lhsthumbnailHeight,
                let lhsreplyMarkup,
                let lhsinputMessageContent),
              .venue(
                let rhsid,
                let rhsvenue,
                let rhsthumbnailUrl,
                let rhsthumbnailWidth,
                let rhsthumbnailHeight,
                let rhsreplyMarkup,
                let rhsinputMessageContent)):
              return 
                lhsid == rhsid &&
                lhsvenue == rhsvenue &&
                lhsthumbnailUrl == rhsthumbnailUrl &&
                lhsthumbnailWidth == rhsthumbnailWidth &&
                lhsthumbnailHeight == rhsthumbnailHeight &&
                lhsreplyMarkup == rhsreplyMarkup &&
                lhsinputMessageContent == rhsinputMessageContent
            case (.video(
                let lhsid,
                let lhstitle,
                let lhsdescription,
                let lhsthumbnailUrl,
                let lhsvideoUrl,
                let lhsmimeType,
                let lhsvideoWidth,
                let lhsvideoHeight,
                let lhsvideoDuration,
                let lhsreplyMarkup,
                let lhsinputMessageContent),
              .video(
                let rhsid,
                let rhstitle,
                let rhsdescription,
                let rhsthumbnailUrl,
                let rhsvideoUrl,
                let rhsmimeType,
                let rhsvideoWidth,
                let rhsvideoHeight,
                let rhsvideoDuration,
                let rhsreplyMarkup,
                let rhsinputMessageContent)):
              return 
                lhsid == rhsid &&
                lhstitle == rhstitle &&
                lhsdescription == rhsdescription &&
                lhsthumbnailUrl == rhsthumbnailUrl &&
                lhsvideoUrl == rhsvideoUrl &&
                lhsmimeType == rhsmimeType &&
                lhsvideoWidth == rhsvideoWidth &&
                lhsvideoHeight == rhsvideoHeight &&
                lhsvideoDuration == rhsvideoDuration &&
                lhsreplyMarkup == rhsreplyMarkup &&
                lhsinputMessageContent == rhsinputMessageContent
            case (.voiceNote(
                let lhsid,
                let lhstitle,
                let lhsvoiceNoteUrl,
                let lhsvoiceNoteDuration,
                let lhsreplyMarkup,
                let lhsinputMessageContent),
              .voiceNote(
                let rhsid,
                let rhstitle,
                let rhsvoiceNoteUrl,
                let rhsvoiceNoteDuration,
                let rhsreplyMarkup,
                let rhsinputMessageContent)):
              return 
                lhsid == rhsid &&
                lhstitle == rhstitle &&
                lhsvoiceNoteUrl == rhsvoiceNoteUrl &&
                lhsvoiceNoteDuration == rhsvoiceNoteDuration &&
                lhsreplyMarkup == rhsreplyMarkup &&
                lhsinputMessageContent == rhsinputMessageContent
        default:
            return false
        }
    }
}

extension InputMessageContent {
   public static func == (lhs: InputMessageContent, rhs: InputMessageContent) -> Bool {
        switch (lhs, rhs) {
            case (.inputMessageText(
                let lhstext,
                let lhsdisableWebPagePreview,
                let lhsclearDraft),
              .inputMessageText(
                let rhstext,
                let rhsdisableWebPagePreview,
                let rhsclearDraft)):
              return 
                lhstext == rhstext &&
                lhsdisableWebPagePreview == rhsdisableWebPagePreview &&
                lhsclearDraft == rhsclearDraft
            case (.inputMessageAnimation(
                let lhsanimation,
                let lhsthumbnail,
                let lhsduration,
                let lhswidth,
                let lhsheight,
                let lhscaption),
              .inputMessageAnimation(
                let rhsanimation,
                let rhsthumbnail,
                let rhsduration,
                let rhswidth,
                let rhsheight,
                let rhscaption)):
              return 
                lhsanimation == rhsanimation &&
                lhsthumbnail == rhsthumbnail &&
                lhsduration == rhsduration &&
                lhswidth == rhswidth &&
                lhsheight == rhsheight &&
                lhscaption == rhscaption
            case (.inputMessageAudio(
                let lhsaudio,
                let lhsalbumCoverThumbnail,
                let lhsduration,
                let lhstitle,
                let lhsperformer,
                let lhscaption),
              .inputMessageAudio(
                let rhsaudio,
                let rhsalbumCoverThumbnail,
                let rhsduration,
                let rhstitle,
                let rhsperformer,
                let rhscaption)):
              return 
                lhsaudio == rhsaudio &&
                lhsalbumCoverThumbnail == rhsalbumCoverThumbnail &&
                lhsduration == rhsduration &&
                lhstitle == rhstitle &&
                lhsperformer == rhsperformer &&
                lhscaption == rhscaption
            case (.inputMessageDocument(
                let lhsdocument,
                let lhsthumbnail,
                let lhscaption),
              .inputMessageDocument(
                let rhsdocument,
                let rhsthumbnail,
                let rhscaption)):
              return 
                lhsdocument == rhsdocument &&
                lhsthumbnail == rhsthumbnail &&
                lhscaption == rhscaption
            case (.inputMessagePhoto(
                let lhsphoto,
                let lhsthumbnail,
                let lhsaddedStickerFileIds,
                let lhswidth,
                let lhsheight,
                let lhscaption,
                let lhsttl),
              .inputMessagePhoto(
                let rhsphoto,
                let rhsthumbnail,
                let rhsaddedStickerFileIds,
                let rhswidth,
                let rhsheight,
                let rhscaption,
                let rhsttl)):
              return 
                lhsphoto == rhsphoto &&
                lhsthumbnail == rhsthumbnail &&
                lhsaddedStickerFileIds == rhsaddedStickerFileIds &&
                lhswidth == rhswidth &&
                lhsheight == rhsheight &&
                lhscaption == rhscaption &&
                lhsttl == rhsttl
            case (.inputMessageSticker(
                let lhssticker,
                let lhsthumbnail,
                let lhswidth,
                let lhsheight),
              .inputMessageSticker(
                let rhssticker,
                let rhsthumbnail,
                let rhswidth,
                let rhsheight)):
              return 
                lhssticker == rhssticker &&
                lhsthumbnail == rhsthumbnail &&
                lhswidth == rhswidth &&
                lhsheight == rhsheight
            case (.inputMessageVideo(
                let lhsvideo,
                let lhsthumbnail,
                let lhsaddedStickerFileIds,
                let lhsduration,
                let lhswidth,
                let lhsheight,
                let lhssupportsStreaming,
                let lhscaption,
                let lhsttl),
              .inputMessageVideo(
                let rhsvideo,
                let rhsthumbnail,
                let rhsaddedStickerFileIds,
                let rhsduration,
                let rhswidth,
                let rhsheight,
                let rhssupportsStreaming,
                let rhscaption,
                let rhsttl)):
              return 
                lhsvideo == rhsvideo &&
                lhsthumbnail == rhsthumbnail &&
                lhsaddedStickerFileIds == rhsaddedStickerFileIds &&
                lhsduration == rhsduration &&
                lhswidth == rhswidth &&
                lhsheight == rhsheight &&
                lhssupportsStreaming == rhssupportsStreaming &&
                lhscaption == rhscaption &&
                lhsttl == rhsttl
            case (.inputMessageVideoNote(
                let lhsvideoNote,
                let lhsthumbnail,
                let lhsduration,
                let lhslength),
              .inputMessageVideoNote(
                let rhsvideoNote,
                let rhsthumbnail,
                let rhsduration,
                let rhslength)):
              return 
                lhsvideoNote == rhsvideoNote &&
                lhsthumbnail == rhsthumbnail &&
                lhsduration == rhsduration &&
                lhslength == rhslength
            case (.inputMessageVoiceNote(
                let lhsvoiceNote,
                let lhsduration,
                let lhswaveform,
                let lhscaption),
              .inputMessageVoiceNote(
                let rhsvoiceNote,
                let rhsduration,
                let rhswaveform,
                let rhscaption)):
              return 
                lhsvoiceNote == rhsvoiceNote &&
                lhsduration == rhsduration &&
                lhswaveform == rhswaveform &&
                lhscaption == rhscaption
            case (.inputMessageLocation(
                let lhslocation,
                let lhslivePeriod),
              .inputMessageLocation(
                let rhslocation,
                let rhslivePeriod)):
              return 
                lhslocation == rhslocation &&
                lhslivePeriod == rhslivePeriod
            case (.inputMessageVenue(
                let lhsvenue),
              .inputMessageVenue(
                let rhsvenue)):
              return 
                lhsvenue == rhsvenue
            case (.inputMessageContact(
                let lhscontact),
              .inputMessageContact(
                let rhscontact)):
              return 
                lhscontact == rhscontact
            case (.inputMessageGame(
                let lhsbotUserId,
                let lhsgameShortName),
              .inputMessageGame(
                let rhsbotUserId,
                let rhsgameShortName)):
              return 
                lhsbotUserId == rhsbotUserId &&
                lhsgameShortName == rhsgameShortName
            case (.inputMessageInvoice(
                let lhsinvoice,
                let lhstitle,
                let lhsdescription,
                let lhsphotoUrl,
                let lhsphotoSize,
                let lhsphotoWidth,
                let lhsphotoHeight,
                let lhspayload,
                let lhsproviderToken,
                let lhsproviderData,
                let lhsstartParameter),
              .inputMessageInvoice(
                let rhsinvoice,
                let rhstitle,
                let rhsdescription,
                let rhsphotoUrl,
                let rhsphotoSize,
                let rhsphotoWidth,
                let rhsphotoHeight,
                let rhspayload,
                let rhsproviderToken,
                let rhsproviderData,
                let rhsstartParameter)):
              return 
                lhsinvoice == rhsinvoice &&
                lhstitle == rhstitle &&
                lhsdescription == rhsdescription &&
                lhsphotoUrl == rhsphotoUrl &&
                lhsphotoSize == rhsphotoSize &&
                lhsphotoWidth == rhsphotoWidth &&
                lhsphotoHeight == rhsphotoHeight &&
                lhspayload == rhspayload &&
                lhsproviderToken == rhsproviderToken &&
                lhsproviderData == rhsproviderData &&
                lhsstartParameter == rhsstartParameter
            case (.inputMessageForwarded(
                let lhsfromChatId,
                let lhsmessageId,
                let lhsinGameShare),
              .inputMessageForwarded(
                let rhsfromChatId,
                let rhsmessageId,
                let rhsinGameShare)):
              return 
                lhsfromChatId == rhsfromChatId &&
                lhsmessageId == rhsmessageId &&
                lhsinGameShare == rhsinGameShare
        default:
            return false
        }
    }
}

extension KeyboardButtonType {
   public static func == (lhs: KeyboardButtonType, rhs: KeyboardButtonType) -> Bool {
        switch (lhs, rhs) {
            case (.text, .text):
                return true
            case (.requestPhoneNumber, .requestPhoneNumber):
                return true
            case (.requestLocation, .requestLocation):
                return true
        default:
            return false
        }
    }
}

extension LinkState {
   public static func == (lhs: LinkState, rhs: LinkState) -> Bool {
        switch (lhs, rhs) {
            case (.none, .none):
                return true
            case (.knowsPhoneNumber, .knowsPhoneNumber):
                return true
            case (.isContact, .isContact):
                return true
        default:
            return false
        }
    }
}

extension MaskPoint {
   public static func == (lhs: MaskPoint, rhs: MaskPoint) -> Bool {
        switch (lhs, rhs) {
            case (.forehead, .forehead):
                return true
            case (.eyes, .eyes):
                return true
            case (.mouth, .mouth):
                return true
            case (.chin, .chin):
                return true
        default:
            return false
        }
    }
}

extension MessageContent {
   public static func == (lhs: MessageContent, rhs: MessageContent) -> Bool {
        switch (lhs, rhs) {
            case (.messageText(
                let lhstext,
                let lhswebPage),
              .messageText(
                let rhstext,
                let rhswebPage)):
              return 
                lhstext == rhstext &&
                lhswebPage == rhswebPage
            case (.messageAnimation(
                let lhsanimation,
                let lhscaption,
                let lhsisSecret),
              .messageAnimation(
                let rhsanimation,
                let rhscaption,
                let rhsisSecret)):
              return 
                lhsanimation == rhsanimation &&
                lhscaption == rhscaption &&
                lhsisSecret == rhsisSecret
            case (.messageAudio(
                let lhsaudio,
                let lhscaption),
              .messageAudio(
                let rhsaudio,
                let rhscaption)):
              return 
                lhsaudio == rhsaudio &&
                lhscaption == rhscaption
            case (.messageDocument(
                let lhsdocument,
                let lhscaption),
              .messageDocument(
                let rhsdocument,
                let rhscaption)):
              return 
                lhsdocument == rhsdocument &&
                lhscaption == rhscaption
            case (.messagePhoto(
                let lhsphoto,
                let lhscaption,
                let lhsisSecret),
              .messagePhoto(
                let rhsphoto,
                let rhscaption,
                let rhsisSecret)):
              return 
                lhsphoto == rhsphoto &&
                lhscaption == rhscaption &&
                lhsisSecret == rhsisSecret
            case (.messageExpiredPhoto, .messageExpiredPhoto):
                return true
            case (.messageSticker(
                let lhssticker),
              .messageSticker(
                let rhssticker)):
              return 
                lhssticker == rhssticker
            case (.messageVideo(
                let lhsvideo,
                let lhscaption,
                let lhsisSecret),
              .messageVideo(
                let rhsvideo,
                let rhscaption,
                let rhsisSecret)):
              return 
                lhsvideo == rhsvideo &&
                lhscaption == rhscaption &&
                lhsisSecret == rhsisSecret
            case (.messageExpiredVideo, .messageExpiredVideo):
                return true
            case (.messageVideoNote(
                let lhsvideoNote,
                let lhsisViewed,
                let lhsisSecret),
              .messageVideoNote(
                let rhsvideoNote,
                let rhsisViewed,
                let rhsisSecret)):
              return 
                lhsvideoNote == rhsvideoNote &&
                lhsisViewed == rhsisViewed &&
                lhsisSecret == rhsisSecret
            case (.messageVoiceNote(
                let lhsvoiceNote,
                let lhscaption,
                let lhsisListened),
              .messageVoiceNote(
                let rhsvoiceNote,
                let rhscaption,
                let rhsisListened)):
              return 
                lhsvoiceNote == rhsvoiceNote &&
                lhscaption == rhscaption &&
                lhsisListened == rhsisListened
            case (.messageLocation(
                let lhslocation,
                let lhslivePeriod,
                let lhsexpiresIn),
              .messageLocation(
                let rhslocation,
                let rhslivePeriod,
                let rhsexpiresIn)):
              return 
                lhslocation == rhslocation &&
                lhslivePeriod == rhslivePeriod &&
                lhsexpiresIn == rhsexpiresIn
            case (.messageVenue(
                let lhsvenue),
              .messageVenue(
                let rhsvenue)):
              return 
                lhsvenue == rhsvenue
            case (.messageContact(
                let lhscontact),
              .messageContact(
                let rhscontact)):
              return 
                lhscontact == rhscontact
            case (.messageGame(
                let lhsgame),
              .messageGame(
                let rhsgame)):
              return 
                lhsgame == rhsgame
            case (.messageInvoice(
                let lhstitle,
                let lhsdescription,
                let lhsphoto,
                let lhscurrency,
                let lhstotalAmount,
                let lhsstartParameter,
                let lhsisTest,
                let lhsneedShippingAddress,
                let lhsreceiptMessageId),
              .messageInvoice(
                let rhstitle,
                let rhsdescription,
                let rhsphoto,
                let rhscurrency,
                let rhstotalAmount,
                let rhsstartParameter,
                let rhsisTest,
                let rhsneedShippingAddress,
                let rhsreceiptMessageId)):
              return 
                lhstitle == rhstitle &&
                lhsdescription == rhsdescription &&
                lhsphoto == rhsphoto &&
                lhscurrency == rhscurrency &&
                lhstotalAmount == rhstotalAmount &&
                lhsstartParameter == rhsstartParameter &&
                lhsisTest == rhsisTest &&
                lhsneedShippingAddress == rhsneedShippingAddress &&
                lhsreceiptMessageId == rhsreceiptMessageId
            case (.messageCall(
                let lhsdiscardReason,
                let lhsduration),
              .messageCall(
                let rhsdiscardReason,
                let rhsduration)):
              return 
                lhsdiscardReason == rhsdiscardReason &&
                lhsduration == rhsduration
            case (.messageBasicGroupChatCreate(
                let lhstitle,
                let lhsmemberUserIds),
              .messageBasicGroupChatCreate(
                let rhstitle,
                let rhsmemberUserIds)):
              return 
                lhstitle == rhstitle &&
                lhsmemberUserIds == rhsmemberUserIds
            case (.messageSupergroupChatCreate(
                let lhstitle),
              .messageSupergroupChatCreate(
                let rhstitle)):
              return 
                lhstitle == rhstitle
            case (.messageChatChangeTitle(
                let lhstitle),
              .messageChatChangeTitle(
                let rhstitle)):
              return 
                lhstitle == rhstitle
            case (.messageChatChangePhoto(
                let lhsphoto),
              .messageChatChangePhoto(
                let rhsphoto)):
              return 
                lhsphoto == rhsphoto
            case (.messageChatDeletePhoto, .messageChatDeletePhoto):
                return true
            case (.messageChatAddMembers(
                let lhsmemberUserIds),
              .messageChatAddMembers(
                let rhsmemberUserIds)):
              return 
                lhsmemberUserIds == rhsmemberUserIds
            case (.messageChatJoinByLink, .messageChatJoinByLink):
                return true
            case (.messageChatDeleteMember(
                let lhsuserId),
              .messageChatDeleteMember(
                let rhsuserId)):
              return 
                lhsuserId == rhsuserId
            case (.messageChatUpgradeTo(
                let lhssupergroupId),
              .messageChatUpgradeTo(
                let rhssupergroupId)):
              return 
                lhssupergroupId == rhssupergroupId
            case (.messageChatUpgradeFrom(
                let lhstitle,
                let lhsbasicGroupId),
              .messageChatUpgradeFrom(
                let rhstitle,
                let rhsbasicGroupId)):
              return 
                lhstitle == rhstitle &&
                lhsbasicGroupId == rhsbasicGroupId
            case (.messagePinMessage(
                let lhsmessageId),
              .messagePinMessage(
                let rhsmessageId)):
              return 
                lhsmessageId == rhsmessageId
            case (.messageScreenshotTaken, .messageScreenshotTaken):
                return true
            case (.messageChatSetTtl(
                let lhsttl),
              .messageChatSetTtl(
                let rhsttl)):
              return 
                lhsttl == rhsttl
            case (.messageCustomServiceAction(
                let lhstext),
              .messageCustomServiceAction(
                let rhstext)):
              return 
                lhstext == rhstext
            case (.messageGameScore(
                let lhsgameMessageId,
                let lhsgameId,
                let lhsscore),
              .messageGameScore(
                let rhsgameMessageId,
                let rhsgameId,
                let rhsscore)):
              return 
                lhsgameMessageId == rhsgameMessageId &&
                lhsgameId == rhsgameId &&
                lhsscore == rhsscore
            case (.messagePaymentSuccessful(
                let lhsinvoiceMessageId,
                let lhscurrency,
                let lhstotalAmount),
              .messagePaymentSuccessful(
                let rhsinvoiceMessageId,
                let rhscurrency,
                let rhstotalAmount)):
              return 
                lhsinvoiceMessageId == rhsinvoiceMessageId &&
                lhscurrency == rhscurrency &&
                lhstotalAmount == rhstotalAmount
            case (.messagePaymentSuccessfulBot(
                let lhsinvoiceMessageId,
                let lhscurrency,
                let lhstotalAmount,
                let lhsinvoicePayload,
                let lhsshippingOptionId,
                let lhsorderInfo,
                let lhstelegramPaymentChargeId,
                let lhsproviderPaymentChargeId),
              .messagePaymentSuccessfulBot(
                let rhsinvoiceMessageId,
                let rhscurrency,
                let rhstotalAmount,
                let rhsinvoicePayload,
                let rhsshippingOptionId,
                let rhsorderInfo,
                let rhstelegramPaymentChargeId,
                let rhsproviderPaymentChargeId)):
              return 
                lhsinvoiceMessageId == rhsinvoiceMessageId &&
                lhscurrency == rhscurrency &&
                lhstotalAmount == rhstotalAmount &&
                lhsinvoicePayload == rhsinvoicePayload &&
                lhsshippingOptionId == rhsshippingOptionId &&
                lhsorderInfo == rhsorderInfo &&
                lhstelegramPaymentChargeId == rhstelegramPaymentChargeId &&
                lhsproviderPaymentChargeId == rhsproviderPaymentChargeId
            case (.messageContactRegistered, .messageContactRegistered):
                return true
            case (.messageWebsiteConnected(
                let lhsdomainName),
              .messageWebsiteConnected(
                let rhsdomainName)):
              return 
                lhsdomainName == rhsdomainName
            case (.messageUnsupported, .messageUnsupported):
                return true
        default:
            return false
        }
    }
}

extension MessageForwardInfo {
   public static func == (lhs: MessageForwardInfo, rhs: MessageForwardInfo) -> Bool {
        switch (lhs, rhs) {
            case (.messageForwardedFromUser(
                let lhssenderUserId,
                let lhsdate,
                let lhsforwardedFromChatId,
                let lhsforwardedFromMessageId),
              .messageForwardedFromUser(
                let rhssenderUserId,
                let rhsdate,
                let rhsforwardedFromChatId,
                let rhsforwardedFromMessageId)):
              return 
                lhssenderUserId == rhssenderUserId &&
                lhsdate == rhsdate &&
                lhsforwardedFromChatId == rhsforwardedFromChatId &&
                lhsforwardedFromMessageId == rhsforwardedFromMessageId
            case (.messageForwardedPost(
                let lhschatId,
                let lhsauthorSignature,
                let lhsdate,
                let lhsmessageId,
                let lhsforwardedFromChatId,
                let lhsforwardedFromMessageId),
              .messageForwardedPost(
                let rhschatId,
                let rhsauthorSignature,
                let rhsdate,
                let rhsmessageId,
                let rhsforwardedFromChatId,
                let rhsforwardedFromMessageId)):
              return 
                lhschatId == rhschatId &&
                lhsauthorSignature == rhsauthorSignature &&
                lhsdate == rhsdate &&
                lhsmessageId == rhsmessageId &&
                lhsforwardedFromChatId == rhsforwardedFromChatId &&
                lhsforwardedFromMessageId == rhsforwardedFromMessageId
        default:
            return false
        }
    }
}

extension MessageSendingState {
   public static func == (lhs: MessageSendingState, rhs: MessageSendingState) -> Bool {
        switch (lhs, rhs) {
            case (.pending, .pending):
                return true
            case (.failed, .failed):
                return true
        default:
            return false
        }
    }
}

extension NetworkStatisticsEntry {
   public static func == (lhs: NetworkStatisticsEntry, rhs: NetworkStatisticsEntry) -> Bool {
        switch (lhs, rhs) {
            case (.file(
                let lhsfileType,
                let lhsnetworkType,
                let lhssentBytes,
                let lhsreceivedBytes),
              .file(
                let rhsfileType,
                let rhsnetworkType,
                let rhssentBytes,
                let rhsreceivedBytes)):
              return 
                lhsfileType == rhsfileType &&
                lhsnetworkType == rhsnetworkType &&
                lhssentBytes == rhssentBytes &&
                lhsreceivedBytes == rhsreceivedBytes
            case (.call(
                let lhsnetworkType,
                let lhssentBytes,
                let lhsreceivedBytes,
                let lhsduration),
              .call(
                let rhsnetworkType,
                let rhssentBytes,
                let rhsreceivedBytes,
                let rhsduration)):
              return 
                lhsnetworkType == rhsnetworkType &&
                lhssentBytes == rhssentBytes &&
                lhsreceivedBytes == rhsreceivedBytes &&
                lhsduration == rhsduration
        default:
            return false
        }
    }
}

extension NetworkType {
   public static func == (lhs: NetworkType, rhs: NetworkType) -> Bool {
        switch (lhs, rhs) {
            case (.none, .none):
                return true
            case (.mobile, .mobile):
                return true
            case (.mobileRoaming, .mobileRoaming):
                return true
            case (.wiFi, .wiFi):
                return true
            case (.other, .other):
                return true
        default:
            return false
        }
    }
}

extension NotificationSettingsScope {
   public static func == (lhs: NotificationSettingsScope, rhs: NotificationSettingsScope) -> Bool {
        switch (lhs, rhs) {
            case (.chat(
                let lhschatId),
              .chat(
                let rhschatId)):
              return 
                lhschatId == rhschatId
            case (.privateChats, .privateChats):
                return true
            case (.basicGroupChats, .basicGroupChats):
                return true
            case (.allChats, .allChats):
                return true
        default:
            return false
        }
    }
}

extension OptionValue {
   public static func == (lhs: OptionValue, rhs: OptionValue) -> Bool {
        switch (lhs, rhs) {
            case (.boolean(
                let lhsvalue),
              .boolean(
                let rhsvalue)):
              return 
                lhsvalue == rhsvalue
            case (.empty, .empty):
                return true
            case (.integer(
                let lhsvalue),
              .integer(
                let rhsvalue)):
              return 
                lhsvalue == rhsvalue
            case (.string(
                let lhsvalue),
              .string(
                let rhsvalue)):
              return 
                lhsvalue == rhsvalue
        default:
            return false
        }
    }
}

extension PageBlock {
   public static func == (lhs: PageBlock, rhs: PageBlock) -> Bool {
        switch (lhs, rhs) {
            case (.title(
                let lhstitle),
              .title(
                let rhstitle)):
              return 
                lhstitle == rhstitle
            case (.subtitle(
                let lhssubtitle),
              .subtitle(
                let rhssubtitle)):
              return 
                lhssubtitle == rhssubtitle
            case (.authorDate(
                let lhsauthor,
                let lhspublishDate),
              .authorDate(
                let rhsauthor,
                let rhspublishDate)):
              return 
                lhsauthor == rhsauthor &&
                lhspublishDate == rhspublishDate
            case (.header(
                let lhsheader),
              .header(
                let rhsheader)):
              return 
                lhsheader == rhsheader
            case (.subheader(
                let lhssubheader),
              .subheader(
                let rhssubheader)):
              return 
                lhssubheader == rhssubheader
            case (.paragraph(
                let lhstext),
              .paragraph(
                let rhstext)):
              return 
                lhstext == rhstext
            case (.preformatted(
                let lhstext,
                let lhslanguage),
              .preformatted(
                let rhstext,
                let rhslanguage)):
              return 
                lhstext == rhstext &&
                lhslanguage == rhslanguage
            case (.footer(
                let lhsfooter),
              .footer(
                let rhsfooter)):
              return 
                lhsfooter == rhsfooter
            case (.divider, .divider):
                return true
            case (.anchor(
                let lhsname),
              .anchor(
                let rhsname)):
              return 
                lhsname == rhsname
            case (.list(
                let lhsitems,
                let lhsisOrdered),
              .list(
                let rhsitems,
                let rhsisOrdered)):
              return 
                lhsitems == rhsitems &&
                lhsisOrdered == rhsisOrdered
            case (.blockQuote(
                let lhstext,
                let lhscaption),
              .blockQuote(
                let rhstext,
                let rhscaption)):
              return 
                lhstext == rhstext &&
                lhscaption == rhscaption
            case (.pullQuote(
                let lhstext,
                let lhscaption),
              .pullQuote(
                let rhstext,
                let rhscaption)):
              return 
                lhstext == rhstext &&
                lhscaption == rhscaption
            case (.animation(
                let lhsanimation,
                let lhscaption,
                let lhsneedAutoplay),
              .animation(
                let rhsanimation,
                let rhscaption,
                let rhsneedAutoplay)):
              return 
                lhsanimation == rhsanimation &&
                lhscaption == rhscaption &&
                lhsneedAutoplay == rhsneedAutoplay
            case (.audio(
                let lhsaudio,
                let lhscaption),
              .audio(
                let rhsaudio,
                let rhscaption)):
              return 
                lhsaudio == rhsaudio &&
                lhscaption == rhscaption
            case (.photo(
                let lhsphoto,
                let lhscaption),
              .photo(
                let rhsphoto,
                let rhscaption)):
              return 
                lhsphoto == rhsphoto &&
                lhscaption == rhscaption
            case (.video(
                let lhsvideo,
                let lhscaption,
                let lhsneedAutoplay,
                let lhsisLooped),
              .video(
                let rhsvideo,
                let rhscaption,
                let rhsneedAutoplay,
                let rhsisLooped)):
              return 
                lhsvideo == rhsvideo &&
                lhscaption == rhscaption &&
                lhsneedAutoplay == rhsneedAutoplay &&
                lhsisLooped == rhsisLooped
            case (.cover(
                let lhscover),
              .cover(
                let rhscover)):
              return 
                lhscover == rhscover
            case (.embedded(
                let lhsurl,
                let lhshtml,
                let lhsposterPhoto,
                let lhswidth,
                let lhsheight,
                let lhscaption,
                let lhsisFullWidth,
                let lhsallowScrolling),
              .embedded(
                let rhsurl,
                let rhshtml,
                let rhsposterPhoto,
                let rhswidth,
                let rhsheight,
                let rhscaption,
                let rhsisFullWidth,
                let rhsallowScrolling)):
              return 
                lhsurl == rhsurl &&
                lhshtml == rhshtml &&
                lhsposterPhoto == rhsposterPhoto &&
                lhswidth == rhswidth &&
                lhsheight == rhsheight &&
                lhscaption == rhscaption &&
                lhsisFullWidth == rhsisFullWidth &&
                lhsallowScrolling == rhsallowScrolling
            case (.embeddedPost(
                let lhsurl,
                let lhsauthor,
                let lhsauthorPhoto,
                let lhsdate,
                let lhspageBlocks,
                let lhscaption),
              .embeddedPost(
                let rhsurl,
                let rhsauthor,
                let rhsauthorPhoto,
                let rhsdate,
                let rhspageBlocks,
                let rhscaption)):
              return 
                lhsurl == rhsurl &&
                lhsauthor == rhsauthor &&
                lhsauthorPhoto == rhsauthorPhoto &&
                lhsdate == rhsdate &&
                lhspageBlocks == rhspageBlocks &&
                lhscaption == rhscaption
            case (.collage(
                let lhspageBlocks,
                let lhscaption),
              .collage(
                let rhspageBlocks,
                let rhscaption)):
              return 
                lhspageBlocks == rhspageBlocks &&
                lhscaption == rhscaption
            case (.slideshow(
                let lhspageBlocks,
                let lhscaption),
              .slideshow(
                let rhspageBlocks,
                let rhscaption)):
              return 
                lhspageBlocks == rhspageBlocks &&
                lhscaption == rhscaption
            case (.chatLink(
                let lhstitle,
                let lhsphoto,
                let lhsusername),
              .chatLink(
                let rhstitle,
                let rhsphoto,
                let rhsusername)):
              return 
                lhstitle == rhstitle &&
                lhsphoto == rhsphoto &&
                lhsusername == rhsusername
        default:
            return false
        }
    }
}

extension Proxy {
   public static func == (lhs: Proxy, rhs: Proxy) -> Bool {
        switch (lhs, rhs) {
            case (.empty, .empty):
                return true
            case (.socks5(
                let lhsserver,
                let lhsport,
                let lhsusername,
                let lhspassword),
              .socks5(
                let rhsserver,
                let rhsport,
                let rhsusername,
                let rhspassword)):
              return 
                lhsserver == rhsserver &&
                lhsport == rhsport &&
                lhsusername == rhsusername &&
                lhspassword == rhspassword
        default:
            return false
        }
    }
}

extension ReplyMarkup {
   public static func == (lhs: ReplyMarkup, rhs: ReplyMarkup) -> Bool {
        switch (lhs, rhs) {
            case (.removeKeyboard(
                let lhsisPersonal),
              .removeKeyboard(
                let rhsisPersonal)):
              return 
                lhsisPersonal == rhsisPersonal
            case (.forceReply(
                let lhsisPersonal),
              .forceReply(
                let rhsisPersonal)):
              return 
                lhsisPersonal == rhsisPersonal
            case (.showKeyboard(
                let lhsrows,
                let lhsresizeKeyboard,
                let lhsoneTime,
                let lhsisPersonal),
              .showKeyboard(
                let rhsrows,
                let rhsresizeKeyboard,
                let rhsoneTime,
                let rhsisPersonal)):
              return 
                lhsrows == rhsrows &&
                lhsresizeKeyboard == rhsresizeKeyboard &&
                lhsoneTime == rhsoneTime &&
                lhsisPersonal == rhsisPersonal
            case (.inlineKeyboard(
                let lhsrows),
              .inlineKeyboard(
                let rhsrows)):
              return 
                lhsrows == rhsrows
        default:
            return false
        }
    }
}

extension RichText {
   public static func == (lhs: RichText, rhs: RichText) -> Bool {
        switch (lhs, rhs) {
            case (.plain(
                let lhstext),
              .plain(
                let rhstext)):
              return 
                lhstext == rhstext
            case (.bold(
                let lhstext),
              .bold(
                let rhstext)):
              return 
                lhstext == rhstext
            case (.italic(
                let lhstext),
              .italic(
                let rhstext)):
              return 
                lhstext == rhstext
            case (.underline(
                let lhstext),
              .underline(
                let rhstext)):
              return 
                lhstext == rhstext
            case (.strikethrough(
                let lhstext),
              .strikethrough(
                let rhstext)):
              return 
                lhstext == rhstext
            case (.fixed(
                let lhstext),
              .fixed(
                let rhstext)):
              return 
                lhstext == rhstext
            case (.url(
                let lhstext,
                let lhsurl),
              .url(
                let rhstext,
                let rhsurl)):
              return 
                lhstext == rhstext &&
                lhsurl == rhsurl
            case (.emailAddress(
                let lhstext,
                let lhsemailAddress),
              .emailAddress(
                let rhstext,
                let rhsemailAddress)):
              return 
                lhstext == rhstext &&
                lhsemailAddress == rhsemailAddress
            case (.s(
                let lhstexts),
              .s(
                let rhstexts)):
              return 
                lhstexts == rhstexts
        default:
            return false
        }
    }
}

extension SearchMessagesFilter {
   public static func == (lhs: SearchMessagesFilter, rhs: SearchMessagesFilter) -> Bool {
        switch (lhs, rhs) {
            case (.empty, .empty):
                return true
            case (.animation, .animation):
                return true
            case (.audio, .audio):
                return true
            case (.document, .document):
                return true
            case (.photo, .photo):
                return true
            case (.video, .video):
                return true
            case (.voiceNote, .voiceNote):
                return true
            case (.photoAndVideo, .photoAndVideo):
                return true
            case (.url, .url):
                return true
            case (.chatPhoto, .chatPhoto):
                return true
            case (.call, .call):
                return true
            case (.missedCall, .missedCall):
                return true
            case (.videoNote, .videoNote):
                return true
            case (.voiceAndVideoNote, .voiceAndVideoNote):
                return true
            case (.mention, .mention):
                return true
            case (.unreadMention, .unreadMention):
                return true
        default:
            return false
        }
    }
}

extension SecretChatState {
   public static func == (lhs: SecretChatState, rhs: SecretChatState) -> Bool {
        switch (lhs, rhs) {
            case (.pending, .pending):
                return true
            case (.ready, .ready):
                return true
            case (.closed, .closed):
                return true
        default:
            return false
        }
    }
}

extension SupergroupMembersFilter {
   public static func == (lhs: SupergroupMembersFilter, rhs: SupergroupMembersFilter) -> Bool {
        switch (lhs, rhs) {
            case (.recent, .recent):
                return true
            case (.administrators, .administrators):
                return true
            case (.search(
                let lhsquery),
              .search(
                let rhsquery)):
              return 
                lhsquery == rhsquery
            case (.restricted(
                let lhsquery),
              .restricted(
                let rhsquery)):
              return 
                lhsquery == rhsquery
            case (.banned(
                let lhsquery),
              .banned(
                let rhsquery)):
              return 
                lhsquery == rhsquery
            case (.bots, .bots):
                return true
        default:
            return false
        }
    }
}

extension TMeUrlType {
   public static func == (lhs: TMeUrlType, rhs: TMeUrlType) -> Bool {
        switch (lhs, rhs) {
            case (.user(
                let lhsuserId),
              .user(
                let rhsuserId)):
              return 
                lhsuserId == rhsuserId
            case (.supergroup(
                let lhssupergroupId),
              .supergroup(
                let rhssupergroupId)):
              return 
                lhssupergroupId == rhssupergroupId
            case (.chatInvite(
                let lhsinfo),
              .chatInvite(
                let rhsinfo)):
              return 
                lhsinfo == rhsinfo
            case (.stickerSet(
                let lhsstickerSetId),
              .stickerSet(
                let rhsstickerSetId)):
              return 
                lhsstickerSetId == rhsstickerSetId
        default:
            return false
        }
    }
}

extension TextEntityType {
   public static func == (lhs: TextEntityType, rhs: TextEntityType) -> Bool {
        switch (lhs, rhs) {
            case (.mention, .mention):
                return true
            case (.hashtag, .hashtag):
                return true
            case (.cashtag, .cashtag):
                return true
            case (.botCommand, .botCommand):
                return true
            case (.url, .url):
                return true
            case (.emailAddress, .emailAddress):
                return true
            case (.bold, .bold):
                return true
            case (.italic, .italic):
                return true
            case (.code, .code):
                return true
            case (.pre, .pre):
                return true
            case (.preCode(
                let lhslanguage),
              .preCode(
                let rhslanguage)):
              return 
                lhslanguage == rhslanguage
            case (.textUrl(
                let lhsurl),
              .textUrl(
                let rhsurl)):
              return 
                lhsurl == rhsurl
            case (.mentionName(
                let lhsuserId),
              .mentionName(
                let rhsuserId)):
              return 
                lhsuserId == rhsuserId
            case (.phoneNumber, .phoneNumber):
                return true
        default:
            return false
        }
    }
}

extension TextParseMode {
   public static func == (lhs: TextParseMode, rhs: TextParseMode) -> Bool {
        switch (lhs, rhs) {
            case (.markdown, .markdown):
                return true
            case (.hTML, .hTML):
                return true
        default:
            return false
        }
    }
}

extension TopChatCategory {
   public static func == (lhs: TopChatCategory, rhs: TopChatCategory) -> Bool {
        switch (lhs, rhs) {
            case (.users, .users):
                return true
            case (.bots, .bots):
                return true
            case (.groups, .groups):
                return true
            case (.channels, .channels):
                return true
            case (.inlineBots, .inlineBots):
                return true
            case (.calls, .calls):
                return true
        default:
            return false
        }
    }
}

extension Update {
   public static func == (lhs: Update, rhs: Update) -> Bool {
        switch (lhs, rhs) {
            case (.authorizationState(
                let lhsauthorizationState),
              .authorizationState(
                let rhsauthorizationState)):
              return 
                lhsauthorizationState == rhsauthorizationState
            case (.newMessage(
                let lhsmessage,
                let lhsdisableNotification,
                let lhscontainsMention),
              .newMessage(
                let rhsmessage,
                let rhsdisableNotification,
                let rhscontainsMention)):
              return 
                lhsmessage == rhsmessage &&
                lhsdisableNotification == rhsdisableNotification &&
                lhscontainsMention == rhscontainsMention
            case (.messageSendAcknowledged(
                let lhschatId,
                let lhsmessageId),
              .messageSendAcknowledged(
                let rhschatId,
                let rhsmessageId)):
              return 
                lhschatId == rhschatId &&
                lhsmessageId == rhsmessageId
            case (.messageSendSucceeded(
                let lhsmessage,
                let lhsoldMessageId),
              .messageSendSucceeded(
                let rhsmessage,
                let rhsoldMessageId)):
              return 
                lhsmessage == rhsmessage &&
                lhsoldMessageId == rhsoldMessageId
            case (.messageSendFailed(
                let lhsmessage,
                let lhsoldMessageId,
                let lhserrorCode,
                let lhserrorMessage),
              .messageSendFailed(
                let rhsmessage,
                let rhsoldMessageId,
                let rhserrorCode,
                let rhserrorMessage)):
              return 
                lhsmessage == rhsmessage &&
                lhsoldMessageId == rhsoldMessageId &&
                lhserrorCode == rhserrorCode &&
                lhserrorMessage == rhserrorMessage
            case (.messageContent(
                let lhschatId,
                let lhsmessageId,
                let lhsnewContent),
              .messageContent(
                let rhschatId,
                let rhsmessageId,
                let rhsnewContent)):
              return 
                lhschatId == rhschatId &&
                lhsmessageId == rhsmessageId &&
                lhsnewContent == rhsnewContent
            case (.messageEdited(
                let lhschatId,
                let lhsmessageId,
                let lhseditDate,
                let lhsreplyMarkup),
              .messageEdited(
                let rhschatId,
                let rhsmessageId,
                let rhseditDate,
                let rhsreplyMarkup)):
              return 
                lhschatId == rhschatId &&
                lhsmessageId == rhsmessageId &&
                lhseditDate == rhseditDate &&
                lhsreplyMarkup == rhsreplyMarkup
            case (.messageViews(
                let lhschatId,
                let lhsmessageId,
                let lhsviews),
              .messageViews(
                let rhschatId,
                let rhsmessageId,
                let rhsviews)):
              return 
                lhschatId == rhschatId &&
                lhsmessageId == rhsmessageId &&
                lhsviews == rhsviews
            case (.messageContentOpened(
                let lhschatId,
                let lhsmessageId),
              .messageContentOpened(
                let rhschatId,
                let rhsmessageId)):
              return 
                lhschatId == rhschatId &&
                lhsmessageId == rhsmessageId
            case (.messageMentionRead(
                let lhschatId,
                let lhsmessageId,
                let lhsunreadMentionCount),
              .messageMentionRead(
                let rhschatId,
                let rhsmessageId,
                let rhsunreadMentionCount)):
              return 
                lhschatId == rhschatId &&
                lhsmessageId == rhsmessageId &&
                lhsunreadMentionCount == rhsunreadMentionCount
            case (.newChat(
                let lhschat),
              .newChat(
                let rhschat)):
              return 
                lhschat == rhschat
            case (.chatTitle(
                let lhschatId,
                let lhstitle),
              .chatTitle(
                let rhschatId,
                let rhstitle)):
              return 
                lhschatId == rhschatId &&
                lhstitle == rhstitle
            case (.chatPhoto(
                let lhschatId,
                let lhsphoto),
              .chatPhoto(
                let rhschatId,
                let rhsphoto)):
              return 
                lhschatId == rhschatId &&
                lhsphoto == rhsphoto
            case (.chatLastMessage(
                let lhschatId,
                let lhslastMessage,
                let lhsorder),
              .chatLastMessage(
                let rhschatId,
                let rhslastMessage,
                let rhsorder)):
              return 
                lhschatId == rhschatId &&
                lhslastMessage == rhslastMessage &&
                lhsorder == rhsorder
            case (.chatOrder(
                let lhschatId,
                let lhsorder),
              .chatOrder(
                let rhschatId,
                let rhsorder)):
              return 
                lhschatId == rhschatId &&
                lhsorder == rhsorder
            case (.chatIsPinned(
                let lhschatId,
                let lhsisPinned,
                let lhsorder),
              .chatIsPinned(
                let rhschatId,
                let rhsisPinned,
                let rhsorder)):
              return 
                lhschatId == rhschatId &&
                lhsisPinned == rhsisPinned &&
                lhsorder == rhsorder
            case (.chatReadInbox(
                let lhschatId,
                let lhslastReadInboxMessageId,
                let lhsunreadCount),
              .chatReadInbox(
                let rhschatId,
                let rhslastReadInboxMessageId,
                let rhsunreadCount)):
              return 
                lhschatId == rhschatId &&
                lhslastReadInboxMessageId == rhslastReadInboxMessageId &&
                lhsunreadCount == rhsunreadCount
            case (.chatReadOutbox(
                let lhschatId,
                let lhslastReadOutboxMessageId),
              .chatReadOutbox(
                let rhschatId,
                let rhslastReadOutboxMessageId)):
              return 
                lhschatId == rhschatId &&
                lhslastReadOutboxMessageId == rhslastReadOutboxMessageId
            case (.chatUnreadMentionCount(
                let lhschatId,
                let lhsunreadMentionCount),
              .chatUnreadMentionCount(
                let rhschatId,
                let rhsunreadMentionCount)):
              return 
                lhschatId == rhschatId &&
                lhsunreadMentionCount == rhsunreadMentionCount
            case (.notificationSettings(
                let lhsscope,
                let lhsnotificationSettings),
              .notificationSettings(
                let rhsscope,
                let rhsnotificationSettings)):
              return 
                lhsscope == rhsscope &&
                lhsnotificationSettings == rhsnotificationSettings
            case (.chatReplyMarkup(
                let lhschatId,
                let lhsreplyMarkupMessageId),
              .chatReplyMarkup(
                let rhschatId,
                let rhsreplyMarkupMessageId)):
              return 
                lhschatId == rhschatId &&
                lhsreplyMarkupMessageId == rhsreplyMarkupMessageId
            case (.chatDraftMessage(
                let lhschatId,
                let lhsdraftMessage,
                let lhsorder),
              .chatDraftMessage(
                let rhschatId,
                let rhsdraftMessage,
                let rhsorder)):
              return 
                lhschatId == rhschatId &&
                lhsdraftMessage == rhsdraftMessage &&
                lhsorder == rhsorder
            case (.deleteMessages(
                let lhschatId,
                let lhsmessageIds,
                let lhsisPermanent,
                let lhsfromCache),
              .deleteMessages(
                let rhschatId,
                let rhsmessageIds,
                let rhsisPermanent,
                let rhsfromCache)):
              return 
                lhschatId == rhschatId &&
                lhsmessageIds == rhsmessageIds &&
                lhsisPermanent == rhsisPermanent &&
                lhsfromCache == rhsfromCache
            case (.userChatAction(
                let lhschatId,
                let lhsuserId,
                let lhsaction),
              .userChatAction(
                let rhschatId,
                let rhsuserId,
                let rhsaction)):
              return 
                lhschatId == rhschatId &&
                lhsuserId == rhsuserId &&
                lhsaction == rhsaction
            case (.userStatus(
                let lhsuserId,
                let lhsstatus),
              .userStatus(
                let rhsuserId,
                let rhsstatus)):
              return 
                lhsuserId == rhsuserId &&
                lhsstatus == rhsstatus
            case (.user(
                let lhsuser),
              .user(
                let rhsuser)):
              return 
                lhsuser == rhsuser
            case (.basicGroup(
                let lhsbasicGroup),
              .basicGroup(
                let rhsbasicGroup)):
              return 
                lhsbasicGroup == rhsbasicGroup
            case (.supergroup(
                let lhssupergroup),
              .supergroup(
                let rhssupergroup)):
              return 
                lhssupergroup == rhssupergroup
            case (.secretChat(
                let lhssecretChat),
              .secretChat(
                let rhssecretChat)):
              return 
                lhssecretChat == rhssecretChat
            case (.userFullInfo(
                let lhsuserId,
                let lhsuserFullInfo),
              .userFullInfo(
                let rhsuserId,
                let rhsuserFullInfo)):
              return 
                lhsuserId == rhsuserId &&
                lhsuserFullInfo == rhsuserFullInfo
            case (.basicGroupFullInfo(
                let lhsbasicGroupId,
                let lhsbasicGroupFullInfo),
              .basicGroupFullInfo(
                let rhsbasicGroupId,
                let rhsbasicGroupFullInfo)):
              return 
                lhsbasicGroupId == rhsbasicGroupId &&
                lhsbasicGroupFullInfo == rhsbasicGroupFullInfo
            case (.supergroupFullInfo(
                let lhssupergroupId,
                let lhssupergroupFullInfo),
              .supergroupFullInfo(
                let rhssupergroupId,
                let rhssupergroupFullInfo)):
              return 
                lhssupergroupId == rhssupergroupId &&
                lhssupergroupFullInfo == rhssupergroupFullInfo
            case (.serviceNotification(
                let lhstype,
                let lhscontent),
              .serviceNotification(
                let rhstype,
                let rhscontent)):
              return 
                lhstype == rhstype &&
                lhscontent == rhscontent
            case (.file(
                let lhsfile),
              .file(
                let rhsfile)):
              return 
                lhsfile == rhsfile
            case (.fileGenerationStart(
                let lhsgenerationId,
                let lhsoriginalPath,
                let lhsdestinationPath,
                let lhsconversion),
              .fileGenerationStart(
                let rhsgenerationId,
                let rhsoriginalPath,
                let rhsdestinationPath,
                let rhsconversion)):
              return 
                lhsgenerationId == rhsgenerationId &&
                lhsoriginalPath == rhsoriginalPath &&
                lhsdestinationPath == rhsdestinationPath &&
                lhsconversion == rhsconversion
            case (.fileGenerationStop(
                let lhsgenerationId),
              .fileGenerationStop(
                let rhsgenerationId)):
              return 
                lhsgenerationId == rhsgenerationId
            case (.call(
                let lhscall),
              .call(
                let rhscall)):
              return 
                lhscall == rhscall
            case (.userPrivacySettingRules(
                let lhssetting,
                let lhsrules),
              .userPrivacySettingRules(
                let rhssetting,
                let rhsrules)):
              return 
                lhssetting == rhssetting &&
                lhsrules == rhsrules
            case (.unreadMessageCount(
                let lhsunreadCount,
                let lhsunreadUnmutedCount),
              .unreadMessageCount(
                let rhsunreadCount,
                let rhsunreadUnmutedCount)):
              return 
                lhsunreadCount == rhsunreadCount &&
                lhsunreadUnmutedCount == rhsunreadUnmutedCount
            case (.option(
                let lhsname,
                let lhsvalue),
              .option(
                let rhsname,
                let rhsvalue)):
              return 
                lhsname == rhsname &&
                lhsvalue == rhsvalue
            case (.installedStickerSets(
                let lhsisMasks,
                let lhsstickerSetIds),
              .installedStickerSets(
                let rhsisMasks,
                let rhsstickerSetIds)):
              return 
                lhsisMasks == rhsisMasks &&
                lhsstickerSetIds == rhsstickerSetIds
            case (.trendingStickerSets(
                let lhsstickerSets),
              .trendingStickerSets(
                let rhsstickerSets)):
              return 
                lhsstickerSets == rhsstickerSets
            case (.recentStickers(
                let lhsisAttached,
                let lhsstickerIds),
              .recentStickers(
                let rhsisAttached,
                let rhsstickerIds)):
              return 
                lhsisAttached == rhsisAttached &&
                lhsstickerIds == rhsstickerIds
            case (.favoriteStickers(
                let lhsstickerIds),
              .favoriteStickers(
                let rhsstickerIds)):
              return 
                lhsstickerIds == rhsstickerIds
            case (.savedAnimations(
                let lhsanimationIds),
              .savedAnimations(
                let rhsanimationIds)):
              return 
                lhsanimationIds == rhsanimationIds
            case (.connectionState(
                let lhsstate),
              .connectionState(
                let rhsstate)):
              return 
                lhsstate == rhsstate
            case (.newInlineQuery(
                let lhsid,
                let lhssenderUserId,
                let lhsuserLocation,
                let lhsquery,
                let lhsoffset),
              .newInlineQuery(
                let rhsid,
                let rhssenderUserId,
                let rhsuserLocation,
                let rhsquery,
                let rhsoffset)):
              return 
                lhsid == rhsid &&
                lhssenderUserId == rhssenderUserId &&
                lhsuserLocation == rhsuserLocation &&
                lhsquery == rhsquery &&
                lhsoffset == rhsoffset
            case (.newChosenInlineResult(
                let lhssenderUserId,
                let lhsuserLocation,
                let lhsquery,
                let lhsresultId,
                let lhsinlineMessageId),
              .newChosenInlineResult(
                let rhssenderUserId,
                let rhsuserLocation,
                let rhsquery,
                let rhsresultId,
                let rhsinlineMessageId)):
              return 
                lhssenderUserId == rhssenderUserId &&
                lhsuserLocation == rhsuserLocation &&
                lhsquery == rhsquery &&
                lhsresultId == rhsresultId &&
                lhsinlineMessageId == rhsinlineMessageId
            case (.newCallbackQuery(
                let lhsid,
                let lhssenderUserId,
                let lhschatId,
                let lhsmessageId,
                let lhschatInstance,
                let lhspayload),
              .newCallbackQuery(
                let rhsid,
                let rhssenderUserId,
                let rhschatId,
                let rhsmessageId,
                let rhschatInstance,
                let rhspayload)):
              return 
                lhsid == rhsid &&
                lhssenderUserId == rhssenderUserId &&
                lhschatId == rhschatId &&
                lhsmessageId == rhsmessageId &&
                lhschatInstance == rhschatInstance &&
                lhspayload == rhspayload
            case (.newInlineCallbackQuery(
                let lhsid,
                let lhssenderUserId,
                let lhsinlineMessageId,
                let lhschatInstance,
                let lhspayload),
              .newInlineCallbackQuery(
                let rhsid,
                let rhssenderUserId,
                let rhsinlineMessageId,
                let rhschatInstance,
                let rhspayload)):
              return 
                lhsid == rhsid &&
                lhssenderUserId == rhssenderUserId &&
                lhsinlineMessageId == rhsinlineMessageId &&
                lhschatInstance == rhschatInstance &&
                lhspayload == rhspayload
            case (.newShippingQuery(
                let lhsid,
                let lhssenderUserId,
                let lhsinvoicePayload,
                let lhsshippingAddress),
              .newShippingQuery(
                let rhsid,
                let rhssenderUserId,
                let rhsinvoicePayload,
                let rhsshippingAddress)):
              return 
                lhsid == rhsid &&
                lhssenderUserId == rhssenderUserId &&
                lhsinvoicePayload == rhsinvoicePayload &&
                lhsshippingAddress == rhsshippingAddress
            case (.newPreCheckoutQuery(
                let lhsid,
                let lhssenderUserId,
                let lhscurrency,
                let lhstotalAmount,
                let lhsinvoicePayload,
                let lhsshippingOptionId,
                let lhsorderInfo),
              .newPreCheckoutQuery(
                let rhsid,
                let rhssenderUserId,
                let rhscurrency,
                let rhstotalAmount,
                let rhsinvoicePayload,
                let rhsshippingOptionId,
                let rhsorderInfo)):
              return 
                lhsid == rhsid &&
                lhssenderUserId == rhssenderUserId &&
                lhscurrency == rhscurrency &&
                lhstotalAmount == rhstotalAmount &&
                lhsinvoicePayload == rhsinvoicePayload &&
                lhsshippingOptionId == rhsshippingOptionId &&
                lhsorderInfo == rhsorderInfo
            case (.newCustomEvent(
                let lhsevent),
              .newCustomEvent(
                let rhsevent)):
              return 
                lhsevent == rhsevent
            case (.newCustomQuery(
                let lhsid,
                let lhsdata,
                let lhstimeout),
              .newCustomQuery(
                let rhsid,
                let rhsdata,
                let rhstimeout)):
              return 
                lhsid == rhsid &&
                lhsdata == rhsdata &&
                lhstimeout == rhstimeout
        default:
            return false
        }
    }
}

extension UserPrivacySetting {
   public static func == (lhs: UserPrivacySetting, rhs: UserPrivacySetting) -> Bool {
        switch (lhs, rhs) {
            case (.showStatus, .showStatus):
                return true
            case (.allowChatInvites, .allowChatInvites):
                return true
            case (.allowCalls, .allowCalls):
                return true
        default:
            return false
        }
    }
}

extension UserPrivacySettingRule {
   public static func == (lhs: UserPrivacySettingRule, rhs: UserPrivacySettingRule) -> Bool {
        switch (lhs, rhs) {
            case (.allowAll, .allowAll):
                return true
            case (.allowContacts, .allowContacts):
                return true
            case (.allowUsers(
                let lhsuserIds),
              .allowUsers(
                let rhsuserIds)):
              return 
                lhsuserIds == rhsuserIds
            case (.restrictAll, .restrictAll):
                return true
            case (.restrictContacts, .restrictContacts):
                return true
            case (.restrictUsers(
                let lhsuserIds),
              .restrictUsers(
                let rhsuserIds)):
              return 
                lhsuserIds == rhsuserIds
        default:
            return false
        }
    }
}

extension UserStatus {
   public static func == (lhs: UserStatus, rhs: UserStatus) -> Bool {
        switch (lhs, rhs) {
            case (.empty, .empty):
                return true
            case (.online(
                let lhsexpires),
              .online(
                let rhsexpires)):
              return 
                lhsexpires == rhsexpires
            case (.offline(
                let lhswasOnline),
              .offline(
                let rhswasOnline)):
              return 
                lhswasOnline == rhswasOnline
            case (.recently, .recently):
                return true
            case (.lastWeek, .lastWeek):
                return true
            case (.lastMonth, .lastMonth):
                return true
        default:
            return false
        }
    }
}

extension UserType {
   public static func == (lhs: UserType, rhs: UserType) -> Bool {
        switch (lhs, rhs) {
            case (.regular, .regular):
                return true
            case (.deleted, .deleted):
                return true
            case (.bot(
                let lhscanJoinGroups,
                let lhscanReadAllGroupMessages,
                let lhsisInline,
                let lhsinlineQueryPlaceholder,
                let lhsneedLocation),
              .bot(
                let rhscanJoinGroups,
                let rhscanReadAllGroupMessages,
                let rhsisInline,
                let rhsinlineQueryPlaceholder,
                let rhsneedLocation)):
              return 
                lhscanJoinGroups == rhscanJoinGroups &&
                lhscanReadAllGroupMessages == rhscanReadAllGroupMessages &&
                lhsisInline == rhsisInline &&
                lhsinlineQueryPlaceholder == rhsinlineQueryPlaceholder &&
                lhsneedLocation == rhsneedLocation
            case (.unknown, .unknown):
                return true
        default:
            return false
        }
    }
}
  