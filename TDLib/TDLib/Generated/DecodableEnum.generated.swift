// Generated using Sourcery 0.11.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



extension AuthorizationState: Decodable {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum Error: Swift.Error {
        case unknownState(String)
  }
  enum WaitEncryptionKeyKeys: String, CodingKey {
          case isEncrypted
  }
  enum WaitCodeKeys: String, CodingKey {
          case isRegistered
          case codeInfo
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
          isRegistered: try caseContainer.decode(Bool.self, forKey: .isRegistered),
          codeInfo: try caseContainer.decode(CodeInfo.self, forKey: .codeInfo)
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
       throw Error.unknownState(type)
        }
    }
}

extension ChatType: Decodable {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum Error: Swift.Error {
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
       throw Error.unknownState(type)
        }
    }
}

extension CodeType: Decodable {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum Error: Swift.Error {
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
    case "authenticationCodeTelegramMessage":
      let caseContainer = try decoder.container(keyedBy: TelegramMessageKeys.self)
      self = .telegramMessage(
          length: try caseContainer.decode(Int32.self, forKey: .length)
        )
    case "authenticationCodeSms":
      let caseContainer = try decoder.container(keyedBy: SmsKeys.self)
      self = .sms(
          length: try caseContainer.decode(Int32.self, forKey: .length)
        )
    case "authenticationCodeCall":
      let caseContainer = try decoder.container(keyedBy: CallKeys.self)
      self = .call(
          length: try caseContainer.decode(Int32.self, forKey: .length)
        )
    case "authenticationCodeFlashCall":
      let caseContainer = try decoder.container(keyedBy: FlashCallKeys.self)
      self = .flashCall(
          pattern: try caseContainer.decode(String.self, forKey: .pattern)
        )
    default:
       throw Error.unknownState(type)
        }
    }
}

extension ConnectionState: Decodable {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum Error: Swift.Error {
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
       throw Error.unknownState(type)
        }
    }
}

extension MessageContent: Decodable {
  enum CodingKeys: String, CodingKey {
        case type = "@type"
  }
  enum TextKeys: String, CodingKey {
          case text
  }
  enum PhotoKeys: String, CodingKey {
          case photo
          case caption
  }

  public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
    case "messageText":
      let caseContainer = try decoder.container(keyedBy: TextKeys.self)
      self = .text(
          text: try caseContainer.decode(FormattedText.self, forKey: .text)
        )
    case "messagePhoto":
      let caseContainer = try decoder.container(keyedBy: PhotoKeys.self)
      self = .photo(
          photo: try caseContainer.decode(Photo.self, forKey: .photo),
          caption: try caseContainer.decode(FormattedText.self, forKey: .caption)
        )
    case "messageOther":
      self = .other
    default:
        self = .other
        }
    }
}
  