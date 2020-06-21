// Generated using Sourcery 0.18.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



extension AuthenticationCodeType {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum TelegramMessageKeys: String, CodingKey {
          case length
  }
  enum SmsKeys: String, CodingKey {
          case length
  }
  enum CallKeys: String, CodingKey {
          case length
  }
  enum FlashCallKeys: String, CodingKey {
          case pattern
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "authenticationCodeTypeTelegramMessage":
      let caseContainer = try decoder.container(keyedBy: TelegramMessageKeys.self)
      self = .telegramMessage(
            length: try caseContainer.decode(Int32.self, forKey: .length)
        )
    case "authenticationCodeTypeSms":
      let caseContainer = try decoder.container(keyedBy: SmsKeys.self)
      self = .sms(
            length: try caseContainer.decode(Int32.self, forKey: .length)
        )
    case "authenticationCodeTypeCall":
      let caseContainer = try decoder.container(keyedBy: CallKeys.self)
      self = .call(
            length: try caseContainer.decode(Int32.self, forKey: .length)
        )
    case "authenticationCodeTypeFlashCall":
      let caseContainer = try decoder.container(keyedBy: FlashCallKeys.self)
      self = .flashCall(
            pattern: try caseContainer.decode(String.self, forKey: .pattern)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .telegramMessage(
                let length):
               try container.encode("authenticationCodeTypeTelegramMessage", forKey: .type)
                var caseContainer = encoder.container(keyedBy: TelegramMessageKeys.self)
                      try caseContainer.encode(length, forKey: .length)
            case .sms(
                let length):
               try container.encode("authenticationCodeTypeSms", forKey: .type)
                var caseContainer = encoder.container(keyedBy: SmsKeys.self)
                      try caseContainer.encode(length, forKey: .length)
            case .call(
                let length):
               try container.encode("authenticationCodeTypeCall", forKey: .type)
                var caseContainer = encoder.container(keyedBy: CallKeys.self)
                      try caseContainer.encode(length, forKey: .length)
            case .flashCall(
                let pattern):
               try container.encode("authenticationCodeTypeFlashCall", forKey: .type)
                var caseContainer = encoder.container(keyedBy: FlashCallKeys.self)
                      try caseContainer.encode(pattern, forKey: .pattern)
        }
  }
}

extension AuthorizationState {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum WaitEncryptionKeyKeys: String, CodingKey {
          case isEncrypted
  }
  enum WaitCodeKeys: String, CodingKey {
          case codeInfo
  }
  enum WaitOtherDeviceConfirmationKeys: String, CodingKey {
          case link
  }
  enum WaitRegistrationKeys: String, CodingKey {
          case termsOfService
  }
  enum WaitPasswordKeys: String, CodingKey {
          case passwordHint
          case hasRecoveryEmailAddress
          case recoveryEmailAddressPattern
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "authorizationStateWaitTdlibParameters":
      self = .waitTdlibParameters
    case "authorizationStateWaitEncryptionKey":
      let caseContainer = try decoder.container(keyedBy: WaitEncryptionKeyKeys.self)
      self = .waitEncryptionKey(
            isEncrypted: try caseContainer.decode(Bool.self, forKey: .isEncrypted)
        )
    case "authorizationStateWaitPhoneNumber":
      self = .waitPhoneNumber
    case "authorizationStateWaitCode":
      let caseContainer = try decoder.container(keyedBy: WaitCodeKeys.self)
      self = .waitCode(
            codeInfo: try caseContainer.decode(AuthenticationCodeInfo.self, forKey: .codeInfo)
        )
    case "authorizationStateWaitOtherDeviceConfirmation":
      let caseContainer = try decoder.container(keyedBy: WaitOtherDeviceConfirmationKeys.self)
      self = .waitOtherDeviceConfirmation(
            link: try caseContainer.decode(String.self, forKey: .link)
        )
    case "authorizationStateWaitRegistration":
      let caseContainer = try decoder.container(keyedBy: WaitRegistrationKeys.self)
      self = .waitRegistration(
            termsOfService: try caseContainer.decode(TermsOfService.self, forKey: .termsOfService)
        )
    case "authorizationStateWaitPassword":
      let caseContainer = try decoder.container(keyedBy: WaitPasswordKeys.self)
      self = .waitPassword(
            passwordHint: try caseContainer.decode(String.self, forKey: .passwordHint),
            hasRecoveryEmailAddress: try caseContainer.decode(Bool.self, forKey: .hasRecoveryEmailAddress),
            recoveryEmailAddressPattern: try caseContainer.decode(String.self, forKey: .recoveryEmailAddressPattern)
        )
    case "authorizationStateReady":
      self = .ready
    case "authorizationStateLoggingOut":
      self = .loggingOut
    case "authorizationStateClosing":
      self = .closing
    case "authorizationStateClosed":
      self = .closed
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .waitTdlibParameters:
               try container.encode("authorizationStateWaitTdlibParameters", forKey: .type)
            case .waitEncryptionKey(
                let isEncrypted):
               try container.encode("authorizationStateWaitEncryptionKey", forKey: .type)
                var caseContainer = encoder.container(keyedBy: WaitEncryptionKeyKeys.self)
                      try caseContainer.encode(isEncrypted, forKey: .isEncrypted)
            case .waitPhoneNumber:
               try container.encode("authorizationStateWaitPhoneNumber", forKey: .type)
            case .waitCode(
                let codeInfo):
               try container.encode("authorizationStateWaitCode", forKey: .type)
                var caseContainer = encoder.container(keyedBy: WaitCodeKeys.self)
                      try caseContainer.encode(codeInfo, forKey: .codeInfo)
            case .waitOtherDeviceConfirmation(
                let link):
               try container.encode("authorizationStateWaitOtherDeviceConfirmation", forKey: .type)
                var caseContainer = encoder.container(keyedBy: WaitOtherDeviceConfirmationKeys.self)
                      try caseContainer.encode(link, forKey: .link)
            case .waitRegistration(
                let termsOfService):
               try container.encode("authorizationStateWaitRegistration", forKey: .type)
                var caseContainer = encoder.container(keyedBy: WaitRegistrationKeys.self)
                      try caseContainer.encode(termsOfService, forKey: .termsOfService)
            case .waitPassword(
                let passwordHint,
                let hasRecoveryEmailAddress,
                let recoveryEmailAddressPattern):
               try container.encode("authorizationStateWaitPassword", forKey: .type)
                var caseContainer = encoder.container(keyedBy: WaitPasswordKeys.self)
                      try caseContainer.encode(passwordHint, forKey: .passwordHint)
                      try caseContainer.encode(hasRecoveryEmailAddress, forKey: .hasRecoveryEmailAddress)
                      try caseContainer.encode(recoveryEmailAddressPattern, forKey: .recoveryEmailAddressPattern)
            case .ready:
               try container.encode("authorizationStateReady", forKey: .type)
            case .loggingOut:
               try container.encode("authorizationStateLoggingOut", forKey: .type)
            case .closing:
               try container.encode("authorizationStateClosing", forKey: .type)
            case .closed:
               try container.encode("authorizationStateClosed", forKey: .type)
        }
  }
}

extension BackgroundFill {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum SolidKeys: String, CodingKey {
          case color
  }
  enum GradientKeys: String, CodingKey {
          case topColor
          case bottomColor
          case rotationAngle
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "backgroundFillSolid":
      let caseContainer = try decoder.container(keyedBy: SolidKeys.self)
      self = .solid(
              color: try caseContainer.decodeIfPresent(Int32.self, forKey: .color)
        )
    case "backgroundFillGradient":
      let caseContainer = try decoder.container(keyedBy: GradientKeys.self)
      self = .gradient(
              topColor: try caseContainer.decodeIfPresent(Int32.self, forKey: .topColor),
              bottomColor: try caseContainer.decodeIfPresent(Int32.self, forKey: .bottomColor),
              rotationAngle: try caseContainer.decodeIfPresent(Int32.self, forKey: .rotationAngle)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .solid(
                let color):
               try container.encode("backgroundFillSolid", forKey: .type)
                var caseContainer = encoder.container(keyedBy: SolidKeys.self)
                      try caseContainer.encodeIfPresent(color, forKey: .color)
            case .gradient(
                let topColor,
                let bottomColor,
                let rotationAngle):
               try container.encode("backgroundFillGradient", forKey: .type)
                var caseContainer = encoder.container(keyedBy: GradientKeys.self)
                      try caseContainer.encodeIfPresent(topColor, forKey: .topColor)
                      try caseContainer.encodeIfPresent(bottomColor, forKey: .bottomColor)
                      try caseContainer.encodeIfPresent(rotationAngle, forKey: .rotationAngle)
        }
  }
}

extension BackgroundType {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum WallpaperKeys: String, CodingKey {
          case isBlurred
          case isMoving
  }
  enum PatternKeys: String, CodingKey {
          case fill
          case intensity
          case isMoving
  }
  enum FillKeys: String, CodingKey {
          case fill
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "backgroundTypeWallpaper":
      let caseContainer = try decoder.container(keyedBy: WallpaperKeys.self)
      self = .wallpaper(
              isBlurred: try caseContainer.decodeIfPresent(Bool.self, forKey: .isBlurred),
            isMoving: try caseContainer.decode(Bool.self, forKey: .isMoving)
        )
    case "backgroundTypePattern":
      let caseContainer = try decoder.container(keyedBy: PatternKeys.self)
      self = .pattern(
            fill: try caseContainer.decode(BackgroundFill.self, forKey: .fill),
              intensity: try caseContainer.decodeIfPresent(Int32.self, forKey: .intensity),
              isMoving: try caseContainer.decodeIfPresent(Bool.self, forKey: .isMoving)
        )
    case "backgroundTypeFill":
      let caseContainer = try decoder.container(keyedBy: FillKeys.self)
      self = .fill(
              fill: try caseContainer.decodeIfPresent(BackgroundFill.self, forKey: .fill)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .wallpaper(
                let isBlurred,
                let isMoving):
               try container.encode("backgroundTypeWallpaper", forKey: .type)
                var caseContainer = encoder.container(keyedBy: WallpaperKeys.self)
                      try caseContainer.encodeIfPresent(isBlurred, forKey: .isBlurred)
                      try caseContainer.encode(isMoving, forKey: .isMoving)
            case .pattern(
                let fill,
                let intensity,
                let isMoving):
               try container.encode("backgroundTypePattern", forKey: .type)
                var caseContainer = encoder.container(keyedBy: PatternKeys.self)
                      try caseContainer.encode(fill, forKey: .fill)
                      try caseContainer.encodeIfPresent(intensity, forKey: .intensity)
                      try caseContainer.encodeIfPresent(isMoving, forKey: .isMoving)
            case .fill(
                let fill):
               try container.encode("backgroundTypeFill", forKey: .type)
                var caseContainer = encoder.container(keyedBy: FillKeys.self)
                      try caseContainer.encodeIfPresent(fill, forKey: .fill)
        }
  }
}

extension CallDiscardReason {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "callDiscardReasonEmpty":
      self = .empty
    case "callDiscardReasonMissed":
      self = .missed
    case "callDiscardReasonDeclined":
      self = .declined
    case "callDiscardReasonDisconnected":
      self = .disconnected
    case "callDiscardReasonHungUp":
      self = .hungUp
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .empty:
               try container.encode("callDiscardReasonEmpty", forKey: .type)
            case .missed:
               try container.encode("callDiscardReasonMissed", forKey: .type)
            case .declined:
               try container.encode("callDiscardReasonDeclined", forKey: .type)
            case .disconnected:
               try container.encode("callDiscardReasonDisconnected", forKey: .type)
            case .hungUp:
               try container.encode("callDiscardReasonHungUp", forKey: .type)
        }
  }
}

extension CallProblem {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "callProblemEcho":
      self = .echo
    case "callProblemNoise":
      self = .noise
    case "callProblemInterruptions":
      self = .interruptions
    case "callProblemDistortedSpeech":
      self = .distortedSpeech
    case "callProblemSilentLocal":
      self = .silentLocal
    case "callProblemSilentRemote":
      self = .silentRemote
    case "callProblemDropped":
      self = .dropped
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .echo:
               try container.encode("callProblemEcho", forKey: .type)
            case .noise:
               try container.encode("callProblemNoise", forKey: .type)
            case .interruptions:
               try container.encode("callProblemInterruptions", forKey: .type)
            case .distortedSpeech:
               try container.encode("callProblemDistortedSpeech", forKey: .type)
            case .silentLocal:
               try container.encode("callProblemSilentLocal", forKey: .type)
            case .silentRemote:
               try container.encode("callProblemSilentRemote", forKey: .type)
            case .dropped:
               try container.encode("callProblemDropped", forKey: .type)
        }
  }
}

extension CallState {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum PendingKeys: String, CodingKey {
          case isCreated
          case isReceived
  }
  enum ReadyKeys: String, CodingKey {
          case `protocol`
          case connections
          case config
          case encryptionKey
          case emojis
          case allowP2p
  }
  enum DiscardedKeys: String, CodingKey {
          case reason
          case needRating
          case needDebugInformation
  }
  enum ErrorKeys: String, CodingKey {
          case error
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "callStatePending":
      let caseContainer = try decoder.container(keyedBy: PendingKeys.self)
      self = .pending(
            isCreated: try caseContainer.decode(Bool.self, forKey: .isCreated),
            isReceived: try caseContainer.decode(Bool.self, forKey: .isReceived)
        )
    case "callStateExchangingKeys":
      self = .exchangingKeys
    case "callStateReady":
      let caseContainer = try decoder.container(keyedBy: ReadyKeys.self)
      self = .ready(
            protocol: try caseContainer.decode(CallProtocol.self, forKey: .`protocol`),
            connections: try caseContainer.decode([CallConnection].self, forKey: .connections),
            config: try caseContainer.decode(String.self, forKey: .config),
            encryptionKey: try caseContainer.decode(Bytes.self, forKey: .encryptionKey),
            emojis: try caseContainer.decode([String].self, forKey: .emojis),
            allowP2p: try caseContainer.decode(Bool.self, forKey: .allowP2p)
        )
    case "callStateHangingUp":
      self = .hangingUp
    case "callStateDiscarded":
      let caseContainer = try decoder.container(keyedBy: DiscardedKeys.self)
      self = .discarded(
            reason: try caseContainer.decode(CallDiscardReason.self, forKey: .reason),
            needRating: try caseContainer.decode(Bool.self, forKey: .needRating),
            needDebugInformation: try caseContainer.decode(Bool.self, forKey: .needDebugInformation)
        )
    case "callStateError":
      let caseContainer = try decoder.container(keyedBy: ErrorKeys.self)
      self = .error(
            error: try caseContainer.decode(Error.self, forKey: .error)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .pending(
                let isCreated,
                let isReceived):
               try container.encode("callStatePending", forKey: .type)
                var caseContainer = encoder.container(keyedBy: PendingKeys.self)
                      try caseContainer.encode(isCreated, forKey: .isCreated)
                      try caseContainer.encode(isReceived, forKey: .isReceived)
            case .exchangingKeys:
               try container.encode("callStateExchangingKeys", forKey: .type)
            case .ready(
                let `protocol`,
                let connections,
                let config,
                let encryptionKey,
                let emojis,
                let allowP2p):
               try container.encode("callStateReady", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ReadyKeys.self)
                      try caseContainer.encode(`protocol`, forKey: .`protocol`)
                      try caseContainer.encode(connections, forKey: .connections)
                      try caseContainer.encode(config, forKey: .config)
                      try caseContainer.encode(encryptionKey, forKey: .encryptionKey)
                      try caseContainer.encode(emojis, forKey: .emojis)
                      try caseContainer.encode(allowP2p, forKey: .allowP2p)
            case .hangingUp:
               try container.encode("callStateHangingUp", forKey: .type)
            case .discarded(
                let reason,
                let needRating,
                let needDebugInformation):
               try container.encode("callStateDiscarded", forKey: .type)
                var caseContainer = encoder.container(keyedBy: DiscardedKeys.self)
                      try caseContainer.encode(reason, forKey: .reason)
                      try caseContainer.encode(needRating, forKey: .needRating)
                      try caseContainer.encode(needDebugInformation, forKey: .needDebugInformation)
            case .error(
                let error):
               try container.encode("callStateError", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ErrorKeys.self)
                      try caseContainer.encode(error, forKey: .error)
        }
  }
}

extension CallbackQueryPayload {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum DataKeys: String, CodingKey {
          case data
  }
  enum GameKeys: String, CodingKey {
          case gameShortName
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "callbackQueryPayloadData":
      let caseContainer = try decoder.container(keyedBy: DataKeys.self)
      self = .data(
              data: try caseContainer.decodeIfPresent(Bytes.self, forKey: .data)
        )
    case "callbackQueryPayloadGame":
      let caseContainer = try decoder.container(keyedBy: GameKeys.self)
      self = .game(
              gameShortName: try caseContainer.decodeIfPresent(String.self, forKey: .gameShortName)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .data(
                let data):
               try container.encode("callbackQueryPayloadData", forKey: .type)
                var caseContainer = encoder.container(keyedBy: DataKeys.self)
                      try caseContainer.encodeIfPresent(data, forKey: .data)
            case .game(
                let gameShortName):
               try container.encode("callbackQueryPayloadGame", forKey: .type)
                var caseContainer = encoder.container(keyedBy: GameKeys.self)
                      try caseContainer.encodeIfPresent(gameShortName, forKey: .gameShortName)
        }
  }
}

extension CanTransferOwnershipResult {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum PasswordTooFreshKeys: String, CodingKey {
          case retryAfter
  }
  enum SessionTooFreshKeys: String, CodingKey {
          case retryAfter
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "canTransferOwnershipResultOk":
      self = .ok
    case "canTransferOwnershipResultPasswordNeeded":
      self = .passwordNeeded
    case "canTransferOwnershipResultPasswordTooFresh":
      let caseContainer = try decoder.container(keyedBy: PasswordTooFreshKeys.self)
      self = .passwordTooFresh(
            retryAfter: try caseContainer.decode(Int32.self, forKey: .retryAfter)
        )
    case "canTransferOwnershipResultSessionTooFresh":
      let caseContainer = try decoder.container(keyedBy: SessionTooFreshKeys.self)
      self = .sessionTooFresh(
            retryAfter: try caseContainer.decode(Int32.self, forKey: .retryAfter)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .ok:
               try container.encode("canTransferOwnershipResultOk", forKey: .type)
            case .passwordNeeded:
               try container.encode("canTransferOwnershipResultPasswordNeeded", forKey: .type)
            case .passwordTooFresh(
                let retryAfter):
               try container.encode("canTransferOwnershipResultPasswordTooFresh", forKey: .type)
                var caseContainer = encoder.container(keyedBy: PasswordTooFreshKeys.self)
                      try caseContainer.encode(retryAfter, forKey: .retryAfter)
            case .sessionTooFresh(
                let retryAfter):
               try container.encode("canTransferOwnershipResultSessionTooFresh", forKey: .type)
                var caseContainer = encoder.container(keyedBy: SessionTooFreshKeys.self)
                      try caseContainer.encode(retryAfter, forKey: .retryAfter)
        }
  }
}

extension ChatAction {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum UploadingVideoKeys: String, CodingKey {
          case progress
  }
  enum UploadingVoiceNoteKeys: String, CodingKey {
          case progress
  }
  enum UploadingPhotoKeys: String, CodingKey {
          case progress
  }
  enum UploadingDocumentKeys: String, CodingKey {
          case progress
  }
  enum UploadingVideoNoteKeys: String, CodingKey {
          case progress
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "chatActionTyping":
      self = .typing
    case "chatActionRecordingVideo":
      self = .recordingVideo
    case "chatActionUploadingVideo":
      let caseContainer = try decoder.container(keyedBy: UploadingVideoKeys.self)
      self = .uploadingVideo(
            progress: try caseContainer.decode(Int32.self, forKey: .progress)
        )
    case "chatActionRecordingVoiceNote":
      self = .recordingVoiceNote
    case "chatActionUploadingVoiceNote":
      let caseContainer = try decoder.container(keyedBy: UploadingVoiceNoteKeys.self)
      self = .uploadingVoiceNote(
            progress: try caseContainer.decode(Int32.self, forKey: .progress)
        )
    case "chatActionUploadingPhoto":
      let caseContainer = try decoder.container(keyedBy: UploadingPhotoKeys.self)
      self = .uploadingPhoto(
            progress: try caseContainer.decode(Int32.self, forKey: .progress)
        )
    case "chatActionUploadingDocument":
      let caseContainer = try decoder.container(keyedBy: UploadingDocumentKeys.self)
      self = .uploadingDocument(
            progress: try caseContainer.decode(Int32.self, forKey: .progress)
        )
    case "chatActionChoosingLocation":
      self = .choosingLocation
    case "chatActionChoosingContact":
      self = .choosingContact
    case "chatActionStartPlayingGame":
      self = .startPlayingGame
    case "chatActionRecordingVideoNote":
      self = .recordingVideoNote
    case "chatActionUploadingVideoNote":
      let caseContainer = try decoder.container(keyedBy: UploadingVideoNoteKeys.self)
      self = .uploadingVideoNote(
              progress: try caseContainer.decodeIfPresent(Int32.self, forKey: .progress)
        )
    case "chatActionCancel":
      self = .cancel
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .typing:
               try container.encode("chatActionTyping", forKey: .type)
            case .recordingVideo:
               try container.encode("chatActionRecordingVideo", forKey: .type)
            case .uploadingVideo(
                let progress):
               try container.encode("chatActionUploadingVideo", forKey: .type)
                var caseContainer = encoder.container(keyedBy: UploadingVideoKeys.self)
                      try caseContainer.encode(progress, forKey: .progress)
            case .recordingVoiceNote:
               try container.encode("chatActionRecordingVoiceNote", forKey: .type)
            case .uploadingVoiceNote(
                let progress):
               try container.encode("chatActionUploadingVoiceNote", forKey: .type)
                var caseContainer = encoder.container(keyedBy: UploadingVoiceNoteKeys.self)
                      try caseContainer.encode(progress, forKey: .progress)
            case .uploadingPhoto(
                let progress):
               try container.encode("chatActionUploadingPhoto", forKey: .type)
                var caseContainer = encoder.container(keyedBy: UploadingPhotoKeys.self)
                      try caseContainer.encode(progress, forKey: .progress)
            case .uploadingDocument(
                let progress):
               try container.encode("chatActionUploadingDocument", forKey: .type)
                var caseContainer = encoder.container(keyedBy: UploadingDocumentKeys.self)
                      try caseContainer.encode(progress, forKey: .progress)
            case .choosingLocation:
               try container.encode("chatActionChoosingLocation", forKey: .type)
            case .choosingContact:
               try container.encode("chatActionChoosingContact", forKey: .type)
            case .startPlayingGame:
               try container.encode("chatActionStartPlayingGame", forKey: .type)
            case .recordingVideoNote:
               try container.encode("chatActionRecordingVideoNote", forKey: .type)
            case .uploadingVideoNote(
                let progress):
               try container.encode("chatActionUploadingVideoNote", forKey: .type)
                var caseContainer = encoder.container(keyedBy: UploadingVideoNoteKeys.self)
                      try caseContainer.encodeIfPresent(progress, forKey: .progress)
            case .cancel:
               try container.encode("chatActionCancel", forKey: .type)
        }
  }
}

extension ChatActionBar {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "chatActionBarReportSpam":
      self = .reportSpam
    case "chatActionBarReportUnrelatedLocation":
      self = .reportUnrelatedLocation
    case "chatActionBarReportAddBlock":
      self = .reportAddBlock
    case "chatActionBarAddContact":
      self = .addContact
    case "chatActionBarSharePhoneNumber":
      self = .sharePhoneNumber
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .reportSpam:
               try container.encode("chatActionBarReportSpam", forKey: .type)
            case .reportUnrelatedLocation:
               try container.encode("chatActionBarReportUnrelatedLocation", forKey: .type)
            case .reportAddBlock:
               try container.encode("chatActionBarReportAddBlock", forKey: .type)
            case .addContact:
               try container.encode("chatActionBarAddContact", forKey: .type)
            case .sharePhoneNumber:
               try container.encode("chatActionBarSharePhoneNumber", forKey: .type)
        }
  }
}

extension ChatEventAction {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum ChatEventMessageEditedKeys: String, CodingKey {
          case oldMessage
          case newMessage
  }
  enum ChatEventMessageDeletedKeys: String, CodingKey {
          case message
  }
  enum ChatEventPollStoppedKeys: String, CodingKey {
          case message
  }
  enum ChatEventMessagePinnedKeys: String, CodingKey {
          case message
  }
  enum ChatEventMemberInvitedKeys: String, CodingKey {
          case userId
          case status
  }
  enum ChatEventMemberPromotedKeys: String, CodingKey {
          case userId
          case oldStatus
          case newStatus
  }
  enum ChatEventMemberRestrictedKeys: String, CodingKey {
          case userId
          case oldStatus
          case newStatus
  }
  enum ChatEventTitleChangedKeys: String, CodingKey {
          case oldTitle
          case newTitle
  }
  enum ChatEventPermissionsChangedKeys: String, CodingKey {
          case oldPermissions
          case newPermissions
  }
  enum ChatEventDescriptionChangedKeys: String, CodingKey {
          case oldDescription
          case newDescription
  }
  enum ChatEventUsernameChangedKeys: String, CodingKey {
          case oldUsername
          case newUsername
  }
  enum ChatEventPhotoChangedKeys: String, CodingKey {
          case oldPhoto
          case newPhoto
  }
  enum ChatEventInvitesToggledKeys: String, CodingKey {
          case canInviteUsers
  }
  enum ChatEventLinkedChatChangedKeys: String, CodingKey {
          case oldLinkedChatId
          case newLinkedChatId
  }
  enum ChatEventSlowModeDelayChangedKeys: String, CodingKey {
          case oldSlowModeDelay
          case newSlowModeDelay
  }
  enum ChatEventSignMessagesToggledKeys: String, CodingKey {
          case signMessages
  }
  enum ChatEventStickerSetChangedKeys: String, CodingKey {
          case oldStickerSetId
          case newStickerSetId
  }
  enum ChatEventLocationChangedKeys: String, CodingKey {
          case oldLocation
          case newLocation
  }
  enum ChatEventIsAllHistoryAvailableToggledKeys: String, CodingKey {
          case isAllHistoryAvailable
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "chatEventMessageEdited":
      let caseContainer = try decoder.container(keyedBy: ChatEventMessageEditedKeys.self)
      self = .chatEventMessageEdited(
            oldMessage: try caseContainer.decode(Message.self, forKey: .oldMessage),
            newMessage: try caseContainer.decode(Message.self, forKey: .newMessage)
        )
    case "chatEventMessageDeleted":
      let caseContainer = try decoder.container(keyedBy: ChatEventMessageDeletedKeys.self)
      self = .chatEventMessageDeleted(
            message: try caseContainer.decode(Message.self, forKey: .message)
        )
    case "chatEventPollStopped":
      let caseContainer = try decoder.container(keyedBy: ChatEventPollStoppedKeys.self)
      self = .chatEventPollStopped(
            message: try caseContainer.decode(Message.self, forKey: .message)
        )
    case "chatEventMessagePinned":
      let caseContainer = try decoder.container(keyedBy: ChatEventMessagePinnedKeys.self)
      self = .chatEventMessagePinned(
            message: try caseContainer.decode(Message.self, forKey: .message)
        )
    case "chatEventMessageUnpinned":
      self = .chatEventMessageUnpinned
    case "chatEventMemberJoined":
      self = .chatEventMemberJoined
    case "chatEventMemberLeft":
      self = .chatEventMemberLeft
    case "chatEventMemberInvited":
      let caseContainer = try decoder.container(keyedBy: ChatEventMemberInvitedKeys.self)
      self = .chatEventMemberInvited(
            userId: try caseContainer.decode(Int32.self, forKey: .userId),
            status: try caseContainer.decode(ChatMemberStatus.self, forKey: .status)
        )
    case "chatEventMemberPromoted":
      let caseContainer = try decoder.container(keyedBy: ChatEventMemberPromotedKeys.self)
      self = .chatEventMemberPromoted(
            userId: try caseContainer.decode(Int32.self, forKey: .userId),
            oldStatus: try caseContainer.decode(ChatMemberStatus.self, forKey: .oldStatus),
            newStatus: try caseContainer.decode(ChatMemberStatus.self, forKey: .newStatus)
        )
    case "chatEventMemberRestricted":
      let caseContainer = try decoder.container(keyedBy: ChatEventMemberRestrictedKeys.self)
      self = .chatEventMemberRestricted(
            userId: try caseContainer.decode(Int32.self, forKey: .userId),
            oldStatus: try caseContainer.decode(ChatMemberStatus.self, forKey: .oldStatus),
            newStatus: try caseContainer.decode(ChatMemberStatus.self, forKey: .newStatus)
        )
    case "chatEventTitleChanged":
      let caseContainer = try decoder.container(keyedBy: ChatEventTitleChangedKeys.self)
      self = .chatEventTitleChanged(
            oldTitle: try caseContainer.decode(String.self, forKey: .oldTitle),
            newTitle: try caseContainer.decode(String.self, forKey: .newTitle)
        )
    case "chatEventPermissionsChanged":
      let caseContainer = try decoder.container(keyedBy: ChatEventPermissionsChangedKeys.self)
      self = .chatEventPermissionsChanged(
            oldPermissions: try caseContainer.decode(ChatPermissions.self, forKey: .oldPermissions),
            newPermissions: try caseContainer.decode(ChatPermissions.self, forKey: .newPermissions)
        )
    case "chatEventDescriptionChanged":
      let caseContainer = try decoder.container(keyedBy: ChatEventDescriptionChangedKeys.self)
      self = .chatEventDescriptionChanged(
            oldDescription: try caseContainer.decode(String.self, forKey: .oldDescription),
            newDescription: try caseContainer.decode(String.self, forKey: .newDescription)
        )
    case "chatEventUsernameChanged":
      let caseContainer = try decoder.container(keyedBy: ChatEventUsernameChangedKeys.self)
      self = .chatEventUsernameChanged(
            oldUsername: try caseContainer.decode(String.self, forKey: .oldUsername),
            newUsername: try caseContainer.decode(String.self, forKey: .newUsername)
        )
    case "chatEventPhotoChanged":
      let caseContainer = try decoder.container(keyedBy: ChatEventPhotoChangedKeys.self)
      self = .chatEventPhotoChanged(
              oldPhoto: try caseContainer.decodeIfPresent(Photo.self, forKey: .oldPhoto),
              newPhoto: try caseContainer.decodeIfPresent(Photo.self, forKey: .newPhoto)
        )
    case "chatEventInvitesToggled":
      let caseContainer = try decoder.container(keyedBy: ChatEventInvitesToggledKeys.self)
      self = .chatEventInvitesToggled(
            canInviteUsers: try caseContainer.decode(Bool.self, forKey: .canInviteUsers)
        )
    case "chatEventLinkedChatChanged":
      let caseContainer = try decoder.container(keyedBy: ChatEventLinkedChatChangedKeys.self)
      self = .chatEventLinkedChatChanged(
            oldLinkedChatId: try caseContainer.decode(Int53.self, forKey: .oldLinkedChatId),
            newLinkedChatId: try caseContainer.decode(Int53.self, forKey: .newLinkedChatId)
        )
    case "chatEventSlowModeDelayChanged":
      let caseContainer = try decoder.container(keyedBy: ChatEventSlowModeDelayChangedKeys.self)
      self = .chatEventSlowModeDelayChanged(
            oldSlowModeDelay: try caseContainer.decode(Int32.self, forKey: .oldSlowModeDelay),
            newSlowModeDelay: try caseContainer.decode(Int32.self, forKey: .newSlowModeDelay)
        )
    case "chatEventSignMessagesToggled":
      let caseContainer = try decoder.container(keyedBy: ChatEventSignMessagesToggledKeys.self)
      self = .chatEventSignMessagesToggled(
            signMessages: try caseContainer.decode(Bool.self, forKey: .signMessages)
        )
    case "chatEventStickerSetChanged":
      let caseContainer = try decoder.container(keyedBy: ChatEventStickerSetChangedKeys.self)
      self = .chatEventStickerSetChanged(
            oldStickerSetId: try caseContainer.decode(TDInt64.self, forKey: .oldStickerSetId),
            newStickerSetId: try caseContainer.decode(TDInt64.self, forKey: .newStickerSetId)
        )
    case "chatEventLocationChanged":
      let caseContainer = try decoder.container(keyedBy: ChatEventLocationChangedKeys.self)
      self = .chatEventLocationChanged(
              oldLocation: try caseContainer.decodeIfPresent(ChatLocation.self, forKey: .oldLocation),
              newLocation: try caseContainer.decodeIfPresent(ChatLocation.self, forKey: .newLocation)
        )
    case "chatEventIsAllHistoryAvailableToggled":
      let caseContainer = try decoder.container(keyedBy: ChatEventIsAllHistoryAvailableToggledKeys.self)
      self = .chatEventIsAllHistoryAvailableToggled(
            isAllHistoryAvailable: try caseContainer.decode(Bool.self, forKey: .isAllHistoryAvailable)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .chatEventMessageEdited(
                let oldMessage,
                let newMessage):
               try container.encode("chatEventMessageEdited", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatEventMessageEditedKeys.self)
                      try caseContainer.encode(oldMessage, forKey: .oldMessage)
                      try caseContainer.encode(newMessage, forKey: .newMessage)
            case .chatEventMessageDeleted(
                let message):
               try container.encode("chatEventMessageDeleted", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatEventMessageDeletedKeys.self)
                      try caseContainer.encode(message, forKey: .message)
            case .chatEventPollStopped(
                let message):
               try container.encode("chatEventPollStopped", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatEventPollStoppedKeys.self)
                      try caseContainer.encode(message, forKey: .message)
            case .chatEventMessagePinned(
                let message):
               try container.encode("chatEventMessagePinned", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatEventMessagePinnedKeys.self)
                      try caseContainer.encode(message, forKey: .message)
            case .chatEventMessageUnpinned:
               try container.encode("chatEventMessageUnpinned", forKey: .type)
            case .chatEventMemberJoined:
               try container.encode("chatEventMemberJoined", forKey: .type)
            case .chatEventMemberLeft:
               try container.encode("chatEventMemberLeft", forKey: .type)
            case .chatEventMemberInvited(
                let userId,
                let status):
               try container.encode("chatEventMemberInvited", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatEventMemberInvitedKeys.self)
                      try caseContainer.encode(userId, forKey: .userId)
                      try caseContainer.encode(status, forKey: .status)
            case .chatEventMemberPromoted(
                let userId,
                let oldStatus,
                let newStatus):
               try container.encode("chatEventMemberPromoted", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatEventMemberPromotedKeys.self)
                      try caseContainer.encode(userId, forKey: .userId)
                      try caseContainer.encode(oldStatus, forKey: .oldStatus)
                      try caseContainer.encode(newStatus, forKey: .newStatus)
            case .chatEventMemberRestricted(
                let userId,
                let oldStatus,
                let newStatus):
               try container.encode("chatEventMemberRestricted", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatEventMemberRestrictedKeys.self)
                      try caseContainer.encode(userId, forKey: .userId)
                      try caseContainer.encode(oldStatus, forKey: .oldStatus)
                      try caseContainer.encode(newStatus, forKey: .newStatus)
            case .chatEventTitleChanged(
                let oldTitle,
                let newTitle):
               try container.encode("chatEventTitleChanged", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatEventTitleChangedKeys.self)
                      try caseContainer.encode(oldTitle, forKey: .oldTitle)
                      try caseContainer.encode(newTitle, forKey: .newTitle)
            case .chatEventPermissionsChanged(
                let oldPermissions,
                let newPermissions):
               try container.encode("chatEventPermissionsChanged", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatEventPermissionsChangedKeys.self)
                      try caseContainer.encode(oldPermissions, forKey: .oldPermissions)
                      try caseContainer.encode(newPermissions, forKey: .newPermissions)
            case .chatEventDescriptionChanged(
                let oldDescription,
                let newDescription):
               try container.encode("chatEventDescriptionChanged", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatEventDescriptionChangedKeys.self)
                      try caseContainer.encode(oldDescription, forKey: .oldDescription)
                      try caseContainer.encode(newDescription, forKey: .newDescription)
            case .chatEventUsernameChanged(
                let oldUsername,
                let newUsername):
               try container.encode("chatEventUsernameChanged", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatEventUsernameChangedKeys.self)
                      try caseContainer.encode(oldUsername, forKey: .oldUsername)
                      try caseContainer.encode(newUsername, forKey: .newUsername)
            case .chatEventPhotoChanged(
                let oldPhoto,
                let newPhoto):
               try container.encode("chatEventPhotoChanged", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatEventPhotoChangedKeys.self)
                      try caseContainer.encodeIfPresent(oldPhoto, forKey: .oldPhoto)
                      try caseContainer.encodeIfPresent(newPhoto, forKey: .newPhoto)
            case .chatEventInvitesToggled(
                let canInviteUsers):
               try container.encode("chatEventInvitesToggled", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatEventInvitesToggledKeys.self)
                      try caseContainer.encode(canInviteUsers, forKey: .canInviteUsers)
            case .chatEventLinkedChatChanged(
                let oldLinkedChatId,
                let newLinkedChatId):
               try container.encode("chatEventLinkedChatChanged", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatEventLinkedChatChangedKeys.self)
                      try caseContainer.encode(oldLinkedChatId, forKey: .oldLinkedChatId)
                      try caseContainer.encode(newLinkedChatId, forKey: .newLinkedChatId)
            case .chatEventSlowModeDelayChanged(
                let oldSlowModeDelay,
                let newSlowModeDelay):
               try container.encode("chatEventSlowModeDelayChanged", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatEventSlowModeDelayChangedKeys.self)
                      try caseContainer.encode(oldSlowModeDelay, forKey: .oldSlowModeDelay)
                      try caseContainer.encode(newSlowModeDelay, forKey: .newSlowModeDelay)
            case .chatEventSignMessagesToggled(
                let signMessages):
               try container.encode("chatEventSignMessagesToggled", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatEventSignMessagesToggledKeys.self)
                      try caseContainer.encode(signMessages, forKey: .signMessages)
            case .chatEventStickerSetChanged(
                let oldStickerSetId,
                let newStickerSetId):
               try container.encode("chatEventStickerSetChanged", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatEventStickerSetChangedKeys.self)
                      try caseContainer.encode(oldStickerSetId, forKey: .oldStickerSetId)
                      try caseContainer.encode(newStickerSetId, forKey: .newStickerSetId)
            case .chatEventLocationChanged(
                let oldLocation,
                let newLocation):
               try container.encode("chatEventLocationChanged", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatEventLocationChangedKeys.self)
                      try caseContainer.encodeIfPresent(oldLocation, forKey: .oldLocation)
                      try caseContainer.encodeIfPresent(newLocation, forKey: .newLocation)
            case .chatEventIsAllHistoryAvailableToggled(
                let isAllHistoryAvailable):
               try container.encode("chatEventIsAllHistoryAvailableToggled", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatEventIsAllHistoryAvailableToggledKeys.self)
                      try caseContainer.encode(isAllHistoryAvailable, forKey: .isAllHistoryAvailable)
        }
  }
}

extension ChatList {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "chatListMain":
      self = .main
    case "chatListArchive":
      self = .archive
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .main:
               try container.encode("chatListMain", forKey: .type)
            case .archive:
               try container.encode("chatListArchive", forKey: .type)
        }
  }
}

extension ChatMemberStatus {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum CreatorKeys: String, CodingKey {
          case customTitle
          case isMember
  }
  enum AdministratorKeys: String, CodingKey {
          case customTitle
          case canBeEdited
          case canChangeInfo
          case canPostMessages
          case canEditMessages
          case canDeleteMessages
          case canInviteUsers
          case canRestrictMembers
          case canPinMessages
          case canPromoteMembers
  }
  enum RestrictedKeys: String, CodingKey {
          case isMember
          case restrictedUntilDate
          case permissions
  }
  enum BannedKeys: String, CodingKey {
          case bannedUntilDate
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "chatMemberStatusCreator":
      let caseContainer = try decoder.container(keyedBy: CreatorKeys.self)
      self = .creator(
            customTitle: try caseContainer.decode(String.self, forKey: .customTitle),
            isMember: try caseContainer.decode(Bool.self, forKey: .isMember)
        )
    case "chatMemberStatusAdministrator":
      let caseContainer = try decoder.container(keyedBy: AdministratorKeys.self)
      let customTitle = try caseContainer.decodeIfPresent(String.self, forKey: .customTitle)
      let canBeEdited = try caseContainer.decodeIfPresent(Bool.self, forKey: .canBeEdited)
      let canChangeInfo = try caseContainer.decodeIfPresent(Bool.self, forKey: .canChangeInfo)
      let canPostMessages = try caseContainer.decodeIfPresent(Bool.self, forKey: .canPostMessages)
      let canEditMessages = try caseContainer.decodeIfPresent(Bool.self, forKey: .canEditMessages)
      let canDeleteMessages = try caseContainer.decodeIfPresent(Bool.self, forKey: .canDeleteMessages)
      let canInviteUsers = try caseContainer.decodeIfPresent(Bool.self, forKey: .canInviteUsers)
      let canRestrictMembers = try caseContainer.decodeIfPresent(Bool.self, forKey: .canRestrictMembers)
      let canPinMessages = try caseContainer.decodeIfPresent(Bool.self, forKey: .canPinMessages)
      let canPromoteMembers = try caseContainer.decodeIfPresent(Bool.self, forKey: .canPromoteMembers)
      self = .administrator(
              customTitle: customTitle,
              canBeEdited: canBeEdited,
              canChangeInfo: canChangeInfo,
              canPostMessages: canPostMessages,
              canEditMessages: canEditMessages,
              canDeleteMessages: canDeleteMessages,
              canInviteUsers: canInviteUsers,
              canRestrictMembers: canRestrictMembers,
              canPinMessages: canPinMessages,
              canPromoteMembers: canPromoteMembers
        )
    case "chatMemberStatusMember":
      self = .member
    case "chatMemberStatusRestricted":
      let caseContainer = try decoder.container(keyedBy: RestrictedKeys.self)
      self = .restricted(
              isMember: try caseContainer.decodeIfPresent(Bool.self, forKey: .isMember),
              restrictedUntilDate: try caseContainer.decodeIfPresent(Int32.self, forKey: .restrictedUntilDate),
              permissions: try caseContainer.decodeIfPresent(ChatPermissions.self, forKey: .permissions)
        )
    case "chatMemberStatusLeft":
      self = .left
    case "chatMemberStatusBanned":
      let caseContainer = try decoder.container(keyedBy: BannedKeys.self)
      self = .banned(
              bannedUntilDate: try caseContainer.decodeIfPresent(Int32.self, forKey: .bannedUntilDate)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .creator(
                let customTitle,
                let isMember):
               try container.encode("chatMemberStatusCreator", forKey: .type)
                var caseContainer = encoder.container(keyedBy: CreatorKeys.self)
                      try caseContainer.encode(customTitle, forKey: .customTitle)
                      try caseContainer.encode(isMember, forKey: .isMember)
            case .administrator(
                let customTitle,
                let canBeEdited,
                let canChangeInfo,
                let canPostMessages,
                let canEditMessages,
                let canDeleteMessages,
                let canInviteUsers,
                let canRestrictMembers,
                let canPinMessages,
                let canPromoteMembers):
               try container.encode("chatMemberStatusAdministrator", forKey: .type)
                var caseContainer = encoder.container(keyedBy: AdministratorKeys.self)
                      try caseContainer.encodeIfPresent(customTitle, forKey: .customTitle)
                      try caseContainer.encodeIfPresent(canBeEdited, forKey: .canBeEdited)
                      try caseContainer.encodeIfPresent(canChangeInfo, forKey: .canChangeInfo)
                      try caseContainer.encodeIfPresent(canPostMessages, forKey: .canPostMessages)
                      try caseContainer.encodeIfPresent(canEditMessages, forKey: .canEditMessages)
                      try caseContainer.encodeIfPresent(canDeleteMessages, forKey: .canDeleteMessages)
                      try caseContainer.encodeIfPresent(canInviteUsers, forKey: .canInviteUsers)
                      try caseContainer.encodeIfPresent(canRestrictMembers, forKey: .canRestrictMembers)
                      try caseContainer.encodeIfPresent(canPinMessages, forKey: .canPinMessages)
                      try caseContainer.encodeIfPresent(canPromoteMembers, forKey: .canPromoteMembers)
            case .member:
               try container.encode("chatMemberStatusMember", forKey: .type)
            case .restricted(
                let isMember,
                let restrictedUntilDate,
                let permissions):
               try container.encode("chatMemberStatusRestricted", forKey: .type)
                var caseContainer = encoder.container(keyedBy: RestrictedKeys.self)
                      try caseContainer.encodeIfPresent(isMember, forKey: .isMember)
                      try caseContainer.encodeIfPresent(restrictedUntilDate, forKey: .restrictedUntilDate)
                      try caseContainer.encodeIfPresent(permissions, forKey: .permissions)
            case .left:
               try container.encode("chatMemberStatusLeft", forKey: .type)
            case .banned(
                let bannedUntilDate):
               try container.encode("chatMemberStatusBanned", forKey: .type)
                var caseContainer = encoder.container(keyedBy: BannedKeys.self)
                      try caseContainer.encodeIfPresent(bannedUntilDate, forKey: .bannedUntilDate)
        }
  }
}

extension ChatMembersFilter {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "chatMembersFilterContacts":
      self = .contacts
    case "chatMembersFilterAdministrators":
      self = .administrators
    case "chatMembersFilterMembers":
      self = .members
    case "chatMembersFilterRestricted":
      self = .restricted
    case "chatMembersFilterBanned":
      self = .banned
    case "chatMembersFilterBots":
      self = .bots
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .contacts:
               try container.encode("chatMembersFilterContacts", forKey: .type)
            case .administrators:
               try container.encode("chatMembersFilterAdministrators", forKey: .type)
            case .members:
               try container.encode("chatMembersFilterMembers", forKey: .type)
            case .restricted:
               try container.encode("chatMembersFilterRestricted", forKey: .type)
            case .banned:
               try container.encode("chatMembersFilterBanned", forKey: .type)
            case .bots:
               try container.encode("chatMembersFilterBots", forKey: .type)
        }
  }
}

extension ChatReportReason {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum CustomKeys: String, CodingKey {
          case text
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "chatReportReasonSpam":
      self = .spam
    case "chatReportReasonViolence":
      self = .violence
    case "chatReportReasonPornography":
      self = .pornography
    case "chatReportReasonChildAbuse":
      self = .childAbuse
    case "chatReportReasonCopyright":
      self = .copyright
    case "chatReportReasonUnrelatedLocation":
      self = .unrelatedLocation
    case "chatReportReasonCustom":
      let caseContainer = try decoder.container(keyedBy: CustomKeys.self)
      self = .custom(
              text: try caseContainer.decodeIfPresent(String.self, forKey: .text)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .spam:
               try container.encode("chatReportReasonSpam", forKey: .type)
            case .violence:
               try container.encode("chatReportReasonViolence", forKey: .type)
            case .pornography:
               try container.encode("chatReportReasonPornography", forKey: .type)
            case .childAbuse:
               try container.encode("chatReportReasonChildAbuse", forKey: .type)
            case .copyright:
               try container.encode("chatReportReasonCopyright", forKey: .type)
            case .unrelatedLocation:
               try container.encode("chatReportReasonUnrelatedLocation", forKey: .type)
            case .custom(
                let text):
               try container.encode("chatReportReasonCustom", forKey: .type)
                var caseContainer = encoder.container(keyedBy: CustomKeys.self)
                      try caseContainer.encodeIfPresent(text, forKey: .text)
        }
  }
}

extension ChatType {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum PrivateKeys: String, CodingKey {
          case userId
  }
  enum BasicGroupKeys: String, CodingKey {
          case basicGroupId
  }
  enum SupergroupKeys: String, CodingKey {
          case supergroupId
          case isChannel
  }
  enum SecretKeys: String, CodingKey {
          case secretChatId
          case userId
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "chatTypePrivate":
      let caseContainer = try decoder.container(keyedBy: PrivateKeys.self)
      self = .private(
            userId: try caseContainer.decode(Int32.self, forKey: .userId)
        )
    case "chatTypeBasicGroup":
      let caseContainer = try decoder.container(keyedBy: BasicGroupKeys.self)
      self = .basicGroup(
            basicGroupId: try caseContainer.decode(Int32.self, forKey: .basicGroupId)
        )
    case "chatTypeSupergroup":
      let caseContainer = try decoder.container(keyedBy: SupergroupKeys.self)
      self = .supergroup(
            supergroupId: try caseContainer.decode(Int32.self, forKey: .supergroupId),
            isChannel: try caseContainer.decode(Bool.self, forKey: .isChannel)
        )
    case "chatTypeSecret":
      let caseContainer = try decoder.container(keyedBy: SecretKeys.self)
      self = .secret(
            secretChatId: try caseContainer.decode(Int32.self, forKey: .secretChatId),
            userId: try caseContainer.decode(Int32.self, forKey: .userId)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .private(
                let userId):
               try container.encode("chatTypePrivate", forKey: .type)
                var caseContainer = encoder.container(keyedBy: PrivateKeys.self)
                      try caseContainer.encode(userId, forKey: .userId)
            case .basicGroup(
                let basicGroupId):
               try container.encode("chatTypeBasicGroup", forKey: .type)
                var caseContainer = encoder.container(keyedBy: BasicGroupKeys.self)
                      try caseContainer.encode(basicGroupId, forKey: .basicGroupId)
            case .supergroup(
                let supergroupId,
                let isChannel):
               try container.encode("chatTypeSupergroup", forKey: .type)
                var caseContainer = encoder.container(keyedBy: SupergroupKeys.self)
                      try caseContainer.encode(supergroupId, forKey: .supergroupId)
                      try caseContainer.encode(isChannel, forKey: .isChannel)
            case .secret(
                let secretChatId,
                let userId):
               try container.encode("chatTypeSecret", forKey: .type)
                var caseContainer = encoder.container(keyedBy: SecretKeys.self)
                      try caseContainer.encode(secretChatId, forKey: .secretChatId)
                      try caseContainer.encode(userId, forKey: .userId)
        }
  }
}

extension CheckChatUsernameResult {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "checkChatUsernameResultOk":
      self = .ok
    case "checkChatUsernameResultUsernameInvalid":
      self = .usernameInvalid
    case "checkChatUsernameResultUsernameOccupied":
      self = .usernameOccupied
    case "checkChatUsernameResultPublicChatsTooMuch":
      self = .publicChatsTooMuch
    case "checkChatUsernameResultPublicGroupsUnavailable":
      self = .publicGroupsUnavailable
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .ok:
               try container.encode("checkChatUsernameResultOk", forKey: .type)
            case .usernameInvalid:
               try container.encode("checkChatUsernameResultUsernameInvalid", forKey: .type)
            case .usernameOccupied:
               try container.encode("checkChatUsernameResultUsernameOccupied", forKey: .type)
            case .publicChatsTooMuch:
               try container.encode("checkChatUsernameResultPublicChatsTooMuch", forKey: .type)
            case .publicGroupsUnavailable:
               try container.encode("checkChatUsernameResultPublicGroupsUnavailable", forKey: .type)
        }
  }
}

extension ConnectionState {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "connectionStateWaitingForNetwork":
      self = .waitingForNetwork
    case "connectionStateConnectingToProxy":
      self = .connectingToProxy
    case "connectionStateConnecting":
      self = .connecting
    case "connectionStateUpdating":
      self = .updating
    case "connectionStateReady":
      self = .ready
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .waitingForNetwork:
               try container.encode("connectionStateWaitingForNetwork", forKey: .type)
            case .connectingToProxy:
               try container.encode("connectionStateConnectingToProxy", forKey: .type)
            case .connecting:
               try container.encode("connectionStateConnecting", forKey: .type)
            case .updating:
               try container.encode("connectionStateUpdating", forKey: .type)
            case .ready:
               try container.encode("connectionStateReady", forKey: .type)
        }
  }
}

extension DeviceToken {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum FirebaseCloudMessagingKeys: String, CodingKey {
          case token
          case encrypt
  }
  enum ApplePushKeys: String, CodingKey {
          case deviceToken
          case isAppSandbox
  }
  enum ApplePushVoIPKeys: String, CodingKey {
          case deviceToken
          case isAppSandbox
          case encrypt
  }
  enum WindowsPushKeys: String, CodingKey {
          case accessToken
  }
  enum MicrosoftPushKeys: String, CodingKey {
          case channelUri
  }
  enum MicrosoftPushVoIPKeys: String, CodingKey {
          case channelUri
  }
  enum WebPushKeys: String, CodingKey {
          case endpoint
          case p256dhBase64url
          case authBase64url
  }
  enum SimplePushKeys: String, CodingKey {
          case endpoint
  }
  enum UbuntuPushKeys: String, CodingKey {
          case token
  }
  enum BlackBerryPushKeys: String, CodingKey {
          case token
  }
  enum TizenPushKeys: String, CodingKey {
          case regId
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "deviceTokenFirebaseCloudMessaging":
      let caseContainer = try decoder.container(keyedBy: FirebaseCloudMessagingKeys.self)
      self = .firebaseCloudMessaging(
            token: try caseContainer.decode(String.self, forKey: .token),
            encrypt: try caseContainer.decode(Bool.self, forKey: .encrypt)
        )
    case "deviceTokenApplePush":
      let caseContainer = try decoder.container(keyedBy: ApplePushKeys.self)
      self = .applePush(
            deviceToken: try caseContainer.decode(String.self, forKey: .deviceToken),
            isAppSandbox: try caseContainer.decode(Bool.self, forKey: .isAppSandbox)
        )
    case "deviceTokenApplePushVoIP":
      let caseContainer = try decoder.container(keyedBy: ApplePushVoIPKeys.self)
      self = .applePushVoIP(
              deviceToken: try caseContainer.decodeIfPresent(String.self, forKey: .deviceToken),
              isAppSandbox: try caseContainer.decodeIfPresent(Bool.self, forKey: .isAppSandbox),
              encrypt: try caseContainer.decodeIfPresent(Bool.self, forKey: .encrypt)
        )
    case "deviceTokenWindowsPush":
      let caseContainer = try decoder.container(keyedBy: WindowsPushKeys.self)
      self = .windowsPush(
              accessToken: try caseContainer.decodeIfPresent(String.self, forKey: .accessToken)
        )
    case "deviceTokenMicrosoftPush":
      let caseContainer = try decoder.container(keyedBy: MicrosoftPushKeys.self)
      self = .microsoftPush(
            channelUri: try caseContainer.decode(String.self, forKey: .channelUri)
        )
    case "deviceTokenMicrosoftPushVoIP":
      let caseContainer = try decoder.container(keyedBy: MicrosoftPushVoIPKeys.self)
      self = .microsoftPushVoIP(
              channelUri: try caseContainer.decodeIfPresent(String.self, forKey: .channelUri)
        )
    case "deviceTokenWebPush":
      let caseContainer = try decoder.container(keyedBy: WebPushKeys.self)
      self = .webPush(
            endpoint: try caseContainer.decode(String.self, forKey: .endpoint),
              p256dhBase64url: try caseContainer.decodeIfPresent(String.self, forKey: .p256dhBase64url),
              authBase64url: try caseContainer.decodeIfPresent(String.self, forKey: .authBase64url)
        )
    case "deviceTokenSimplePush":
      let caseContainer = try decoder.container(keyedBy: SimplePushKeys.self)
      self = .simplePush(
              endpoint: try caseContainer.decodeIfPresent(String.self, forKey: .endpoint)
        )
    case "deviceTokenUbuntuPush":
      let caseContainer = try decoder.container(keyedBy: UbuntuPushKeys.self)
      self = .ubuntuPush(
            token: try caseContainer.decode(String.self, forKey: .token)
        )
    case "deviceTokenBlackBerryPush":
      let caseContainer = try decoder.container(keyedBy: BlackBerryPushKeys.self)
      self = .blackBerryPush(
              token: try caseContainer.decodeIfPresent(String.self, forKey: .token)
        )
    case "deviceTokenTizenPush":
      let caseContainer = try decoder.container(keyedBy: TizenPushKeys.self)
      self = .tizenPush(
              regId: try caseContainer.decodeIfPresent(String.self, forKey: .regId)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .firebaseCloudMessaging(
                let token,
                let encrypt):
               try container.encode("deviceTokenFirebaseCloudMessaging", forKey: .type)
                var caseContainer = encoder.container(keyedBy: FirebaseCloudMessagingKeys.self)
                      try caseContainer.encode(token, forKey: .token)
                      try caseContainer.encode(encrypt, forKey: .encrypt)
            case .applePush(
                let deviceToken,
                let isAppSandbox):
               try container.encode("deviceTokenApplePush", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ApplePushKeys.self)
                      try caseContainer.encode(deviceToken, forKey: .deviceToken)
                      try caseContainer.encode(isAppSandbox, forKey: .isAppSandbox)
            case .applePushVoIP(
                let deviceToken,
                let isAppSandbox,
                let encrypt):
               try container.encode("deviceTokenApplePushVoIP", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ApplePushVoIPKeys.self)
                      try caseContainer.encodeIfPresent(deviceToken, forKey: .deviceToken)
                      try caseContainer.encodeIfPresent(isAppSandbox, forKey: .isAppSandbox)
                      try caseContainer.encodeIfPresent(encrypt, forKey: .encrypt)
            case .windowsPush(
                let accessToken):
               try container.encode("deviceTokenWindowsPush", forKey: .type)
                var caseContainer = encoder.container(keyedBy: WindowsPushKeys.self)
                      try caseContainer.encodeIfPresent(accessToken, forKey: .accessToken)
            case .microsoftPush(
                let channelUri):
               try container.encode("deviceTokenMicrosoftPush", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MicrosoftPushKeys.self)
                      try caseContainer.encode(channelUri, forKey: .channelUri)
            case .microsoftPushVoIP(
                let channelUri):
               try container.encode("deviceTokenMicrosoftPushVoIP", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MicrosoftPushVoIPKeys.self)
                      try caseContainer.encodeIfPresent(channelUri, forKey: .channelUri)
            case .webPush(
                let endpoint,
                let p256dhBase64url,
                let authBase64url):
               try container.encode("deviceTokenWebPush", forKey: .type)
                var caseContainer = encoder.container(keyedBy: WebPushKeys.self)
                      try caseContainer.encode(endpoint, forKey: .endpoint)
                      try caseContainer.encodeIfPresent(p256dhBase64url, forKey: .p256dhBase64url)
                      try caseContainer.encodeIfPresent(authBase64url, forKey: .authBase64url)
            case .simplePush(
                let endpoint):
               try container.encode("deviceTokenSimplePush", forKey: .type)
                var caseContainer = encoder.container(keyedBy: SimplePushKeys.self)
                      try caseContainer.encodeIfPresent(endpoint, forKey: .endpoint)
            case .ubuntuPush(
                let token):
               try container.encode("deviceTokenUbuntuPush", forKey: .type)
                var caseContainer = encoder.container(keyedBy: UbuntuPushKeys.self)
                      try caseContainer.encode(token, forKey: .token)
            case .blackBerryPush(
                let token):
               try container.encode("deviceTokenBlackBerryPush", forKey: .type)
                var caseContainer = encoder.container(keyedBy: BlackBerryPushKeys.self)
                      try caseContainer.encodeIfPresent(token, forKey: .token)
            case .tizenPush(
                let regId):
               try container.encode("deviceTokenTizenPush", forKey: .type)
                var caseContainer = encoder.container(keyedBy: TizenPushKeys.self)
                      try caseContainer.encodeIfPresent(regId, forKey: .regId)
        }
  }
}

extension FileType {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "fileTypeNone":
      self = .none
    case "fileTypeAnimation":
      self = .animation
    case "fileTypeAudio":
      self = .audio
    case "fileTypeDocument":
      self = .document
    case "fileTypePhoto":
      self = .photo
    case "fileTypeProfilePhoto":
      self = .profilePhoto
    case "fileTypeSecret":
      self = .secret
    case "fileTypeSecretThumbnail":
      self = .secretThumbnail
    case "fileTypeSecure":
      self = .secure
    case "fileTypeSticker":
      self = .sticker
    case "fileTypeThumbnail":
      self = .thumbnail
    case "fileTypeUnknown":
      self = .unknown
    case "fileTypeVideo":
      self = .video
    case "fileTypeVideoNote":
      self = .videoNote
    case "fileTypeVoiceNote":
      self = .voiceNote
    case "fileTypeWallpaper":
      self = .wallpaper
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .none:
               try container.encode("fileTypeNone", forKey: .type)
            case .animation:
               try container.encode("fileTypeAnimation", forKey: .type)
            case .audio:
               try container.encode("fileTypeAudio", forKey: .type)
            case .document:
               try container.encode("fileTypeDocument", forKey: .type)
            case .photo:
               try container.encode("fileTypePhoto", forKey: .type)
            case .profilePhoto:
               try container.encode("fileTypeProfilePhoto", forKey: .type)
            case .secret:
               try container.encode("fileTypeSecret", forKey: .type)
            case .secretThumbnail:
               try container.encode("fileTypeSecretThumbnail", forKey: .type)
            case .secure:
               try container.encode("fileTypeSecure", forKey: .type)
            case .sticker:
               try container.encode("fileTypeSticker", forKey: .type)
            case .thumbnail:
               try container.encode("fileTypeThumbnail", forKey: .type)
            case .unknown:
               try container.encode("fileTypeUnknown", forKey: .type)
            case .video:
               try container.encode("fileTypeVideo", forKey: .type)
            case .videoNote:
               try container.encode("fileTypeVideoNote", forKey: .type)
            case .voiceNote:
               try container.encode("fileTypeVoiceNote", forKey: .type)
            case .wallpaper:
               try container.encode("fileTypeWallpaper", forKey: .type)
        }
  }
}

extension InlineKeyboardButtonType {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum UrlKeys: String, CodingKey {
          case url
  }
  enum LoginUrlKeys: String, CodingKey {
          case url
          case id
          case forwardText
  }
  enum CallbackKeys: String, CodingKey {
          case data
  }
  enum SwitchInlineKeys: String, CodingKey {
          case query
          case inCurrentChat
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "inlineKeyboardButtonTypeUrl":
      let caseContainer = try decoder.container(keyedBy: UrlKeys.self)
      self = .url(
            url: try caseContainer.decode(String.self, forKey: .url)
        )
    case "inlineKeyboardButtonTypeLoginUrl":
      let caseContainer = try decoder.container(keyedBy: LoginUrlKeys.self)
      self = .loginUrl(
            url: try caseContainer.decode(String.self, forKey: .url),
            id: try caseContainer.decode(Int32.self, forKey: .id),
            forwardText: try caseContainer.decode(String.self, forKey: .forwardText)
        )
    case "inlineKeyboardButtonTypeCallback":
      let caseContainer = try decoder.container(keyedBy: CallbackKeys.self)
      self = .callback(
            data: try caseContainer.decode(Bytes.self, forKey: .data)
        )
    case "inlineKeyboardButtonTypeCallbackGame":
      self = .callbackGame
    case "inlineKeyboardButtonTypeSwitchInline":
      let caseContainer = try decoder.container(keyedBy: SwitchInlineKeys.self)
      self = .switchInline(
            query: try caseContainer.decode(String.self, forKey: .query),
            inCurrentChat: try caseContainer.decode(Bool.self, forKey: .inCurrentChat)
        )
    case "inlineKeyboardButtonTypeBuy":
      self = .buy
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .url(
                let url):
               try container.encode("inlineKeyboardButtonTypeUrl", forKey: .type)
                var caseContainer = encoder.container(keyedBy: UrlKeys.self)
                      try caseContainer.encode(url, forKey: .url)
            case .loginUrl(
                let url,
                let id,
                let forwardText):
               try container.encode("inlineKeyboardButtonTypeLoginUrl", forKey: .type)
                var caseContainer = encoder.container(keyedBy: LoginUrlKeys.self)
                      try caseContainer.encode(url, forKey: .url)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(forwardText, forKey: .forwardText)
            case .callback(
                let data):
               try container.encode("inlineKeyboardButtonTypeCallback", forKey: .type)
                var caseContainer = encoder.container(keyedBy: CallbackKeys.self)
                      try caseContainer.encode(data, forKey: .data)
            case .callbackGame:
               try container.encode("inlineKeyboardButtonTypeCallbackGame", forKey: .type)
            case .switchInline(
                let query,
                let inCurrentChat):
               try container.encode("inlineKeyboardButtonTypeSwitchInline", forKey: .type)
                var caseContainer = encoder.container(keyedBy: SwitchInlineKeys.self)
                      try caseContainer.encode(query, forKey: .query)
                      try caseContainer.encode(inCurrentChat, forKey: .inCurrentChat)
            case .buy:
               try container.encode("inlineKeyboardButtonTypeBuy", forKey: .type)
        }
  }
}

extension InlineQueryResult {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum ArticleKeys: String, CodingKey {
          case id
          case url
          case hideUrl
          case title
          case description
          case thumbnail
  }
  enum ContactKeys: String, CodingKey {
          case id
          case contact
          case thumbnail
  }
  enum LocationKeys: String, CodingKey {
          case id
          case location
          case title
          case thumbnail
  }
  enum VenueKeys: String, CodingKey {
          case id
          case venue
          case thumbnail
  }
  enum GameKeys: String, CodingKey {
          case id
          case game
  }
  enum AnimationKeys: String, CodingKey {
          case id
          case animation
          case title
  }
  enum AudioKeys: String, CodingKey {
          case id
          case audio
  }
  enum DocumentKeys: String, CodingKey {
          case id
          case document
          case title
          case description
  }
  enum PhotoKeys: String, CodingKey {
          case id
          case photo
          case title
          case description
  }
  enum StickerKeys: String, CodingKey {
          case id
          case sticker
  }
  enum VideoKeys: String, CodingKey {
          case id
          case video
          case title
          case description
  }
  enum VoiceNoteKeys: String, CodingKey {
          case id
          case voiceNote
          case title
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "inlineQueryResultArticle":
      let caseContainer = try decoder.container(keyedBy: ArticleKeys.self)
      self = .article(
            id: try caseContainer.decode(String.self, forKey: .id),
            url: try caseContainer.decode(String.self, forKey: .url),
            hideUrl: try caseContainer.decode(Bool.self, forKey: .hideUrl),
            title: try caseContainer.decode(String.self, forKey: .title),
            description: try caseContainer.decode(String.self, forKey: .description),
              thumbnail: try caseContainer.decodeIfPresent(PhotoSize.self, forKey: .thumbnail)
        )
    case "inlineQueryResultContact":
      let caseContainer = try decoder.container(keyedBy: ContactKeys.self)
      self = .contact(
            id: try caseContainer.decode(String.self, forKey: .id),
            contact: try caseContainer.decode(Contact.self, forKey: .contact),
              thumbnail: try caseContainer.decodeIfPresent(PhotoSize.self, forKey: .thumbnail)
        )
    case "inlineQueryResultLocation":
      let caseContainer = try decoder.container(keyedBy: LocationKeys.self)
      self = .location(
            id: try caseContainer.decode(String.self, forKey: .id),
            location: try caseContainer.decode(Location.self, forKey: .location),
            title: try caseContainer.decode(String.self, forKey: .title),
              thumbnail: try caseContainer.decodeIfPresent(PhotoSize.self, forKey: .thumbnail)
        )
    case "inlineQueryResultVenue":
      let caseContainer = try decoder.container(keyedBy: VenueKeys.self)
      self = .venue(
            id: try caseContainer.decode(String.self, forKey: .id),
            venue: try caseContainer.decode(Venue.self, forKey: .venue),
              thumbnail: try caseContainer.decodeIfPresent(PhotoSize.self, forKey: .thumbnail)
        )
    case "inlineQueryResultGame":
      let caseContainer = try decoder.container(keyedBy: GameKeys.self)
      self = .game(
            id: try caseContainer.decode(String.self, forKey: .id),
            game: try caseContainer.decode(Game.self, forKey: .game)
        )
    case "inlineQueryResultAnimation":
      let caseContainer = try decoder.container(keyedBy: AnimationKeys.self)
      self = .animation(
            id: try caseContainer.decode(String.self, forKey: .id),
            animation: try caseContainer.decode(Animation.self, forKey: .animation),
            title: try caseContainer.decode(String.self, forKey: .title)
        )
    case "inlineQueryResultAudio":
      let caseContainer = try decoder.container(keyedBy: AudioKeys.self)
      self = .audio(
            id: try caseContainer.decode(String.self, forKey: .id),
            audio: try caseContainer.decode(Audio.self, forKey: .audio)
        )
    case "inlineQueryResultDocument":
      let caseContainer = try decoder.container(keyedBy: DocumentKeys.self)
      self = .document(
            id: try caseContainer.decode(String.self, forKey: .id),
            document: try caseContainer.decode(Document.self, forKey: .document),
            title: try caseContainer.decode(String.self, forKey: .title),
            description: try caseContainer.decode(String.self, forKey: .description)
        )
    case "inlineQueryResultPhoto":
      let caseContainer = try decoder.container(keyedBy: PhotoKeys.self)
      self = .photo(
            id: try caseContainer.decode(String.self, forKey: .id),
            photo: try caseContainer.decode(Photo.self, forKey: .photo),
            title: try caseContainer.decode(String.self, forKey: .title),
            description: try caseContainer.decode(String.self, forKey: .description)
        )
    case "inlineQueryResultSticker":
      let caseContainer = try decoder.container(keyedBy: StickerKeys.self)
      self = .sticker(
            id: try caseContainer.decode(String.self, forKey: .id),
            sticker: try caseContainer.decode(Sticker.self, forKey: .sticker)
        )
    case "inlineQueryResultVideo":
      let caseContainer = try decoder.container(keyedBy: VideoKeys.self)
      self = .video(
            id: try caseContainer.decode(String.self, forKey: .id),
            video: try caseContainer.decode(Video.self, forKey: .video),
            title: try caseContainer.decode(String.self, forKey: .title),
            description: try caseContainer.decode(String.self, forKey: .description)
        )
    case "inlineQueryResultVoiceNote":
      let caseContainer = try decoder.container(keyedBy: VoiceNoteKeys.self)
      self = .voiceNote(
            id: try caseContainer.decode(String.self, forKey: .id),
            voiceNote: try caseContainer.decode(VoiceNote.self, forKey: .voiceNote),
            title: try caseContainer.decode(String.self, forKey: .title)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .article(
                let id,
                let url,
                let hideUrl,
                let title,
                let description,
                let thumbnail):
               try container.encode("inlineQueryResultArticle", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ArticleKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(url, forKey: .url)
                      try caseContainer.encode(hideUrl, forKey: .hideUrl)
                      try caseContainer.encode(title, forKey: .title)
                      try caseContainer.encode(description, forKey: .description)
                      try caseContainer.encodeIfPresent(thumbnail, forKey: .thumbnail)
            case .contact(
                let id,
                let contact,
                let thumbnail):
               try container.encode("inlineQueryResultContact", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ContactKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(contact, forKey: .contact)
                      try caseContainer.encodeIfPresent(thumbnail, forKey: .thumbnail)
            case .location(
                let id,
                let location,
                let title,
                let thumbnail):
               try container.encode("inlineQueryResultLocation", forKey: .type)
                var caseContainer = encoder.container(keyedBy: LocationKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(location, forKey: .location)
                      try caseContainer.encode(title, forKey: .title)
                      try caseContainer.encodeIfPresent(thumbnail, forKey: .thumbnail)
            case .venue(
                let id,
                let venue,
                let thumbnail):
               try container.encode("inlineQueryResultVenue", forKey: .type)
                var caseContainer = encoder.container(keyedBy: VenueKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(venue, forKey: .venue)
                      try caseContainer.encodeIfPresent(thumbnail, forKey: .thumbnail)
            case .game(
                let id,
                let game):
               try container.encode("inlineQueryResultGame", forKey: .type)
                var caseContainer = encoder.container(keyedBy: GameKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(game, forKey: .game)
            case .animation(
                let id,
                let animation,
                let title):
               try container.encode("inlineQueryResultAnimation", forKey: .type)
                var caseContainer = encoder.container(keyedBy: AnimationKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(animation, forKey: .animation)
                      try caseContainer.encode(title, forKey: .title)
            case .audio(
                let id,
                let audio):
               try container.encode("inlineQueryResultAudio", forKey: .type)
                var caseContainer = encoder.container(keyedBy: AudioKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(audio, forKey: .audio)
            case .document(
                let id,
                let document,
                let title,
                let description):
               try container.encode("inlineQueryResultDocument", forKey: .type)
                var caseContainer = encoder.container(keyedBy: DocumentKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(document, forKey: .document)
                      try caseContainer.encode(title, forKey: .title)
                      try caseContainer.encode(description, forKey: .description)
            case .photo(
                let id,
                let photo,
                let title,
                let description):
               try container.encode("inlineQueryResultPhoto", forKey: .type)
                var caseContainer = encoder.container(keyedBy: PhotoKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(photo, forKey: .photo)
                      try caseContainer.encode(title, forKey: .title)
                      try caseContainer.encode(description, forKey: .description)
            case .sticker(
                let id,
                let sticker):
               try container.encode("inlineQueryResultSticker", forKey: .type)
                var caseContainer = encoder.container(keyedBy: StickerKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(sticker, forKey: .sticker)
            case .video(
                let id,
                let video,
                let title,
                let description):
               try container.encode("inlineQueryResultVideo", forKey: .type)
                var caseContainer = encoder.container(keyedBy: VideoKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(video, forKey: .video)
                      try caseContainer.encode(title, forKey: .title)
                      try caseContainer.encode(description, forKey: .description)
            case .voiceNote(
                let id,
                let voiceNote,
                let title):
               try container.encode("inlineQueryResultVoiceNote", forKey: .type)
                var caseContainer = encoder.container(keyedBy: VoiceNoteKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(voiceNote, forKey: .voiceNote)
                      try caseContainer.encode(title, forKey: .title)
        }
  }
}

extension InputBackground {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum LocalKeys: String, CodingKey {
          case background
  }
  enum RemoteKeys: String, CodingKey {
          case backgroundId
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "inputBackgroundLocal":
      let caseContainer = try decoder.container(keyedBy: LocalKeys.self)
      self = .local(
              background: try caseContainer.decodeIfPresent(InputFile.self, forKey: .background)
        )
    case "inputBackgroundRemote":
      let caseContainer = try decoder.container(keyedBy: RemoteKeys.self)
      self = .remote(
              backgroundId: try caseContainer.decodeIfPresent(TDInt64.self, forKey: .backgroundId)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .local(
                let background):
               try container.encode("inputBackgroundLocal", forKey: .type)
                var caseContainer = encoder.container(keyedBy: LocalKeys.self)
                      try caseContainer.encodeIfPresent(background, forKey: .background)
            case .remote(
                let backgroundId):
               try container.encode("inputBackgroundRemote", forKey: .type)
                var caseContainer = encoder.container(keyedBy: RemoteKeys.self)
                      try caseContainer.encodeIfPresent(backgroundId, forKey: .backgroundId)
        }
  }
}

extension InputCredentials {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum SavedKeys: String, CodingKey {
          case savedCredentialsId
  }
  enum NewKeys: String, CodingKey {
          case data
          case allowSave
  }
  enum AndroidPayKeys: String, CodingKey {
          case data
  }
  enum ApplePayKeys: String, CodingKey {
          case data
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "inputCredentialsSaved":
      let caseContainer = try decoder.container(keyedBy: SavedKeys.self)
      self = .saved(
              savedCredentialsId: try caseContainer.decodeIfPresent(String.self, forKey: .savedCredentialsId)
        )
    case "inputCredentialsNew":
      let caseContainer = try decoder.container(keyedBy: NewKeys.self)
      self = .new(
            data: try caseContainer.decode(String.self, forKey: .data),
              allowSave: try caseContainer.decodeIfPresent(Bool.self, forKey: .allowSave)
        )
    case "inputCredentialsAndroidPay":
      let caseContainer = try decoder.container(keyedBy: AndroidPayKeys.self)
      self = .androidPay(
            data: try caseContainer.decode(String.self, forKey: .data)
        )
    case "inputCredentialsApplePay":
      let caseContainer = try decoder.container(keyedBy: ApplePayKeys.self)
      self = .applePay(
              data: try caseContainer.decodeIfPresent(String.self, forKey: .data)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .saved(
                let savedCredentialsId):
               try container.encode("inputCredentialsSaved", forKey: .type)
                var caseContainer = encoder.container(keyedBy: SavedKeys.self)
                      try caseContainer.encodeIfPresent(savedCredentialsId, forKey: .savedCredentialsId)
            case .new(
                let data,
                let allowSave):
               try container.encode("inputCredentialsNew", forKey: .type)
                var caseContainer = encoder.container(keyedBy: NewKeys.self)
                      try caseContainer.encode(data, forKey: .data)
                      try caseContainer.encodeIfPresent(allowSave, forKey: .allowSave)
            case .androidPay(
                let data):
               try container.encode("inputCredentialsAndroidPay", forKey: .type)
                var caseContainer = encoder.container(keyedBy: AndroidPayKeys.self)
                      try caseContainer.encode(data, forKey: .data)
            case .applePay(
                let data):
               try container.encode("inputCredentialsApplePay", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ApplePayKeys.self)
                      try caseContainer.encodeIfPresent(data, forKey: .data)
        }
  }
}

extension InputFile {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum IdKeys: String, CodingKey {
          case id
  }
  enum RemoteKeys: String, CodingKey {
          case id
  }
  enum LocalKeys: String, CodingKey {
          case path
  }
  enum GeneratedKeys: String, CodingKey {
          case originalPath
          case conversion
          case expectedSize
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "inputFileId":
      let caseContainer = try decoder.container(keyedBy: IdKeys.self)
      self = .id(
            id: try caseContainer.decode(Int32.self, forKey: .id)
        )
    case "inputFileRemote":
      let caseContainer = try decoder.container(keyedBy: RemoteKeys.self)
      self = .remote(
              id: try caseContainer.decodeIfPresent(String.self, forKey: .id)
        )
    case "inputFileLocal":
      let caseContainer = try decoder.container(keyedBy: LocalKeys.self)
      self = .local(
              path: try caseContainer.decodeIfPresent(String.self, forKey: .path)
        )
    case "inputFileGenerated":
      let caseContainer = try decoder.container(keyedBy: GeneratedKeys.self)
      self = .generated(
              originalPath: try caseContainer.decodeIfPresent(String.self, forKey: .originalPath),
              conversion: try caseContainer.decodeIfPresent(String.self, forKey: .conversion),
              expectedSize: try caseContainer.decodeIfPresent(Int32.self, forKey: .expectedSize)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .id(
                let id):
               try container.encode("inputFileId", forKey: .type)
                var caseContainer = encoder.container(keyedBy: IdKeys.self)
                      try caseContainer.encode(id, forKey: .id)
            case .remote(
                let id):
               try container.encode("inputFileRemote", forKey: .type)
                var caseContainer = encoder.container(keyedBy: RemoteKeys.self)
                      try caseContainer.encodeIfPresent(id, forKey: .id)
            case .local(
                let path):
               try container.encode("inputFileLocal", forKey: .type)
                var caseContainer = encoder.container(keyedBy: LocalKeys.self)
                      try caseContainer.encodeIfPresent(path, forKey: .path)
            case .generated(
                let originalPath,
                let conversion,
                let expectedSize):
               try container.encode("inputFileGenerated", forKey: .type)
                var caseContainer = encoder.container(keyedBy: GeneratedKeys.self)
                      try caseContainer.encodeIfPresent(originalPath, forKey: .originalPath)
                      try caseContainer.encodeIfPresent(conversion, forKey: .conversion)
                      try caseContainer.encodeIfPresent(expectedSize, forKey: .expectedSize)
        }
  }
}

extension InputInlineQueryResult {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum AnimatedGifKeys: String, CodingKey {
          case id
          case title
          case thumbnailUrl
          case gifUrl
          case gifDuration
          case gifWidth
          case gifHeight
          case replyMarkup
          case inputMessageContent
  }
  enum AnimatedMpeg4Keys: String, CodingKey {
          case id
          case title
          case thumbnailUrl
          case mpeg4Url
          case mpeg4Duration
          case mpeg4Width
          case mpeg4Height
          case replyMarkup
          case inputMessageContent
  }
  enum ArticleKeys: String, CodingKey {
          case id
          case url
          case hideUrl
          case title
          case description
          case thumbnailUrl
          case thumbnailWidth
          case thumbnailHeight
          case replyMarkup
          case inputMessageContent
  }
  enum AudioKeys: String, CodingKey {
          case id
          case title
          case performer
          case audioUrl
          case audioDuration
          case replyMarkup
          case inputMessageContent
  }
  enum ContactKeys: String, CodingKey {
          case id
          case contact
          case thumbnailUrl
          case thumbnailWidth
          case thumbnailHeight
          case replyMarkup
          case inputMessageContent
  }
  enum DocumentKeys: String, CodingKey {
          case id
          case title
          case description
          case documentUrl
          case mimeType
          case thumbnailUrl
          case thumbnailWidth
          case thumbnailHeight
          case replyMarkup
          case inputMessageContent
  }
  enum GameKeys: String, CodingKey {
          case id
          case gameShortName
          case replyMarkup
  }
  enum LocationKeys: String, CodingKey {
          case id
          case location
          case livePeriod
          case title
          case thumbnailUrl
          case thumbnailWidth
          case thumbnailHeight
          case replyMarkup
          case inputMessageContent
  }
  enum PhotoKeys: String, CodingKey {
          case id
          case title
          case description
          case thumbnailUrl
          case photoUrl
          case photoWidth
          case photoHeight
          case replyMarkup
          case inputMessageContent
  }
  enum StickerKeys: String, CodingKey {
          case id
          case thumbnailUrl
          case stickerUrl
          case stickerWidth
          case stickerHeight
          case replyMarkup
          case inputMessageContent
  }
  enum VenueKeys: String, CodingKey {
          case id
          case venue
          case thumbnailUrl
          case thumbnailWidth
          case thumbnailHeight
          case replyMarkup
          case inputMessageContent
  }
  enum VideoKeys: String, CodingKey {
          case id
          case title
          case description
          case thumbnailUrl
          case videoUrl
          case mimeType
          case videoWidth
          case videoHeight
          case videoDuration
          case replyMarkup
          case inputMessageContent
  }
  enum VoiceNoteKeys: String, CodingKey {
          case id
          case title
          case voiceNoteUrl
          case voiceNoteDuration
          case replyMarkup
          case inputMessageContent
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "inputInlineQueryResultAnimatedGif":
      let caseContainer = try decoder.container(keyedBy: AnimatedGifKeys.self)
      self = .animatedGif(
            id: try caseContainer.decode(String.self, forKey: .id),
            title: try caseContainer.decode(String.self, forKey: .title),
            thumbnailUrl: try caseContainer.decode(String.self, forKey: .thumbnailUrl),
            gifUrl: try caseContainer.decode(String.self, forKey: .gifUrl),
            gifDuration: try caseContainer.decode(Int32.self, forKey: .gifDuration),
            gifWidth: try caseContainer.decode(Int32.self, forKey: .gifWidth),
            gifHeight: try caseContainer.decode(Int32.self, forKey: .gifHeight),
            replyMarkup: try caseContainer.decode(ReplyMarkup.self, forKey: .replyMarkup),
            inputMessageContent: try caseContainer.decode(InputMessageContent.self, forKey: .inputMessageContent)
        )
    case "inputInlineQueryResultAnimatedMpeg4":
      let caseContainer = try decoder.container(keyedBy: AnimatedMpeg4Keys.self)
      self = .animatedMpeg4(
            id: try caseContainer.decode(String.self, forKey: .id),
            title: try caseContainer.decode(String.self, forKey: .title),
            thumbnailUrl: try caseContainer.decode(String.self, forKey: .thumbnailUrl),
            mpeg4Url: try caseContainer.decode(String.self, forKey: .mpeg4Url),
            mpeg4Duration: try caseContainer.decode(Int32.self, forKey: .mpeg4Duration),
            mpeg4Width: try caseContainer.decode(Int32.self, forKey: .mpeg4Width),
            mpeg4Height: try caseContainer.decode(Int32.self, forKey: .mpeg4Height),
            replyMarkup: try caseContainer.decode(ReplyMarkup.self, forKey: .replyMarkup),
            inputMessageContent: try caseContainer.decode(InputMessageContent.self, forKey: .inputMessageContent)
        )
    case "inputInlineQueryResultArticle":
      let caseContainer = try decoder.container(keyedBy: ArticleKeys.self)
      self = .article(
            id: try caseContainer.decode(String.self, forKey: .id),
            url: try caseContainer.decode(String.self, forKey: .url),
            hideUrl: try caseContainer.decode(Bool.self, forKey: .hideUrl),
            title: try caseContainer.decode(String.self, forKey: .title),
            description: try caseContainer.decode(String.self, forKey: .description),
            thumbnailUrl: try caseContainer.decode(String.self, forKey: .thumbnailUrl),
            thumbnailWidth: try caseContainer.decode(Int32.self, forKey: .thumbnailWidth),
            thumbnailHeight: try caseContainer.decode(Int32.self, forKey: .thumbnailHeight),
            replyMarkup: try caseContainer.decode(ReplyMarkup.self, forKey: .replyMarkup),
            inputMessageContent: try caseContainer.decode(InputMessageContent.self, forKey: .inputMessageContent)
        )
    case "inputInlineQueryResultAudio":
      let caseContainer = try decoder.container(keyedBy: AudioKeys.self)
      self = .audio(
            id: try caseContainer.decode(String.self, forKey: .id),
            title: try caseContainer.decode(String.self, forKey: .title),
            performer: try caseContainer.decode(String.self, forKey: .performer),
            audioUrl: try caseContainer.decode(String.self, forKey: .audioUrl),
            audioDuration: try caseContainer.decode(Int32.self, forKey: .audioDuration),
            replyMarkup: try caseContainer.decode(ReplyMarkup.self, forKey: .replyMarkup),
            inputMessageContent: try caseContainer.decode(InputMessageContent.self, forKey: .inputMessageContent)
        )
    case "inputInlineQueryResultContact":
      let caseContainer = try decoder.container(keyedBy: ContactKeys.self)
      self = .contact(
            id: try caseContainer.decode(String.self, forKey: .id),
            contact: try caseContainer.decode(Contact.self, forKey: .contact),
            thumbnailUrl: try caseContainer.decode(String.self, forKey: .thumbnailUrl),
            thumbnailWidth: try caseContainer.decode(Int32.self, forKey: .thumbnailWidth),
            thumbnailHeight: try caseContainer.decode(Int32.self, forKey: .thumbnailHeight),
            replyMarkup: try caseContainer.decode(ReplyMarkup.self, forKey: .replyMarkup),
            inputMessageContent: try caseContainer.decode(InputMessageContent.self, forKey: .inputMessageContent)
        )
    case "inputInlineQueryResultDocument":
      let caseContainer = try decoder.container(keyedBy: DocumentKeys.self)
      self = .document(
            id: try caseContainer.decode(String.self, forKey: .id),
            title: try caseContainer.decode(String.self, forKey: .title),
            description: try caseContainer.decode(String.self, forKey: .description),
            documentUrl: try caseContainer.decode(String.self, forKey: .documentUrl),
            mimeType: try caseContainer.decode(String.self, forKey: .mimeType),
            thumbnailUrl: try caseContainer.decode(String.self, forKey: .thumbnailUrl),
            thumbnailWidth: try caseContainer.decode(Int32.self, forKey: .thumbnailWidth),
            thumbnailHeight: try caseContainer.decode(Int32.self, forKey: .thumbnailHeight),
            replyMarkup: try caseContainer.decode(ReplyMarkup.self, forKey: .replyMarkup),
            inputMessageContent: try caseContainer.decode(InputMessageContent.self, forKey: .inputMessageContent)
        )
    case "inputInlineQueryResultGame":
      let caseContainer = try decoder.container(keyedBy: GameKeys.self)
      self = .game(
            id: try caseContainer.decode(String.self, forKey: .id),
            gameShortName: try caseContainer.decode(String.self, forKey: .gameShortName),
            replyMarkup: try caseContainer.decode(ReplyMarkup.self, forKey: .replyMarkup)
        )
    case "inputInlineQueryResultLocation":
      let caseContainer = try decoder.container(keyedBy: LocationKeys.self)
      self = .location(
            id: try caseContainer.decode(String.self, forKey: .id),
            location: try caseContainer.decode(Location.self, forKey: .location),
            livePeriod: try caseContainer.decode(Int32.self, forKey: .livePeriod),
            title: try caseContainer.decode(String.self, forKey: .title),
            thumbnailUrl: try caseContainer.decode(String.self, forKey: .thumbnailUrl),
            thumbnailWidth: try caseContainer.decode(Int32.self, forKey: .thumbnailWidth),
            thumbnailHeight: try caseContainer.decode(Int32.self, forKey: .thumbnailHeight),
            replyMarkup: try caseContainer.decode(ReplyMarkup.self, forKey: .replyMarkup),
            inputMessageContent: try caseContainer.decode(InputMessageContent.self, forKey: .inputMessageContent)
        )
    case "inputInlineQueryResultPhoto":
      let caseContainer = try decoder.container(keyedBy: PhotoKeys.self)
      self = .photo(
            id: try caseContainer.decode(String.self, forKey: .id),
            title: try caseContainer.decode(String.self, forKey: .title),
            description: try caseContainer.decode(String.self, forKey: .description),
            thumbnailUrl: try caseContainer.decode(String.self, forKey: .thumbnailUrl),
            photoUrl: try caseContainer.decode(String.self, forKey: .photoUrl),
            photoWidth: try caseContainer.decode(Int32.self, forKey: .photoWidth),
            photoHeight: try caseContainer.decode(Int32.self, forKey: .photoHeight),
            replyMarkup: try caseContainer.decode(ReplyMarkup.self, forKey: .replyMarkup),
            inputMessageContent: try caseContainer.decode(InputMessageContent.self, forKey: .inputMessageContent)
        )
    case "inputInlineQueryResultSticker":
      let caseContainer = try decoder.container(keyedBy: StickerKeys.self)
      self = .sticker(
            id: try caseContainer.decode(String.self, forKey: .id),
            thumbnailUrl: try caseContainer.decode(String.self, forKey: .thumbnailUrl),
            stickerUrl: try caseContainer.decode(String.self, forKey: .stickerUrl),
            stickerWidth: try caseContainer.decode(Int32.self, forKey: .stickerWidth),
            stickerHeight: try caseContainer.decode(Int32.self, forKey: .stickerHeight),
            replyMarkup: try caseContainer.decode(ReplyMarkup.self, forKey: .replyMarkup),
            inputMessageContent: try caseContainer.decode(InputMessageContent.self, forKey: .inputMessageContent)
        )
    case "inputInlineQueryResultVenue":
      let caseContainer = try decoder.container(keyedBy: VenueKeys.self)
      self = .venue(
            id: try caseContainer.decode(String.self, forKey: .id),
            venue: try caseContainer.decode(Venue.self, forKey: .venue),
            thumbnailUrl: try caseContainer.decode(String.self, forKey: .thumbnailUrl),
            thumbnailWidth: try caseContainer.decode(Int32.self, forKey: .thumbnailWidth),
            thumbnailHeight: try caseContainer.decode(Int32.self, forKey: .thumbnailHeight),
            replyMarkup: try caseContainer.decode(ReplyMarkup.self, forKey: .replyMarkup),
            inputMessageContent: try caseContainer.decode(InputMessageContent.self, forKey: .inputMessageContent)
        )
    case "inputInlineQueryResultVideo":
      let caseContainer = try decoder.container(keyedBy: VideoKeys.self)
      self = .video(
            id: try caseContainer.decode(String.self, forKey: .id),
            title: try caseContainer.decode(String.self, forKey: .title),
            description: try caseContainer.decode(String.self, forKey: .description),
            thumbnailUrl: try caseContainer.decode(String.self, forKey: .thumbnailUrl),
            videoUrl: try caseContainer.decode(String.self, forKey: .videoUrl),
            mimeType: try caseContainer.decode(String.self, forKey: .mimeType),
            videoWidth: try caseContainer.decode(Int32.self, forKey: .videoWidth),
            videoHeight: try caseContainer.decode(Int32.self, forKey: .videoHeight),
            videoDuration: try caseContainer.decode(Int32.self, forKey: .videoDuration),
            replyMarkup: try caseContainer.decode(ReplyMarkup.self, forKey: .replyMarkup),
            inputMessageContent: try caseContainer.decode(InputMessageContent.self, forKey: .inputMessageContent)
        )
    case "inputInlineQueryResultVoiceNote":
      let caseContainer = try decoder.container(keyedBy: VoiceNoteKeys.self)
      self = .voiceNote(
            id: try caseContainer.decode(String.self, forKey: .id),
            title: try caseContainer.decode(String.self, forKey: .title),
            voiceNoteUrl: try caseContainer.decode(String.self, forKey: .voiceNoteUrl),
            voiceNoteDuration: try caseContainer.decode(Int32.self, forKey: .voiceNoteDuration),
            replyMarkup: try caseContainer.decode(ReplyMarkup.self, forKey: .replyMarkup),
            inputMessageContent: try caseContainer.decode(InputMessageContent.self, forKey: .inputMessageContent)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .animatedGif(
                let id,
                let title,
                let thumbnailUrl,
                let gifUrl,
                let gifDuration,
                let gifWidth,
                let gifHeight,
                let replyMarkup,
                let inputMessageContent):
               try container.encode("inputInlineQueryResultAnimatedGif", forKey: .type)
                var caseContainer = encoder.container(keyedBy: AnimatedGifKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(title, forKey: .title)
                      try caseContainer.encode(thumbnailUrl, forKey: .thumbnailUrl)
                      try caseContainer.encode(gifUrl, forKey: .gifUrl)
                      try caseContainer.encode(gifDuration, forKey: .gifDuration)
                      try caseContainer.encode(gifWidth, forKey: .gifWidth)
                      try caseContainer.encode(gifHeight, forKey: .gifHeight)
                      try caseContainer.encode(replyMarkup, forKey: .replyMarkup)
                      try caseContainer.encode(inputMessageContent, forKey: .inputMessageContent)
            case .animatedMpeg4(
                let id,
                let title,
                let thumbnailUrl,
                let mpeg4Url,
                let mpeg4Duration,
                let mpeg4Width,
                let mpeg4Height,
                let replyMarkup,
                let inputMessageContent):
               try container.encode("inputInlineQueryResultAnimatedMpeg4", forKey: .type)
                var caseContainer = encoder.container(keyedBy: AnimatedMpeg4Keys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(title, forKey: .title)
                      try caseContainer.encode(thumbnailUrl, forKey: .thumbnailUrl)
                      try caseContainer.encode(mpeg4Url, forKey: .mpeg4Url)
                      try caseContainer.encode(mpeg4Duration, forKey: .mpeg4Duration)
                      try caseContainer.encode(mpeg4Width, forKey: .mpeg4Width)
                      try caseContainer.encode(mpeg4Height, forKey: .mpeg4Height)
                      try caseContainer.encode(replyMarkup, forKey: .replyMarkup)
                      try caseContainer.encode(inputMessageContent, forKey: .inputMessageContent)
            case .article(
                let id,
                let url,
                let hideUrl,
                let title,
                let description,
                let thumbnailUrl,
                let thumbnailWidth,
                let thumbnailHeight,
                let replyMarkup,
                let inputMessageContent):
               try container.encode("inputInlineQueryResultArticle", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ArticleKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(url, forKey: .url)
                      try caseContainer.encode(hideUrl, forKey: .hideUrl)
                      try caseContainer.encode(title, forKey: .title)
                      try caseContainer.encode(description, forKey: .description)
                      try caseContainer.encode(thumbnailUrl, forKey: .thumbnailUrl)
                      try caseContainer.encode(thumbnailWidth, forKey: .thumbnailWidth)
                      try caseContainer.encode(thumbnailHeight, forKey: .thumbnailHeight)
                      try caseContainer.encode(replyMarkup, forKey: .replyMarkup)
                      try caseContainer.encode(inputMessageContent, forKey: .inputMessageContent)
            case .audio(
                let id,
                let title,
                let performer,
                let audioUrl,
                let audioDuration,
                let replyMarkup,
                let inputMessageContent):
               try container.encode("inputInlineQueryResultAudio", forKey: .type)
                var caseContainer = encoder.container(keyedBy: AudioKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(title, forKey: .title)
                      try caseContainer.encode(performer, forKey: .performer)
                      try caseContainer.encode(audioUrl, forKey: .audioUrl)
                      try caseContainer.encode(audioDuration, forKey: .audioDuration)
                      try caseContainer.encode(replyMarkup, forKey: .replyMarkup)
                      try caseContainer.encode(inputMessageContent, forKey: .inputMessageContent)
            case .contact(
                let id,
                let contact,
                let thumbnailUrl,
                let thumbnailWidth,
                let thumbnailHeight,
                let replyMarkup,
                let inputMessageContent):
               try container.encode("inputInlineQueryResultContact", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ContactKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(contact, forKey: .contact)
                      try caseContainer.encode(thumbnailUrl, forKey: .thumbnailUrl)
                      try caseContainer.encode(thumbnailWidth, forKey: .thumbnailWidth)
                      try caseContainer.encode(thumbnailHeight, forKey: .thumbnailHeight)
                      try caseContainer.encode(replyMarkup, forKey: .replyMarkup)
                      try caseContainer.encode(inputMessageContent, forKey: .inputMessageContent)
            case .document(
                let id,
                let title,
                let description,
                let documentUrl,
                let mimeType,
                let thumbnailUrl,
                let thumbnailWidth,
                let thumbnailHeight,
                let replyMarkup,
                let inputMessageContent):
               try container.encode("inputInlineQueryResultDocument", forKey: .type)
                var caseContainer = encoder.container(keyedBy: DocumentKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(title, forKey: .title)
                      try caseContainer.encode(description, forKey: .description)
                      try caseContainer.encode(documentUrl, forKey: .documentUrl)
                      try caseContainer.encode(mimeType, forKey: .mimeType)
                      try caseContainer.encode(thumbnailUrl, forKey: .thumbnailUrl)
                      try caseContainer.encode(thumbnailWidth, forKey: .thumbnailWidth)
                      try caseContainer.encode(thumbnailHeight, forKey: .thumbnailHeight)
                      try caseContainer.encode(replyMarkup, forKey: .replyMarkup)
                      try caseContainer.encode(inputMessageContent, forKey: .inputMessageContent)
            case .game(
                let id,
                let gameShortName,
                let replyMarkup):
               try container.encode("inputInlineQueryResultGame", forKey: .type)
                var caseContainer = encoder.container(keyedBy: GameKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(gameShortName, forKey: .gameShortName)
                      try caseContainer.encode(replyMarkup, forKey: .replyMarkup)
            case .location(
                let id,
                let location,
                let livePeriod,
                let title,
                let thumbnailUrl,
                let thumbnailWidth,
                let thumbnailHeight,
                let replyMarkup,
                let inputMessageContent):
               try container.encode("inputInlineQueryResultLocation", forKey: .type)
                var caseContainer = encoder.container(keyedBy: LocationKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(location, forKey: .location)
                      try caseContainer.encode(livePeriod, forKey: .livePeriod)
                      try caseContainer.encode(title, forKey: .title)
                      try caseContainer.encode(thumbnailUrl, forKey: .thumbnailUrl)
                      try caseContainer.encode(thumbnailWidth, forKey: .thumbnailWidth)
                      try caseContainer.encode(thumbnailHeight, forKey: .thumbnailHeight)
                      try caseContainer.encode(replyMarkup, forKey: .replyMarkup)
                      try caseContainer.encode(inputMessageContent, forKey: .inputMessageContent)
            case .photo(
                let id,
                let title,
                let description,
                let thumbnailUrl,
                let photoUrl,
                let photoWidth,
                let photoHeight,
                let replyMarkup,
                let inputMessageContent):
               try container.encode("inputInlineQueryResultPhoto", forKey: .type)
                var caseContainer = encoder.container(keyedBy: PhotoKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(title, forKey: .title)
                      try caseContainer.encode(description, forKey: .description)
                      try caseContainer.encode(thumbnailUrl, forKey: .thumbnailUrl)
                      try caseContainer.encode(photoUrl, forKey: .photoUrl)
                      try caseContainer.encode(photoWidth, forKey: .photoWidth)
                      try caseContainer.encode(photoHeight, forKey: .photoHeight)
                      try caseContainer.encode(replyMarkup, forKey: .replyMarkup)
                      try caseContainer.encode(inputMessageContent, forKey: .inputMessageContent)
            case .sticker(
                let id,
                let thumbnailUrl,
                let stickerUrl,
                let stickerWidth,
                let stickerHeight,
                let replyMarkup,
                let inputMessageContent):
               try container.encode("inputInlineQueryResultSticker", forKey: .type)
                var caseContainer = encoder.container(keyedBy: StickerKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(thumbnailUrl, forKey: .thumbnailUrl)
                      try caseContainer.encode(stickerUrl, forKey: .stickerUrl)
                      try caseContainer.encode(stickerWidth, forKey: .stickerWidth)
                      try caseContainer.encode(stickerHeight, forKey: .stickerHeight)
                      try caseContainer.encode(replyMarkup, forKey: .replyMarkup)
                      try caseContainer.encode(inputMessageContent, forKey: .inputMessageContent)
            case .venue(
                let id,
                let venue,
                let thumbnailUrl,
                let thumbnailWidth,
                let thumbnailHeight,
                let replyMarkup,
                let inputMessageContent):
               try container.encode("inputInlineQueryResultVenue", forKey: .type)
                var caseContainer = encoder.container(keyedBy: VenueKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(venue, forKey: .venue)
                      try caseContainer.encode(thumbnailUrl, forKey: .thumbnailUrl)
                      try caseContainer.encode(thumbnailWidth, forKey: .thumbnailWidth)
                      try caseContainer.encode(thumbnailHeight, forKey: .thumbnailHeight)
                      try caseContainer.encode(replyMarkup, forKey: .replyMarkup)
                      try caseContainer.encode(inputMessageContent, forKey: .inputMessageContent)
            case .video(
                let id,
                let title,
                let description,
                let thumbnailUrl,
                let videoUrl,
                let mimeType,
                let videoWidth,
                let videoHeight,
                let videoDuration,
                let replyMarkup,
                let inputMessageContent):
               try container.encode("inputInlineQueryResultVideo", forKey: .type)
                var caseContainer = encoder.container(keyedBy: VideoKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(title, forKey: .title)
                      try caseContainer.encode(description, forKey: .description)
                      try caseContainer.encode(thumbnailUrl, forKey: .thumbnailUrl)
                      try caseContainer.encode(videoUrl, forKey: .videoUrl)
                      try caseContainer.encode(mimeType, forKey: .mimeType)
                      try caseContainer.encode(videoWidth, forKey: .videoWidth)
                      try caseContainer.encode(videoHeight, forKey: .videoHeight)
                      try caseContainer.encode(videoDuration, forKey: .videoDuration)
                      try caseContainer.encode(replyMarkup, forKey: .replyMarkup)
                      try caseContainer.encode(inputMessageContent, forKey: .inputMessageContent)
            case .voiceNote(
                let id,
                let title,
                let voiceNoteUrl,
                let voiceNoteDuration,
                let replyMarkup,
                let inputMessageContent):
               try container.encode("inputInlineQueryResultVoiceNote", forKey: .type)
                var caseContainer = encoder.container(keyedBy: VoiceNoteKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(title, forKey: .title)
                      try caseContainer.encode(voiceNoteUrl, forKey: .voiceNoteUrl)
                      try caseContainer.encode(voiceNoteDuration, forKey: .voiceNoteDuration)
                      try caseContainer.encode(replyMarkup, forKey: .replyMarkup)
                      try caseContainer.encode(inputMessageContent, forKey: .inputMessageContent)
        }
  }
}

extension InputMessageContent {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum InputMessageTextKeys: String, CodingKey {
          case text
          case disableWebPagePreview
          case clearDraft
  }
  enum InputMessageAnimationKeys: String, CodingKey {
          case animation
          case thumbnail
          case duration
          case width
          case height
          case caption
  }
  enum InputMessageAudioKeys: String, CodingKey {
          case audio
          case albumCoverThumbnail
          case duration
          case title
          case performer
          case caption
  }
  enum InputMessageDocumentKeys: String, CodingKey {
          case document
          case thumbnail
          case caption
  }
  enum InputMessagePhotoKeys: String, CodingKey {
          case photo
          case thumbnail
          case addedStickerFileIds
          case width
          case height
          case caption
          case ttl
  }
  enum InputMessageStickerKeys: String, CodingKey {
          case sticker
          case thumbnail
          case width
          case height
  }
  enum InputMessageVideoKeys: String, CodingKey {
          case video
          case thumbnail
          case addedStickerFileIds
          case duration
          case width
          case height
          case supportsStreaming
          case caption
          case ttl
  }
  enum InputMessageVideoNoteKeys: String, CodingKey {
          case videoNote
          case thumbnail
          case duration
          case length
  }
  enum InputMessageVoiceNoteKeys: String, CodingKey {
          case voiceNote
          case duration
          case waveform
          case caption
  }
  enum InputMessageLocationKeys: String, CodingKey {
          case location
          case livePeriod
  }
  enum InputMessageVenueKeys: String, CodingKey {
          case venue
  }
  enum InputMessageContactKeys: String, CodingKey {
          case contact
  }
  enum InputMessageGameKeys: String, CodingKey {
          case botUserId
          case gameShortName
  }
  enum InputMessageInvoiceKeys: String, CodingKey {
          case invoice
          case title
          case description
          case photoUrl
          case photoSize
          case photoWidth
          case photoHeight
          case payload
          case providerToken
          case providerData
          case startParameter
  }
  enum InputMessagePollKeys: String, CodingKey {
          case question
          case options
          case isAnonymous
          case type
          case isClosed
  }
  enum InputMessageForwardedKeys: String, CodingKey {
          case fromChatId
          case messageId
          case inGameShare
          case sendCopy
          case removeCaption
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "inputMessageText":
      let caseContainer = try decoder.container(keyedBy: InputMessageTextKeys.self)
      self = .inputMessageText(
              text: try caseContainer.decodeIfPresent(FormattedText.self, forKey: .text),
              disableWebPagePreview: try caseContainer.decodeIfPresent(Bool.self, forKey: .disableWebPagePreview),
              clearDraft: try caseContainer.decodeIfPresent(Bool.self, forKey: .clearDraft)
        )
    case "inputMessageAnimation":
      let caseContainer = try decoder.container(keyedBy: InputMessageAnimationKeys.self)
      self = .inputMessageAnimation(
              animation: try caseContainer.decodeIfPresent(InputFile.self, forKey: .animation),
            thumbnail: try caseContainer.decode(InputThumbnail.self, forKey: .thumbnail),
            duration: try caseContainer.decode(Int32.self, forKey: .duration),
            width: try caseContainer.decode(Int32.self, forKey: .width),
            height: try caseContainer.decode(Int32.self, forKey: .height),
            caption: try caseContainer.decode(FormattedText.self, forKey: .caption)
        )
    case "inputMessageAudio":
      let caseContainer = try decoder.container(keyedBy: InputMessageAudioKeys.self)
      self = .inputMessageAudio(
              audio: try caseContainer.decodeIfPresent(InputFile.self, forKey: .audio),
              albumCoverThumbnail: try caseContainer.decodeIfPresent(InputThumbnail.self, forKey: .albumCoverThumbnail),
            duration: try caseContainer.decode(Int32.self, forKey: .duration),
            title: try caseContainer.decode(String.self, forKey: .title),
              performer: try caseContainer.decodeIfPresent(String.self, forKey: .performer),
            caption: try caseContainer.decode(FormattedText.self, forKey: .caption)
        )
    case "inputMessageDocument":
      let caseContainer = try decoder.container(keyedBy: InputMessageDocumentKeys.self)
      self = .inputMessageDocument(
              document: try caseContainer.decodeIfPresent(InputFile.self, forKey: .document),
            thumbnail: try caseContainer.decode(InputThumbnail.self, forKey: .thumbnail),
            caption: try caseContainer.decode(FormattedText.self, forKey: .caption)
        )
    case "inputMessagePhoto":
      let caseContainer = try decoder.container(keyedBy: InputMessagePhotoKeys.self)
      self = .inputMessagePhoto(
              photo: try caseContainer.decodeIfPresent(InputFile.self, forKey: .photo),
            thumbnail: try caseContainer.decode(InputThumbnail.self, forKey: .thumbnail),
            addedStickerFileIds: try caseContainer.decode([Int32].self, forKey: .addedStickerFileIds),
            width: try caseContainer.decode(Int32.self, forKey: .width),
            height: try caseContainer.decode(Int32.self, forKey: .height),
            caption: try caseContainer.decode(FormattedText.self, forKey: .caption),
            ttl: try caseContainer.decode(Int32.self, forKey: .ttl)
        )
    case "inputMessageSticker":
      let caseContainer = try decoder.container(keyedBy: InputMessageStickerKeys.self)
      self = .inputMessageSticker(
              sticker: try caseContainer.decodeIfPresent(InputFile.self, forKey: .sticker),
            thumbnail: try caseContainer.decode(InputThumbnail.self, forKey: .thumbnail),
            width: try caseContainer.decode(Int32.self, forKey: .width),
            height: try caseContainer.decode(Int32.self, forKey: .height)
        )
    case "inputMessageVideo":
      let caseContainer = try decoder.container(keyedBy: InputMessageVideoKeys.self)
      self = .inputMessageVideo(
              video: try caseContainer.decodeIfPresent(InputFile.self, forKey: .video),
            thumbnail: try caseContainer.decode(InputThumbnail.self, forKey: .thumbnail),
              addedStickerFileIds: try caseContainer.decodeIfPresent([Int32].self, forKey: .addedStickerFileIds),
            duration: try caseContainer.decode(Int32.self, forKey: .duration),
              width: try caseContainer.decodeIfPresent(Int32.self, forKey: .width),
              height: try caseContainer.decodeIfPresent(Int32.self, forKey: .height),
              supportsStreaming: try caseContainer.decodeIfPresent(Bool.self, forKey: .supportsStreaming),
            caption: try caseContainer.decode(FormattedText.self, forKey: .caption),
              ttl: try caseContainer.decodeIfPresent(Int32.self, forKey: .ttl)
        )
    case "inputMessageVideoNote":
      let caseContainer = try decoder.container(keyedBy: InputMessageVideoNoteKeys.self)
      self = .inputMessageVideoNote(
              videoNote: try caseContainer.decodeIfPresent(InputFile.self, forKey: .videoNote),
              thumbnail: try caseContainer.decodeIfPresent(InputThumbnail.self, forKey: .thumbnail),
            duration: try caseContainer.decode(Int32.self, forKey: .duration),
              length: try caseContainer.decodeIfPresent(Int32.self, forKey: .length)
        )
    case "inputMessageVoiceNote":
      let caseContainer = try decoder.container(keyedBy: InputMessageVoiceNoteKeys.self)
      self = .inputMessageVoiceNote(
              voiceNote: try caseContainer.decodeIfPresent(InputFile.self, forKey: .voiceNote),
              duration: try caseContainer.decodeIfPresent(Int32.self, forKey: .duration),
              waveform: try caseContainer.decodeIfPresent(Bytes.self, forKey: .waveform),
              caption: try caseContainer.decodeIfPresent(FormattedText.self, forKey: .caption)
        )
    case "inputMessageLocation":
      let caseContainer = try decoder.container(keyedBy: InputMessageLocationKeys.self)
      self = .inputMessageLocation(
              location: try caseContainer.decodeIfPresent(Location.self, forKey: .location),
              livePeriod: try caseContainer.decodeIfPresent(Int32.self, forKey: .livePeriod)
        )
    case "inputMessageVenue":
      let caseContainer = try decoder.container(keyedBy: InputMessageVenueKeys.self)
      self = .inputMessageVenue(
              venue: try caseContainer.decodeIfPresent(Venue.self, forKey: .venue)
        )
    case "inputMessageContact":
      let caseContainer = try decoder.container(keyedBy: InputMessageContactKeys.self)
      self = .inputMessageContact(
              contact: try caseContainer.decodeIfPresent(Contact.self, forKey: .contact)
        )
    case "inputMessageGame":
      let caseContainer = try decoder.container(keyedBy: InputMessageGameKeys.self)
      self = .inputMessageGame(
              botUserId: try caseContainer.decodeIfPresent(Int32.self, forKey: .botUserId),
              gameShortName: try caseContainer.decodeIfPresent(String.self, forKey: .gameShortName)
        )
    case "inputMessageInvoice":
      let caseContainer = try decoder.container(keyedBy: InputMessageInvoiceKeys.self)
      let invoice = try caseContainer.decodeIfPresent(Invoice.self, forKey: .invoice)
      let title = try caseContainer.decodeIfPresent(String.self, forKey: .title)
      let description = try caseContainer.decodeIfPresent(String.self, forKey: .description)
      let photoUrl = try caseContainer.decodeIfPresent(String.self, forKey: .photoUrl)
      let photoSize = try caseContainer.decodeIfPresent(Int32.self, forKey: .photoSize)
      let photoWidth = try caseContainer.decodeIfPresent(Int32.self, forKey: .photoWidth)
      let photoHeight = try caseContainer.decodeIfPresent(Int32.self, forKey: .photoHeight)
      let payload = try caseContainer.decodeIfPresent(Bytes.self, forKey: .payload)
      let providerToken = try caseContainer.decodeIfPresent(String.self, forKey: .providerToken)
      let providerData = try caseContainer.decodeIfPresent(String.self, forKey: .providerData)
      let startParameter = try caseContainer.decodeIfPresent(String.self, forKey: .startParameter)
      self = .inputMessageInvoice(
              invoice: invoice,
              title: title,
              description: description,
              photoUrl: photoUrl,
              photoSize: photoSize,
              photoWidth: photoWidth,
              photoHeight: photoHeight,
              payload: payload,
              providerToken: providerToken,
              providerData: providerData,
              startParameter: startParameter
        )
    case "inputMessagePoll":
      let caseContainer = try decoder.container(keyedBy: InputMessagePollKeys.self)
      self = .inputMessagePoll(
              question: try caseContainer.decodeIfPresent(String.self, forKey: .question),
              options: try caseContainer.decodeIfPresent([String].self, forKey: .options),
              isAnonymous: try caseContainer.decodeIfPresent(Bool.self, forKey: .isAnonymous),
              type: try caseContainer.decodeIfPresent(PollType.self, forKey: .type),
              isClosed: try caseContainer.decodeIfPresent(Bool.self, forKey: .isClosed)
        )
    case "inputMessageForwarded":
      let caseContainer = try decoder.container(keyedBy: InputMessageForwardedKeys.self)
      self = .inputMessageForwarded(
              fromChatId: try caseContainer.decodeIfPresent(Int53.self, forKey: .fromChatId),
              messageId: try caseContainer.decodeIfPresent(Int53.self, forKey: .messageId),
              inGameShare: try caseContainer.decodeIfPresent(Bool.self, forKey: .inGameShare),
              sendCopy: try caseContainer.decodeIfPresent(Bool.self, forKey: .sendCopy),
              removeCaption: try caseContainer.decodeIfPresent(Bool.self, forKey: .removeCaption)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .inputMessageText(
                let text,
                let disableWebPagePreview,
                let clearDraft):
               try container.encode("inputMessageText", forKey: .type)
                var caseContainer = encoder.container(keyedBy: InputMessageTextKeys.self)
                      try caseContainer.encodeIfPresent(text, forKey: .text)
                      try caseContainer.encodeIfPresent(disableWebPagePreview, forKey: .disableWebPagePreview)
                      try caseContainer.encodeIfPresent(clearDraft, forKey: .clearDraft)
            case .inputMessageAnimation(
                let animation,
                let thumbnail,
                let duration,
                let width,
                let height,
                let caption):
               try container.encode("inputMessageAnimation", forKey: .type)
                var caseContainer = encoder.container(keyedBy: InputMessageAnimationKeys.self)
                      try caseContainer.encodeIfPresent(animation, forKey: .animation)
                      try caseContainer.encode(thumbnail, forKey: .thumbnail)
                      try caseContainer.encode(duration, forKey: .duration)
                      try caseContainer.encode(width, forKey: .width)
                      try caseContainer.encode(height, forKey: .height)
                      try caseContainer.encode(caption, forKey: .caption)
            case .inputMessageAudio(
                let audio,
                let albumCoverThumbnail,
                let duration,
                let title,
                let performer,
                let caption):
               try container.encode("inputMessageAudio", forKey: .type)
                var caseContainer = encoder.container(keyedBy: InputMessageAudioKeys.self)
                      try caseContainer.encodeIfPresent(audio, forKey: .audio)
                      try caseContainer.encodeIfPresent(albumCoverThumbnail, forKey: .albumCoverThumbnail)
                      try caseContainer.encode(duration, forKey: .duration)
                      try caseContainer.encode(title, forKey: .title)
                      try caseContainer.encodeIfPresent(performer, forKey: .performer)
                      try caseContainer.encode(caption, forKey: .caption)
            case .inputMessageDocument(
                let document,
                let thumbnail,
                let caption):
               try container.encode("inputMessageDocument", forKey: .type)
                var caseContainer = encoder.container(keyedBy: InputMessageDocumentKeys.self)
                      try caseContainer.encodeIfPresent(document, forKey: .document)
                      try caseContainer.encode(thumbnail, forKey: .thumbnail)
                      try caseContainer.encode(caption, forKey: .caption)
            case .inputMessagePhoto(
                let photo,
                let thumbnail,
                let addedStickerFileIds,
                let width,
                let height,
                let caption,
                let ttl):
               try container.encode("inputMessagePhoto", forKey: .type)
                var caseContainer = encoder.container(keyedBy: InputMessagePhotoKeys.self)
                      try caseContainer.encodeIfPresent(photo, forKey: .photo)
                      try caseContainer.encode(thumbnail, forKey: .thumbnail)
                      try caseContainer.encode(addedStickerFileIds, forKey: .addedStickerFileIds)
                      try caseContainer.encode(width, forKey: .width)
                      try caseContainer.encode(height, forKey: .height)
                      try caseContainer.encode(caption, forKey: .caption)
                      try caseContainer.encode(ttl, forKey: .ttl)
            case .inputMessageSticker(
                let sticker,
                let thumbnail,
                let width,
                let height):
               try container.encode("inputMessageSticker", forKey: .type)
                var caseContainer = encoder.container(keyedBy: InputMessageStickerKeys.self)
                      try caseContainer.encodeIfPresent(sticker, forKey: .sticker)
                      try caseContainer.encode(thumbnail, forKey: .thumbnail)
                      try caseContainer.encode(width, forKey: .width)
                      try caseContainer.encode(height, forKey: .height)
            case .inputMessageVideo(
                let video,
                let thumbnail,
                let addedStickerFileIds,
                let duration,
                let width,
                let height,
                let supportsStreaming,
                let caption,
                let ttl):
               try container.encode("inputMessageVideo", forKey: .type)
                var caseContainer = encoder.container(keyedBy: InputMessageVideoKeys.self)
                      try caseContainer.encodeIfPresent(video, forKey: .video)
                      try caseContainer.encode(thumbnail, forKey: .thumbnail)
                      try caseContainer.encodeIfPresent(addedStickerFileIds, forKey: .addedStickerFileIds)
                      try caseContainer.encode(duration, forKey: .duration)
                      try caseContainer.encodeIfPresent(width, forKey: .width)
                      try caseContainer.encodeIfPresent(height, forKey: .height)
                      try caseContainer.encodeIfPresent(supportsStreaming, forKey: .supportsStreaming)
                      try caseContainer.encode(caption, forKey: .caption)
                      try caseContainer.encodeIfPresent(ttl, forKey: .ttl)
            case .inputMessageVideoNote(
                let videoNote,
                let thumbnail,
                let duration,
                let length):
               try container.encode("inputMessageVideoNote", forKey: .type)
                var caseContainer = encoder.container(keyedBy: InputMessageVideoNoteKeys.self)
                      try caseContainer.encodeIfPresent(videoNote, forKey: .videoNote)
                      try caseContainer.encodeIfPresent(thumbnail, forKey: .thumbnail)
                      try caseContainer.encode(duration, forKey: .duration)
                      try caseContainer.encodeIfPresent(length, forKey: .length)
            case .inputMessageVoiceNote(
                let voiceNote,
                let duration,
                let waveform,
                let caption):
               try container.encode("inputMessageVoiceNote", forKey: .type)
                var caseContainer = encoder.container(keyedBy: InputMessageVoiceNoteKeys.self)
                      try caseContainer.encodeIfPresent(voiceNote, forKey: .voiceNote)
                      try caseContainer.encodeIfPresent(duration, forKey: .duration)
                      try caseContainer.encodeIfPresent(waveform, forKey: .waveform)
                      try caseContainer.encodeIfPresent(caption, forKey: .caption)
            case .inputMessageLocation(
                let location,
                let livePeriod):
               try container.encode("inputMessageLocation", forKey: .type)
                var caseContainer = encoder.container(keyedBy: InputMessageLocationKeys.self)
                      try caseContainer.encodeIfPresent(location, forKey: .location)
                      try caseContainer.encodeIfPresent(livePeriod, forKey: .livePeriod)
            case .inputMessageVenue(
                let venue):
               try container.encode("inputMessageVenue", forKey: .type)
                var caseContainer = encoder.container(keyedBy: InputMessageVenueKeys.self)
                      try caseContainer.encodeIfPresent(venue, forKey: .venue)
            case .inputMessageContact(
                let contact):
               try container.encode("inputMessageContact", forKey: .type)
                var caseContainer = encoder.container(keyedBy: InputMessageContactKeys.self)
                      try caseContainer.encodeIfPresent(contact, forKey: .contact)
            case .inputMessageGame(
                let botUserId,
                let gameShortName):
               try container.encode("inputMessageGame", forKey: .type)
                var caseContainer = encoder.container(keyedBy: InputMessageGameKeys.self)
                      try caseContainer.encodeIfPresent(botUserId, forKey: .botUserId)
                      try caseContainer.encodeIfPresent(gameShortName, forKey: .gameShortName)
            case .inputMessageInvoice(
                let invoice,
                let title,
                let description,
                let photoUrl,
                let photoSize,
                let photoWidth,
                let photoHeight,
                let payload,
                let providerToken,
                let providerData,
                let startParameter):
               try container.encode("inputMessageInvoice", forKey: .type)
                var caseContainer = encoder.container(keyedBy: InputMessageInvoiceKeys.self)
                      try caseContainer.encodeIfPresent(invoice, forKey: .invoice)
                      try caseContainer.encodeIfPresent(title, forKey: .title)
                      try caseContainer.encodeIfPresent(description, forKey: .description)
                      try caseContainer.encodeIfPresent(photoUrl, forKey: .photoUrl)
                      try caseContainer.encodeIfPresent(photoSize, forKey: .photoSize)
                      try caseContainer.encodeIfPresent(photoWidth, forKey: .photoWidth)
                      try caseContainer.encodeIfPresent(photoHeight, forKey: .photoHeight)
                      try caseContainer.encodeIfPresent(payload, forKey: .payload)
                      try caseContainer.encodeIfPresent(providerToken, forKey: .providerToken)
                      try caseContainer.encodeIfPresent(providerData, forKey: .providerData)
                      try caseContainer.encodeIfPresent(startParameter, forKey: .startParameter)
            case .inputMessagePoll(
                let question,
                let options,
                let isAnonymous,
                let type,
                let isClosed):
               try container.encode("inputMessagePoll", forKey: .type)
                var caseContainer = encoder.container(keyedBy: InputMessagePollKeys.self)
                      try caseContainer.encodeIfPresent(question, forKey: .question)
                      try caseContainer.encodeIfPresent(options, forKey: .options)
                      try caseContainer.encodeIfPresent(isAnonymous, forKey: .isAnonymous)
                      try caseContainer.encodeIfPresent(type, forKey: .type)
                      try caseContainer.encodeIfPresent(isClosed, forKey: .isClosed)
            case .inputMessageForwarded(
                let fromChatId,
                let messageId,
                let inGameShare,
                let sendCopy,
                let removeCaption):
               try container.encode("inputMessageForwarded", forKey: .type)
                var caseContainer = encoder.container(keyedBy: InputMessageForwardedKeys.self)
                      try caseContainer.encodeIfPresent(fromChatId, forKey: .fromChatId)
                      try caseContainer.encodeIfPresent(messageId, forKey: .messageId)
                      try caseContainer.encodeIfPresent(inGameShare, forKey: .inGameShare)
                      try caseContainer.encodeIfPresent(sendCopy, forKey: .sendCopy)
                      try caseContainer.encodeIfPresent(removeCaption, forKey: .removeCaption)
        }
  }
}

extension InputPassportElement {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum PersonalDetailsKeys: String, CodingKey {
          case personalDetails
  }
  enum PassportKeys: String, CodingKey {
          case passport
  }
  enum DriverLicenseKeys: String, CodingKey {
          case driverLicense
  }
  enum IdentityCardKeys: String, CodingKey {
          case identityCard
  }
  enum InternalPassportKeys: String, CodingKey {
          case internalPassport
  }
  enum AddressKeys: String, CodingKey {
          case address
  }
  enum UtilityBillKeys: String, CodingKey {
          case utilityBill
  }
  enum BankStatementKeys: String, CodingKey {
          case bankStatement
  }
  enum RentalAgreementKeys: String, CodingKey {
          case rentalAgreement
  }
  enum PassportRegistrationKeys: String, CodingKey {
          case passportRegistration
  }
  enum TemporaryRegistrationKeys: String, CodingKey {
          case temporaryRegistration
  }
  enum PhoneNumberKeys: String, CodingKey {
          case phoneNumber
  }
  enum EmailAddressKeys: String, CodingKey {
          case emailAddress
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "inputPassportElementPersonalDetails":
      let caseContainer = try decoder.container(keyedBy: PersonalDetailsKeys.self)
      self = .personalDetails(
              personalDetails: try caseContainer.decodeIfPresent(PersonalDetails.self, forKey: .personalDetails)
        )
    case "inputPassportElementPassport":
      let caseContainer = try decoder.container(keyedBy: PassportKeys.self)
      self = .passport(
              passport: try caseContainer.decodeIfPresent(InputIdentityDocument.self, forKey: .passport)
        )
    case "inputPassportElementDriverLicense":
      let caseContainer = try decoder.container(keyedBy: DriverLicenseKeys.self)
      self = .driverLicense(
              driverLicense: try caseContainer.decodeIfPresent(InputIdentityDocument.self, forKey: .driverLicense)
        )
    case "inputPassportElementIdentityCard":
      let caseContainer = try decoder.container(keyedBy: IdentityCardKeys.self)
      self = .identityCard(
              identityCard: try caseContainer.decodeIfPresent(InputIdentityDocument.self, forKey: .identityCard)
        )
    case "inputPassportElementInternalPassport":
      let caseContainer = try decoder.container(keyedBy: InternalPassportKeys.self)
      self = .internalPassport(
              internalPassport: try caseContainer.decodeIfPresent(InputIdentityDocument.self, forKey: .internalPassport)
        )
    case "inputPassportElementAddress":
      let caseContainer = try decoder.container(keyedBy: AddressKeys.self)
      self = .address(
              address: try caseContainer.decodeIfPresent(Address.self, forKey: .address)
        )
    case "inputPassportElementUtilityBill":
      let caseContainer = try decoder.container(keyedBy: UtilityBillKeys.self)
      self = .utilityBill(
              utilityBill: try caseContainer.decodeIfPresent(InputPersonalDocument.self, forKey: .utilityBill)
        )
    case "inputPassportElementBankStatement":
      let caseContainer = try decoder.container(keyedBy: BankStatementKeys.self)
      self = .bankStatement(
              bankStatement: try caseContainer.decodeIfPresent(InputPersonalDocument.self, forKey: .bankStatement)
        )
    case "inputPassportElementRentalAgreement":
      let caseContainer = try decoder.container(keyedBy: RentalAgreementKeys.self)
      self = .rentalAgreement(
              rentalAgreement: try caseContainer.decodeIfPresent(InputPersonalDocument.self, forKey: .rentalAgreement)
        )
    case "inputPassportElementPassportRegistration":
      let caseContainer = try decoder.container(keyedBy: PassportRegistrationKeys.self)
      self = .passportRegistration(
              passportRegistration: try caseContainer.decodeIfPresent(InputPersonalDocument.self, forKey: .passportRegistration)
        )
    case "inputPassportElementTemporaryRegistration":
      let caseContainer = try decoder.container(keyedBy: TemporaryRegistrationKeys.self)
      self = .temporaryRegistration(
              temporaryRegistration: try caseContainer.decodeIfPresent(InputPersonalDocument.self, forKey: .temporaryRegistration)
        )
    case "inputPassportElementPhoneNumber":
      let caseContainer = try decoder.container(keyedBy: PhoneNumberKeys.self)
      self = .phoneNumber(
              phoneNumber: try caseContainer.decodeIfPresent(String.self, forKey: .phoneNumber)
        )
    case "inputPassportElementEmailAddress":
      let caseContainer = try decoder.container(keyedBy: EmailAddressKeys.self)
      self = .emailAddress(
              emailAddress: try caseContainer.decodeIfPresent(String.self, forKey: .emailAddress)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .personalDetails(
                let personalDetails):
               try container.encode("inputPassportElementPersonalDetails", forKey: .type)
                var caseContainer = encoder.container(keyedBy: PersonalDetailsKeys.self)
                      try caseContainer.encodeIfPresent(personalDetails, forKey: .personalDetails)
            case .passport(
                let passport):
               try container.encode("inputPassportElementPassport", forKey: .type)
                var caseContainer = encoder.container(keyedBy: PassportKeys.self)
                      try caseContainer.encodeIfPresent(passport, forKey: .passport)
            case .driverLicense(
                let driverLicense):
               try container.encode("inputPassportElementDriverLicense", forKey: .type)
                var caseContainer = encoder.container(keyedBy: DriverLicenseKeys.self)
                      try caseContainer.encodeIfPresent(driverLicense, forKey: .driverLicense)
            case .identityCard(
                let identityCard):
               try container.encode("inputPassportElementIdentityCard", forKey: .type)
                var caseContainer = encoder.container(keyedBy: IdentityCardKeys.self)
                      try caseContainer.encodeIfPresent(identityCard, forKey: .identityCard)
            case .internalPassport(
                let internalPassport):
               try container.encode("inputPassportElementInternalPassport", forKey: .type)
                var caseContainer = encoder.container(keyedBy: InternalPassportKeys.self)
                      try caseContainer.encodeIfPresent(internalPassport, forKey: .internalPassport)
            case .address(
                let address):
               try container.encode("inputPassportElementAddress", forKey: .type)
                var caseContainer = encoder.container(keyedBy: AddressKeys.self)
                      try caseContainer.encodeIfPresent(address, forKey: .address)
            case .utilityBill(
                let utilityBill):
               try container.encode("inputPassportElementUtilityBill", forKey: .type)
                var caseContainer = encoder.container(keyedBy: UtilityBillKeys.self)
                      try caseContainer.encodeIfPresent(utilityBill, forKey: .utilityBill)
            case .bankStatement(
                let bankStatement):
               try container.encode("inputPassportElementBankStatement", forKey: .type)
                var caseContainer = encoder.container(keyedBy: BankStatementKeys.self)
                      try caseContainer.encodeIfPresent(bankStatement, forKey: .bankStatement)
            case .rentalAgreement(
                let rentalAgreement):
               try container.encode("inputPassportElementRentalAgreement", forKey: .type)
                var caseContainer = encoder.container(keyedBy: RentalAgreementKeys.self)
                      try caseContainer.encodeIfPresent(rentalAgreement, forKey: .rentalAgreement)
            case .passportRegistration(
                let passportRegistration):
               try container.encode("inputPassportElementPassportRegistration", forKey: .type)
                var caseContainer = encoder.container(keyedBy: PassportRegistrationKeys.self)
                      try caseContainer.encodeIfPresent(passportRegistration, forKey: .passportRegistration)
            case .temporaryRegistration(
                let temporaryRegistration):
               try container.encode("inputPassportElementTemporaryRegistration", forKey: .type)
                var caseContainer = encoder.container(keyedBy: TemporaryRegistrationKeys.self)
                      try caseContainer.encodeIfPresent(temporaryRegistration, forKey: .temporaryRegistration)
            case .phoneNumber(
                let phoneNumber):
               try container.encode("inputPassportElementPhoneNumber", forKey: .type)
                var caseContainer = encoder.container(keyedBy: PhoneNumberKeys.self)
                      try caseContainer.encodeIfPresent(phoneNumber, forKey: .phoneNumber)
            case .emailAddress(
                let emailAddress):
               try container.encode("inputPassportElementEmailAddress", forKey: .type)
                var caseContainer = encoder.container(keyedBy: EmailAddressKeys.self)
                      try caseContainer.encodeIfPresent(emailAddress, forKey: .emailAddress)
        }
  }
}

extension InputPassportElementErrorSource {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum UnspecifiedKeys: String, CodingKey {
          case elementHash
  }
  enum DataFieldKeys: String, CodingKey {
          case fieldName
          case dataHash
  }
  enum FrontSideKeys: String, CodingKey {
          case fileHash
  }
  enum ReverseSideKeys: String, CodingKey {
          case fileHash
  }
  enum SelfieKeys: String, CodingKey {
          case fileHash
  }
  enum TranslationFileKeys: String, CodingKey {
          case fileHash
  }
  enum TranslationFilesKeys: String, CodingKey {
          case fileHashes
  }
  enum FileKeys: String, CodingKey {
          case fileHash
  }
  enum FilesKeys: String, CodingKey {
          case fileHashes
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "inputPassportElementErrorSourceUnspecified":
      let caseContainer = try decoder.container(keyedBy: UnspecifiedKeys.self)
      self = .unspecified(
            elementHash: try caseContainer.decode(Bytes.self, forKey: .elementHash)
        )
    case "inputPassportElementErrorSourceDataField":
      let caseContainer = try decoder.container(keyedBy: DataFieldKeys.self)
      self = .dataField(
            fieldName: try caseContainer.decode(String.self, forKey: .fieldName),
            dataHash: try caseContainer.decode(Bytes.self, forKey: .dataHash)
        )
    case "inputPassportElementErrorSourceFrontSide":
      let caseContainer = try decoder.container(keyedBy: FrontSideKeys.self)
      self = .frontSide(
            fileHash: try caseContainer.decode(Bytes.self, forKey: .fileHash)
        )
    case "inputPassportElementErrorSourceReverseSide":
      let caseContainer = try decoder.container(keyedBy: ReverseSideKeys.self)
      self = .reverseSide(
            fileHash: try caseContainer.decode(Bytes.self, forKey: .fileHash)
        )
    case "inputPassportElementErrorSourceSelfie":
      let caseContainer = try decoder.container(keyedBy: SelfieKeys.self)
      self = .selfie(
            fileHash: try caseContainer.decode(Bytes.self, forKey: .fileHash)
        )
    case "inputPassportElementErrorSourceTranslationFile":
      let caseContainer = try decoder.container(keyedBy: TranslationFileKeys.self)
      self = .translationFile(
            fileHash: try caseContainer.decode(Bytes.self, forKey: .fileHash)
        )
    case "inputPassportElementErrorSourceTranslationFiles":
      let caseContainer = try decoder.container(keyedBy: TranslationFilesKeys.self)
      self = .translationFiles(
            fileHashes: try caseContainer.decode([Bytes].self, forKey: .fileHashes)
        )
    case "inputPassportElementErrorSourceFile":
      let caseContainer = try decoder.container(keyedBy: FileKeys.self)
      self = .file(
            fileHash: try caseContainer.decode(Bytes.self, forKey: .fileHash)
        )
    case "inputPassportElementErrorSourceFiles":
      let caseContainer = try decoder.container(keyedBy: FilesKeys.self)
      self = .files(
            fileHashes: try caseContainer.decode([Bytes].self, forKey: .fileHashes)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .unspecified(
                let elementHash):
               try container.encode("inputPassportElementErrorSourceUnspecified", forKey: .type)
                var caseContainer = encoder.container(keyedBy: UnspecifiedKeys.self)
                      try caseContainer.encode(elementHash, forKey: .elementHash)
            case .dataField(
                let fieldName,
                let dataHash):
               try container.encode("inputPassportElementErrorSourceDataField", forKey: .type)
                var caseContainer = encoder.container(keyedBy: DataFieldKeys.self)
                      try caseContainer.encode(fieldName, forKey: .fieldName)
                      try caseContainer.encode(dataHash, forKey: .dataHash)
            case .frontSide(
                let fileHash):
               try container.encode("inputPassportElementErrorSourceFrontSide", forKey: .type)
                var caseContainer = encoder.container(keyedBy: FrontSideKeys.self)
                      try caseContainer.encode(fileHash, forKey: .fileHash)
            case .reverseSide(
                let fileHash):
               try container.encode("inputPassportElementErrorSourceReverseSide", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ReverseSideKeys.self)
                      try caseContainer.encode(fileHash, forKey: .fileHash)
            case .selfie(
                let fileHash):
               try container.encode("inputPassportElementErrorSourceSelfie", forKey: .type)
                var caseContainer = encoder.container(keyedBy: SelfieKeys.self)
                      try caseContainer.encode(fileHash, forKey: .fileHash)
            case .translationFile(
                let fileHash):
               try container.encode("inputPassportElementErrorSourceTranslationFile", forKey: .type)
                var caseContainer = encoder.container(keyedBy: TranslationFileKeys.self)
                      try caseContainer.encode(fileHash, forKey: .fileHash)
            case .translationFiles(
                let fileHashes):
               try container.encode("inputPassportElementErrorSourceTranslationFiles", forKey: .type)
                var caseContainer = encoder.container(keyedBy: TranslationFilesKeys.self)
                      try caseContainer.encode(fileHashes, forKey: .fileHashes)
            case .file(
                let fileHash):
               try container.encode("inputPassportElementErrorSourceFile", forKey: .type)
                var caseContainer = encoder.container(keyedBy: FileKeys.self)
                      try caseContainer.encode(fileHash, forKey: .fileHash)
            case .files(
                let fileHashes):
               try container.encode("inputPassportElementErrorSourceFiles", forKey: .type)
                var caseContainer = encoder.container(keyedBy: FilesKeys.self)
                      try caseContainer.encode(fileHashes, forKey: .fileHashes)
        }
  }
}

extension JsonValue {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum BooleanKeys: String, CodingKey {
          case value
  }
  enum NumberKeys: String, CodingKey {
          case value
  }
  enum StringKeys: String, CodingKey {
          case value
  }
  enum ArrayKeys: String, CodingKey {
          case values
  }
  enum ObjectKeys: String, CodingKey {
          case members
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "jsonValueNull":
      self = .null
    case "jsonValueBoolean":
      let caseContainer = try decoder.container(keyedBy: BooleanKeys.self)
      self = .boolean(
            value: try caseContainer.decode(Bool.self, forKey: .value)
        )
    case "jsonValueNumber":
      let caseContainer = try decoder.container(keyedBy: NumberKeys.self)
      self = .number(
            value: try caseContainer.decode(Double.self, forKey: .value)
        )
    case "jsonValueString":
      let caseContainer = try decoder.container(keyedBy: StringKeys.self)
      self = .string(
              value: try caseContainer.decodeIfPresent(String.self, forKey: .value)
        )
    case "jsonValueArray":
      let caseContainer = try decoder.container(keyedBy: ArrayKeys.self)
      self = .array(
              values: try caseContainer.decodeIfPresent([JsonValue].self, forKey: .values)
        )
    case "jsonValueObject":
      let caseContainer = try decoder.container(keyedBy: ObjectKeys.self)
      self = .object(
              members: try caseContainer.decodeIfPresent([JsonObjectMember].self, forKey: .members)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .null:
               try container.encode("jsonValueNull", forKey: .type)
            case .boolean(
                let value):
               try container.encode("jsonValueBoolean", forKey: .type)
                var caseContainer = encoder.container(keyedBy: BooleanKeys.self)
                      try caseContainer.encode(value, forKey: .value)
            case .number(
                let value):
               try container.encode("jsonValueNumber", forKey: .type)
                var caseContainer = encoder.container(keyedBy: NumberKeys.self)
                      try caseContainer.encode(value, forKey: .value)
            case .string(
                let value):
               try container.encode("jsonValueString", forKey: .type)
                var caseContainer = encoder.container(keyedBy: StringKeys.self)
                      try caseContainer.encodeIfPresent(value, forKey: .value)
            case .array(
                let values):
               try container.encode("jsonValueArray", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ArrayKeys.self)
                      try caseContainer.encodeIfPresent(values, forKey: .values)
            case .object(
                let members):
               try container.encode("jsonValueObject", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ObjectKeys.self)
                      try caseContainer.encodeIfPresent(members, forKey: .members)
        }
  }
}

extension KeyboardButtonType {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum RequestPollKeys: String, CodingKey {
          case forceRegular
          case forceQuiz
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "keyboardButtonTypeText":
      self = .text
    case "keyboardButtonTypeRequestPhoneNumber":
      self = .requestPhoneNumber
    case "keyboardButtonTypeRequestLocation":
      self = .requestLocation
    case "keyboardButtonTypeRequestPoll":
      let caseContainer = try decoder.container(keyedBy: RequestPollKeys.self)
      self = .requestPoll(
            forceRegular: try caseContainer.decode(Bool.self, forKey: .forceRegular),
            forceQuiz: try caseContainer.decode(Bool.self, forKey: .forceQuiz)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .text:
               try container.encode("keyboardButtonTypeText", forKey: .type)
            case .requestPhoneNumber:
               try container.encode("keyboardButtonTypeRequestPhoneNumber", forKey: .type)
            case .requestLocation:
               try container.encode("keyboardButtonTypeRequestLocation", forKey: .type)
            case .requestPoll(
                let forceRegular,
                let forceQuiz):
               try container.encode("keyboardButtonTypeRequestPoll", forKey: .type)
                var caseContainer = encoder.container(keyedBy: RequestPollKeys.self)
                      try caseContainer.encode(forceRegular, forKey: .forceRegular)
                      try caseContainer.encode(forceQuiz, forKey: .forceQuiz)
        }
  }
}

extension LanguagePackStringValue {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum OrdinaryKeys: String, CodingKey {
          case value
  }
  enum PluralizedKeys: String, CodingKey {
          case zeroValue
          case oneValue
          case twoValue
          case fewValue
          case manyValue
          case otherValue
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "languagePackStringValueOrdinary":
      let caseContainer = try decoder.container(keyedBy: OrdinaryKeys.self)
      self = .ordinary(
              value: try caseContainer.decodeIfPresent(String.self, forKey: .value)
        )
    case "languagePackStringValuePluralized":
      let caseContainer = try decoder.container(keyedBy: PluralizedKeys.self)
      self = .pluralized(
              zeroValue: try caseContainer.decodeIfPresent(String.self, forKey: .zeroValue),
              oneValue: try caseContainer.decodeIfPresent(String.self, forKey: .oneValue),
              twoValue: try caseContainer.decodeIfPresent(String.self, forKey: .twoValue),
              fewValue: try caseContainer.decodeIfPresent(String.self, forKey: .fewValue),
              manyValue: try caseContainer.decodeIfPresent(String.self, forKey: .manyValue),
              otherValue: try caseContainer.decodeIfPresent(String.self, forKey: .otherValue)
        )
    case "languagePackStringValueDeleted":
      self = .deleted
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .ordinary(
                let value):
               try container.encode("languagePackStringValueOrdinary", forKey: .type)
                var caseContainer = encoder.container(keyedBy: OrdinaryKeys.self)
                      try caseContainer.encodeIfPresent(value, forKey: .value)
            case .pluralized(
                let zeroValue,
                let oneValue,
                let twoValue,
                let fewValue,
                let manyValue,
                let otherValue):
               try container.encode("languagePackStringValuePluralized", forKey: .type)
                var caseContainer = encoder.container(keyedBy: PluralizedKeys.self)
                      try caseContainer.encodeIfPresent(zeroValue, forKey: .zeroValue)
                      try caseContainer.encodeIfPresent(oneValue, forKey: .oneValue)
                      try caseContainer.encodeIfPresent(twoValue, forKey: .twoValue)
                      try caseContainer.encodeIfPresent(fewValue, forKey: .fewValue)
                      try caseContainer.encodeIfPresent(manyValue, forKey: .manyValue)
                      try caseContainer.encodeIfPresent(otherValue, forKey: .otherValue)
            case .deleted:
               try container.encode("languagePackStringValueDeleted", forKey: .type)
        }
  }
}

extension LogStream {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum FileKeys: String, CodingKey {
          case path
          case maxFileSize
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "logStreamDefault":
      self = .default
    case "logStreamFile":
      let caseContainer = try decoder.container(keyedBy: FileKeys.self)
      self = .file(
              path: try caseContainer.decodeIfPresent(String.self, forKey: .path),
              maxFileSize: try caseContainer.decodeIfPresent(Int53.self, forKey: .maxFileSize)
        )
    case "logStreamEmpty":
      self = .empty
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .default:
               try container.encode("logStreamDefault", forKey: .type)
            case .file(
                let path,
                let maxFileSize):
               try container.encode("logStreamFile", forKey: .type)
                var caseContainer = encoder.container(keyedBy: FileKeys.self)
                      try caseContainer.encodeIfPresent(path, forKey: .path)
                      try caseContainer.encodeIfPresent(maxFileSize, forKey: .maxFileSize)
            case .empty:
               try container.encode("logStreamEmpty", forKey: .type)
        }
  }
}

extension LoginUrlInfo {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum OpenKeys: String, CodingKey {
          case url
          case skipConfirm
  }
  enum RequestConfirmationKeys: String, CodingKey {
          case url
          case domain
          case botUserId
          case requestWriteAccess
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "loginUrlInfoOpen":
      let caseContainer = try decoder.container(keyedBy: OpenKeys.self)
      self = .open(
            url: try caseContainer.decode(String.self, forKey: .url),
            skipConfirm: try caseContainer.decode(Bool.self, forKey: .skipConfirm)
        )
    case "loginUrlInfoRequestConfirmation":
      let caseContainer = try decoder.container(keyedBy: RequestConfirmationKeys.self)
      self = .requestConfirmation(
            url: try caseContainer.decode(String.self, forKey: .url),
            domain: try caseContainer.decode(String.self, forKey: .domain),
            botUserId: try caseContainer.decode(Int32.self, forKey: .botUserId),
            requestWriteAccess: try caseContainer.decode(Bool.self, forKey: .requestWriteAccess)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .open(
                let url,
                let skipConfirm):
               try container.encode("loginUrlInfoOpen", forKey: .type)
                var caseContainer = encoder.container(keyedBy: OpenKeys.self)
                      try caseContainer.encode(url, forKey: .url)
                      try caseContainer.encode(skipConfirm, forKey: .skipConfirm)
            case .requestConfirmation(
                let url,
                let domain,
                let botUserId,
                let requestWriteAccess):
               try container.encode("loginUrlInfoRequestConfirmation", forKey: .type)
                var caseContainer = encoder.container(keyedBy: RequestConfirmationKeys.self)
                      try caseContainer.encode(url, forKey: .url)
                      try caseContainer.encode(domain, forKey: .domain)
                      try caseContainer.encode(botUserId, forKey: .botUserId)
                      try caseContainer.encode(requestWriteAccess, forKey: .requestWriteAccess)
        }
  }
}

extension MaskPoint {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "maskPointForehead":
      self = .forehead
    case "maskPointEyes":
      self = .eyes
    case "maskPointMouth":
      self = .mouth
    case "maskPointChin":
      self = .chin
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .forehead:
               try container.encode("maskPointForehead", forKey: .type)
            case .eyes:
               try container.encode("maskPointEyes", forKey: .type)
            case .mouth:
               try container.encode("maskPointMouth", forKey: .type)
            case .chin:
               try container.encode("maskPointChin", forKey: .type)
        }
  }
}

extension MessageContent {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum MessageTextKeys: String, CodingKey {
          case text
          case webPage
  }
  enum MessageAnimationKeys: String, CodingKey {
          case animation
          case caption
          case isSecret
  }
  enum MessageAudioKeys: String, CodingKey {
          case audio
          case caption
  }
  enum MessageDocumentKeys: String, CodingKey {
          case document
          case caption
  }
  enum MessagePhotoKeys: String, CodingKey {
          case photo
          case caption
          case isSecret
  }
  enum MessageStickerKeys: String, CodingKey {
          case sticker
  }
  enum MessageVideoKeys: String, CodingKey {
          case video
          case caption
          case isSecret
  }
  enum MessageVideoNoteKeys: String, CodingKey {
          case videoNote
          case isViewed
          case isSecret
  }
  enum MessageVoiceNoteKeys: String, CodingKey {
          case voiceNote
          case caption
          case isListened
  }
  enum MessageLocationKeys: String, CodingKey {
          case location
          case livePeriod
          case expiresIn
  }
  enum MessageVenueKeys: String, CodingKey {
          case venue
  }
  enum MessageContactKeys: String, CodingKey {
          case contact
  }
  enum MessageGameKeys: String, CodingKey {
          case game
  }
  enum MessagePollKeys: String, CodingKey {
          case poll
  }
  enum MessageInvoiceKeys: String, CodingKey {
          case title
          case description
          case photo
          case currency
          case totalAmount
          case startParameter
          case isTest
          case needShippingAddress
          case receiptMessageId
  }
  enum MessageCallKeys: String, CodingKey {
          case discardReason
          case duration
  }
  enum MessageBasicGroupChatCreateKeys: String, CodingKey {
          case title
          case memberUserIds
  }
  enum MessageSupergroupChatCreateKeys: String, CodingKey {
          case title
  }
  enum MessageChatChangeTitleKeys: String, CodingKey {
          case title
  }
  enum MessageChatChangePhotoKeys: String, CodingKey {
          case photo
  }
  enum MessageChatAddMembersKeys: String, CodingKey {
          case memberUserIds
  }
  enum MessageChatDeleteMemberKeys: String, CodingKey {
          case userId
  }
  enum MessageChatUpgradeToKeys: String, CodingKey {
          case supergroupId
  }
  enum MessageChatUpgradeFromKeys: String, CodingKey {
          case title
          case basicGroupId
  }
  enum MessagePinMessageKeys: String, CodingKey {
          case messageId
  }
  enum MessageChatSetTtlKeys: String, CodingKey {
          case ttl
  }
  enum MessageCustomServiceActionKeys: String, CodingKey {
          case text
  }
  enum MessageGameScoreKeys: String, CodingKey {
          case gameMessageId
          case gameId
          case score
  }
  enum MessagePaymentSuccessfulKeys: String, CodingKey {
          case invoiceMessageId
          case currency
          case totalAmount
  }
  enum MessagePaymentSuccessfulBotKeys: String, CodingKey {
          case invoiceMessageId
          case currency
          case totalAmount
          case invoicePayload
          case shippingOptionId
          case orderInfo
          case telegramPaymentChargeId
          case providerPaymentChargeId
  }
  enum MessageWebsiteConnectedKeys: String, CodingKey {
          case domainName
  }
  enum MessagePassportDataSentKeys: String, CodingKey {
          case types
  }
  enum MessagePassportDataReceivedKeys: String, CodingKey {
          case elements
          case credentials
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "messageText":
      let caseContainer = try decoder.container(keyedBy: MessageTextKeys.self)
      self = .messageText(
            text: try caseContainer.decode(FormattedText.self, forKey: .text),
              webPage: try caseContainer.decodeIfPresent(WebPage.self, forKey: .webPage)
        )
    case "messageAnimation":
      let caseContainer = try decoder.container(keyedBy: MessageAnimationKeys.self)
      self = .messageAnimation(
            animation: try caseContainer.decode(Animation.self, forKey: .animation),
            caption: try caseContainer.decode(FormattedText.self, forKey: .caption),
            isSecret: try caseContainer.decode(Bool.self, forKey: .isSecret)
        )
    case "messageAudio":
      let caseContainer = try decoder.container(keyedBy: MessageAudioKeys.self)
      self = .messageAudio(
            audio: try caseContainer.decode(Audio.self, forKey: .audio),
            caption: try caseContainer.decode(FormattedText.self, forKey: .caption)
        )
    case "messageDocument":
      let caseContainer = try decoder.container(keyedBy: MessageDocumentKeys.self)
      self = .messageDocument(
            document: try caseContainer.decode(Document.self, forKey: .document),
            caption: try caseContainer.decode(FormattedText.self, forKey: .caption)
        )
    case "messagePhoto":
      let caseContainer = try decoder.container(keyedBy: MessagePhotoKeys.self)
      self = .messagePhoto(
            photo: try caseContainer.decode(Photo.self, forKey: .photo),
            caption: try caseContainer.decode(FormattedText.self, forKey: .caption),
            isSecret: try caseContainer.decode(Bool.self, forKey: .isSecret)
        )
    case "messageExpiredPhoto":
      self = .messageExpiredPhoto
    case "messageSticker":
      let caseContainer = try decoder.container(keyedBy: MessageStickerKeys.self)
      self = .messageSticker(
            sticker: try caseContainer.decode(Sticker.self, forKey: .sticker)
        )
    case "messageVideo":
      let caseContainer = try decoder.container(keyedBy: MessageVideoKeys.self)
      self = .messageVideo(
            video: try caseContainer.decode(Video.self, forKey: .video),
            caption: try caseContainer.decode(FormattedText.self, forKey: .caption),
            isSecret: try caseContainer.decode(Bool.self, forKey: .isSecret)
        )
    case "messageExpiredVideo":
      self = .messageExpiredVideo
    case "messageVideoNote":
      let caseContainer = try decoder.container(keyedBy: MessageVideoNoteKeys.self)
      self = .messageVideoNote(
            videoNote: try caseContainer.decode(VideoNote.self, forKey: .videoNote),
            isViewed: try caseContainer.decode(Bool.self, forKey: .isViewed),
            isSecret: try caseContainer.decode(Bool.self, forKey: .isSecret)
        )
    case "messageVoiceNote":
      let caseContainer = try decoder.container(keyedBy: MessageVoiceNoteKeys.self)
      self = .messageVoiceNote(
            voiceNote: try caseContainer.decode(VoiceNote.self, forKey: .voiceNote),
            caption: try caseContainer.decode(FormattedText.self, forKey: .caption),
            isListened: try caseContainer.decode(Bool.self, forKey: .isListened)
        )
    case "messageLocation":
      let caseContainer = try decoder.container(keyedBy: MessageLocationKeys.self)
      self = .messageLocation(
            location: try caseContainer.decode(Location.self, forKey: .location),
            livePeriod: try caseContainer.decode(Int32.self, forKey: .livePeriod),
            expiresIn: try caseContainer.decode(Int32.self, forKey: .expiresIn)
        )
    case "messageVenue":
      let caseContainer = try decoder.container(keyedBy: MessageVenueKeys.self)
      self = .messageVenue(
            venue: try caseContainer.decode(Venue.self, forKey: .venue)
        )
    case "messageContact":
      let caseContainer = try decoder.container(keyedBy: MessageContactKeys.self)
      self = .messageContact(
            contact: try caseContainer.decode(Contact.self, forKey: .contact)
        )
    case "messageGame":
      let caseContainer = try decoder.container(keyedBy: MessageGameKeys.self)
      self = .messageGame(
            game: try caseContainer.decode(Game.self, forKey: .game)
        )
    case "messagePoll":
      let caseContainer = try decoder.container(keyedBy: MessagePollKeys.self)
      self = .messagePoll(
            poll: try caseContainer.decode(Poll.self, forKey: .poll)
        )
    case "messageInvoice":
      let caseContainer = try decoder.container(keyedBy: MessageInvoiceKeys.self)
      self = .messageInvoice(
            title: try caseContainer.decode(String.self, forKey: .title),
            description: try caseContainer.decode(String.self, forKey: .description),
              photo: try caseContainer.decodeIfPresent(Photo.self, forKey: .photo),
            currency: try caseContainer.decode(String.self, forKey: .currency),
            totalAmount: try caseContainer.decode(Int53.self, forKey: .totalAmount),
            startParameter: try caseContainer.decode(String.self, forKey: .startParameter),
            isTest: try caseContainer.decode(Bool.self, forKey: .isTest),
            needShippingAddress: try caseContainer.decode(Bool.self, forKey: .needShippingAddress),
            receiptMessageId: try caseContainer.decode(Int53.self, forKey: .receiptMessageId)
        )
    case "messageCall":
      let caseContainer = try decoder.container(keyedBy: MessageCallKeys.self)
      self = .messageCall(
            discardReason: try caseContainer.decode(CallDiscardReason.self, forKey: .discardReason),
            duration: try caseContainer.decode(Int32.self, forKey: .duration)
        )
    case "messageBasicGroupChatCreate":
      let caseContainer = try decoder.container(keyedBy: MessageBasicGroupChatCreateKeys.self)
      self = .messageBasicGroupChatCreate(
            title: try caseContainer.decode(String.self, forKey: .title),
            memberUserIds: try caseContainer.decode([Int32].self, forKey: .memberUserIds)
        )
    case "messageSupergroupChatCreate":
      let caseContainer = try decoder.container(keyedBy: MessageSupergroupChatCreateKeys.self)
      self = .messageSupergroupChatCreate(
            title: try caseContainer.decode(String.self, forKey: .title)
        )
    case "messageChatChangeTitle":
      let caseContainer = try decoder.container(keyedBy: MessageChatChangeTitleKeys.self)
      self = .messageChatChangeTitle(
            title: try caseContainer.decode(String.self, forKey: .title)
        )
    case "messageChatChangePhoto":
      let caseContainer = try decoder.container(keyedBy: MessageChatChangePhotoKeys.self)
      self = .messageChatChangePhoto(
            photo: try caseContainer.decode(Photo.self, forKey: .photo)
        )
    case "messageChatDeletePhoto":
      self = .messageChatDeletePhoto
    case "messageChatAddMembers":
      let caseContainer = try decoder.container(keyedBy: MessageChatAddMembersKeys.self)
      self = .messageChatAddMembers(
            memberUserIds: try caseContainer.decode([Int32].self, forKey: .memberUserIds)
        )
    case "messageChatJoinByLink":
      self = .messageChatJoinByLink
    case "messageChatDeleteMember":
      let caseContainer = try decoder.container(keyedBy: MessageChatDeleteMemberKeys.self)
      self = .messageChatDeleteMember(
            userId: try caseContainer.decode(Int32.self, forKey: .userId)
        )
    case "messageChatUpgradeTo":
      let caseContainer = try decoder.container(keyedBy: MessageChatUpgradeToKeys.self)
      self = .messageChatUpgradeTo(
            supergroupId: try caseContainer.decode(Int32.self, forKey: .supergroupId)
        )
    case "messageChatUpgradeFrom":
      let caseContainer = try decoder.container(keyedBy: MessageChatUpgradeFromKeys.self)
      self = .messageChatUpgradeFrom(
            title: try caseContainer.decode(String.self, forKey: .title),
            basicGroupId: try caseContainer.decode(Int32.self, forKey: .basicGroupId)
        )
    case "messagePinMessage":
      let caseContainer = try decoder.container(keyedBy: MessagePinMessageKeys.self)
      self = .messagePinMessage(
            messageId: try caseContainer.decode(Int53.self, forKey: .messageId)
        )
    case "messageScreenshotTaken":
      self = .messageScreenshotTaken
    case "messageChatSetTtl":
      let caseContainer = try decoder.container(keyedBy: MessageChatSetTtlKeys.self)
      self = .messageChatSetTtl(
            ttl: try caseContainer.decode(Int32.self, forKey: .ttl)
        )
    case "messageCustomServiceAction":
      let caseContainer = try decoder.container(keyedBy: MessageCustomServiceActionKeys.self)
      self = .messageCustomServiceAction(
            text: try caseContainer.decode(String.self, forKey: .text)
        )
    case "messageGameScore":
      let caseContainer = try decoder.container(keyedBy: MessageGameScoreKeys.self)
      self = .messageGameScore(
            gameMessageId: try caseContainer.decode(Int53.self, forKey: .gameMessageId),
            gameId: try caseContainer.decode(TDInt64.self, forKey: .gameId),
            score: try caseContainer.decode(Int32.self, forKey: .score)
        )
    case "messagePaymentSuccessful":
      let caseContainer = try decoder.container(keyedBy: MessagePaymentSuccessfulKeys.self)
      self = .messagePaymentSuccessful(
            invoiceMessageId: try caseContainer.decode(Int53.self, forKey: .invoiceMessageId),
            currency: try caseContainer.decode(String.self, forKey: .currency),
            totalAmount: try caseContainer.decode(Int53.self, forKey: .totalAmount)
        )
    case "messagePaymentSuccessfulBot":
      let caseContainer = try decoder.container(keyedBy: MessagePaymentSuccessfulBotKeys.self)
      self = .messagePaymentSuccessfulBot(
            invoiceMessageId: try caseContainer.decode(Int53.self, forKey: .invoiceMessageId),
            currency: try caseContainer.decode(String.self, forKey: .currency),
            totalAmount: try caseContainer.decode(Int53.self, forKey: .totalAmount),
            invoicePayload: try caseContainer.decode(Bytes.self, forKey: .invoicePayload),
            shippingOptionId: try caseContainer.decode(String.self, forKey: .shippingOptionId),
              orderInfo: try caseContainer.decodeIfPresent(OrderInfo.self, forKey: .orderInfo),
            telegramPaymentChargeId: try caseContainer.decode(String.self, forKey: .telegramPaymentChargeId),
            providerPaymentChargeId: try caseContainer.decode(String.self, forKey: .providerPaymentChargeId)
        )
    case "messageContactRegistered":
      self = .messageContactRegistered
    case "messageWebsiteConnected":
      let caseContainer = try decoder.container(keyedBy: MessageWebsiteConnectedKeys.self)
      self = .messageWebsiteConnected(
            domainName: try caseContainer.decode(String.self, forKey: .domainName)
        )
    case "messagePassportDataSent":
      let caseContainer = try decoder.container(keyedBy: MessagePassportDataSentKeys.self)
      self = .messagePassportDataSent(
            types: try caseContainer.decode([PassportElementType].self, forKey: .types)
        )
    case "messagePassportDataReceived":
      let caseContainer = try decoder.container(keyedBy: MessagePassportDataReceivedKeys.self)
      self = .messagePassportDataReceived(
            elements: try caseContainer.decode([EncryptedPassportElement].self, forKey: .elements),
            credentials: try caseContainer.decode(EncryptedCredentials.self, forKey: .credentials)
        )
    case "messageUnsupported":
      self = .messageUnsupported
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .messageText(
                let text,
                let webPage):
               try container.encode("messageText", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageTextKeys.self)
                      try caseContainer.encode(text, forKey: .text)
                      try caseContainer.encodeIfPresent(webPage, forKey: .webPage)
            case .messageAnimation(
                let animation,
                let caption,
                let isSecret):
               try container.encode("messageAnimation", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageAnimationKeys.self)
                      try caseContainer.encode(animation, forKey: .animation)
                      try caseContainer.encode(caption, forKey: .caption)
                      try caseContainer.encode(isSecret, forKey: .isSecret)
            case .messageAudio(
                let audio,
                let caption):
               try container.encode("messageAudio", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageAudioKeys.self)
                      try caseContainer.encode(audio, forKey: .audio)
                      try caseContainer.encode(caption, forKey: .caption)
            case .messageDocument(
                let document,
                let caption):
               try container.encode("messageDocument", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageDocumentKeys.self)
                      try caseContainer.encode(document, forKey: .document)
                      try caseContainer.encode(caption, forKey: .caption)
            case .messagePhoto(
                let photo,
                let caption,
                let isSecret):
               try container.encode("messagePhoto", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessagePhotoKeys.self)
                      try caseContainer.encode(photo, forKey: .photo)
                      try caseContainer.encode(caption, forKey: .caption)
                      try caseContainer.encode(isSecret, forKey: .isSecret)
            case .messageExpiredPhoto:
               try container.encode("messageExpiredPhoto", forKey: .type)
            case .messageSticker(
                let sticker):
               try container.encode("messageSticker", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageStickerKeys.self)
                      try caseContainer.encode(sticker, forKey: .sticker)
            case .messageVideo(
                let video,
                let caption,
                let isSecret):
               try container.encode("messageVideo", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageVideoKeys.self)
                      try caseContainer.encode(video, forKey: .video)
                      try caseContainer.encode(caption, forKey: .caption)
                      try caseContainer.encode(isSecret, forKey: .isSecret)
            case .messageExpiredVideo:
               try container.encode("messageExpiredVideo", forKey: .type)
            case .messageVideoNote(
                let videoNote,
                let isViewed,
                let isSecret):
               try container.encode("messageVideoNote", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageVideoNoteKeys.self)
                      try caseContainer.encode(videoNote, forKey: .videoNote)
                      try caseContainer.encode(isViewed, forKey: .isViewed)
                      try caseContainer.encode(isSecret, forKey: .isSecret)
            case .messageVoiceNote(
                let voiceNote,
                let caption,
                let isListened):
               try container.encode("messageVoiceNote", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageVoiceNoteKeys.self)
                      try caseContainer.encode(voiceNote, forKey: .voiceNote)
                      try caseContainer.encode(caption, forKey: .caption)
                      try caseContainer.encode(isListened, forKey: .isListened)
            case .messageLocation(
                let location,
                let livePeriod,
                let expiresIn):
               try container.encode("messageLocation", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageLocationKeys.self)
                      try caseContainer.encode(location, forKey: .location)
                      try caseContainer.encode(livePeriod, forKey: .livePeriod)
                      try caseContainer.encode(expiresIn, forKey: .expiresIn)
            case .messageVenue(
                let venue):
               try container.encode("messageVenue", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageVenueKeys.self)
                      try caseContainer.encode(venue, forKey: .venue)
            case .messageContact(
                let contact):
               try container.encode("messageContact", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageContactKeys.self)
                      try caseContainer.encode(contact, forKey: .contact)
            case .messageGame(
                let game):
               try container.encode("messageGame", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageGameKeys.self)
                      try caseContainer.encode(game, forKey: .game)
            case .messagePoll(
                let poll):
               try container.encode("messagePoll", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessagePollKeys.self)
                      try caseContainer.encode(poll, forKey: .poll)
            case .messageInvoice(
                let title,
                let description,
                let photo,
                let currency,
                let totalAmount,
                let startParameter,
                let isTest,
                let needShippingAddress,
                let receiptMessageId):
               try container.encode("messageInvoice", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageInvoiceKeys.self)
                      try caseContainer.encode(title, forKey: .title)
                      try caseContainer.encode(description, forKey: .description)
                      try caseContainer.encodeIfPresent(photo, forKey: .photo)
                      try caseContainer.encode(currency, forKey: .currency)
                      try caseContainer.encode(totalAmount, forKey: .totalAmount)
                      try caseContainer.encode(startParameter, forKey: .startParameter)
                      try caseContainer.encode(isTest, forKey: .isTest)
                      try caseContainer.encode(needShippingAddress, forKey: .needShippingAddress)
                      try caseContainer.encode(receiptMessageId, forKey: .receiptMessageId)
            case .messageCall(
                let discardReason,
                let duration):
               try container.encode("messageCall", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageCallKeys.self)
                      try caseContainer.encode(discardReason, forKey: .discardReason)
                      try caseContainer.encode(duration, forKey: .duration)
            case .messageBasicGroupChatCreate(
                let title,
                let memberUserIds):
               try container.encode("messageBasicGroupChatCreate", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageBasicGroupChatCreateKeys.self)
                      try caseContainer.encode(title, forKey: .title)
                      try caseContainer.encode(memberUserIds, forKey: .memberUserIds)
            case .messageSupergroupChatCreate(
                let title):
               try container.encode("messageSupergroupChatCreate", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageSupergroupChatCreateKeys.self)
                      try caseContainer.encode(title, forKey: .title)
            case .messageChatChangeTitle(
                let title):
               try container.encode("messageChatChangeTitle", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageChatChangeTitleKeys.self)
                      try caseContainer.encode(title, forKey: .title)
            case .messageChatChangePhoto(
                let photo):
               try container.encode("messageChatChangePhoto", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageChatChangePhotoKeys.self)
                      try caseContainer.encode(photo, forKey: .photo)
            case .messageChatDeletePhoto:
               try container.encode("messageChatDeletePhoto", forKey: .type)
            case .messageChatAddMembers(
                let memberUserIds):
               try container.encode("messageChatAddMembers", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageChatAddMembersKeys.self)
                      try caseContainer.encode(memberUserIds, forKey: .memberUserIds)
            case .messageChatJoinByLink:
               try container.encode("messageChatJoinByLink", forKey: .type)
            case .messageChatDeleteMember(
                let userId):
               try container.encode("messageChatDeleteMember", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageChatDeleteMemberKeys.self)
                      try caseContainer.encode(userId, forKey: .userId)
            case .messageChatUpgradeTo(
                let supergroupId):
               try container.encode("messageChatUpgradeTo", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageChatUpgradeToKeys.self)
                      try caseContainer.encode(supergroupId, forKey: .supergroupId)
            case .messageChatUpgradeFrom(
                let title,
                let basicGroupId):
               try container.encode("messageChatUpgradeFrom", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageChatUpgradeFromKeys.self)
                      try caseContainer.encode(title, forKey: .title)
                      try caseContainer.encode(basicGroupId, forKey: .basicGroupId)
            case .messagePinMessage(
                let messageId):
               try container.encode("messagePinMessage", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessagePinMessageKeys.self)
                      try caseContainer.encode(messageId, forKey: .messageId)
            case .messageScreenshotTaken:
               try container.encode("messageScreenshotTaken", forKey: .type)
            case .messageChatSetTtl(
                let ttl):
               try container.encode("messageChatSetTtl", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageChatSetTtlKeys.self)
                      try caseContainer.encode(ttl, forKey: .ttl)
            case .messageCustomServiceAction(
                let text):
               try container.encode("messageCustomServiceAction", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageCustomServiceActionKeys.self)
                      try caseContainer.encode(text, forKey: .text)
            case .messageGameScore(
                let gameMessageId,
                let gameId,
                let score):
               try container.encode("messageGameScore", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageGameScoreKeys.self)
                      try caseContainer.encode(gameMessageId, forKey: .gameMessageId)
                      try caseContainer.encode(gameId, forKey: .gameId)
                      try caseContainer.encode(score, forKey: .score)
            case .messagePaymentSuccessful(
                let invoiceMessageId,
                let currency,
                let totalAmount):
               try container.encode("messagePaymentSuccessful", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessagePaymentSuccessfulKeys.self)
                      try caseContainer.encode(invoiceMessageId, forKey: .invoiceMessageId)
                      try caseContainer.encode(currency, forKey: .currency)
                      try caseContainer.encode(totalAmount, forKey: .totalAmount)
            case .messagePaymentSuccessfulBot(
                let invoiceMessageId,
                let currency,
                let totalAmount,
                let invoicePayload,
                let shippingOptionId,
                let orderInfo,
                let telegramPaymentChargeId,
                let providerPaymentChargeId):
               try container.encode("messagePaymentSuccessfulBot", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessagePaymentSuccessfulBotKeys.self)
                      try caseContainer.encode(invoiceMessageId, forKey: .invoiceMessageId)
                      try caseContainer.encode(currency, forKey: .currency)
                      try caseContainer.encode(totalAmount, forKey: .totalAmount)
                      try caseContainer.encode(invoicePayload, forKey: .invoicePayload)
                      try caseContainer.encode(shippingOptionId, forKey: .shippingOptionId)
                      try caseContainer.encodeIfPresent(orderInfo, forKey: .orderInfo)
                      try caseContainer.encode(telegramPaymentChargeId, forKey: .telegramPaymentChargeId)
                      try caseContainer.encode(providerPaymentChargeId, forKey: .providerPaymentChargeId)
            case .messageContactRegistered:
               try container.encode("messageContactRegistered", forKey: .type)
            case .messageWebsiteConnected(
                let domainName):
               try container.encode("messageWebsiteConnected", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageWebsiteConnectedKeys.self)
                      try caseContainer.encode(domainName, forKey: .domainName)
            case .messagePassportDataSent(
                let types):
               try container.encode("messagePassportDataSent", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessagePassportDataSentKeys.self)
                      try caseContainer.encode(types, forKey: .types)
            case .messagePassportDataReceived(
                let elements,
                let credentials):
               try container.encode("messagePassportDataReceived", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessagePassportDataReceivedKeys.self)
                      try caseContainer.encode(elements, forKey: .elements)
                      try caseContainer.encode(credentials, forKey: .credentials)
            case .messageUnsupported:
               try container.encode("messageUnsupported", forKey: .type)
        }
  }
}

extension MessageForwardOrigin {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum UserKeys: String, CodingKey {
          case senderUserId
  }
  enum HiddenUserKeys: String, CodingKey {
          case senderName
  }
  enum ChannelKeys: String, CodingKey {
          case chatId
          case messageId
          case authorSignature
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "messageForwardOriginUser":
      let caseContainer = try decoder.container(keyedBy: UserKeys.self)
      self = .user(
            senderUserId: try caseContainer.decode(Int32.self, forKey: .senderUserId)
        )
    case "messageForwardOriginHiddenUser":
      let caseContainer = try decoder.container(keyedBy: HiddenUserKeys.self)
      self = .hiddenUser(
            senderName: try caseContainer.decode(String.self, forKey: .senderName)
        )
    case "messageForwardOriginChannel":
      let caseContainer = try decoder.container(keyedBy: ChannelKeys.self)
      self = .channel(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
            messageId: try caseContainer.decode(Int53.self, forKey: .messageId),
            authorSignature: try caseContainer.decode(String.self, forKey: .authorSignature)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .user(
                let senderUserId):
               try container.encode("messageForwardOriginUser", forKey: .type)
                var caseContainer = encoder.container(keyedBy: UserKeys.self)
                      try caseContainer.encode(senderUserId, forKey: .senderUserId)
            case .hiddenUser(
                let senderName):
               try container.encode("messageForwardOriginHiddenUser", forKey: .type)
                var caseContainer = encoder.container(keyedBy: HiddenUserKeys.self)
                      try caseContainer.encode(senderName, forKey: .senderName)
            case .channel(
                let chatId,
                let messageId,
                let authorSignature):
               try container.encode("messageForwardOriginChannel", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChannelKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encode(messageId, forKey: .messageId)
                      try caseContainer.encode(authorSignature, forKey: .authorSignature)
        }
  }
}

extension MessageSchedulingState {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum SendAtDateKeys: String, CodingKey {
          case sendDate
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "messageSchedulingStateSendAtDate":
      let caseContainer = try decoder.container(keyedBy: SendAtDateKeys.self)
      self = .sendAtDate(
              sendDate: try caseContainer.decodeIfPresent(Int32.self, forKey: .sendDate)
        )
    case "messageSchedulingStateSendWhenOnline":
      self = .sendWhenOnline
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .sendAtDate(
                let sendDate):
               try container.encode("messageSchedulingStateSendAtDate", forKey: .type)
                var caseContainer = encoder.container(keyedBy: SendAtDateKeys.self)
                      try caseContainer.encodeIfPresent(sendDate, forKey: .sendDate)
            case .sendWhenOnline:
               try container.encode("messageSchedulingStateSendWhenOnline", forKey: .type)
        }
  }
}

extension MessageSendingState {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum FailedKeys: String, CodingKey {
          case errorCode
          case errorMessage
          case canRetry
          case retryAfter
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "messageSendingStatePending":
      self = .pending
    case "messageSendingStateFailed":
      let caseContainer = try decoder.container(keyedBy: FailedKeys.self)
      self = .failed(
            errorCode: try caseContainer.decode(Int32.self, forKey: .errorCode),
            errorMessage: try caseContainer.decode(String.self, forKey: .errorMessage),
            canRetry: try caseContainer.decode(Bool.self, forKey: .canRetry),
            retryAfter: try caseContainer.decode(Double.self, forKey: .retryAfter)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .pending:
               try container.encode("messageSendingStatePending", forKey: .type)
            case .failed(
                let errorCode,
                let errorMessage,
                let canRetry,
                let retryAfter):
               try container.encode("messageSendingStateFailed", forKey: .type)
                var caseContainer = encoder.container(keyedBy: FailedKeys.self)
                      try caseContainer.encode(errorCode, forKey: .errorCode)
                      try caseContainer.encode(errorMessage, forKey: .errorMessage)
                      try caseContainer.encode(canRetry, forKey: .canRetry)
                      try caseContainer.encode(retryAfter, forKey: .retryAfter)
        }
  }
}

extension NetworkStatisticsEntry {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum FileKeys: String, CodingKey {
          case fileType
          case networkType
          case sentBytes
          case receivedBytes
  }
  enum CallKeys: String, CodingKey {
          case networkType
          case sentBytes
          case receivedBytes
          case duration
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "networkStatisticsEntryFile":
      let caseContainer = try decoder.container(keyedBy: FileKeys.self)
      self = .file(
              fileType: try caseContainer.decodeIfPresent(FileType.self, forKey: .fileType),
            networkType: try caseContainer.decode(NetworkType.self, forKey: .networkType),
            sentBytes: try caseContainer.decode(Int53.self, forKey: .sentBytes),
            receivedBytes: try caseContainer.decode(Int53.self, forKey: .receivedBytes)
        )
    case "networkStatisticsEntryCall":
      let caseContainer = try decoder.container(keyedBy: CallKeys.self)
      self = .call(
              networkType: try caseContainer.decodeIfPresent(NetworkType.self, forKey: .networkType),
              sentBytes: try caseContainer.decodeIfPresent(Int53.self, forKey: .sentBytes),
              receivedBytes: try caseContainer.decodeIfPresent(Int53.self, forKey: .receivedBytes),
              duration: try caseContainer.decodeIfPresent(Double.self, forKey: .duration)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .file(
                let fileType,
                let networkType,
                let sentBytes,
                let receivedBytes):
               try container.encode("networkStatisticsEntryFile", forKey: .type)
                var caseContainer = encoder.container(keyedBy: FileKeys.self)
                      try caseContainer.encodeIfPresent(fileType, forKey: .fileType)
                      try caseContainer.encode(networkType, forKey: .networkType)
                      try caseContainer.encode(sentBytes, forKey: .sentBytes)
                      try caseContainer.encode(receivedBytes, forKey: .receivedBytes)
            case .call(
                let networkType,
                let sentBytes,
                let receivedBytes,
                let duration):
               try container.encode("networkStatisticsEntryCall", forKey: .type)
                var caseContainer = encoder.container(keyedBy: CallKeys.self)
                      try caseContainer.encodeIfPresent(networkType, forKey: .networkType)
                      try caseContainer.encodeIfPresent(sentBytes, forKey: .sentBytes)
                      try caseContainer.encodeIfPresent(receivedBytes, forKey: .receivedBytes)
                      try caseContainer.encodeIfPresent(duration, forKey: .duration)
        }
  }
}

extension NetworkType {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "networkTypeNone":
      self = .none
    case "networkTypeMobile":
      self = .mobile
    case "networkTypeMobileRoaming":
      self = .mobileRoaming
    case "networkTypeWiFi":
      self = .wiFi
    case "networkTypeOther":
      self = .other
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .none:
               try container.encode("networkTypeNone", forKey: .type)
            case .mobile:
               try container.encode("networkTypeMobile", forKey: .type)
            case .mobileRoaming:
               try container.encode("networkTypeMobileRoaming", forKey: .type)
            case .wiFi:
               try container.encode("networkTypeWiFi", forKey: .type)
            case .other:
               try container.encode("networkTypeOther", forKey: .type)
        }
  }
}

extension NotificationGroupType {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "notificationGroupTypeMessages":
      self = .messages
    case "notificationGroupTypeMentions":
      self = .mentions
    case "notificationGroupTypeSecretChat":
      self = .secretChat
    case "notificationGroupTypeCalls":
      self = .calls
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .messages:
               try container.encode("notificationGroupTypeMessages", forKey: .type)
            case .mentions:
               try container.encode("notificationGroupTypeMentions", forKey: .type)
            case .secretChat:
               try container.encode("notificationGroupTypeSecretChat", forKey: .type)
            case .calls:
               try container.encode("notificationGroupTypeCalls", forKey: .type)
        }
  }
}

extension NotificationSettingsScope {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "notificationSettingsScopePrivateChats":
      self = .privateChats
    case "notificationSettingsScopeGroupChats":
      self = .groupChats
    case "notificationSettingsScopeChannelChats":
      self = .channelChats
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .privateChats:
               try container.encode("notificationSettingsScopePrivateChats", forKey: .type)
            case .groupChats:
               try container.encode("notificationSettingsScopeGroupChats", forKey: .type)
            case .channelChats:
               try container.encode("notificationSettingsScopeChannelChats", forKey: .type)
        }
  }
}

extension NotificationType {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum NewMessageKeys: String, CodingKey {
          case message
  }
  enum NewCallKeys: String, CodingKey {
          case callId
  }
  enum NewPushMessageKeys: String, CodingKey {
          case messageId
          case senderUserId
          case content
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "notificationTypeNewMessage":
      let caseContainer = try decoder.container(keyedBy: NewMessageKeys.self)
      self = .newMessage(
            message: try caseContainer.decode(Message.self, forKey: .message)
        )
    case "notificationTypeNewSecretChat":
      self = .newSecretChat
    case "notificationTypeNewCall":
      let caseContainer = try decoder.container(keyedBy: NewCallKeys.self)
      self = .newCall(
            callId: try caseContainer.decode(Int32.self, forKey: .callId)
        )
    case "notificationTypeNewPushMessage":
      let caseContainer = try decoder.container(keyedBy: NewPushMessageKeys.self)
      self = .newPushMessage(
            messageId: try caseContainer.decode(Int53.self, forKey: .messageId),
            senderUserId: try caseContainer.decode(Int32.self, forKey: .senderUserId),
            content: try caseContainer.decode(PushMessageContent.self, forKey: .content)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .newMessage(
                let message):
               try container.encode("notificationTypeNewMessage", forKey: .type)
                var caseContainer = encoder.container(keyedBy: NewMessageKeys.self)
                      try caseContainer.encode(message, forKey: .message)
            case .newSecretChat:
               try container.encode("notificationTypeNewSecretChat", forKey: .type)
            case .newCall(
                let callId):
               try container.encode("notificationTypeNewCall", forKey: .type)
                var caseContainer = encoder.container(keyedBy: NewCallKeys.self)
                      try caseContainer.encode(callId, forKey: .callId)
            case .newPushMessage(
                let messageId,
                let senderUserId,
                let content):
               try container.encode("notificationTypeNewPushMessage", forKey: .type)
                var caseContainer = encoder.container(keyedBy: NewPushMessageKeys.self)
                      try caseContainer.encode(messageId, forKey: .messageId)
                      try caseContainer.encode(senderUserId, forKey: .senderUserId)
                      try caseContainer.encode(content, forKey: .content)
        }
  }
}

extension OptionValue {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum BooleanKeys: String, CodingKey {
          case value
  }
  enum IntegerKeys: String, CodingKey {
          case value
  }
  enum StringKeys: String, CodingKey {
          case value
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "optionValueBoolean":
      let caseContainer = try decoder.container(keyedBy: BooleanKeys.self)
      self = .boolean(
            value: try caseContainer.decode(Bool.self, forKey: .value)
        )
    case "optionValueEmpty":
      self = .empty
    case "optionValueInteger":
      let caseContainer = try decoder.container(keyedBy: IntegerKeys.self)
      self = .integer(
            value: try caseContainer.decode(Int32.self, forKey: .value)
        )
    case "optionValueString":
      let caseContainer = try decoder.container(keyedBy: StringKeys.self)
      self = .string(
              value: try caseContainer.decodeIfPresent(String.self, forKey: .value)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .boolean(
                let value):
               try container.encode("optionValueBoolean", forKey: .type)
                var caseContainer = encoder.container(keyedBy: BooleanKeys.self)
                      try caseContainer.encode(value, forKey: .value)
            case .empty:
               try container.encode("optionValueEmpty", forKey: .type)
            case .integer(
                let value):
               try container.encode("optionValueInteger", forKey: .type)
                var caseContainer = encoder.container(keyedBy: IntegerKeys.self)
                      try caseContainer.encode(value, forKey: .value)
            case .string(
                let value):
               try container.encode("optionValueString", forKey: .type)
                var caseContainer = encoder.container(keyedBy: StringKeys.self)
                      try caseContainer.encodeIfPresent(value, forKey: .value)
        }
  }
}

extension PageBlock {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum TitleKeys: String, CodingKey {
          case title
  }
  enum SubtitleKeys: String, CodingKey {
          case subtitle
  }
  enum AuthorDateKeys: String, CodingKey {
          case author
          case publishDate
  }
  enum HeaderKeys: String, CodingKey {
          case header
  }
  enum SubheaderKeys: String, CodingKey {
          case subheader
  }
  enum KickerKeys: String, CodingKey {
          case kicker
  }
  enum ParagraphKeys: String, CodingKey {
          case text
  }
  enum PreformattedKeys: String, CodingKey {
          case text
          case language
  }
  enum FooterKeys: String, CodingKey {
          case footer
  }
  enum AnchorKeys: String, CodingKey {
          case name
  }
  enum ListKeys: String, CodingKey {
          case items
  }
  enum BlockQuoteKeys: String, CodingKey {
          case text
          case credit
  }
  enum PullQuoteKeys: String, CodingKey {
          case text
          case credit
  }
  enum AnimationKeys: String, CodingKey {
          case animation
          case caption
          case needAutoplay
  }
  enum AudioKeys: String, CodingKey {
          case audio
          case caption
  }
  enum PhotoKeys: String, CodingKey {
          case photo
          case caption
          case url
  }
  enum VideoKeys: String, CodingKey {
          case video
          case caption
          case needAutoplay
          case isLooped
  }
  enum VoiceNoteKeys: String, CodingKey {
          case voiceNote
          case caption
  }
  enum CoverKeys: String, CodingKey {
          case cover
  }
  enum EmbeddedKeys: String, CodingKey {
          case url
          case html
          case posterPhoto
          case width
          case height
          case caption
          case isFullWidth
          case allowScrolling
  }
  enum EmbeddedPostKeys: String, CodingKey {
          case url
          case author
          case authorPhoto
          case date
          case pageBlocks
          case caption
  }
  enum CollageKeys: String, CodingKey {
          case pageBlocks
          case caption
  }
  enum SlideshowKeys: String, CodingKey {
          case pageBlocks
          case caption
  }
  enum ChatLinkKeys: String, CodingKey {
          case title
          case photo
          case username
  }
  enum TableKeys: String, CodingKey {
          case caption
          case cells
          case isBordered
          case isStriped
  }
  enum DetailsKeys: String, CodingKey {
          case header
          case pageBlocks
          case isOpen
  }
  enum RelatedArticlesKeys: String, CodingKey {
          case header
          case articles
  }
  enum MapKeys: String, CodingKey {
          case location
          case zoom
          case width
          case height
          case caption
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "pageBlockTitle":
      let caseContainer = try decoder.container(keyedBy: TitleKeys.self)
      self = .title(
            title: try caseContainer.decode(RichText.self, forKey: .title)
        )
    case "pageBlockSubtitle":
      let caseContainer = try decoder.container(keyedBy: SubtitleKeys.self)
      self = .subtitle(
            subtitle: try caseContainer.decode(RichText.self, forKey: .subtitle)
        )
    case "pageBlockAuthorDate":
      let caseContainer = try decoder.container(keyedBy: AuthorDateKeys.self)
      self = .authorDate(
            author: try caseContainer.decode(RichText.self, forKey: .author),
            publishDate: try caseContainer.decode(Int32.self, forKey: .publishDate)
        )
    case "pageBlockHeader":
      let caseContainer = try decoder.container(keyedBy: HeaderKeys.self)
      self = .header(
            header: try caseContainer.decode(RichText.self, forKey: .header)
        )
    case "pageBlockSubheader":
      let caseContainer = try decoder.container(keyedBy: SubheaderKeys.self)
      self = .subheader(
            subheader: try caseContainer.decode(RichText.self, forKey: .subheader)
        )
    case "pageBlockKicker":
      let caseContainer = try decoder.container(keyedBy: KickerKeys.self)
      self = .kicker(
            kicker: try caseContainer.decode(RichText.self, forKey: .kicker)
        )
    case "pageBlockParagraph":
      let caseContainer = try decoder.container(keyedBy: ParagraphKeys.self)
      self = .paragraph(
            text: try caseContainer.decode(RichText.self, forKey: .text)
        )
    case "pageBlockPreformatted":
      let caseContainer = try decoder.container(keyedBy: PreformattedKeys.self)
      self = .preformatted(
            text: try caseContainer.decode(RichText.self, forKey: .text),
            language: try caseContainer.decode(String.self, forKey: .language)
        )
    case "pageBlockFooter":
      let caseContainer = try decoder.container(keyedBy: FooterKeys.self)
      self = .footer(
            footer: try caseContainer.decode(RichText.self, forKey: .footer)
        )
    case "pageBlockDivider":
      self = .divider
    case "pageBlockAnchor":
      let caseContainer = try decoder.container(keyedBy: AnchorKeys.self)
      self = .anchor(
            name: try caseContainer.decode(String.self, forKey: .name)
        )
    case "pageBlockList":
      let caseContainer = try decoder.container(keyedBy: ListKeys.self)
      self = .list(
            items: try caseContainer.decode([PageBlockListItem].self, forKey: .items)
        )
    case "pageBlockBlockQuote":
      let caseContainer = try decoder.container(keyedBy: BlockQuoteKeys.self)
      self = .blockQuote(
            text: try caseContainer.decode(RichText.self, forKey: .text),
            credit: try caseContainer.decode(RichText.self, forKey: .credit)
        )
    case "pageBlockPullQuote":
      let caseContainer = try decoder.container(keyedBy: PullQuoteKeys.self)
      self = .pullQuote(
            text: try caseContainer.decode(RichText.self, forKey: .text),
            credit: try caseContainer.decode(RichText.self, forKey: .credit)
        )
    case "pageBlockAnimation":
      let caseContainer = try decoder.container(keyedBy: AnimationKeys.self)
      self = .animation(
              animation: try caseContainer.decodeIfPresent(Animation.self, forKey: .animation),
            caption: try caseContainer.decode(PageBlockCaption.self, forKey: .caption),
            needAutoplay: try caseContainer.decode(Bool.self, forKey: .needAutoplay)
        )
    case "pageBlockAudio":
      let caseContainer = try decoder.container(keyedBy: AudioKeys.self)
      self = .audio(
              audio: try caseContainer.decodeIfPresent(Audio.self, forKey: .audio),
            caption: try caseContainer.decode(PageBlockCaption.self, forKey: .caption)
        )
    case "pageBlockPhoto":
      let caseContainer = try decoder.container(keyedBy: PhotoKeys.self)
      self = .photo(
              photo: try caseContainer.decodeIfPresent(Photo.self, forKey: .photo),
            caption: try caseContainer.decode(PageBlockCaption.self, forKey: .caption),
            url: try caseContainer.decode(String.self, forKey: .url)
        )
    case "pageBlockVideo":
      let caseContainer = try decoder.container(keyedBy: VideoKeys.self)
      self = .video(
              video: try caseContainer.decodeIfPresent(Video.self, forKey: .video),
            caption: try caseContainer.decode(PageBlockCaption.self, forKey: .caption),
            needAutoplay: try caseContainer.decode(Bool.self, forKey: .needAutoplay),
            isLooped: try caseContainer.decode(Bool.self, forKey: .isLooped)
        )
    case "pageBlockVoiceNote":
      let caseContainer = try decoder.container(keyedBy: VoiceNoteKeys.self)
      self = .voiceNote(
              voiceNote: try caseContainer.decodeIfPresent(VoiceNote.self, forKey: .voiceNote),
            caption: try caseContainer.decode(PageBlockCaption.self, forKey: .caption)
        )
    case "pageBlockCover":
      let caseContainer = try decoder.container(keyedBy: CoverKeys.self)
      self = .cover(
            cover: try caseContainer.decode(PageBlock.self, forKey: .cover)
        )
    case "pageBlockEmbedded":
      let caseContainer = try decoder.container(keyedBy: EmbeddedKeys.self)
      self = .embedded(
            url: try caseContainer.decode(String.self, forKey: .url),
            html: try caseContainer.decode(String.self, forKey: .html),
              posterPhoto: try caseContainer.decodeIfPresent(Photo.self, forKey: .posterPhoto),
            width: try caseContainer.decode(Int32.self, forKey: .width),
            height: try caseContainer.decode(Int32.self, forKey: .height),
            caption: try caseContainer.decode(PageBlockCaption.self, forKey: .caption),
            isFullWidth: try caseContainer.decode(Bool.self, forKey: .isFullWidth),
            allowScrolling: try caseContainer.decode(Bool.self, forKey: .allowScrolling)
        )
    case "pageBlockEmbeddedPost":
      let caseContainer = try decoder.container(keyedBy: EmbeddedPostKeys.self)
      self = .embeddedPost(
            url: try caseContainer.decode(String.self, forKey: .url),
            author: try caseContainer.decode(String.self, forKey: .author),
              authorPhoto: try caseContainer.decodeIfPresent(Photo.self, forKey: .authorPhoto),
            date: try caseContainer.decode(Int32.self, forKey: .date),
            pageBlocks: try caseContainer.decode([PageBlock].self, forKey: .pageBlocks),
            caption: try caseContainer.decode(PageBlockCaption.self, forKey: .caption)
        )
    case "pageBlockCollage":
      let caseContainer = try decoder.container(keyedBy: CollageKeys.self)
      self = .collage(
            pageBlocks: try caseContainer.decode([PageBlock].self, forKey: .pageBlocks),
            caption: try caseContainer.decode(PageBlockCaption.self, forKey: .caption)
        )
    case "pageBlockSlideshow":
      let caseContainer = try decoder.container(keyedBy: SlideshowKeys.self)
      self = .slideshow(
            pageBlocks: try caseContainer.decode([PageBlock].self, forKey: .pageBlocks),
            caption: try caseContainer.decode(PageBlockCaption.self, forKey: .caption)
        )
    case "pageBlockChatLink":
      let caseContainer = try decoder.container(keyedBy: ChatLinkKeys.self)
      self = .chatLink(
            title: try caseContainer.decode(String.self, forKey: .title),
              photo: try caseContainer.decodeIfPresent(ChatPhoto.self, forKey: .photo),
            username: try caseContainer.decode(String.self, forKey: .username)
        )
    case "pageBlockTable":
      let caseContainer = try decoder.container(keyedBy: TableKeys.self)
      self = .table(
            caption: try caseContainer.decode(RichText.self, forKey: .caption),
            cells: try caseContainer.decode([[PageBlockTableCell]].self, forKey: .cells),
            isBordered: try caseContainer.decode(Bool.self, forKey: .isBordered),
            isStriped: try caseContainer.decode(Bool.self, forKey: .isStriped)
        )
    case "pageBlockDetails":
      let caseContainer = try decoder.container(keyedBy: DetailsKeys.self)
      self = .details(
            header: try caseContainer.decode(RichText.self, forKey: .header),
            pageBlocks: try caseContainer.decode([PageBlock].self, forKey: .pageBlocks),
            isOpen: try caseContainer.decode(Bool.self, forKey: .isOpen)
        )
    case "pageBlockRelatedArticles":
      let caseContainer = try decoder.container(keyedBy: RelatedArticlesKeys.self)
      self = .relatedArticles(
            header: try caseContainer.decode(RichText.self, forKey: .header),
            articles: try caseContainer.decode([PageBlockRelatedArticle].self, forKey: .articles)
        )
    case "pageBlockMap":
      let caseContainer = try decoder.container(keyedBy: MapKeys.self)
      self = .map(
            location: try caseContainer.decode(Location.self, forKey: .location),
            zoom: try caseContainer.decode(Int32.self, forKey: .zoom),
            width: try caseContainer.decode(Int32.self, forKey: .width),
            height: try caseContainer.decode(Int32.self, forKey: .height),
            caption: try caseContainer.decode(PageBlockCaption.self, forKey: .caption)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .title(
                let title):
               try container.encode("pageBlockTitle", forKey: .type)
                var caseContainer = encoder.container(keyedBy: TitleKeys.self)
                      try caseContainer.encode(title, forKey: .title)
            case .subtitle(
                let subtitle):
               try container.encode("pageBlockSubtitle", forKey: .type)
                var caseContainer = encoder.container(keyedBy: SubtitleKeys.self)
                      try caseContainer.encode(subtitle, forKey: .subtitle)
            case .authorDate(
                let author,
                let publishDate):
               try container.encode("pageBlockAuthorDate", forKey: .type)
                var caseContainer = encoder.container(keyedBy: AuthorDateKeys.self)
                      try caseContainer.encode(author, forKey: .author)
                      try caseContainer.encode(publishDate, forKey: .publishDate)
            case .header(
                let header):
               try container.encode("pageBlockHeader", forKey: .type)
                var caseContainer = encoder.container(keyedBy: HeaderKeys.self)
                      try caseContainer.encode(header, forKey: .header)
            case .subheader(
                let subheader):
               try container.encode("pageBlockSubheader", forKey: .type)
                var caseContainer = encoder.container(keyedBy: SubheaderKeys.self)
                      try caseContainer.encode(subheader, forKey: .subheader)
            case .kicker(
                let kicker):
               try container.encode("pageBlockKicker", forKey: .type)
                var caseContainer = encoder.container(keyedBy: KickerKeys.self)
                      try caseContainer.encode(kicker, forKey: .kicker)
            case .paragraph(
                let text):
               try container.encode("pageBlockParagraph", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ParagraphKeys.self)
                      try caseContainer.encode(text, forKey: .text)
            case .preformatted(
                let text,
                let language):
               try container.encode("pageBlockPreformatted", forKey: .type)
                var caseContainer = encoder.container(keyedBy: PreformattedKeys.self)
                      try caseContainer.encode(text, forKey: .text)
                      try caseContainer.encode(language, forKey: .language)
            case .footer(
                let footer):
               try container.encode("pageBlockFooter", forKey: .type)
                var caseContainer = encoder.container(keyedBy: FooterKeys.self)
                      try caseContainer.encode(footer, forKey: .footer)
            case .divider:
               try container.encode("pageBlockDivider", forKey: .type)
            case .anchor(
                let name):
               try container.encode("pageBlockAnchor", forKey: .type)
                var caseContainer = encoder.container(keyedBy: AnchorKeys.self)
                      try caseContainer.encode(name, forKey: .name)
            case .list(
                let items):
               try container.encode("pageBlockList", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ListKeys.self)
                      try caseContainer.encode(items, forKey: .items)
            case .blockQuote(
                let text,
                let credit):
               try container.encode("pageBlockBlockQuote", forKey: .type)
                var caseContainer = encoder.container(keyedBy: BlockQuoteKeys.self)
                      try caseContainer.encode(text, forKey: .text)
                      try caseContainer.encode(credit, forKey: .credit)
            case .pullQuote(
                let text,
                let credit):
               try container.encode("pageBlockPullQuote", forKey: .type)
                var caseContainer = encoder.container(keyedBy: PullQuoteKeys.self)
                      try caseContainer.encode(text, forKey: .text)
                      try caseContainer.encode(credit, forKey: .credit)
            case .animation(
                let animation,
                let caption,
                let needAutoplay):
               try container.encode("pageBlockAnimation", forKey: .type)
                var caseContainer = encoder.container(keyedBy: AnimationKeys.self)
                      try caseContainer.encodeIfPresent(animation, forKey: .animation)
                      try caseContainer.encode(caption, forKey: .caption)
                      try caseContainer.encode(needAutoplay, forKey: .needAutoplay)
            case .audio(
                let audio,
                let caption):
               try container.encode("pageBlockAudio", forKey: .type)
                var caseContainer = encoder.container(keyedBy: AudioKeys.self)
                      try caseContainer.encodeIfPresent(audio, forKey: .audio)
                      try caseContainer.encode(caption, forKey: .caption)
            case .photo(
                let photo,
                let caption,
                let url):
               try container.encode("pageBlockPhoto", forKey: .type)
                var caseContainer = encoder.container(keyedBy: PhotoKeys.self)
                      try caseContainer.encodeIfPresent(photo, forKey: .photo)
                      try caseContainer.encode(caption, forKey: .caption)
                      try caseContainer.encode(url, forKey: .url)
            case .video(
                let video,
                let caption,
                let needAutoplay,
                let isLooped):
               try container.encode("pageBlockVideo", forKey: .type)
                var caseContainer = encoder.container(keyedBy: VideoKeys.self)
                      try caseContainer.encodeIfPresent(video, forKey: .video)
                      try caseContainer.encode(caption, forKey: .caption)
                      try caseContainer.encode(needAutoplay, forKey: .needAutoplay)
                      try caseContainer.encode(isLooped, forKey: .isLooped)
            case .voiceNote(
                let voiceNote,
                let caption):
               try container.encode("pageBlockVoiceNote", forKey: .type)
                var caseContainer = encoder.container(keyedBy: VoiceNoteKeys.self)
                      try caseContainer.encodeIfPresent(voiceNote, forKey: .voiceNote)
                      try caseContainer.encode(caption, forKey: .caption)
            case .cover(
                let cover):
               try container.encode("pageBlockCover", forKey: .type)
                var caseContainer = encoder.container(keyedBy: CoverKeys.self)
                      try caseContainer.encode(cover, forKey: .cover)
            case .embedded(
                let url,
                let html,
                let posterPhoto,
                let width,
                let height,
                let caption,
                let isFullWidth,
                let allowScrolling):
               try container.encode("pageBlockEmbedded", forKey: .type)
                var caseContainer = encoder.container(keyedBy: EmbeddedKeys.self)
                      try caseContainer.encode(url, forKey: .url)
                      try caseContainer.encode(html, forKey: .html)
                      try caseContainer.encodeIfPresent(posterPhoto, forKey: .posterPhoto)
                      try caseContainer.encode(width, forKey: .width)
                      try caseContainer.encode(height, forKey: .height)
                      try caseContainer.encode(caption, forKey: .caption)
                      try caseContainer.encode(isFullWidth, forKey: .isFullWidth)
                      try caseContainer.encode(allowScrolling, forKey: .allowScrolling)
            case .embeddedPost(
                let url,
                let author,
                let authorPhoto,
                let date,
                let pageBlocks,
                let caption):
               try container.encode("pageBlockEmbeddedPost", forKey: .type)
                var caseContainer = encoder.container(keyedBy: EmbeddedPostKeys.self)
                      try caseContainer.encode(url, forKey: .url)
                      try caseContainer.encode(author, forKey: .author)
                      try caseContainer.encodeIfPresent(authorPhoto, forKey: .authorPhoto)
                      try caseContainer.encode(date, forKey: .date)
                      try caseContainer.encode(pageBlocks, forKey: .pageBlocks)
                      try caseContainer.encode(caption, forKey: .caption)
            case .collage(
                let pageBlocks,
                let caption):
               try container.encode("pageBlockCollage", forKey: .type)
                var caseContainer = encoder.container(keyedBy: CollageKeys.self)
                      try caseContainer.encode(pageBlocks, forKey: .pageBlocks)
                      try caseContainer.encode(caption, forKey: .caption)
            case .slideshow(
                let pageBlocks,
                let caption):
               try container.encode("pageBlockSlideshow", forKey: .type)
                var caseContainer = encoder.container(keyedBy: SlideshowKeys.self)
                      try caseContainer.encode(pageBlocks, forKey: .pageBlocks)
                      try caseContainer.encode(caption, forKey: .caption)
            case .chatLink(
                let title,
                let photo,
                let username):
               try container.encode("pageBlockChatLink", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatLinkKeys.self)
                      try caseContainer.encode(title, forKey: .title)
                      try caseContainer.encodeIfPresent(photo, forKey: .photo)
                      try caseContainer.encode(username, forKey: .username)
            case .table(
                let caption,
                let cells,
                let isBordered,
                let isStriped):
               try container.encode("pageBlockTable", forKey: .type)
                var caseContainer = encoder.container(keyedBy: TableKeys.self)
                      try caseContainer.encode(caption, forKey: .caption)
                      try caseContainer.encode(cells, forKey: .cells)
                      try caseContainer.encode(isBordered, forKey: .isBordered)
                      try caseContainer.encode(isStriped, forKey: .isStriped)
            case .details(
                let header,
                let pageBlocks,
                let isOpen):
               try container.encode("pageBlockDetails", forKey: .type)
                var caseContainer = encoder.container(keyedBy: DetailsKeys.self)
                      try caseContainer.encode(header, forKey: .header)
                      try caseContainer.encode(pageBlocks, forKey: .pageBlocks)
                      try caseContainer.encode(isOpen, forKey: .isOpen)
            case .relatedArticles(
                let header,
                let articles):
               try container.encode("pageBlockRelatedArticles", forKey: .type)
                var caseContainer = encoder.container(keyedBy: RelatedArticlesKeys.self)
                      try caseContainer.encode(header, forKey: .header)
                      try caseContainer.encode(articles, forKey: .articles)
            case .map(
                let location,
                let zoom,
                let width,
                let height,
                let caption):
               try container.encode("pageBlockMap", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MapKeys.self)
                      try caseContainer.encode(location, forKey: .location)
                      try caseContainer.encode(zoom, forKey: .zoom)
                      try caseContainer.encode(width, forKey: .width)
                      try caseContainer.encode(height, forKey: .height)
                      try caseContainer.encode(caption, forKey: .caption)
        }
  }
}

extension PageBlockHorizontalAlignment {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "pageBlockHorizontalAlignmentLeft":
      self = .left
    case "pageBlockHorizontalAlignmentCenter":
      self = .center
    case "pageBlockHorizontalAlignmentRight":
      self = .right
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .left:
               try container.encode("pageBlockHorizontalAlignmentLeft", forKey: .type)
            case .center:
               try container.encode("pageBlockHorizontalAlignmentCenter", forKey: .type)
            case .right:
               try container.encode("pageBlockHorizontalAlignmentRight", forKey: .type)
        }
  }
}

extension PageBlockVerticalAlignment {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "pageBlockVerticalAlignmentTop":
      self = .top
    case "pageBlockVerticalAlignmentMiddle":
      self = .middle
    case "pageBlockVerticalAlignmentBottom":
      self = .bottom
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .top:
               try container.encode("pageBlockVerticalAlignmentTop", forKey: .type)
            case .middle:
               try container.encode("pageBlockVerticalAlignmentMiddle", forKey: .type)
            case .bottom:
               try container.encode("pageBlockVerticalAlignmentBottom", forKey: .type)
        }
  }
}

extension PassportElement {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum PersonalDetailsKeys: String, CodingKey {
          case personalDetails
  }
  enum PassportKeys: String, CodingKey {
          case passport
  }
  enum DriverLicenseKeys: String, CodingKey {
          case driverLicense
  }
  enum IdentityCardKeys: String, CodingKey {
          case identityCard
  }
  enum InternalPassportKeys: String, CodingKey {
          case internalPassport
  }
  enum AddressKeys: String, CodingKey {
          case address
  }
  enum UtilityBillKeys: String, CodingKey {
          case utilityBill
  }
  enum BankStatementKeys: String, CodingKey {
          case bankStatement
  }
  enum RentalAgreementKeys: String, CodingKey {
          case rentalAgreement
  }
  enum PassportRegistrationKeys: String, CodingKey {
          case passportRegistration
  }
  enum TemporaryRegistrationKeys: String, CodingKey {
          case temporaryRegistration
  }
  enum PhoneNumberKeys: String, CodingKey {
          case phoneNumber
  }
  enum EmailAddressKeys: String, CodingKey {
          case emailAddress
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "passportElementPersonalDetails":
      let caseContainer = try decoder.container(keyedBy: PersonalDetailsKeys.self)
      self = .personalDetails(
            personalDetails: try caseContainer.decode(PersonalDetails.self, forKey: .personalDetails)
        )
    case "passportElementPassport":
      let caseContainer = try decoder.container(keyedBy: PassportKeys.self)
      self = .passport(
            passport: try caseContainer.decode(IdentityDocument.self, forKey: .passport)
        )
    case "passportElementDriverLicense":
      let caseContainer = try decoder.container(keyedBy: DriverLicenseKeys.self)
      self = .driverLicense(
            driverLicense: try caseContainer.decode(IdentityDocument.self, forKey: .driverLicense)
        )
    case "passportElementIdentityCard":
      let caseContainer = try decoder.container(keyedBy: IdentityCardKeys.self)
      self = .identityCard(
            identityCard: try caseContainer.decode(IdentityDocument.self, forKey: .identityCard)
        )
    case "passportElementInternalPassport":
      let caseContainer = try decoder.container(keyedBy: InternalPassportKeys.self)
      self = .internalPassport(
            internalPassport: try caseContainer.decode(IdentityDocument.self, forKey: .internalPassport)
        )
    case "passportElementAddress":
      let caseContainer = try decoder.container(keyedBy: AddressKeys.self)
      self = .address(
            address: try caseContainer.decode(Address.self, forKey: .address)
        )
    case "passportElementUtilityBill":
      let caseContainer = try decoder.container(keyedBy: UtilityBillKeys.self)
      self = .utilityBill(
            utilityBill: try caseContainer.decode(PersonalDocument.self, forKey: .utilityBill)
        )
    case "passportElementBankStatement":
      let caseContainer = try decoder.container(keyedBy: BankStatementKeys.self)
      self = .bankStatement(
            bankStatement: try caseContainer.decode(PersonalDocument.self, forKey: .bankStatement)
        )
    case "passportElementRentalAgreement":
      let caseContainer = try decoder.container(keyedBy: RentalAgreementKeys.self)
      self = .rentalAgreement(
            rentalAgreement: try caseContainer.decode(PersonalDocument.self, forKey: .rentalAgreement)
        )
    case "passportElementPassportRegistration":
      let caseContainer = try decoder.container(keyedBy: PassportRegistrationKeys.self)
      self = .passportRegistration(
            passportRegistration: try caseContainer.decode(PersonalDocument.self, forKey: .passportRegistration)
        )
    case "passportElementTemporaryRegistration":
      let caseContainer = try decoder.container(keyedBy: TemporaryRegistrationKeys.self)
      self = .temporaryRegistration(
            temporaryRegistration: try caseContainer.decode(PersonalDocument.self, forKey: .temporaryRegistration)
        )
    case "passportElementPhoneNumber":
      let caseContainer = try decoder.container(keyedBy: PhoneNumberKeys.self)
      self = .phoneNumber(
            phoneNumber: try caseContainer.decode(String.self, forKey: .phoneNumber)
        )
    case "passportElementEmailAddress":
      let caseContainer = try decoder.container(keyedBy: EmailAddressKeys.self)
      self = .emailAddress(
            emailAddress: try caseContainer.decode(String.self, forKey: .emailAddress)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .personalDetails(
                let personalDetails):
               try container.encode("passportElementPersonalDetails", forKey: .type)
                var caseContainer = encoder.container(keyedBy: PersonalDetailsKeys.self)
                      try caseContainer.encode(personalDetails, forKey: .personalDetails)
            case .passport(
                let passport):
               try container.encode("passportElementPassport", forKey: .type)
                var caseContainer = encoder.container(keyedBy: PassportKeys.self)
                      try caseContainer.encode(passport, forKey: .passport)
            case .driverLicense(
                let driverLicense):
               try container.encode("passportElementDriverLicense", forKey: .type)
                var caseContainer = encoder.container(keyedBy: DriverLicenseKeys.self)
                      try caseContainer.encode(driverLicense, forKey: .driverLicense)
            case .identityCard(
                let identityCard):
               try container.encode("passportElementIdentityCard", forKey: .type)
                var caseContainer = encoder.container(keyedBy: IdentityCardKeys.self)
                      try caseContainer.encode(identityCard, forKey: .identityCard)
            case .internalPassport(
                let internalPassport):
               try container.encode("passportElementInternalPassport", forKey: .type)
                var caseContainer = encoder.container(keyedBy: InternalPassportKeys.self)
                      try caseContainer.encode(internalPassport, forKey: .internalPassport)
            case .address(
                let address):
               try container.encode("passportElementAddress", forKey: .type)
                var caseContainer = encoder.container(keyedBy: AddressKeys.self)
                      try caseContainer.encode(address, forKey: .address)
            case .utilityBill(
                let utilityBill):
               try container.encode("passportElementUtilityBill", forKey: .type)
                var caseContainer = encoder.container(keyedBy: UtilityBillKeys.self)
                      try caseContainer.encode(utilityBill, forKey: .utilityBill)
            case .bankStatement(
                let bankStatement):
               try container.encode("passportElementBankStatement", forKey: .type)
                var caseContainer = encoder.container(keyedBy: BankStatementKeys.self)
                      try caseContainer.encode(bankStatement, forKey: .bankStatement)
            case .rentalAgreement(
                let rentalAgreement):
               try container.encode("passportElementRentalAgreement", forKey: .type)
                var caseContainer = encoder.container(keyedBy: RentalAgreementKeys.self)
                      try caseContainer.encode(rentalAgreement, forKey: .rentalAgreement)
            case .passportRegistration(
                let passportRegistration):
               try container.encode("passportElementPassportRegistration", forKey: .type)
                var caseContainer = encoder.container(keyedBy: PassportRegistrationKeys.self)
                      try caseContainer.encode(passportRegistration, forKey: .passportRegistration)
            case .temporaryRegistration(
                let temporaryRegistration):
               try container.encode("passportElementTemporaryRegistration", forKey: .type)
                var caseContainer = encoder.container(keyedBy: TemporaryRegistrationKeys.self)
                      try caseContainer.encode(temporaryRegistration, forKey: .temporaryRegistration)
            case .phoneNumber(
                let phoneNumber):
               try container.encode("passportElementPhoneNumber", forKey: .type)
                var caseContainer = encoder.container(keyedBy: PhoneNumberKeys.self)
                      try caseContainer.encode(phoneNumber, forKey: .phoneNumber)
            case .emailAddress(
                let emailAddress):
               try container.encode("passportElementEmailAddress", forKey: .type)
                var caseContainer = encoder.container(keyedBy: EmailAddressKeys.self)
                      try caseContainer.encode(emailAddress, forKey: .emailAddress)
        }
  }
}

extension PassportElementErrorSource {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum DataFieldKeys: String, CodingKey {
          case fieldName
  }
  enum TranslationFileKeys: String, CodingKey {
          case fileIndex
  }
  enum FileKeys: String, CodingKey {
          case fileIndex
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "passportElementErrorSourceUnspecified":
      self = .unspecified
    case "passportElementErrorSourceDataField":
      let caseContainer = try decoder.container(keyedBy: DataFieldKeys.self)
      self = .dataField(
            fieldName: try caseContainer.decode(String.self, forKey: .fieldName)
        )
    case "passportElementErrorSourceFrontSide":
      self = .frontSide
    case "passportElementErrorSourceReverseSide":
      self = .reverseSide
    case "passportElementErrorSourceSelfie":
      self = .selfie
    case "passportElementErrorSourceTranslationFile":
      let caseContainer = try decoder.container(keyedBy: TranslationFileKeys.self)
      self = .translationFile(
            fileIndex: try caseContainer.decode(Int32.self, forKey: .fileIndex)
        )
    case "passportElementErrorSourceTranslationFiles":
      self = .translationFiles
    case "passportElementErrorSourceFile":
      let caseContainer = try decoder.container(keyedBy: FileKeys.self)
      self = .file(
            fileIndex: try caseContainer.decode(Int32.self, forKey: .fileIndex)
        )
    case "passportElementErrorSourceFiles":
      self = .files
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .unspecified:
               try container.encode("passportElementErrorSourceUnspecified", forKey: .type)
            case .dataField(
                let fieldName):
               try container.encode("passportElementErrorSourceDataField", forKey: .type)
                var caseContainer = encoder.container(keyedBy: DataFieldKeys.self)
                      try caseContainer.encode(fieldName, forKey: .fieldName)
            case .frontSide:
               try container.encode("passportElementErrorSourceFrontSide", forKey: .type)
            case .reverseSide:
               try container.encode("passportElementErrorSourceReverseSide", forKey: .type)
            case .selfie:
               try container.encode("passportElementErrorSourceSelfie", forKey: .type)
            case .translationFile(
                let fileIndex):
               try container.encode("passportElementErrorSourceTranslationFile", forKey: .type)
                var caseContainer = encoder.container(keyedBy: TranslationFileKeys.self)
                      try caseContainer.encode(fileIndex, forKey: .fileIndex)
            case .translationFiles:
               try container.encode("passportElementErrorSourceTranslationFiles", forKey: .type)
            case .file(
                let fileIndex):
               try container.encode("passportElementErrorSourceFile", forKey: .type)
                var caseContainer = encoder.container(keyedBy: FileKeys.self)
                      try caseContainer.encode(fileIndex, forKey: .fileIndex)
            case .files:
               try container.encode("passportElementErrorSourceFiles", forKey: .type)
        }
  }
}

extension PassportElementType {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "passportElementTypePersonalDetails":
      self = .personalDetails
    case "passportElementTypePassport":
      self = .passport
    case "passportElementTypeDriverLicense":
      self = .driverLicense
    case "passportElementTypeIdentityCard":
      self = .identityCard
    case "passportElementTypeInternalPassport":
      self = .internalPassport
    case "passportElementTypeAddress":
      self = .address
    case "passportElementTypeUtilityBill":
      self = .utilityBill
    case "passportElementTypeBankStatement":
      self = .bankStatement
    case "passportElementTypeRentalAgreement":
      self = .rentalAgreement
    case "passportElementTypePassportRegistration":
      self = .passportRegistration
    case "passportElementTypeTemporaryRegistration":
      self = .temporaryRegistration
    case "passportElementTypePhoneNumber":
      self = .phoneNumber
    case "passportElementTypeEmailAddress":
      self = .emailAddress
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .personalDetails:
               try container.encode("passportElementTypePersonalDetails", forKey: .type)
            case .passport:
               try container.encode("passportElementTypePassport", forKey: .type)
            case .driverLicense:
               try container.encode("passportElementTypeDriverLicense", forKey: .type)
            case .identityCard:
               try container.encode("passportElementTypeIdentityCard", forKey: .type)
            case .internalPassport:
               try container.encode("passportElementTypeInternalPassport", forKey: .type)
            case .address:
               try container.encode("passportElementTypeAddress", forKey: .type)
            case .utilityBill:
               try container.encode("passportElementTypeUtilityBill", forKey: .type)
            case .bankStatement:
               try container.encode("passportElementTypeBankStatement", forKey: .type)
            case .rentalAgreement:
               try container.encode("passportElementTypeRentalAgreement", forKey: .type)
            case .passportRegistration:
               try container.encode("passportElementTypePassportRegistration", forKey: .type)
            case .temporaryRegistration:
               try container.encode("passportElementTypeTemporaryRegistration", forKey: .type)
            case .phoneNumber:
               try container.encode("passportElementTypePhoneNumber", forKey: .type)
            case .emailAddress:
               try container.encode("passportElementTypeEmailAddress", forKey: .type)
        }
  }
}

extension PollType {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum RegularKeys: String, CodingKey {
          case allowMultipleAnswers
  }
  enum QuizKeys: String, CodingKey {
          case correctOptionId
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "pollTypeRegular":
      let caseContainer = try decoder.container(keyedBy: RegularKeys.self)
      self = .regular(
              allowMultipleAnswers: try caseContainer.decodeIfPresent(Bool.self, forKey: .allowMultipleAnswers)
        )
    case "pollTypeQuiz":
      let caseContainer = try decoder.container(keyedBy: QuizKeys.self)
      self = .quiz(
              correctOptionId: try caseContainer.decodeIfPresent(Int32.self, forKey: .correctOptionId)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .regular(
                let allowMultipleAnswers):
               try container.encode("pollTypeRegular", forKey: .type)
                var caseContainer = encoder.container(keyedBy: RegularKeys.self)
                      try caseContainer.encodeIfPresent(allowMultipleAnswers, forKey: .allowMultipleAnswers)
            case .quiz(
                let correctOptionId):
               try container.encode("pollTypeQuiz", forKey: .type)
                var caseContainer = encoder.container(keyedBy: QuizKeys.self)
                      try caseContainer.encodeIfPresent(correctOptionId, forKey: .correctOptionId)
        }
  }
}

extension ProxyType {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum Socks5Keys: String, CodingKey {
          case username
          case password
  }
  enum HttpKeys: String, CodingKey {
          case username
          case password
          case httpOnly
  }
  enum MtprotoKeys: String, CodingKey {
          case secret
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "proxyTypeSocks5":
      let caseContainer = try decoder.container(keyedBy: Socks5Keys.self)
      self = .socks5(
            username: try caseContainer.decode(String.self, forKey: .username),
            password: try caseContainer.decode(String.self, forKey: .password)
        )
    case "proxyTypeHttp":
      let caseContainer = try decoder.container(keyedBy: HttpKeys.self)
      self = .http(
              username: try caseContainer.decodeIfPresent(String.self, forKey: .username),
              password: try caseContainer.decodeIfPresent(String.self, forKey: .password),
              httpOnly: try caseContainer.decodeIfPresent(Bool.self, forKey: .httpOnly)
        )
    case "proxyTypeMtproto":
      let caseContainer = try decoder.container(keyedBy: MtprotoKeys.self)
      self = .mtproto(
              secret: try caseContainer.decodeIfPresent(String.self, forKey: .secret)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .socks5(
                let username,
                let password):
               try container.encode("proxyTypeSocks5", forKey: .type)
                var caseContainer = encoder.container(keyedBy: Socks5Keys.self)
                      try caseContainer.encode(username, forKey: .username)
                      try caseContainer.encode(password, forKey: .password)
            case .http(
                let username,
                let password,
                let httpOnly):
               try container.encode("proxyTypeHttp", forKey: .type)
                var caseContainer = encoder.container(keyedBy: HttpKeys.self)
                      try caseContainer.encodeIfPresent(username, forKey: .username)
                      try caseContainer.encodeIfPresent(password, forKey: .password)
                      try caseContainer.encodeIfPresent(httpOnly, forKey: .httpOnly)
            case .mtproto(
                let secret):
               try container.encode("proxyTypeMtproto", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MtprotoKeys.self)
                      try caseContainer.encodeIfPresent(secret, forKey: .secret)
        }
  }
}

extension PublicChatType {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "publicChatTypeHasUsername":
      self = .hasUsername
    case "publicChatTypeIsLocationBased":
      self = .isLocationBased
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .hasUsername:
               try container.encode("publicChatTypeHasUsername", forKey: .type)
            case .isLocationBased:
               try container.encode("publicChatTypeIsLocationBased", forKey: .type)
        }
  }
}

extension PushMessageContent {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum HiddenKeys: String, CodingKey {
          case isPinned
  }
  enum AnimationKeys: String, CodingKey {
          case animation
          case caption
          case isPinned
  }
  enum AudioKeys: String, CodingKey {
          case audio
          case isPinned
  }
  enum ContactKeys: String, CodingKey {
          case name
          case isPinned
  }
  enum DocumentKeys: String, CodingKey {
          case document
          case isPinned
  }
  enum GameKeys: String, CodingKey {
          case title
          case isPinned
  }
  enum GameScoreKeys: String, CodingKey {
          case title
          case score
          case isPinned
  }
  enum InvoiceKeys: String, CodingKey {
          case price
          case isPinned
  }
  enum LocationKeys: String, CodingKey {
          case isLive
          case isPinned
  }
  enum PhotoKeys: String, CodingKey {
          case photo
          case caption
          case isSecret
          case isPinned
  }
  enum PollKeys: String, CodingKey {
          case question
          case isRegular
          case isPinned
  }
  enum StickerKeys: String, CodingKey {
          case sticker
          case emoji
          case isPinned
  }
  enum TextKeys: String, CodingKey {
          case text
          case isPinned
  }
  enum VideoKeys: String, CodingKey {
          case video
          case caption
          case isSecret
          case isPinned
  }
  enum VideoNoteKeys: String, CodingKey {
          case videoNote
          case isPinned
  }
  enum VoiceNoteKeys: String, CodingKey {
          case voiceNote
          case isPinned
  }
  enum ChatAddMembersKeys: String, CodingKey {
          case memberName
          case isCurrentUser
          case isReturned
  }
  enum ChatChangeTitleKeys: String, CodingKey {
          case title
  }
  enum ChatDeleteMemberKeys: String, CodingKey {
          case memberName
          case isCurrentUser
          case isLeft
  }
  enum MessageForwardsKeys: String, CodingKey {
          case totalCount
  }
  enum MediaAlbumKeys: String, CodingKey {
          case totalCount
          case hasPhotos
          case hasVideos
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "pushMessageContentHidden":
      let caseContainer = try decoder.container(keyedBy: HiddenKeys.self)
      self = .hidden(
            isPinned: try caseContainer.decode(Bool.self, forKey: .isPinned)
        )
    case "pushMessageContentAnimation":
      let caseContainer = try decoder.container(keyedBy: AnimationKeys.self)
      self = .animation(
              animation: try caseContainer.decodeIfPresent(Animation.self, forKey: .animation),
            caption: try caseContainer.decode(String.self, forKey: .caption),
            isPinned: try caseContainer.decode(Bool.self, forKey: .isPinned)
        )
    case "pushMessageContentAudio":
      let caseContainer = try decoder.container(keyedBy: AudioKeys.self)
      self = .audio(
              audio: try caseContainer.decodeIfPresent(Audio.self, forKey: .audio),
            isPinned: try caseContainer.decode(Bool.self, forKey: .isPinned)
        )
    case "pushMessageContentContact":
      let caseContainer = try decoder.container(keyedBy: ContactKeys.self)
      self = .contact(
            name: try caseContainer.decode(String.self, forKey: .name),
            isPinned: try caseContainer.decode(Bool.self, forKey: .isPinned)
        )
    case "pushMessageContentContactRegistered":
      self = .contactRegistered
    case "pushMessageContentDocument":
      let caseContainer = try decoder.container(keyedBy: DocumentKeys.self)
      self = .document(
              document: try caseContainer.decodeIfPresent(Document.self, forKey: .document),
            isPinned: try caseContainer.decode(Bool.self, forKey: .isPinned)
        )
    case "pushMessageContentGame":
      let caseContainer = try decoder.container(keyedBy: GameKeys.self)
      self = .game(
            title: try caseContainer.decode(String.self, forKey: .title),
            isPinned: try caseContainer.decode(Bool.self, forKey: .isPinned)
        )
    case "pushMessageContentGameScore":
      let caseContainer = try decoder.container(keyedBy: GameScoreKeys.self)
      self = .gameScore(
            title: try caseContainer.decode(String.self, forKey: .title),
            score: try caseContainer.decode(Int32.self, forKey: .score),
            isPinned: try caseContainer.decode(Bool.self, forKey: .isPinned)
        )
    case "pushMessageContentInvoice":
      let caseContainer = try decoder.container(keyedBy: InvoiceKeys.self)
      self = .invoice(
            price: try caseContainer.decode(String.self, forKey: .price),
            isPinned: try caseContainer.decode(Bool.self, forKey: .isPinned)
        )
    case "pushMessageContentLocation":
      let caseContainer = try decoder.container(keyedBy: LocationKeys.self)
      self = .location(
            isLive: try caseContainer.decode(Bool.self, forKey: .isLive),
            isPinned: try caseContainer.decode(Bool.self, forKey: .isPinned)
        )
    case "pushMessageContentPhoto":
      let caseContainer = try decoder.container(keyedBy: PhotoKeys.self)
      self = .photo(
              photo: try caseContainer.decodeIfPresent(Photo.self, forKey: .photo),
            caption: try caseContainer.decode(String.self, forKey: .caption),
            isSecret: try caseContainer.decode(Bool.self, forKey: .isSecret),
            isPinned: try caseContainer.decode(Bool.self, forKey: .isPinned)
        )
    case "pushMessageContentPoll":
      let caseContainer = try decoder.container(keyedBy: PollKeys.self)
      self = .poll(
            question: try caseContainer.decode(String.self, forKey: .question),
            isRegular: try caseContainer.decode(Bool.self, forKey: .isRegular),
            isPinned: try caseContainer.decode(Bool.self, forKey: .isPinned)
        )
    case "pushMessageContentScreenshotTaken":
      self = .screenshotTaken
    case "pushMessageContentSticker":
      let caseContainer = try decoder.container(keyedBy: StickerKeys.self)
      self = .sticker(
              sticker: try caseContainer.decodeIfPresent(Sticker.self, forKey: .sticker),
            emoji: try caseContainer.decode(String.self, forKey: .emoji),
            isPinned: try caseContainer.decode(Bool.self, forKey: .isPinned)
        )
    case "pushMessageContentText":
      let caseContainer = try decoder.container(keyedBy: TextKeys.self)
      self = .text(
            text: try caseContainer.decode(String.self, forKey: .text),
            isPinned: try caseContainer.decode(Bool.self, forKey: .isPinned)
        )
    case "pushMessageContentVideo":
      let caseContainer = try decoder.container(keyedBy: VideoKeys.self)
      self = .video(
              video: try caseContainer.decodeIfPresent(Video.self, forKey: .video),
            caption: try caseContainer.decode(String.self, forKey: .caption),
            isSecret: try caseContainer.decode(Bool.self, forKey: .isSecret),
            isPinned: try caseContainer.decode(Bool.self, forKey: .isPinned)
        )
    case "pushMessageContentVideoNote":
      let caseContainer = try decoder.container(keyedBy: VideoNoteKeys.self)
      self = .videoNote(
              videoNote: try caseContainer.decodeIfPresent(VideoNote.self, forKey: .videoNote),
            isPinned: try caseContainer.decode(Bool.self, forKey: .isPinned)
        )
    case "pushMessageContentVoiceNote":
      let caseContainer = try decoder.container(keyedBy: VoiceNoteKeys.self)
      self = .voiceNote(
              voiceNote: try caseContainer.decodeIfPresent(VoiceNote.self, forKey: .voiceNote),
            isPinned: try caseContainer.decode(Bool.self, forKey: .isPinned)
        )
    case "pushMessageContentBasicGroupChatCreate":
      self = .basicGroupChatCreate
    case "pushMessageContentChatAddMembers":
      let caseContainer = try decoder.container(keyedBy: ChatAddMembersKeys.self)
      self = .chatAddMembers(
            memberName: try caseContainer.decode(String.self, forKey: .memberName),
            isCurrentUser: try caseContainer.decode(Bool.self, forKey: .isCurrentUser),
            isReturned: try caseContainer.decode(Bool.self, forKey: .isReturned)
        )
    case "pushMessageContentChatChangePhoto":
      self = .chatChangePhoto
    case "pushMessageContentChatChangeTitle":
      let caseContainer = try decoder.container(keyedBy: ChatChangeTitleKeys.self)
      self = .chatChangeTitle(
            title: try caseContainer.decode(String.self, forKey: .title)
        )
    case "pushMessageContentChatDeleteMember":
      let caseContainer = try decoder.container(keyedBy: ChatDeleteMemberKeys.self)
      self = .chatDeleteMember(
            memberName: try caseContainer.decode(String.self, forKey: .memberName),
            isCurrentUser: try caseContainer.decode(Bool.self, forKey: .isCurrentUser),
            isLeft: try caseContainer.decode(Bool.self, forKey: .isLeft)
        )
    case "pushMessageContentChatJoinByLink":
      self = .chatJoinByLink
    case "pushMessageContentMessageForwards":
      let caseContainer = try decoder.container(keyedBy: MessageForwardsKeys.self)
      self = .messageForwards(
            totalCount: try caseContainer.decode(Int32.self, forKey: .totalCount)
        )
    case "pushMessageContentMediaAlbum":
      let caseContainer = try decoder.container(keyedBy: MediaAlbumKeys.self)
      self = .mediaAlbum(
            totalCount: try caseContainer.decode(Int32.self, forKey: .totalCount),
            hasPhotos: try caseContainer.decode(Bool.self, forKey: .hasPhotos),
            hasVideos: try caseContainer.decode(Bool.self, forKey: .hasVideos)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .hidden(
                let isPinned):
               try container.encode("pushMessageContentHidden", forKey: .type)
                var caseContainer = encoder.container(keyedBy: HiddenKeys.self)
                      try caseContainer.encode(isPinned, forKey: .isPinned)
            case .animation(
                let animation,
                let caption,
                let isPinned):
               try container.encode("pushMessageContentAnimation", forKey: .type)
                var caseContainer = encoder.container(keyedBy: AnimationKeys.self)
                      try caseContainer.encodeIfPresent(animation, forKey: .animation)
                      try caseContainer.encode(caption, forKey: .caption)
                      try caseContainer.encode(isPinned, forKey: .isPinned)
            case .audio(
                let audio,
                let isPinned):
               try container.encode("pushMessageContentAudio", forKey: .type)
                var caseContainer = encoder.container(keyedBy: AudioKeys.self)
                      try caseContainer.encodeIfPresent(audio, forKey: .audio)
                      try caseContainer.encode(isPinned, forKey: .isPinned)
            case .contact(
                let name,
                let isPinned):
               try container.encode("pushMessageContentContact", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ContactKeys.self)
                      try caseContainer.encode(name, forKey: .name)
                      try caseContainer.encode(isPinned, forKey: .isPinned)
            case .contactRegistered:
               try container.encode("pushMessageContentContactRegistered", forKey: .type)
            case .document(
                let document,
                let isPinned):
               try container.encode("pushMessageContentDocument", forKey: .type)
                var caseContainer = encoder.container(keyedBy: DocumentKeys.self)
                      try caseContainer.encodeIfPresent(document, forKey: .document)
                      try caseContainer.encode(isPinned, forKey: .isPinned)
            case .game(
                let title,
                let isPinned):
               try container.encode("pushMessageContentGame", forKey: .type)
                var caseContainer = encoder.container(keyedBy: GameKeys.self)
                      try caseContainer.encode(title, forKey: .title)
                      try caseContainer.encode(isPinned, forKey: .isPinned)
            case .gameScore(
                let title,
                let score,
                let isPinned):
               try container.encode("pushMessageContentGameScore", forKey: .type)
                var caseContainer = encoder.container(keyedBy: GameScoreKeys.self)
                      try caseContainer.encode(title, forKey: .title)
                      try caseContainer.encode(score, forKey: .score)
                      try caseContainer.encode(isPinned, forKey: .isPinned)
            case .invoice(
                let price,
                let isPinned):
               try container.encode("pushMessageContentInvoice", forKey: .type)
                var caseContainer = encoder.container(keyedBy: InvoiceKeys.self)
                      try caseContainer.encode(price, forKey: .price)
                      try caseContainer.encode(isPinned, forKey: .isPinned)
            case .location(
                let isLive,
                let isPinned):
               try container.encode("pushMessageContentLocation", forKey: .type)
                var caseContainer = encoder.container(keyedBy: LocationKeys.self)
                      try caseContainer.encode(isLive, forKey: .isLive)
                      try caseContainer.encode(isPinned, forKey: .isPinned)
            case .photo(
                let photo,
                let caption,
                let isSecret,
                let isPinned):
               try container.encode("pushMessageContentPhoto", forKey: .type)
                var caseContainer = encoder.container(keyedBy: PhotoKeys.self)
                      try caseContainer.encodeIfPresent(photo, forKey: .photo)
                      try caseContainer.encode(caption, forKey: .caption)
                      try caseContainer.encode(isSecret, forKey: .isSecret)
                      try caseContainer.encode(isPinned, forKey: .isPinned)
            case .poll(
                let question,
                let isRegular,
                let isPinned):
               try container.encode("pushMessageContentPoll", forKey: .type)
                var caseContainer = encoder.container(keyedBy: PollKeys.self)
                      try caseContainer.encode(question, forKey: .question)
                      try caseContainer.encode(isRegular, forKey: .isRegular)
                      try caseContainer.encode(isPinned, forKey: .isPinned)
            case .screenshotTaken:
               try container.encode("pushMessageContentScreenshotTaken", forKey: .type)
            case .sticker(
                let sticker,
                let emoji,
                let isPinned):
               try container.encode("pushMessageContentSticker", forKey: .type)
                var caseContainer = encoder.container(keyedBy: StickerKeys.self)
                      try caseContainer.encodeIfPresent(sticker, forKey: .sticker)
                      try caseContainer.encode(emoji, forKey: .emoji)
                      try caseContainer.encode(isPinned, forKey: .isPinned)
            case .text(
                let text,
                let isPinned):
               try container.encode("pushMessageContentText", forKey: .type)
                var caseContainer = encoder.container(keyedBy: TextKeys.self)
                      try caseContainer.encode(text, forKey: .text)
                      try caseContainer.encode(isPinned, forKey: .isPinned)
            case .video(
                let video,
                let caption,
                let isSecret,
                let isPinned):
               try container.encode("pushMessageContentVideo", forKey: .type)
                var caseContainer = encoder.container(keyedBy: VideoKeys.self)
                      try caseContainer.encodeIfPresent(video, forKey: .video)
                      try caseContainer.encode(caption, forKey: .caption)
                      try caseContainer.encode(isSecret, forKey: .isSecret)
                      try caseContainer.encode(isPinned, forKey: .isPinned)
            case .videoNote(
                let videoNote,
                let isPinned):
               try container.encode("pushMessageContentVideoNote", forKey: .type)
                var caseContainer = encoder.container(keyedBy: VideoNoteKeys.self)
                      try caseContainer.encodeIfPresent(videoNote, forKey: .videoNote)
                      try caseContainer.encode(isPinned, forKey: .isPinned)
            case .voiceNote(
                let voiceNote,
                let isPinned):
               try container.encode("pushMessageContentVoiceNote", forKey: .type)
                var caseContainer = encoder.container(keyedBy: VoiceNoteKeys.self)
                      try caseContainer.encodeIfPresent(voiceNote, forKey: .voiceNote)
                      try caseContainer.encode(isPinned, forKey: .isPinned)
            case .basicGroupChatCreate:
               try container.encode("pushMessageContentBasicGroupChatCreate", forKey: .type)
            case .chatAddMembers(
                let memberName,
                let isCurrentUser,
                let isReturned):
               try container.encode("pushMessageContentChatAddMembers", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatAddMembersKeys.self)
                      try caseContainer.encode(memberName, forKey: .memberName)
                      try caseContainer.encode(isCurrentUser, forKey: .isCurrentUser)
                      try caseContainer.encode(isReturned, forKey: .isReturned)
            case .chatChangePhoto:
               try container.encode("pushMessageContentChatChangePhoto", forKey: .type)
            case .chatChangeTitle(
                let title):
               try container.encode("pushMessageContentChatChangeTitle", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatChangeTitleKeys.self)
                      try caseContainer.encode(title, forKey: .title)
            case .chatDeleteMember(
                let memberName,
                let isCurrentUser,
                let isLeft):
               try container.encode("pushMessageContentChatDeleteMember", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatDeleteMemberKeys.self)
                      try caseContainer.encode(memberName, forKey: .memberName)
                      try caseContainer.encode(isCurrentUser, forKey: .isCurrentUser)
                      try caseContainer.encode(isLeft, forKey: .isLeft)
            case .chatJoinByLink:
               try container.encode("pushMessageContentChatJoinByLink", forKey: .type)
            case .messageForwards(
                let totalCount):
               try container.encode("pushMessageContentMessageForwards", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageForwardsKeys.self)
                      try caseContainer.encode(totalCount, forKey: .totalCount)
            case .mediaAlbum(
                let totalCount,
                let hasPhotos,
                let hasVideos):
               try container.encode("pushMessageContentMediaAlbum", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MediaAlbumKeys.self)
                      try caseContainer.encode(totalCount, forKey: .totalCount)
                      try caseContainer.encode(hasPhotos, forKey: .hasPhotos)
                      try caseContainer.encode(hasVideos, forKey: .hasVideos)
        }
  }
}

extension ReplyMarkup {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum RemoveKeyboardKeys: String, CodingKey {
          case isPersonal
  }
  enum ForceReplyKeys: String, CodingKey {
          case isPersonal
  }
  enum ShowKeyboardKeys: String, CodingKey {
          case rows
          case resizeKeyboard
          case oneTime
          case isPersonal
  }
  enum InlineKeyboardKeys: String, CodingKey {
          case rows
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "replyMarkupRemoveKeyboard":
      let caseContainer = try decoder.container(keyedBy: RemoveKeyboardKeys.self)
      self = .removeKeyboard(
            isPersonal: try caseContainer.decode(Bool.self, forKey: .isPersonal)
        )
    case "replyMarkupForceReply":
      let caseContainer = try decoder.container(keyedBy: ForceReplyKeys.self)
      self = .forceReply(
            isPersonal: try caseContainer.decode(Bool.self, forKey: .isPersonal)
        )
    case "replyMarkupShowKeyboard":
      let caseContainer = try decoder.container(keyedBy: ShowKeyboardKeys.self)
      self = .showKeyboard(
            rows: try caseContainer.decode([[KeyboardButton]].self, forKey: .rows),
              resizeKeyboard: try caseContainer.decodeIfPresent(Bool.self, forKey: .resizeKeyboard),
              oneTime: try caseContainer.decodeIfPresent(Bool.self, forKey: .oneTime),
              isPersonal: try caseContainer.decodeIfPresent(Bool.self, forKey: .isPersonal)
        )
    case "replyMarkupInlineKeyboard":
      let caseContainer = try decoder.container(keyedBy: InlineKeyboardKeys.self)
      self = .inlineKeyboard(
              rows: try caseContainer.decodeIfPresent([[InlineKeyboardButton]].self, forKey: .rows)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .removeKeyboard(
                let isPersonal):
               try container.encode("replyMarkupRemoveKeyboard", forKey: .type)
                var caseContainer = encoder.container(keyedBy: RemoveKeyboardKeys.self)
                      try caseContainer.encode(isPersonal, forKey: .isPersonal)
            case .forceReply(
                let isPersonal):
               try container.encode("replyMarkupForceReply", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ForceReplyKeys.self)
                      try caseContainer.encode(isPersonal, forKey: .isPersonal)
            case .showKeyboard(
                let rows,
                let resizeKeyboard,
                let oneTime,
                let isPersonal):
               try container.encode("replyMarkupShowKeyboard", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ShowKeyboardKeys.self)
                      try caseContainer.encode(rows, forKey: .rows)
                      try caseContainer.encodeIfPresent(resizeKeyboard, forKey: .resizeKeyboard)
                      try caseContainer.encodeIfPresent(oneTime, forKey: .oneTime)
                      try caseContainer.encodeIfPresent(isPersonal, forKey: .isPersonal)
            case .inlineKeyboard(
                let rows):
               try container.encode("replyMarkupInlineKeyboard", forKey: .type)
                var caseContainer = encoder.container(keyedBy: InlineKeyboardKeys.self)
                      try caseContainer.encodeIfPresent(rows, forKey: .rows)
        }
  }
}

extension RichText {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum PlainKeys: String, CodingKey {
          case text
  }
  enum BoldKeys: String, CodingKey {
          case text
  }
  enum ItalicKeys: String, CodingKey {
          case text
  }
  enum UnderlineKeys: String, CodingKey {
          case text
  }
  enum StrikethroughKeys: String, CodingKey {
          case text
  }
  enum FixedKeys: String, CodingKey {
          case text
  }
  enum UrlKeys: String, CodingKey {
          case text
          case url
          case isCached
  }
  enum EmailAddressKeys: String, CodingKey {
          case text
          case emailAddress
  }
  enum SubscriptKeys: String, CodingKey {
          case text
  }
  enum SuperscriptKeys: String, CodingKey {
          case text
  }
  enum MarkedKeys: String, CodingKey {
          case text
  }
  enum PhoneNumberKeys: String, CodingKey {
          case text
          case phoneNumber
  }
  enum IconKeys: String, CodingKey {
          case document
          case width
          case height
  }
  enum AnchorKeys: String, CodingKey {
          case text
          case name
  }
  enum SKeys: String, CodingKey {
          case texts
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "richTextPlain":
      let caseContainer = try decoder.container(keyedBy: PlainKeys.self)
      self = .plain(
            text: try caseContainer.decode(String.self, forKey: .text)
        )
    case "richTextBold":
      let caseContainer = try decoder.container(keyedBy: BoldKeys.self)
      self = .bold(
            text: try caseContainer.decode(RichText.self, forKey: .text)
        )
    case "richTextItalic":
      let caseContainer = try decoder.container(keyedBy: ItalicKeys.self)
      self = .italic(
            text: try caseContainer.decode(RichText.self, forKey: .text)
        )
    case "richTextUnderline":
      let caseContainer = try decoder.container(keyedBy: UnderlineKeys.self)
      self = .underline(
            text: try caseContainer.decode(RichText.self, forKey: .text)
        )
    case "richTextStrikethrough":
      let caseContainer = try decoder.container(keyedBy: StrikethroughKeys.self)
      self = .strikethrough(
            text: try caseContainer.decode(RichText.self, forKey: .text)
        )
    case "richTextFixed":
      let caseContainer = try decoder.container(keyedBy: FixedKeys.self)
      self = .fixed(
            text: try caseContainer.decode(RichText.self, forKey: .text)
        )
    case "richTextUrl":
      let caseContainer = try decoder.container(keyedBy: UrlKeys.self)
      self = .url(
            text: try caseContainer.decode(RichText.self, forKey: .text),
            url: try caseContainer.decode(String.self, forKey: .url),
            isCached: try caseContainer.decode(Bool.self, forKey: .isCached)
        )
    case "richTextEmailAddress":
      let caseContainer = try decoder.container(keyedBy: EmailAddressKeys.self)
      self = .emailAddress(
            text: try caseContainer.decode(RichText.self, forKey: .text),
            emailAddress: try caseContainer.decode(String.self, forKey: .emailAddress)
        )
    case "richTextSubscript":
      let caseContainer = try decoder.container(keyedBy: SubscriptKeys.self)
      self = .subscript(
            text: try caseContainer.decode(RichText.self, forKey: .text)
        )
    case "richTextSuperscript":
      let caseContainer = try decoder.container(keyedBy: SuperscriptKeys.self)
      self = .superscript(
            text: try caseContainer.decode(RichText.self, forKey: .text)
        )
    case "richTextMarked":
      let caseContainer = try decoder.container(keyedBy: MarkedKeys.self)
      self = .marked(
            text: try caseContainer.decode(RichText.self, forKey: .text)
        )
    case "richTextPhoneNumber":
      let caseContainer = try decoder.container(keyedBy: PhoneNumberKeys.self)
      self = .phoneNumber(
            text: try caseContainer.decode(RichText.self, forKey: .text),
            phoneNumber: try caseContainer.decode(String.self, forKey: .phoneNumber)
        )
    case "richTextIcon":
      let caseContainer = try decoder.container(keyedBy: IconKeys.self)
      self = .icon(
            document: try caseContainer.decode(Document.self, forKey: .document),
            width: try caseContainer.decode(Int32.self, forKey: .width),
            height: try caseContainer.decode(Int32.self, forKey: .height)
        )
    case "richTextAnchor":
      let caseContainer = try decoder.container(keyedBy: AnchorKeys.self)
      self = .anchor(
            text: try caseContainer.decode(RichText.self, forKey: .text),
            name: try caseContainer.decode(String.self, forKey: .name)
        )
    case "richTextS":
      let caseContainer = try decoder.container(keyedBy: SKeys.self)
      self = .s(
            texts: try caseContainer.decode([RichText].self, forKey: .texts)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .plain(
                let text):
               try container.encode("richTextPlain", forKey: .type)
                var caseContainer = encoder.container(keyedBy: PlainKeys.self)
                      try caseContainer.encode(text, forKey: .text)
            case .bold(
                let text):
               try container.encode("richTextBold", forKey: .type)
                var caseContainer = encoder.container(keyedBy: BoldKeys.self)
                      try caseContainer.encode(text, forKey: .text)
            case .italic(
                let text):
               try container.encode("richTextItalic", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ItalicKeys.self)
                      try caseContainer.encode(text, forKey: .text)
            case .underline(
                let text):
               try container.encode("richTextUnderline", forKey: .type)
                var caseContainer = encoder.container(keyedBy: UnderlineKeys.self)
                      try caseContainer.encode(text, forKey: .text)
            case .strikethrough(
                let text):
               try container.encode("richTextStrikethrough", forKey: .type)
                var caseContainer = encoder.container(keyedBy: StrikethroughKeys.self)
                      try caseContainer.encode(text, forKey: .text)
            case .fixed(
                let text):
               try container.encode("richTextFixed", forKey: .type)
                var caseContainer = encoder.container(keyedBy: FixedKeys.self)
                      try caseContainer.encode(text, forKey: .text)
            case .url(
                let text,
                let url,
                let isCached):
               try container.encode("richTextUrl", forKey: .type)
                var caseContainer = encoder.container(keyedBy: UrlKeys.self)
                      try caseContainer.encode(text, forKey: .text)
                      try caseContainer.encode(url, forKey: .url)
                      try caseContainer.encode(isCached, forKey: .isCached)
            case .emailAddress(
                let text,
                let emailAddress):
               try container.encode("richTextEmailAddress", forKey: .type)
                var caseContainer = encoder.container(keyedBy: EmailAddressKeys.self)
                      try caseContainer.encode(text, forKey: .text)
                      try caseContainer.encode(emailAddress, forKey: .emailAddress)
            case .subscript(
                let text):
               try container.encode("richTextSubscript", forKey: .type)
                var caseContainer = encoder.container(keyedBy: SubscriptKeys.self)
                      try caseContainer.encode(text, forKey: .text)
            case .superscript(
                let text):
               try container.encode("richTextSuperscript", forKey: .type)
                var caseContainer = encoder.container(keyedBy: SuperscriptKeys.self)
                      try caseContainer.encode(text, forKey: .text)
            case .marked(
                let text):
               try container.encode("richTextMarked", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MarkedKeys.self)
                      try caseContainer.encode(text, forKey: .text)
            case .phoneNumber(
                let text,
                let phoneNumber):
               try container.encode("richTextPhoneNumber", forKey: .type)
                var caseContainer = encoder.container(keyedBy: PhoneNumberKeys.self)
                      try caseContainer.encode(text, forKey: .text)
                      try caseContainer.encode(phoneNumber, forKey: .phoneNumber)
            case .icon(
                let document,
                let width,
                let height):
               try container.encode("richTextIcon", forKey: .type)
                var caseContainer = encoder.container(keyedBy: IconKeys.self)
                      try caseContainer.encode(document, forKey: .document)
                      try caseContainer.encode(width, forKey: .width)
                      try caseContainer.encode(height, forKey: .height)
            case .anchor(
                let text,
                let name):
               try container.encode("richTextAnchor", forKey: .type)
                var caseContainer = encoder.container(keyedBy: AnchorKeys.self)
                      try caseContainer.encode(text, forKey: .text)
                      try caseContainer.encode(name, forKey: .name)
            case .s(
                let texts):
               try container.encode("richTextS", forKey: .type)
                var caseContainer = encoder.container(keyedBy: SKeys.self)
                      try caseContainer.encode(texts, forKey: .texts)
        }
  }
}

extension SearchMessagesFilter {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "searchMessagesFilterEmpty":
      self = .empty
    case "searchMessagesFilterAnimation":
      self = .animation
    case "searchMessagesFilterAudio":
      self = .audio
    case "searchMessagesFilterDocument":
      self = .document
    case "searchMessagesFilterPhoto":
      self = .photo
    case "searchMessagesFilterVideo":
      self = .video
    case "searchMessagesFilterVoiceNote":
      self = .voiceNote
    case "searchMessagesFilterPhotoAndVideo":
      self = .photoAndVideo
    case "searchMessagesFilterUrl":
      self = .url
    case "searchMessagesFilterChatPhoto":
      self = .chatPhoto
    case "searchMessagesFilterCall":
      self = .call
    case "searchMessagesFilterMissedCall":
      self = .missedCall
    case "searchMessagesFilterVideoNote":
      self = .videoNote
    case "searchMessagesFilterVoiceAndVideoNote":
      self = .voiceAndVideoNote
    case "searchMessagesFilterMention":
      self = .mention
    case "searchMessagesFilterUnreadMention":
      self = .unreadMention
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .empty:
               try container.encode("searchMessagesFilterEmpty", forKey: .type)
            case .animation:
               try container.encode("searchMessagesFilterAnimation", forKey: .type)
            case .audio:
               try container.encode("searchMessagesFilterAudio", forKey: .type)
            case .document:
               try container.encode("searchMessagesFilterDocument", forKey: .type)
            case .photo:
               try container.encode("searchMessagesFilterPhoto", forKey: .type)
            case .video:
               try container.encode("searchMessagesFilterVideo", forKey: .type)
            case .voiceNote:
               try container.encode("searchMessagesFilterVoiceNote", forKey: .type)
            case .photoAndVideo:
               try container.encode("searchMessagesFilterPhotoAndVideo", forKey: .type)
            case .url:
               try container.encode("searchMessagesFilterUrl", forKey: .type)
            case .chatPhoto:
               try container.encode("searchMessagesFilterChatPhoto", forKey: .type)
            case .call:
               try container.encode("searchMessagesFilterCall", forKey: .type)
            case .missedCall:
               try container.encode("searchMessagesFilterMissedCall", forKey: .type)
            case .videoNote:
               try container.encode("searchMessagesFilterVideoNote", forKey: .type)
            case .voiceAndVideoNote:
               try container.encode("searchMessagesFilterVoiceAndVideoNote", forKey: .type)
            case .mention:
               try container.encode("searchMessagesFilterMention", forKey: .type)
            case .unreadMention:
               try container.encode("searchMessagesFilterUnreadMention", forKey: .type)
        }
  }
}

extension SecretChatState {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "secretChatStatePending":
      self = .pending
    case "secretChatStateReady":
      self = .ready
    case "secretChatStateClosed":
      self = .closed
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .pending:
               try container.encode("secretChatStatePending", forKey: .type)
            case .ready:
               try container.encode("secretChatStateReady", forKey: .type)
            case .closed:
               try container.encode("secretChatStateClosed", forKey: .type)
        }
  }
}

extension SupergroupMembersFilter {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum ContactsKeys: String, CodingKey {
          case query
  }
  enum SearchKeys: String, CodingKey {
          case query
  }
  enum RestrictedKeys: String, CodingKey {
          case query
  }
  enum BannedKeys: String, CodingKey {
          case query
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "supergroupMembersFilterRecent":
      self = .recent
    case "supergroupMembersFilterContacts":
      let caseContainer = try decoder.container(keyedBy: ContactsKeys.self)
      self = .contacts(
            query: try caseContainer.decode(String.self, forKey: .query)
        )
    case "supergroupMembersFilterAdministrators":
      self = .administrators
    case "supergroupMembersFilterSearch":
      let caseContainer = try decoder.container(keyedBy: SearchKeys.self)
      self = .search(
            query: try caseContainer.decode(String.self, forKey: .query)
        )
    case "supergroupMembersFilterRestricted":
      let caseContainer = try decoder.container(keyedBy: RestrictedKeys.self)
      self = .restricted(
            query: try caseContainer.decode(String.self, forKey: .query)
        )
    case "supergroupMembersFilterBanned":
      let caseContainer = try decoder.container(keyedBy: BannedKeys.self)
      self = .banned(
              query: try caseContainer.decodeIfPresent(String.self, forKey: .query)
        )
    case "supergroupMembersFilterBots":
      self = .bots
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .recent:
               try container.encode("supergroupMembersFilterRecent", forKey: .type)
            case .contacts(
                let query):
               try container.encode("supergroupMembersFilterContacts", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ContactsKeys.self)
                      try caseContainer.encode(query, forKey: .query)
            case .administrators:
               try container.encode("supergroupMembersFilterAdministrators", forKey: .type)
            case .search(
                let query):
               try container.encode("supergroupMembersFilterSearch", forKey: .type)
                var caseContainer = encoder.container(keyedBy: SearchKeys.self)
                      try caseContainer.encode(query, forKey: .query)
            case .restricted(
                let query):
               try container.encode("supergroupMembersFilterRestricted", forKey: .type)
                var caseContainer = encoder.container(keyedBy: RestrictedKeys.self)
                      try caseContainer.encode(query, forKey: .query)
            case .banned(
                let query):
               try container.encode("supergroupMembersFilterBanned", forKey: .type)
                var caseContainer = encoder.container(keyedBy: BannedKeys.self)
                      try caseContainer.encodeIfPresent(query, forKey: .query)
            case .bots:
               try container.encode("supergroupMembersFilterBots", forKey: .type)
        }
  }
}

extension TMeUrlType {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum UserKeys: String, CodingKey {
          case userId
  }
  enum SupergroupKeys: String, CodingKey {
          case supergroupId
  }
  enum ChatInviteKeys: String, CodingKey {
          case info
  }
  enum StickerSetKeys: String, CodingKey {
          case stickerSetId
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "tMeUrlTypeUser":
      let caseContainer = try decoder.container(keyedBy: UserKeys.self)
      self = .user(
            userId: try caseContainer.decode(Int32.self, forKey: .userId)
        )
    case "tMeUrlTypeSupergroup":
      let caseContainer = try decoder.container(keyedBy: SupergroupKeys.self)
      self = .supergroup(
            supergroupId: try caseContainer.decode(Int53.self, forKey: .supergroupId)
        )
    case "tMeUrlTypeChatInvite":
      let caseContainer = try decoder.container(keyedBy: ChatInviteKeys.self)
      self = .chatInvite(
            info: try caseContainer.decode(ChatInviteLinkInfo.self, forKey: .info)
        )
    case "tMeUrlTypeStickerSet":
      let caseContainer = try decoder.container(keyedBy: StickerSetKeys.self)
      self = .stickerSet(
            stickerSetId: try caseContainer.decode(TDInt64.self, forKey: .stickerSetId)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .user(
                let userId):
               try container.encode("tMeUrlTypeUser", forKey: .type)
                var caseContainer = encoder.container(keyedBy: UserKeys.self)
                      try caseContainer.encode(userId, forKey: .userId)
            case .supergroup(
                let supergroupId):
               try container.encode("tMeUrlTypeSupergroup", forKey: .type)
                var caseContainer = encoder.container(keyedBy: SupergroupKeys.self)
                      try caseContainer.encode(supergroupId, forKey: .supergroupId)
            case .chatInvite(
                let info):
               try container.encode("tMeUrlTypeChatInvite", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatInviteKeys.self)
                      try caseContainer.encode(info, forKey: .info)
            case .stickerSet(
                let stickerSetId):
               try container.encode("tMeUrlTypeStickerSet", forKey: .type)
                var caseContainer = encoder.container(keyedBy: StickerSetKeys.self)
                      try caseContainer.encode(stickerSetId, forKey: .stickerSetId)
        }
  }
}

extension TextEntityType {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum PreCodeKeys: String, CodingKey {
          case language
  }
  enum TextUrlKeys: String, CodingKey {
          case url
  }
  enum MentionNameKeys: String, CodingKey {
          case userId
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "textEntityTypeMention":
      self = .mention
    case "textEntityTypeHashtag":
      self = .hashtag
    case "textEntityTypeCashtag":
      self = .cashtag
    case "textEntityTypeBotCommand":
      self = .botCommand
    case "textEntityTypeUrl":
      self = .url
    case "textEntityTypeEmailAddress":
      self = .emailAddress
    case "textEntityTypePhoneNumber":
      self = .phoneNumber
    case "textEntityTypeBold":
      self = .bold
    case "textEntityTypeItalic":
      self = .italic
    case "textEntityTypeUnderline":
      self = .underline
    case "textEntityTypeStrikethrough":
      self = .strikethrough
    case "textEntityTypeCode":
      self = .code
    case "textEntityTypePre":
      self = .pre
    case "textEntityTypePreCode":
      let caseContainer = try decoder.container(keyedBy: PreCodeKeys.self)
      self = .preCode(
            language: try caseContainer.decode(String.self, forKey: .language)
        )
    case "textEntityTypeTextUrl":
      let caseContainer = try decoder.container(keyedBy: TextUrlKeys.self)
      self = .textUrl(
            url: try caseContainer.decode(String.self, forKey: .url)
        )
    case "textEntityTypeMentionName":
      let caseContainer = try decoder.container(keyedBy: MentionNameKeys.self)
      self = .mentionName(
            userId: try caseContainer.decode(Int32.self, forKey: .userId)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .mention:
               try container.encode("textEntityTypeMention", forKey: .type)
            case .hashtag:
               try container.encode("textEntityTypeHashtag", forKey: .type)
            case .cashtag:
               try container.encode("textEntityTypeCashtag", forKey: .type)
            case .botCommand:
               try container.encode("textEntityTypeBotCommand", forKey: .type)
            case .url:
               try container.encode("textEntityTypeUrl", forKey: .type)
            case .emailAddress:
               try container.encode("textEntityTypeEmailAddress", forKey: .type)
            case .phoneNumber:
               try container.encode("textEntityTypePhoneNumber", forKey: .type)
            case .bold:
               try container.encode("textEntityTypeBold", forKey: .type)
            case .italic:
               try container.encode("textEntityTypeItalic", forKey: .type)
            case .underline:
               try container.encode("textEntityTypeUnderline", forKey: .type)
            case .strikethrough:
               try container.encode("textEntityTypeStrikethrough", forKey: .type)
            case .code:
               try container.encode("textEntityTypeCode", forKey: .type)
            case .pre:
               try container.encode("textEntityTypePre", forKey: .type)
            case .preCode(
                let language):
               try container.encode("textEntityTypePreCode", forKey: .type)
                var caseContainer = encoder.container(keyedBy: PreCodeKeys.self)
                      try caseContainer.encode(language, forKey: .language)
            case .textUrl(
                let url):
               try container.encode("textEntityTypeTextUrl", forKey: .type)
                var caseContainer = encoder.container(keyedBy: TextUrlKeys.self)
                      try caseContainer.encode(url, forKey: .url)
            case .mentionName(
                let userId):
               try container.encode("textEntityTypeMentionName", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MentionNameKeys.self)
                      try caseContainer.encode(userId, forKey: .userId)
        }
  }
}

extension TextParseMode {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum MarkdownKeys: String, CodingKey {
          case version
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "textParseModeMarkdown":
      let caseContainer = try decoder.container(keyedBy: MarkdownKeys.self)
      self = .markdown(
              version: try caseContainer.decodeIfPresent(Int32.self, forKey: .version)
        )
    case "textParseModeHTML":
      self = .hTML
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .markdown(
                let version):
               try container.encode("textParseModeMarkdown", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MarkdownKeys.self)
                      try caseContainer.encodeIfPresent(version, forKey: .version)
            case .hTML:
               try container.encode("textParseModeHTML", forKey: .type)
        }
  }
}

extension TopChatCategory {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "topChatCategoryUsers":
      self = .users
    case "topChatCategoryBots":
      self = .bots
    case "topChatCategoryGroups":
      self = .groups
    case "topChatCategoryChannels":
      self = .channels
    case "topChatCategoryInlineBots":
      self = .inlineBots
    case "topChatCategoryCalls":
      self = .calls
    case "topChatCategoryForwardChats":
      self = .forwardChats
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .users:
               try container.encode("topChatCategoryUsers", forKey: .type)
            case .bots:
               try container.encode("topChatCategoryBots", forKey: .type)
            case .groups:
               try container.encode("topChatCategoryGroups", forKey: .type)
            case .channels:
               try container.encode("topChatCategoryChannels", forKey: .type)
            case .inlineBots:
               try container.encode("topChatCategoryInlineBots", forKey: .type)
            case .calls:
               try container.encode("topChatCategoryCalls", forKey: .type)
            case .forwardChats:
               try container.encode("topChatCategoryForwardChats", forKey: .type)
        }
  }
}

extension Update {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum AuthorizationStateKeys: String, CodingKey {
          case authorizationState
  }
  enum NewMessageKeys: String, CodingKey {
          case message
  }
  enum MessageSendAcknowledgedKeys: String, CodingKey {
          case chatId
          case messageId
  }
  enum MessageSendSucceededKeys: String, CodingKey {
          case message
          case oldMessageId
  }
  enum MessageSendFailedKeys: String, CodingKey {
          case message
          case oldMessageId
          case errorCode
          case errorMessage
  }
  enum MessageContentKeys: String, CodingKey {
          case chatId
          case messageId
          case newContent
  }
  enum MessageEditedKeys: String, CodingKey {
          case chatId
          case messageId
          case editDate
          case replyMarkup
  }
  enum MessageViewsKeys: String, CodingKey {
          case chatId
          case messageId
          case views
  }
  enum MessageContentOpenedKeys: String, CodingKey {
          case chatId
          case messageId
  }
  enum MessageMentionReadKeys: String, CodingKey {
          case chatId
          case messageId
          case unreadMentionCount
  }
  enum MessageLiveLocationViewedKeys: String, CodingKey {
          case chatId
          case messageId
  }
  enum NewChatKeys: String, CodingKey {
          case chat
  }
  enum ChatChatListKeys: String, CodingKey {
          case chatId
          case chatList
  }
  enum ChatTitleKeys: String, CodingKey {
          case chatId
          case title
  }
  enum ChatPhotoKeys: String, CodingKey {
          case chatId
          case photo
  }
  enum ChatPermissionsKeys: String, CodingKey {
          case chatId
          case permissions
  }
  enum ChatLastMessageKeys: String, CodingKey {
          case chatId
          case lastMessage
          case order
  }
  enum ChatOrderKeys: String, CodingKey {
          case chatId
          case order
  }
  enum ChatIsPinnedKeys: String, CodingKey {
          case chatId
          case isPinned
          case order
  }
  enum ChatIsMarkedAsUnreadKeys: String, CodingKey {
          case chatId
          case isMarkedAsUnread
  }
  enum ChatIsSponsoredKeys: String, CodingKey {
          case chatId
          case isSponsored
          case order
  }
  enum ChatHasScheduledMessagesKeys: String, CodingKey {
          case chatId
          case hasScheduledMessages
  }
  enum ChatDefaultDisableNotificationKeys: String, CodingKey {
          case chatId
          case defaultDisableNotification
  }
  enum ChatReadInboxKeys: String, CodingKey {
          case chatId
          case lastReadInboxMessageId
          case unreadCount
  }
  enum ChatReadOutboxKeys: String, CodingKey {
          case chatId
          case lastReadOutboxMessageId
  }
  enum ChatUnreadMentionCountKeys: String, CodingKey {
          case chatId
          case unreadMentionCount
  }
  enum ChatNotificationSettingsKeys: String, CodingKey {
          case chatId
          case notificationSettings
  }
  enum ScopeNotificationSettingsKeys: String, CodingKey {
          case scope
          case notificationSettings
  }
  enum ChatActionBarKeys: String, CodingKey {
          case chatId
          case actionBar
  }
  enum ChatPinnedMessageKeys: String, CodingKey {
          case chatId
          case pinnedMessageId
  }
  enum ChatReplyMarkupKeys: String, CodingKey {
          case chatId
          case replyMarkupMessageId
  }
  enum ChatDraftMessageKeys: String, CodingKey {
          case chatId
          case draftMessage
          case order
  }
  enum ChatOnlineMemberCountKeys: String, CodingKey {
          case chatId
          case onlineMemberCount
  }
  enum NotificationKeys: String, CodingKey {
          case notificationGroupId
          case notification
  }
  enum NotificationGroupKeys: String, CodingKey {
          case notificationGroupId
          case type
          case chatId
          case notificationSettingsChatId
          case isSilent
          case totalCount
          case addedNotifications
          case removedNotificationIds
  }
  enum ActiveNotificationsKeys: String, CodingKey {
          case groups
  }
  enum HavePendingNotificationsKeys: String, CodingKey {
          case haveDelayedNotifications
          case haveUnreceivedNotifications
  }
  enum DeleteMessagesKeys: String, CodingKey {
          case chatId
          case messageIds
          case isPermanent
          case fromCache
  }
  enum UserChatActionKeys: String, CodingKey {
          case chatId
          case userId
          case action
  }
  enum UserStatusKeys: String, CodingKey {
          case userId
          case status
  }
  enum UserKeys: String, CodingKey {
          case user
  }
  enum BasicGroupKeys: String, CodingKey {
          case basicGroup
  }
  enum SupergroupKeys: String, CodingKey {
          case supergroup
  }
  enum SecretChatKeys: String, CodingKey {
          case secretChat
  }
  enum UserFullInfoKeys: String, CodingKey {
          case userId
          case userFullInfo
  }
  enum BasicGroupFullInfoKeys: String, CodingKey {
          case basicGroupId
          case basicGroupFullInfo
  }
  enum SupergroupFullInfoKeys: String, CodingKey {
          case supergroupId
          case supergroupFullInfo
  }
  enum ServiceNotificationKeys: String, CodingKey {
          case type
          case content
  }
  enum FileKeys: String, CodingKey {
          case file
  }
  enum FileGenerationStartKeys: String, CodingKey {
          case generationId
          case originalPath
          case destinationPath
          case conversion
  }
  enum FileGenerationStopKeys: String, CodingKey {
          case generationId
  }
  enum CallKeys: String, CodingKey {
          case call
  }
  enum UserPrivacySettingRulesKeys: String, CodingKey {
          case setting
          case rules
  }
  enum UnreadMessageCountKeys: String, CodingKey {
          case chatList
          case unreadCount
          case unreadUnmutedCount
  }
  enum UnreadChatCountKeys: String, CodingKey {
          case chatList
          case totalCount
          case unreadCount
          case unreadUnmutedCount
          case markedAsUnreadCount
          case markedAsUnreadUnmutedCount
  }
  enum OptionKeys: String, CodingKey {
          case name
          case value
  }
  enum InstalledStickerSetsKeys: String, CodingKey {
          case isMasks
          case stickerSetIds
  }
  enum TrendingStickerSetsKeys: String, CodingKey {
          case stickerSets
  }
  enum RecentStickersKeys: String, CodingKey {
          case isAttached
          case stickerIds
  }
  enum FavoriteStickersKeys: String, CodingKey {
          case stickerIds
  }
  enum SavedAnimationsKeys: String, CodingKey {
          case animationIds
  }
  enum SelectedBackgroundKeys: String, CodingKey {
          case forDarkTheme
          case background
  }
  enum LanguagePackStringsKeys: String, CodingKey {
          case localizationTarget
          case languagePackId
          case strings
  }
  enum ConnectionStateKeys: String, CodingKey {
          case state
  }
  enum TermsOfServiceKeys: String, CodingKey {
          case termsOfServiceId
          case termsOfService
  }
  enum UsersNearbyKeys: String, CodingKey {
          case usersNearby
  }
  enum NewInlineQueryKeys: String, CodingKey {
          case id
          case senderUserId
          case userLocation
          case query
          case offset
  }
  enum NewChosenInlineResultKeys: String, CodingKey {
          case senderUserId
          case userLocation
          case query
          case resultId
          case inlineMessageId
  }
  enum NewCallbackQueryKeys: String, CodingKey {
          case id
          case senderUserId
          case chatId
          case messageId
          case chatInstance
          case payload
  }
  enum NewInlineCallbackQueryKeys: String, CodingKey {
          case id
          case senderUserId
          case inlineMessageId
          case chatInstance
          case payload
  }
  enum NewShippingQueryKeys: String, CodingKey {
          case id
          case senderUserId
          case invoicePayload
          case shippingAddress
  }
  enum NewPreCheckoutQueryKeys: String, CodingKey {
          case id
          case senderUserId
          case currency
          case totalAmount
          case invoicePayload
          case shippingOptionId
          case orderInfo
  }
  enum NewCustomEventKeys: String, CodingKey {
          case event
  }
  enum NewCustomQueryKeys: String, CodingKey {
          case id
          case data
          case timeout
  }
  enum PollKeys: String, CodingKey {
          case poll
  }
  enum PollAnswerKeys: String, CodingKey {
          case pollId
          case userId
          case optionIds
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "updateAuthorizationState":
      let caseContainer = try decoder.container(keyedBy: AuthorizationStateKeys.self)
      self = .authorizationState(
            authorizationState: try caseContainer.decode(AuthorizationState.self, forKey: .authorizationState)
        )
    case "updateNewMessage":
      let caseContainer = try decoder.container(keyedBy: NewMessageKeys.self)
      self = .newMessage(
            message: try caseContainer.decode(Message.self, forKey: .message)
        )
    case "updateMessageSendAcknowledged":
      let caseContainer = try decoder.container(keyedBy: MessageSendAcknowledgedKeys.self)
      self = .messageSendAcknowledged(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
            messageId: try caseContainer.decode(Int53.self, forKey: .messageId)
        )
    case "updateMessageSendSucceeded":
      let caseContainer = try decoder.container(keyedBy: MessageSendSucceededKeys.self)
      self = .messageSendSucceeded(
            message: try caseContainer.decode(Message.self, forKey: .message),
            oldMessageId: try caseContainer.decode(Int53.self, forKey: .oldMessageId)
        )
    case "updateMessageSendFailed":
      let caseContainer = try decoder.container(keyedBy: MessageSendFailedKeys.self)
      self = .messageSendFailed(
            message: try caseContainer.decode(Message.self, forKey: .message),
            oldMessageId: try caseContainer.decode(Int53.self, forKey: .oldMessageId),
            errorCode: try caseContainer.decode(Int32.self, forKey: .errorCode),
            errorMessage: try caseContainer.decode(String.self, forKey: .errorMessage)
        )
    case "updateMessageContent":
      let caseContainer = try decoder.container(keyedBy: MessageContentKeys.self)
      self = .messageContent(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
            messageId: try caseContainer.decode(Int53.self, forKey: .messageId),
            newContent: try caseContainer.decode(MessageContent.self, forKey: .newContent)
        )
    case "updateMessageEdited":
      let caseContainer = try decoder.container(keyedBy: MessageEditedKeys.self)
      self = .messageEdited(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
            messageId: try caseContainer.decode(Int53.self, forKey: .messageId),
            editDate: try caseContainer.decode(Int32.self, forKey: .editDate),
              replyMarkup: try caseContainer.decodeIfPresent(ReplyMarkup.self, forKey: .replyMarkup)
        )
    case "updateMessageViews":
      let caseContainer = try decoder.container(keyedBy: MessageViewsKeys.self)
      self = .messageViews(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
            messageId: try caseContainer.decode(Int53.self, forKey: .messageId),
            views: try caseContainer.decode(Int32.self, forKey: .views)
        )
    case "updateMessageContentOpened":
      let caseContainer = try decoder.container(keyedBy: MessageContentOpenedKeys.self)
      self = .messageContentOpened(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
            messageId: try caseContainer.decode(Int53.self, forKey: .messageId)
        )
    case "updateMessageMentionRead":
      let caseContainer = try decoder.container(keyedBy: MessageMentionReadKeys.self)
      self = .messageMentionRead(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
            messageId: try caseContainer.decode(Int53.self, forKey: .messageId),
            unreadMentionCount: try caseContainer.decode(Int32.self, forKey: .unreadMentionCount)
        )
    case "updateMessageLiveLocationViewed":
      let caseContainer = try decoder.container(keyedBy: MessageLiveLocationViewedKeys.self)
      self = .messageLiveLocationViewed(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
            messageId: try caseContainer.decode(Int53.self, forKey: .messageId)
        )
    case "updateNewChat":
      let caseContainer = try decoder.container(keyedBy: NewChatKeys.self)
      self = .newChat(
            chat: try caseContainer.decode(Chat.self, forKey: .chat)
        )
    case "updateChatChatList":
      let caseContainer = try decoder.container(keyedBy: ChatChatListKeys.self)
      self = .chatChatList(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
              chatList: try caseContainer.decodeIfPresent(ChatList.self, forKey: .chatList)
        )
    case "updateChatTitle":
      let caseContainer = try decoder.container(keyedBy: ChatTitleKeys.self)
      self = .chatTitle(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
            title: try caseContainer.decode(String.self, forKey: .title)
        )
    case "updateChatPhoto":
      let caseContainer = try decoder.container(keyedBy: ChatPhotoKeys.self)
      self = .chatPhoto(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
              photo: try caseContainer.decodeIfPresent(ChatPhoto.self, forKey: .photo)
        )
    case "updateChatPermissions":
      let caseContainer = try decoder.container(keyedBy: ChatPermissionsKeys.self)
      self = .chatPermissions(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
            permissions: try caseContainer.decode(ChatPermissions.self, forKey: .permissions)
        )
    case "updateChatLastMessage":
      let caseContainer = try decoder.container(keyedBy: ChatLastMessageKeys.self)
      self = .chatLastMessage(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
              lastMessage: try caseContainer.decodeIfPresent(Message.self, forKey: .lastMessage),
            order: try caseContainer.decode(TDInt64.self, forKey: .order)
        )
    case "updateChatOrder":
      let caseContainer = try decoder.container(keyedBy: ChatOrderKeys.self)
      self = .chatOrder(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
            order: try caseContainer.decode(TDInt64.self, forKey: .order)
        )
    case "updateChatIsPinned":
      let caseContainer = try decoder.container(keyedBy: ChatIsPinnedKeys.self)
      self = .chatIsPinned(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
            isPinned: try caseContainer.decode(Bool.self, forKey: .isPinned),
            order: try caseContainer.decode(TDInt64.self, forKey: .order)
        )
    case "updateChatIsMarkedAsUnread":
      let caseContainer = try decoder.container(keyedBy: ChatIsMarkedAsUnreadKeys.self)
      self = .chatIsMarkedAsUnread(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
            isMarkedAsUnread: try caseContainer.decode(Bool.self, forKey: .isMarkedAsUnread)
        )
    case "updateChatIsSponsored":
      let caseContainer = try decoder.container(keyedBy: ChatIsSponsoredKeys.self)
      self = .chatIsSponsored(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
            isSponsored: try caseContainer.decode(Bool.self, forKey: .isSponsored),
            order: try caseContainer.decode(TDInt64.self, forKey: .order)
        )
    case "updateChatHasScheduledMessages":
      let caseContainer = try decoder.container(keyedBy: ChatHasScheduledMessagesKeys.self)
      self = .chatHasScheduledMessages(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
            hasScheduledMessages: try caseContainer.decode(Bool.self, forKey: .hasScheduledMessages)
        )
    case "updateChatDefaultDisableNotification":
      let caseContainer = try decoder.container(keyedBy: ChatDefaultDisableNotificationKeys.self)
      self = .chatDefaultDisableNotification(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
            defaultDisableNotification: try caseContainer.decode(Bool.self, forKey: .defaultDisableNotification)
        )
    case "updateChatReadInbox":
      let caseContainer = try decoder.container(keyedBy: ChatReadInboxKeys.self)
      self = .chatReadInbox(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
            lastReadInboxMessageId: try caseContainer.decode(Int53.self, forKey: .lastReadInboxMessageId),
            unreadCount: try caseContainer.decode(Int32.self, forKey: .unreadCount)
        )
    case "updateChatReadOutbox":
      let caseContainer = try decoder.container(keyedBy: ChatReadOutboxKeys.self)
      self = .chatReadOutbox(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
            lastReadOutboxMessageId: try caseContainer.decode(Int53.self, forKey: .lastReadOutboxMessageId)
        )
    case "updateChatUnreadMentionCount":
      let caseContainer = try decoder.container(keyedBy: ChatUnreadMentionCountKeys.self)
      self = .chatUnreadMentionCount(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
            unreadMentionCount: try caseContainer.decode(Int32.self, forKey: .unreadMentionCount)
        )
    case "updateChatNotificationSettings":
      let caseContainer = try decoder.container(keyedBy: ChatNotificationSettingsKeys.self)
      self = .chatNotificationSettings(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
            notificationSettings: try caseContainer.decode(ChatNotificationSettings.self, forKey: .notificationSettings)
        )
    case "updateScopeNotificationSettings":
      let caseContainer = try decoder.container(keyedBy: ScopeNotificationSettingsKeys.self)
      self = .scopeNotificationSettings(
            scope: try caseContainer.decode(NotificationSettingsScope.self, forKey: .scope),
            notificationSettings: try caseContainer.decode(ScopeNotificationSettings.self, forKey: .notificationSettings)
        )
    case "updateChatActionBar":
      let caseContainer = try decoder.container(keyedBy: ChatActionBarKeys.self)
      self = .chatActionBar(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
              actionBar: try caseContainer.decodeIfPresent(ChatActionBar.self, forKey: .actionBar)
        )
    case "updateChatPinnedMessage":
      let caseContainer = try decoder.container(keyedBy: ChatPinnedMessageKeys.self)
      self = .chatPinnedMessage(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
            pinnedMessageId: try caseContainer.decode(Int53.self, forKey: .pinnedMessageId)
        )
    case "updateChatReplyMarkup":
      let caseContainer = try decoder.container(keyedBy: ChatReplyMarkupKeys.self)
      self = .chatReplyMarkup(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
            replyMarkupMessageId: try caseContainer.decode(Int53.self, forKey: .replyMarkupMessageId)
        )
    case "updateChatDraftMessage":
      let caseContainer = try decoder.container(keyedBy: ChatDraftMessageKeys.self)
      self = .chatDraftMessage(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
              draftMessage: try caseContainer.decodeIfPresent(DraftMessage.self, forKey: .draftMessage),
            order: try caseContainer.decode(TDInt64.self, forKey: .order)
        )
    case "updateChatOnlineMemberCount":
      let caseContainer = try decoder.container(keyedBy: ChatOnlineMemberCountKeys.self)
      self = .chatOnlineMemberCount(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
            onlineMemberCount: try caseContainer.decode(Int32.self, forKey: .onlineMemberCount)
        )
    case "updateNotification":
      let caseContainer = try decoder.container(keyedBy: NotificationKeys.self)
      self = .notification(
            notificationGroupId: try caseContainer.decode(Int32.self, forKey: .notificationGroupId),
            notification: try caseContainer.decode(Notification.self, forKey: .notification)
        )
    case "updateNotificationGroup":
      let caseContainer = try decoder.container(keyedBy: NotificationGroupKeys.self)
      self = .notificationGroup(
            notificationGroupId: try caseContainer.decode(Int32.self, forKey: .notificationGroupId),
            type: try caseContainer.decode(NotificationGroupType.self, forKey: .type),
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
            notificationSettingsChatId: try caseContainer.decode(Int53.self, forKey: .notificationSettingsChatId),
            isSilent: try caseContainer.decode(Bool.self, forKey: .isSilent),
            totalCount: try caseContainer.decode(Int32.self, forKey: .totalCount),
            addedNotifications: try caseContainer.decode([Notification].self, forKey: .addedNotifications),
            removedNotificationIds: try caseContainer.decode([Int32].self, forKey: .removedNotificationIds)
        )
    case "updateActiveNotifications":
      let caseContainer = try decoder.container(keyedBy: ActiveNotificationsKeys.self)
      self = .activeNotifications(
            groups: try caseContainer.decode([NotificationGroup].self, forKey: .groups)
        )
    case "updateHavePendingNotifications":
      let caseContainer = try decoder.container(keyedBy: HavePendingNotificationsKeys.self)
      self = .havePendingNotifications(
            haveDelayedNotifications: try caseContainer.decode(Bool.self, forKey: .haveDelayedNotifications),
            haveUnreceivedNotifications: try caseContainer.decode(Bool.self, forKey: .haveUnreceivedNotifications)
        )
    case "updateDeleteMessages":
      let caseContainer = try decoder.container(keyedBy: DeleteMessagesKeys.self)
      self = .deleteMessages(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
            messageIds: try caseContainer.decode([Int53].self, forKey: .messageIds),
            isPermanent: try caseContainer.decode(Bool.self, forKey: .isPermanent),
            fromCache: try caseContainer.decode(Bool.self, forKey: .fromCache)
        )
    case "updateUserChatAction":
      let caseContainer = try decoder.container(keyedBy: UserChatActionKeys.self)
      self = .userChatAction(
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
            userId: try caseContainer.decode(Int32.self, forKey: .userId),
            action: try caseContainer.decode(ChatAction.self, forKey: .action)
        )
    case "updateUserStatus":
      let caseContainer = try decoder.container(keyedBy: UserStatusKeys.self)
      self = .userStatus(
            userId: try caseContainer.decode(Int32.self, forKey: .userId),
            status: try caseContainer.decode(UserStatus.self, forKey: .status)
        )
    case "updateUser":
      let caseContainer = try decoder.container(keyedBy: UserKeys.self)
      self = .user(
            user: try caseContainer.decode(User.self, forKey: .user)
        )
    case "updateBasicGroup":
      let caseContainer = try decoder.container(keyedBy: BasicGroupKeys.self)
      self = .basicGroup(
            basicGroup: try caseContainer.decode(BasicGroup.self, forKey: .basicGroup)
        )
    case "updateSupergroup":
      let caseContainer = try decoder.container(keyedBy: SupergroupKeys.self)
      self = .supergroup(
            supergroup: try caseContainer.decode(Supergroup.self, forKey: .supergroup)
        )
    case "updateSecretChat":
      let caseContainer = try decoder.container(keyedBy: SecretChatKeys.self)
      self = .secretChat(
            secretChat: try caseContainer.decode(SecretChat.self, forKey: .secretChat)
        )
    case "updateUserFullInfo":
      let caseContainer = try decoder.container(keyedBy: UserFullInfoKeys.self)
      self = .userFullInfo(
            userId: try caseContainer.decode(Int32.self, forKey: .userId),
            userFullInfo: try caseContainer.decode(UserFullInfo.self, forKey: .userFullInfo)
        )
    case "updateBasicGroupFullInfo":
      let caseContainer = try decoder.container(keyedBy: BasicGroupFullInfoKeys.self)
      self = .basicGroupFullInfo(
            basicGroupId: try caseContainer.decode(Int32.self, forKey: .basicGroupId),
            basicGroupFullInfo: try caseContainer.decode(BasicGroupFullInfo.self, forKey: .basicGroupFullInfo)
        )
    case "updateSupergroupFullInfo":
      let caseContainer = try decoder.container(keyedBy: SupergroupFullInfoKeys.self)
      self = .supergroupFullInfo(
            supergroupId: try caseContainer.decode(Int32.self, forKey: .supergroupId),
            supergroupFullInfo: try caseContainer.decode(SupergroupFullInfo.self, forKey: .supergroupFullInfo)
        )
    case "updateServiceNotification":
      let caseContainer = try decoder.container(keyedBy: ServiceNotificationKeys.self)
      self = .serviceNotification(
            type: try caseContainer.decode(String.self, forKey: .type),
            content: try caseContainer.decode(MessageContent.self, forKey: .content)
        )
    case "updateFile":
      let caseContainer = try decoder.container(keyedBy: FileKeys.self)
      self = .file(
            file: try caseContainer.decode(File.self, forKey: .file)
        )
    case "updateFileGenerationStart":
      let caseContainer = try decoder.container(keyedBy: FileGenerationStartKeys.self)
      self = .fileGenerationStart(
            generationId: try caseContainer.decode(TDInt64.self, forKey: .generationId),
            originalPath: try caseContainer.decode(String.self, forKey: .originalPath),
            destinationPath: try caseContainer.decode(String.self, forKey: .destinationPath),
            conversion: try caseContainer.decode(String.self, forKey: .conversion)
        )
    case "updateFileGenerationStop":
      let caseContainer = try decoder.container(keyedBy: FileGenerationStopKeys.self)
      self = .fileGenerationStop(
            generationId: try caseContainer.decode(TDInt64.self, forKey: .generationId)
        )
    case "updateCall":
      let caseContainer = try decoder.container(keyedBy: CallKeys.self)
      self = .call(
            call: try caseContainer.decode(Call.self, forKey: .call)
        )
    case "updateUserPrivacySettingRules":
      let caseContainer = try decoder.container(keyedBy: UserPrivacySettingRulesKeys.self)
      self = .userPrivacySettingRules(
            setting: try caseContainer.decode(UserPrivacySetting.self, forKey: .setting),
            rules: try caseContainer.decode(UserPrivacySettingRules.self, forKey: .rules)
        )
    case "updateUnreadMessageCount":
      let caseContainer = try decoder.container(keyedBy: UnreadMessageCountKeys.self)
      self = .unreadMessageCount(
            chatList: try caseContainer.decode(ChatList.self, forKey: .chatList),
            unreadCount: try caseContainer.decode(Int32.self, forKey: .unreadCount),
            unreadUnmutedCount: try caseContainer.decode(Int32.self, forKey: .unreadUnmutedCount)
        )
    case "updateUnreadChatCount":
      let caseContainer = try decoder.container(keyedBy: UnreadChatCountKeys.self)
      self = .unreadChatCount(
            chatList: try caseContainer.decode(ChatList.self, forKey: .chatList),
            totalCount: try caseContainer.decode(Int32.self, forKey: .totalCount),
            unreadCount: try caseContainer.decode(Int32.self, forKey: .unreadCount),
            unreadUnmutedCount: try caseContainer.decode(Int32.self, forKey: .unreadUnmutedCount),
            markedAsUnreadCount: try caseContainer.decode(Int32.self, forKey: .markedAsUnreadCount),
            markedAsUnreadUnmutedCount: try caseContainer.decode(Int32.self, forKey: .markedAsUnreadUnmutedCount)
        )
    case "updateOption":
      let caseContainer = try decoder.container(keyedBy: OptionKeys.self)
      self = .option(
            name: try caseContainer.decode(String.self, forKey: .name),
            value: try caseContainer.decode(OptionValue.self, forKey: .value)
        )
    case "updateInstalledStickerSets":
      let caseContainer = try decoder.container(keyedBy: InstalledStickerSetsKeys.self)
      self = .installedStickerSets(
            isMasks: try caseContainer.decode(Bool.self, forKey: .isMasks),
            stickerSetIds: try caseContainer.decode([Int64].self, forKey: .stickerSetIds)
        )
    case "updateTrendingStickerSets":
      let caseContainer = try decoder.container(keyedBy: TrendingStickerSetsKeys.self)
      self = .trendingStickerSets(
            stickerSets: try caseContainer.decode(StickerSets.self, forKey: .stickerSets)
        )
    case "updateRecentStickers":
      let caseContainer = try decoder.container(keyedBy: RecentStickersKeys.self)
      self = .recentStickers(
            isAttached: try caseContainer.decode(Bool.self, forKey: .isAttached),
            stickerIds: try caseContainer.decode([Int32].self, forKey: .stickerIds)
        )
    case "updateFavoriteStickers":
      let caseContainer = try decoder.container(keyedBy: FavoriteStickersKeys.self)
      self = .favoriteStickers(
            stickerIds: try caseContainer.decode([Int32].self, forKey: .stickerIds)
        )
    case "updateSavedAnimations":
      let caseContainer = try decoder.container(keyedBy: SavedAnimationsKeys.self)
      self = .savedAnimations(
            animationIds: try caseContainer.decode([Int32].self, forKey: .animationIds)
        )
    case "updateSelectedBackground":
      let caseContainer = try decoder.container(keyedBy: SelectedBackgroundKeys.self)
      self = .selectedBackground(
            forDarkTheme: try caseContainer.decode(Bool.self, forKey: .forDarkTheme),
              background: try caseContainer.decodeIfPresent(Background.self, forKey: .background)
        )
    case "updateLanguagePackStrings":
      let caseContainer = try decoder.container(keyedBy: LanguagePackStringsKeys.self)
      self = .languagePackStrings(
            localizationTarget: try caseContainer.decode(String.self, forKey: .localizationTarget),
            languagePackId: try caseContainer.decode(String.self, forKey: .languagePackId),
            strings: try caseContainer.decode([LanguagePackString].self, forKey: .strings)
        )
    case "updateConnectionState":
      let caseContainer = try decoder.container(keyedBy: ConnectionStateKeys.self)
      self = .connectionState(
            state: try caseContainer.decode(ConnectionState.self, forKey: .state)
        )
    case "updateTermsOfService":
      let caseContainer = try decoder.container(keyedBy: TermsOfServiceKeys.self)
      self = .termsOfService(
            termsOfServiceId: try caseContainer.decode(String.self, forKey: .termsOfServiceId),
            termsOfService: try caseContainer.decode(TermsOfService.self, forKey: .termsOfService)
        )
    case "updateUsersNearby":
      let caseContainer = try decoder.container(keyedBy: UsersNearbyKeys.self)
      self = .usersNearby(
            usersNearby: try caseContainer.decode([ChatNearby].self, forKey: .usersNearby)
        )
    case "updateNewInlineQuery":
      let caseContainer = try decoder.container(keyedBy: NewInlineQueryKeys.self)
      self = .newInlineQuery(
            id: try caseContainer.decode(TDInt64.self, forKey: .id),
            senderUserId: try caseContainer.decode(Int32.self, forKey: .senderUserId),
              userLocation: try caseContainer.decodeIfPresent(Location.self, forKey: .userLocation),
            query: try caseContainer.decode(String.self, forKey: .query),
            offset: try caseContainer.decode(String.self, forKey: .offset)
        )
    case "updateNewChosenInlineResult":
      let caseContainer = try decoder.container(keyedBy: NewChosenInlineResultKeys.self)
      self = .newChosenInlineResult(
            senderUserId: try caseContainer.decode(Int32.self, forKey: .senderUserId),
              userLocation: try caseContainer.decodeIfPresent(Location.self, forKey: .userLocation),
            query: try caseContainer.decode(String.self, forKey: .query),
            resultId: try caseContainer.decode(String.self, forKey: .resultId),
            inlineMessageId: try caseContainer.decode(String.self, forKey: .inlineMessageId)
        )
    case "updateNewCallbackQuery":
      let caseContainer = try decoder.container(keyedBy: NewCallbackQueryKeys.self)
      self = .newCallbackQuery(
            id: try caseContainer.decode(TDInt64.self, forKey: .id),
            senderUserId: try caseContainer.decode(Int32.self, forKey: .senderUserId),
            chatId: try caseContainer.decode(Int53.self, forKey: .chatId),
            messageId: try caseContainer.decode(Int53.self, forKey: .messageId),
            chatInstance: try caseContainer.decode(TDInt64.self, forKey: .chatInstance),
            payload: try caseContainer.decode(CallbackQueryPayload.self, forKey: .payload)
        )
    case "updateNewInlineCallbackQuery":
      let caseContainer = try decoder.container(keyedBy: NewInlineCallbackQueryKeys.self)
      self = .newInlineCallbackQuery(
            id: try caseContainer.decode(TDInt64.self, forKey: .id),
            senderUserId: try caseContainer.decode(Int32.self, forKey: .senderUserId),
            inlineMessageId: try caseContainer.decode(String.self, forKey: .inlineMessageId),
            chatInstance: try caseContainer.decode(TDInt64.self, forKey: .chatInstance),
            payload: try caseContainer.decode(CallbackQueryPayload.self, forKey: .payload)
        )
    case "updateNewShippingQuery":
      let caseContainer = try decoder.container(keyedBy: NewShippingQueryKeys.self)
      self = .newShippingQuery(
            id: try caseContainer.decode(TDInt64.self, forKey: .id),
            senderUserId: try caseContainer.decode(Int32.self, forKey: .senderUserId),
            invoicePayload: try caseContainer.decode(String.self, forKey: .invoicePayload),
            shippingAddress: try caseContainer.decode(Address.self, forKey: .shippingAddress)
        )
    case "updateNewPreCheckoutQuery":
      let caseContainer = try decoder.container(keyedBy: NewPreCheckoutQueryKeys.self)
      self = .newPreCheckoutQuery(
            id: try caseContainer.decode(TDInt64.self, forKey: .id),
            senderUserId: try caseContainer.decode(Int32.self, forKey: .senderUserId),
            currency: try caseContainer.decode(String.self, forKey: .currency),
            totalAmount: try caseContainer.decode(Int53.self, forKey: .totalAmount),
            invoicePayload: try caseContainer.decode(Bytes.self, forKey: .invoicePayload),
            shippingOptionId: try caseContainer.decode(String.self, forKey: .shippingOptionId),
              orderInfo: try caseContainer.decodeIfPresent(OrderInfo.self, forKey: .orderInfo)
        )
    case "updateNewCustomEvent":
      let caseContainer = try decoder.container(keyedBy: NewCustomEventKeys.self)
      self = .newCustomEvent(
            event: try caseContainer.decode(String.self, forKey: .event)
        )
    case "updateNewCustomQuery":
      let caseContainer = try decoder.container(keyedBy: NewCustomQueryKeys.self)
      self = .newCustomQuery(
            id: try caseContainer.decode(TDInt64.self, forKey: .id),
            data: try caseContainer.decode(String.self, forKey: .data),
            timeout: try caseContainer.decode(Int32.self, forKey: .timeout)
        )
    case "updatePoll":
      let caseContainer = try decoder.container(keyedBy: PollKeys.self)
      self = .poll(
            poll: try caseContainer.decode(Poll.self, forKey: .poll)
        )
    case "updatePollAnswer":
      let caseContainer = try decoder.container(keyedBy: PollAnswerKeys.self)
      self = .pollAnswer(
            pollId: try caseContainer.decode(TDInt64.self, forKey: .pollId),
            userId: try caseContainer.decode(Int32.self, forKey: .userId),
            optionIds: try caseContainer.decode([Int32].self, forKey: .optionIds)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .authorizationState(
                let authorizationState):
               try container.encode("updateAuthorizationState", forKey: .type)
                var caseContainer = encoder.container(keyedBy: AuthorizationStateKeys.self)
                      try caseContainer.encode(authorizationState, forKey: .authorizationState)
            case .newMessage(
                let message):
               try container.encode("updateNewMessage", forKey: .type)
                var caseContainer = encoder.container(keyedBy: NewMessageKeys.self)
                      try caseContainer.encode(message, forKey: .message)
            case .messageSendAcknowledged(
                let chatId,
                let messageId):
               try container.encode("updateMessageSendAcknowledged", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageSendAcknowledgedKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encode(messageId, forKey: .messageId)
            case .messageSendSucceeded(
                let message,
                let oldMessageId):
               try container.encode("updateMessageSendSucceeded", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageSendSucceededKeys.self)
                      try caseContainer.encode(message, forKey: .message)
                      try caseContainer.encode(oldMessageId, forKey: .oldMessageId)
            case .messageSendFailed(
                let message,
                let oldMessageId,
                let errorCode,
                let errorMessage):
               try container.encode("updateMessageSendFailed", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageSendFailedKeys.self)
                      try caseContainer.encode(message, forKey: .message)
                      try caseContainer.encode(oldMessageId, forKey: .oldMessageId)
                      try caseContainer.encode(errorCode, forKey: .errorCode)
                      try caseContainer.encode(errorMessage, forKey: .errorMessage)
            case .messageContent(
                let chatId,
                let messageId,
                let newContent):
               try container.encode("updateMessageContent", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageContentKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encode(messageId, forKey: .messageId)
                      try caseContainer.encode(newContent, forKey: .newContent)
            case .messageEdited(
                let chatId,
                let messageId,
                let editDate,
                let replyMarkup):
               try container.encode("updateMessageEdited", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageEditedKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encode(messageId, forKey: .messageId)
                      try caseContainer.encode(editDate, forKey: .editDate)
                      try caseContainer.encodeIfPresent(replyMarkup, forKey: .replyMarkup)
            case .messageViews(
                let chatId,
                let messageId,
                let views):
               try container.encode("updateMessageViews", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageViewsKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encode(messageId, forKey: .messageId)
                      try caseContainer.encode(views, forKey: .views)
            case .messageContentOpened(
                let chatId,
                let messageId):
               try container.encode("updateMessageContentOpened", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageContentOpenedKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encode(messageId, forKey: .messageId)
            case .messageMentionRead(
                let chatId,
                let messageId,
                let unreadMentionCount):
               try container.encode("updateMessageMentionRead", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageMentionReadKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encode(messageId, forKey: .messageId)
                      try caseContainer.encode(unreadMentionCount, forKey: .unreadMentionCount)
            case .messageLiveLocationViewed(
                let chatId,
                let messageId):
               try container.encode("updateMessageLiveLocationViewed", forKey: .type)
                var caseContainer = encoder.container(keyedBy: MessageLiveLocationViewedKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encode(messageId, forKey: .messageId)
            case .newChat(
                let chat):
               try container.encode("updateNewChat", forKey: .type)
                var caseContainer = encoder.container(keyedBy: NewChatKeys.self)
                      try caseContainer.encode(chat, forKey: .chat)
            case .chatChatList(
                let chatId,
                let chatList):
               try container.encode("updateChatChatList", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatChatListKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encodeIfPresent(chatList, forKey: .chatList)
            case .chatTitle(
                let chatId,
                let title):
               try container.encode("updateChatTitle", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatTitleKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encode(title, forKey: .title)
            case .chatPhoto(
                let chatId,
                let photo):
               try container.encode("updateChatPhoto", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatPhotoKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encodeIfPresent(photo, forKey: .photo)
            case .chatPermissions(
                let chatId,
                let permissions):
               try container.encode("updateChatPermissions", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatPermissionsKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encode(permissions, forKey: .permissions)
            case .chatLastMessage(
                let chatId,
                let lastMessage,
                let order):
               try container.encode("updateChatLastMessage", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatLastMessageKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encodeIfPresent(lastMessage, forKey: .lastMessage)
                      try caseContainer.encode(order, forKey: .order)
            case .chatOrder(
                let chatId,
                let order):
               try container.encode("updateChatOrder", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatOrderKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encode(order, forKey: .order)
            case .chatIsPinned(
                let chatId,
                let isPinned,
                let order):
               try container.encode("updateChatIsPinned", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatIsPinnedKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encode(isPinned, forKey: .isPinned)
                      try caseContainer.encode(order, forKey: .order)
            case .chatIsMarkedAsUnread(
                let chatId,
                let isMarkedAsUnread):
               try container.encode("updateChatIsMarkedAsUnread", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatIsMarkedAsUnreadKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encode(isMarkedAsUnread, forKey: .isMarkedAsUnread)
            case .chatIsSponsored(
                let chatId,
                let isSponsored,
                let order):
               try container.encode("updateChatIsSponsored", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatIsSponsoredKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encode(isSponsored, forKey: .isSponsored)
                      try caseContainer.encode(order, forKey: .order)
            case .chatHasScheduledMessages(
                let chatId,
                let hasScheduledMessages):
               try container.encode("updateChatHasScheduledMessages", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatHasScheduledMessagesKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encode(hasScheduledMessages, forKey: .hasScheduledMessages)
            case .chatDefaultDisableNotification(
                let chatId,
                let defaultDisableNotification):
               try container.encode("updateChatDefaultDisableNotification", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatDefaultDisableNotificationKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encode(defaultDisableNotification, forKey: .defaultDisableNotification)
            case .chatReadInbox(
                let chatId,
                let lastReadInboxMessageId,
                let unreadCount):
               try container.encode("updateChatReadInbox", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatReadInboxKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encode(lastReadInboxMessageId, forKey: .lastReadInboxMessageId)
                      try caseContainer.encode(unreadCount, forKey: .unreadCount)
            case .chatReadOutbox(
                let chatId,
                let lastReadOutboxMessageId):
               try container.encode("updateChatReadOutbox", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatReadOutboxKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encode(lastReadOutboxMessageId, forKey: .lastReadOutboxMessageId)
            case .chatUnreadMentionCount(
                let chatId,
                let unreadMentionCount):
               try container.encode("updateChatUnreadMentionCount", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatUnreadMentionCountKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encode(unreadMentionCount, forKey: .unreadMentionCount)
            case .chatNotificationSettings(
                let chatId,
                let notificationSettings):
               try container.encode("updateChatNotificationSettings", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatNotificationSettingsKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encode(notificationSettings, forKey: .notificationSettings)
            case .scopeNotificationSettings(
                let scope,
                let notificationSettings):
               try container.encode("updateScopeNotificationSettings", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ScopeNotificationSettingsKeys.self)
                      try caseContainer.encode(scope, forKey: .scope)
                      try caseContainer.encode(notificationSettings, forKey: .notificationSettings)
            case .chatActionBar(
                let chatId,
                let actionBar):
               try container.encode("updateChatActionBar", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatActionBarKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encodeIfPresent(actionBar, forKey: .actionBar)
            case .chatPinnedMessage(
                let chatId,
                let pinnedMessageId):
               try container.encode("updateChatPinnedMessage", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatPinnedMessageKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encode(pinnedMessageId, forKey: .pinnedMessageId)
            case .chatReplyMarkup(
                let chatId,
                let replyMarkupMessageId):
               try container.encode("updateChatReplyMarkup", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatReplyMarkupKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encode(replyMarkupMessageId, forKey: .replyMarkupMessageId)
            case .chatDraftMessage(
                let chatId,
                let draftMessage,
                let order):
               try container.encode("updateChatDraftMessage", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatDraftMessageKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encodeIfPresent(draftMessage, forKey: .draftMessage)
                      try caseContainer.encode(order, forKey: .order)
            case .chatOnlineMemberCount(
                let chatId,
                let onlineMemberCount):
               try container.encode("updateChatOnlineMemberCount", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ChatOnlineMemberCountKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encode(onlineMemberCount, forKey: .onlineMemberCount)
            case .notification(
                let notificationGroupId,
                let notification):
               try container.encode("updateNotification", forKey: .type)
                var caseContainer = encoder.container(keyedBy: NotificationKeys.self)
                      try caseContainer.encode(notificationGroupId, forKey: .notificationGroupId)
                      try caseContainer.encode(notification, forKey: .notification)
            case .notificationGroup(
                let notificationGroupId,
                let type,
                let chatId,
                let notificationSettingsChatId,
                let isSilent,
                let totalCount,
                let addedNotifications,
                let removedNotificationIds):
               try container.encode("updateNotificationGroup", forKey: .type)
                var caseContainer = encoder.container(keyedBy: NotificationGroupKeys.self)
                      try caseContainer.encode(notificationGroupId, forKey: .notificationGroupId)
                      try caseContainer.encode(type, forKey: .type)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encode(notificationSettingsChatId, forKey: .notificationSettingsChatId)
                      try caseContainer.encode(isSilent, forKey: .isSilent)
                      try caseContainer.encode(totalCount, forKey: .totalCount)
                      try caseContainer.encode(addedNotifications, forKey: .addedNotifications)
                      try caseContainer.encode(removedNotificationIds, forKey: .removedNotificationIds)
            case .activeNotifications(
                let groups):
               try container.encode("updateActiveNotifications", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ActiveNotificationsKeys.self)
                      try caseContainer.encode(groups, forKey: .groups)
            case .havePendingNotifications(
                let haveDelayedNotifications,
                let haveUnreceivedNotifications):
               try container.encode("updateHavePendingNotifications", forKey: .type)
                var caseContainer = encoder.container(keyedBy: HavePendingNotificationsKeys.self)
                      try caseContainer.encode(haveDelayedNotifications, forKey: .haveDelayedNotifications)
                      try caseContainer.encode(haveUnreceivedNotifications, forKey: .haveUnreceivedNotifications)
            case .deleteMessages(
                let chatId,
                let messageIds,
                let isPermanent,
                let fromCache):
               try container.encode("updateDeleteMessages", forKey: .type)
                var caseContainer = encoder.container(keyedBy: DeleteMessagesKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encode(messageIds, forKey: .messageIds)
                      try caseContainer.encode(isPermanent, forKey: .isPermanent)
                      try caseContainer.encode(fromCache, forKey: .fromCache)
            case .userChatAction(
                let chatId,
                let userId,
                let action):
               try container.encode("updateUserChatAction", forKey: .type)
                var caseContainer = encoder.container(keyedBy: UserChatActionKeys.self)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encode(userId, forKey: .userId)
                      try caseContainer.encode(action, forKey: .action)
            case .userStatus(
                let userId,
                let status):
               try container.encode("updateUserStatus", forKey: .type)
                var caseContainer = encoder.container(keyedBy: UserStatusKeys.self)
                      try caseContainer.encode(userId, forKey: .userId)
                      try caseContainer.encode(status, forKey: .status)
            case .user(
                let user):
               try container.encode("updateUser", forKey: .type)
                var caseContainer = encoder.container(keyedBy: UserKeys.self)
                      try caseContainer.encode(user, forKey: .user)
            case .basicGroup(
                let basicGroup):
               try container.encode("updateBasicGroup", forKey: .type)
                var caseContainer = encoder.container(keyedBy: BasicGroupKeys.self)
                      try caseContainer.encode(basicGroup, forKey: .basicGroup)
            case .supergroup(
                let supergroup):
               try container.encode("updateSupergroup", forKey: .type)
                var caseContainer = encoder.container(keyedBy: SupergroupKeys.self)
                      try caseContainer.encode(supergroup, forKey: .supergroup)
            case .secretChat(
                let secretChat):
               try container.encode("updateSecretChat", forKey: .type)
                var caseContainer = encoder.container(keyedBy: SecretChatKeys.self)
                      try caseContainer.encode(secretChat, forKey: .secretChat)
            case .userFullInfo(
                let userId,
                let userFullInfo):
               try container.encode("updateUserFullInfo", forKey: .type)
                var caseContainer = encoder.container(keyedBy: UserFullInfoKeys.self)
                      try caseContainer.encode(userId, forKey: .userId)
                      try caseContainer.encode(userFullInfo, forKey: .userFullInfo)
            case .basicGroupFullInfo(
                let basicGroupId,
                let basicGroupFullInfo):
               try container.encode("updateBasicGroupFullInfo", forKey: .type)
                var caseContainer = encoder.container(keyedBy: BasicGroupFullInfoKeys.self)
                      try caseContainer.encode(basicGroupId, forKey: .basicGroupId)
                      try caseContainer.encode(basicGroupFullInfo, forKey: .basicGroupFullInfo)
            case .supergroupFullInfo(
                let supergroupId,
                let supergroupFullInfo):
               try container.encode("updateSupergroupFullInfo", forKey: .type)
                var caseContainer = encoder.container(keyedBy: SupergroupFullInfoKeys.self)
                      try caseContainer.encode(supergroupId, forKey: .supergroupId)
                      try caseContainer.encode(supergroupFullInfo, forKey: .supergroupFullInfo)
            case .serviceNotification(
                let type,
                let content):
               try container.encode("updateServiceNotification", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ServiceNotificationKeys.self)
                      try caseContainer.encode(type, forKey: .type)
                      try caseContainer.encode(content, forKey: .content)
            case .file(
                let file):
               try container.encode("updateFile", forKey: .type)
                var caseContainer = encoder.container(keyedBy: FileKeys.self)
                      try caseContainer.encode(file, forKey: .file)
            case .fileGenerationStart(
                let generationId,
                let originalPath,
                let destinationPath,
                let conversion):
               try container.encode("updateFileGenerationStart", forKey: .type)
                var caseContainer = encoder.container(keyedBy: FileGenerationStartKeys.self)
                      try caseContainer.encode(generationId, forKey: .generationId)
                      try caseContainer.encode(originalPath, forKey: .originalPath)
                      try caseContainer.encode(destinationPath, forKey: .destinationPath)
                      try caseContainer.encode(conversion, forKey: .conversion)
            case .fileGenerationStop(
                let generationId):
               try container.encode("updateFileGenerationStop", forKey: .type)
                var caseContainer = encoder.container(keyedBy: FileGenerationStopKeys.self)
                      try caseContainer.encode(generationId, forKey: .generationId)
            case .call(
                let call):
               try container.encode("updateCall", forKey: .type)
                var caseContainer = encoder.container(keyedBy: CallKeys.self)
                      try caseContainer.encode(call, forKey: .call)
            case .userPrivacySettingRules(
                let setting,
                let rules):
               try container.encode("updateUserPrivacySettingRules", forKey: .type)
                var caseContainer = encoder.container(keyedBy: UserPrivacySettingRulesKeys.self)
                      try caseContainer.encode(setting, forKey: .setting)
                      try caseContainer.encode(rules, forKey: .rules)
            case .unreadMessageCount(
                let chatList,
                let unreadCount,
                let unreadUnmutedCount):
               try container.encode("updateUnreadMessageCount", forKey: .type)
                var caseContainer = encoder.container(keyedBy: UnreadMessageCountKeys.self)
                      try caseContainer.encode(chatList, forKey: .chatList)
                      try caseContainer.encode(unreadCount, forKey: .unreadCount)
                      try caseContainer.encode(unreadUnmutedCount, forKey: .unreadUnmutedCount)
            case .unreadChatCount(
                let chatList,
                let totalCount,
                let unreadCount,
                let unreadUnmutedCount,
                let markedAsUnreadCount,
                let markedAsUnreadUnmutedCount):
               try container.encode("updateUnreadChatCount", forKey: .type)
                var caseContainer = encoder.container(keyedBy: UnreadChatCountKeys.self)
                      try caseContainer.encode(chatList, forKey: .chatList)
                      try caseContainer.encode(totalCount, forKey: .totalCount)
                      try caseContainer.encode(unreadCount, forKey: .unreadCount)
                      try caseContainer.encode(unreadUnmutedCount, forKey: .unreadUnmutedCount)
                      try caseContainer.encode(markedAsUnreadCount, forKey: .markedAsUnreadCount)
                      try caseContainer.encode(markedAsUnreadUnmutedCount, forKey: .markedAsUnreadUnmutedCount)
            case .option(
                let name,
                let value):
               try container.encode("updateOption", forKey: .type)
                var caseContainer = encoder.container(keyedBy: OptionKeys.self)
                      try caseContainer.encode(name, forKey: .name)
                      try caseContainer.encode(value, forKey: .value)
            case .installedStickerSets(
                let isMasks,
                let stickerSetIds):
               try container.encode("updateInstalledStickerSets", forKey: .type)
                var caseContainer = encoder.container(keyedBy: InstalledStickerSetsKeys.self)
                      try caseContainer.encode(isMasks, forKey: .isMasks)
                      try caseContainer.encode(stickerSetIds, forKey: .stickerSetIds)
            case .trendingStickerSets(
                let stickerSets):
               try container.encode("updateTrendingStickerSets", forKey: .type)
                var caseContainer = encoder.container(keyedBy: TrendingStickerSetsKeys.self)
                      try caseContainer.encode(stickerSets, forKey: .stickerSets)
            case .recentStickers(
                let isAttached,
                let stickerIds):
               try container.encode("updateRecentStickers", forKey: .type)
                var caseContainer = encoder.container(keyedBy: RecentStickersKeys.self)
                      try caseContainer.encode(isAttached, forKey: .isAttached)
                      try caseContainer.encode(stickerIds, forKey: .stickerIds)
            case .favoriteStickers(
                let stickerIds):
               try container.encode("updateFavoriteStickers", forKey: .type)
                var caseContainer = encoder.container(keyedBy: FavoriteStickersKeys.self)
                      try caseContainer.encode(stickerIds, forKey: .stickerIds)
            case .savedAnimations(
                let animationIds):
               try container.encode("updateSavedAnimations", forKey: .type)
                var caseContainer = encoder.container(keyedBy: SavedAnimationsKeys.self)
                      try caseContainer.encode(animationIds, forKey: .animationIds)
            case .selectedBackground(
                let forDarkTheme,
                let background):
               try container.encode("updateSelectedBackground", forKey: .type)
                var caseContainer = encoder.container(keyedBy: SelectedBackgroundKeys.self)
                      try caseContainer.encode(forDarkTheme, forKey: .forDarkTheme)
                      try caseContainer.encodeIfPresent(background, forKey: .background)
            case .languagePackStrings(
                let localizationTarget,
                let languagePackId,
                let strings):
               try container.encode("updateLanguagePackStrings", forKey: .type)
                var caseContainer = encoder.container(keyedBy: LanguagePackStringsKeys.self)
                      try caseContainer.encode(localizationTarget, forKey: .localizationTarget)
                      try caseContainer.encode(languagePackId, forKey: .languagePackId)
                      try caseContainer.encode(strings, forKey: .strings)
            case .connectionState(
                let state):
               try container.encode("updateConnectionState", forKey: .type)
                var caseContainer = encoder.container(keyedBy: ConnectionStateKeys.self)
                      try caseContainer.encode(state, forKey: .state)
            case .termsOfService(
                let termsOfServiceId,
                let termsOfService):
               try container.encode("updateTermsOfService", forKey: .type)
                var caseContainer = encoder.container(keyedBy: TermsOfServiceKeys.self)
                      try caseContainer.encode(termsOfServiceId, forKey: .termsOfServiceId)
                      try caseContainer.encode(termsOfService, forKey: .termsOfService)
            case .usersNearby(
                let usersNearby):
               try container.encode("updateUsersNearby", forKey: .type)
                var caseContainer = encoder.container(keyedBy: UsersNearbyKeys.self)
                      try caseContainer.encode(usersNearby, forKey: .usersNearby)
            case .newInlineQuery(
                let id,
                let senderUserId,
                let userLocation,
                let query,
                let offset):
               try container.encode("updateNewInlineQuery", forKey: .type)
                var caseContainer = encoder.container(keyedBy: NewInlineQueryKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(senderUserId, forKey: .senderUserId)
                      try caseContainer.encodeIfPresent(userLocation, forKey: .userLocation)
                      try caseContainer.encode(query, forKey: .query)
                      try caseContainer.encode(offset, forKey: .offset)
            case .newChosenInlineResult(
                let senderUserId,
                let userLocation,
                let query,
                let resultId,
                let inlineMessageId):
               try container.encode("updateNewChosenInlineResult", forKey: .type)
                var caseContainer = encoder.container(keyedBy: NewChosenInlineResultKeys.self)
                      try caseContainer.encode(senderUserId, forKey: .senderUserId)
                      try caseContainer.encodeIfPresent(userLocation, forKey: .userLocation)
                      try caseContainer.encode(query, forKey: .query)
                      try caseContainer.encode(resultId, forKey: .resultId)
                      try caseContainer.encode(inlineMessageId, forKey: .inlineMessageId)
            case .newCallbackQuery(
                let id,
                let senderUserId,
                let chatId,
                let messageId,
                let chatInstance,
                let payload):
               try container.encode("updateNewCallbackQuery", forKey: .type)
                var caseContainer = encoder.container(keyedBy: NewCallbackQueryKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(senderUserId, forKey: .senderUserId)
                      try caseContainer.encode(chatId, forKey: .chatId)
                      try caseContainer.encode(messageId, forKey: .messageId)
                      try caseContainer.encode(chatInstance, forKey: .chatInstance)
                      try caseContainer.encode(payload, forKey: .payload)
            case .newInlineCallbackQuery(
                let id,
                let senderUserId,
                let inlineMessageId,
                let chatInstance,
                let payload):
               try container.encode("updateNewInlineCallbackQuery", forKey: .type)
                var caseContainer = encoder.container(keyedBy: NewInlineCallbackQueryKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(senderUserId, forKey: .senderUserId)
                      try caseContainer.encode(inlineMessageId, forKey: .inlineMessageId)
                      try caseContainer.encode(chatInstance, forKey: .chatInstance)
                      try caseContainer.encode(payload, forKey: .payload)
            case .newShippingQuery(
                let id,
                let senderUserId,
                let invoicePayload,
                let shippingAddress):
               try container.encode("updateNewShippingQuery", forKey: .type)
                var caseContainer = encoder.container(keyedBy: NewShippingQueryKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(senderUserId, forKey: .senderUserId)
                      try caseContainer.encode(invoicePayload, forKey: .invoicePayload)
                      try caseContainer.encode(shippingAddress, forKey: .shippingAddress)
            case .newPreCheckoutQuery(
                let id,
                let senderUserId,
                let currency,
                let totalAmount,
                let invoicePayload,
                let shippingOptionId,
                let orderInfo):
               try container.encode("updateNewPreCheckoutQuery", forKey: .type)
                var caseContainer = encoder.container(keyedBy: NewPreCheckoutQueryKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(senderUserId, forKey: .senderUserId)
                      try caseContainer.encode(currency, forKey: .currency)
                      try caseContainer.encode(totalAmount, forKey: .totalAmount)
                      try caseContainer.encode(invoicePayload, forKey: .invoicePayload)
                      try caseContainer.encode(shippingOptionId, forKey: .shippingOptionId)
                      try caseContainer.encodeIfPresent(orderInfo, forKey: .orderInfo)
            case .newCustomEvent(
                let event):
               try container.encode("updateNewCustomEvent", forKey: .type)
                var caseContainer = encoder.container(keyedBy: NewCustomEventKeys.self)
                      try caseContainer.encode(event, forKey: .event)
            case .newCustomQuery(
                let id,
                let data,
                let timeout):
               try container.encode("updateNewCustomQuery", forKey: .type)
                var caseContainer = encoder.container(keyedBy: NewCustomQueryKeys.self)
                      try caseContainer.encode(id, forKey: .id)
                      try caseContainer.encode(data, forKey: .data)
                      try caseContainer.encode(timeout, forKey: .timeout)
            case .poll(
                let poll):
               try container.encode("updatePoll", forKey: .type)
                var caseContainer = encoder.container(keyedBy: PollKeys.self)
                      try caseContainer.encode(poll, forKey: .poll)
            case .pollAnswer(
                let pollId,
                let userId,
                let optionIds):
               try container.encode("updatePollAnswer", forKey: .type)
                var caseContainer = encoder.container(keyedBy: PollAnswerKeys.self)
                      try caseContainer.encode(pollId, forKey: .pollId)
                      try caseContainer.encode(userId, forKey: .userId)
                      try caseContainer.encode(optionIds, forKey: .optionIds)
        }
  }
}

extension UserPrivacySetting {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "userPrivacySettingShowStatus":
      self = .showStatus
    case "userPrivacySettingShowProfilePhoto":
      self = .showProfilePhoto
    case "userPrivacySettingShowLinkInForwardedMessages":
      self = .showLinkInForwardedMessages
    case "userPrivacySettingShowPhoneNumber":
      self = .showPhoneNumber
    case "userPrivacySettingAllowChatInvites":
      self = .allowChatInvites
    case "userPrivacySettingAllowCalls":
      self = .allowCalls
    case "userPrivacySettingAllowPeerToPeerCalls":
      self = .allowPeerToPeerCalls
    case "userPrivacySettingAllowFindingByPhoneNumber":
      self = .allowFindingByPhoneNumber
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .showStatus:
               try container.encode("userPrivacySettingShowStatus", forKey: .type)
            case .showProfilePhoto:
               try container.encode("userPrivacySettingShowProfilePhoto", forKey: .type)
            case .showLinkInForwardedMessages:
               try container.encode("userPrivacySettingShowLinkInForwardedMessages", forKey: .type)
            case .showPhoneNumber:
               try container.encode("userPrivacySettingShowPhoneNumber", forKey: .type)
            case .allowChatInvites:
               try container.encode("userPrivacySettingAllowChatInvites", forKey: .type)
            case .allowCalls:
               try container.encode("userPrivacySettingAllowCalls", forKey: .type)
            case .allowPeerToPeerCalls:
               try container.encode("userPrivacySettingAllowPeerToPeerCalls", forKey: .type)
            case .allowFindingByPhoneNumber:
               try container.encode("userPrivacySettingAllowFindingByPhoneNumber", forKey: .type)
        }
  }
}

extension UserPrivacySettingRule {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum AllowUsersKeys: String, CodingKey {
          case userIds
  }
  enum AllowChatMembersKeys: String, CodingKey {
          case chatIds
  }
  enum RestrictUsersKeys: String, CodingKey {
          case userIds
  }
  enum RestrictChatMembersKeys: String, CodingKey {
          case chatIds
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "userPrivacySettingRuleAllowAll":
      self = .allowAll
    case "userPrivacySettingRuleAllowContacts":
      self = .allowContacts
    case "userPrivacySettingRuleAllowUsers":
      let caseContainer = try decoder.container(keyedBy: AllowUsersKeys.self)
      self = .allowUsers(
            userIds: try caseContainer.decode([Int32].self, forKey: .userIds)
        )
    case "userPrivacySettingRuleAllowChatMembers":
      let caseContainer = try decoder.container(keyedBy: AllowChatMembersKeys.self)
      self = .allowChatMembers(
            chatIds: try caseContainer.decode([Int53].self, forKey: .chatIds)
        )
    case "userPrivacySettingRuleRestrictAll":
      self = .restrictAll
    case "userPrivacySettingRuleRestrictContacts":
      self = .restrictContacts
    case "userPrivacySettingRuleRestrictUsers":
      let caseContainer = try decoder.container(keyedBy: RestrictUsersKeys.self)
      self = .restrictUsers(
            userIds: try caseContainer.decode([Int32].self, forKey: .userIds)
        )
    case "userPrivacySettingRuleRestrictChatMembers":
      let caseContainer = try decoder.container(keyedBy: RestrictChatMembersKeys.self)
      self = .restrictChatMembers(
            chatIds: try caseContainer.decode([Int53].self, forKey: .chatIds)
        )
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .allowAll:
               try container.encode("userPrivacySettingRuleAllowAll", forKey: .type)
            case .allowContacts:
               try container.encode("userPrivacySettingRuleAllowContacts", forKey: .type)
            case .allowUsers(
                let userIds):
               try container.encode("userPrivacySettingRuleAllowUsers", forKey: .type)
                var caseContainer = encoder.container(keyedBy: AllowUsersKeys.self)
                      try caseContainer.encode(userIds, forKey: .userIds)
            case .allowChatMembers(
                let chatIds):
               try container.encode("userPrivacySettingRuleAllowChatMembers", forKey: .type)
                var caseContainer = encoder.container(keyedBy: AllowChatMembersKeys.self)
                      try caseContainer.encode(chatIds, forKey: .chatIds)
            case .restrictAll:
               try container.encode("userPrivacySettingRuleRestrictAll", forKey: .type)
            case .restrictContacts:
               try container.encode("userPrivacySettingRuleRestrictContacts", forKey: .type)
            case .restrictUsers(
                let userIds):
               try container.encode("userPrivacySettingRuleRestrictUsers", forKey: .type)
                var caseContainer = encoder.container(keyedBy: RestrictUsersKeys.self)
                      try caseContainer.encode(userIds, forKey: .userIds)
            case .restrictChatMembers(
                let chatIds):
               try container.encode("userPrivacySettingRuleRestrictChatMembers", forKey: .type)
                var caseContainer = encoder.container(keyedBy: RestrictChatMembersKeys.self)
                      try caseContainer.encode(chatIds, forKey: .chatIds)
        }
  }
}

extension UserStatus {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum OnlineKeys: String, CodingKey {
          case expires
  }
  enum OfflineKeys: String, CodingKey {
          case wasOnline
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "userStatusEmpty":
      self = .empty
    case "userStatusOnline":
      let caseContainer = try decoder.container(keyedBy: OnlineKeys.self)
      self = .online(
            expires: try caseContainer.decode(Int32.self, forKey: .expires)
        )
    case "userStatusOffline":
      let caseContainer = try decoder.container(keyedBy: OfflineKeys.self)
      self = .offline(
            wasOnline: try caseContainer.decode(Int32.self, forKey: .wasOnline)
        )
    case "userStatusRecently":
      self = .recently
    case "userStatusLastWeek":
      self = .lastWeek
    case "userStatusLastMonth":
      self = .lastMonth
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .empty:
               try container.encode("userStatusEmpty", forKey: .type)
            case .online(
                let expires):
               try container.encode("userStatusOnline", forKey: .type)
                var caseContainer = encoder.container(keyedBy: OnlineKeys.self)
                      try caseContainer.encode(expires, forKey: .expires)
            case .offline(
                let wasOnline):
               try container.encode("userStatusOffline", forKey: .type)
                var caseContainer = encoder.container(keyedBy: OfflineKeys.self)
                      try caseContainer.encode(wasOnline, forKey: .wasOnline)
            case .recently:
               try container.encode("userStatusRecently", forKey: .type)
            case .lastWeek:
               try container.encode("userStatusLastWeek", forKey: .type)
            case .lastMonth:
               try container.encode("userStatusLastMonth", forKey: .type)
        }
  }
}

extension UserType {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TDError: Swift.Error {
        case unknownState(String)
  }
  enum BotKeys: String, CodingKey {
          case canJoinGroups
          case canReadAllGroupMessages
          case isInline
          case inlineQueryPlaceholder
          case needLocation
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "userTypeRegular":
      self = .regular
    case "userTypeDeleted":
      self = .deleted
    case "userTypeBot":
      let caseContainer = try decoder.container(keyedBy: BotKeys.self)
      self = .bot(
            canJoinGroups: try caseContainer.decode(Bool.self, forKey: .canJoinGroups),
            canReadAllGroupMessages: try caseContainer.decode(Bool.self, forKey: .canReadAllGroupMessages),
            isInline: try caseContainer.decode(Bool.self, forKey: .isInline),
            inlineQueryPlaceholder: try caseContainer.decode(String.self, forKey: .inlineQueryPlaceholder),
            needLocation: try caseContainer.decode(Bool.self, forKey: .needLocation)
        )
    case "userTypeUnknown":
      self = .unknown
    default:
       throw TDError.unknownState(type)
        }
    }

  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .regular:
               try container.encode("userTypeRegular", forKey: .type)
            case .deleted:
               try container.encode("userTypeDeleted", forKey: .type)
            case .bot(
                let canJoinGroups,
                let canReadAllGroupMessages,
                let isInline,
                let inlineQueryPlaceholder,
                let needLocation):
               try container.encode("userTypeBot", forKey: .type)
                var caseContainer = encoder.container(keyedBy: BotKeys.self)
                      try caseContainer.encode(canJoinGroups, forKey: .canJoinGroups)
                      try caseContainer.encode(canReadAllGroupMessages, forKey: .canReadAllGroupMessages)
                      try caseContainer.encode(isInline, forKey: .isInline)
                      try caseContainer.encode(inlineQueryPlaceholder, forKey: .inlineQueryPlaceholder)
                      try caseContainer.encode(needLocation, forKey: .needLocation)
            case .unknown:
               try container.encode("userTypeUnknown", forKey: .type)
        }
  }
}
  
