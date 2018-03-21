import PromiseKit

public class Coordinator {
    public let client: TDJsonClient
    let apiId: Int
    let apiHash: String
    
    let functionStream = Stream<LoadingEvent<(Extra, Data)>>()
    let eventStream = Stream<LoadingFailableEvent<Update>>()
    public var authorizationState: (AuthorizationState) -> Void = { _ in }
    public let connectionState = Stream<LoadingEvent<ConnectionState>>()
    
    var runningFunctions: [Extra: (Data) -> Void] = [:]

    fileprivate func updateAuthorizationState(state: AuthorizationState) throws {
        switch state {
        case .waitTdlibParameters:
            self.send(SetTDLibParameters(parameters: TDLibParameters(apiId: self.apiId,
                                                                           apiHash: self.apiHash)))
        case .waitEncryptionKey(let isEncrypted):
            let key = Data(repeating: 123, count: 64)
            //                key.withUnsafeMutableBytes { bytes in
            //                    SecRandomCopyBytes(kSecRandomDefault, 64, bytes)
            //                }
            try self.send(CheckDatabaseEncryptionKey(encryptionKey: key))
        default:
            break
        }
        self.authorizationState(state)
    }
    
    public init(client: TDJsonClient, apiId: Int, apiHash: String) {
        self.client = client
        self.apiId = apiId
        self.apiHash = apiHash
        self.client.stream = { [weak self] data in
            DispatchQueue.global().async {
            guard let strongSelf = self else {
                return
            }
            if let extra = try? JSONDecoder.td.decode(Extra.self, from: data) {
                if let resolver = strongSelf.runningFunctions[extra] {
                    strongSelf.runningFunctions[extra] = nil
                    resolver(data)
                } else {
                    //                    print("Unassigned function result: \(extra)")
                }
            } else {
                do {
                    let update = try JSONDecoder.td.decode(Update.self, from: data)
                    //                        print(event)
                    switch update {
                    case let .updateAuthorizationState(state):
                        try? strongSelf.updateAuthorizationState(state: state)
                    case let .connectionState(state):
//                        try strongSelf.updateConnectionState(state: state)
                        ()
                    }
                } catch {
//                    strongSelf.eventStream.current = .error(error)
                    print(error)
                }
            }
            }
        }
//        self.client.stream.subscribeStrong(self) { strongSelf, event in
//            switch event {
//            case .pending:
//                break
//            case let .value(data):
//                if let extra = try? JSONDecoder.td.decode(Extra.self, from: data) {
//                    strongSelf.functionStream.current = .value((extra, data))
//                } else {
//                    do {
//                        let event = try JSONDecoder.td.decode(Update.self, from: data)
////                        print(event)
//                        strongSelf.eventStream.current = .value(event)
//                    } catch {
//                        strongSelf.eventStream.current = .error(error)
//                    }
//                }
//            case let .error(error):
////                print(error)
//                break
//            }
//
//        }
//        self.functionStream.subscribeStrong(self) { (strongSelf, event) in
//            if let (extra, data) = event.value {
//                if let resolver = strongSelf.runningFunctions[extra] {
//                    strongSelf.runningFunctions[extra] = nil
//                    resolver.fulfill(data)
//                } else {
////                    print("Unassigned function result: \(extra)")
//                }
//            }
//        }
//        self.eventStream.subscribeStrong(self) { strongSelf, event in
//            switch event {
//            case .pending:
//                print("Loading...")
//            case let .value(update):
//                switch update {
//                case let .updateAuthorizationState(state):
//                    strongSelf.authorizationState.current = .value(state)
//                case let .connectionState(state):
//                    strongSelf.connectionState.current = .value(state)
//                }
//            case let .error(error):
////                print(error)
//                break
//            }
//        }
//        self.authorizationState.subscribeStrong(self) { strongSelf, event in
//            do {
//                updateAuthorizationState(event, strongSelf)
//            } catch {
////                print(error)
//            }
//        }
    }
    
    public func send<F: TDFunction>(_ function: F, callback: @escaping (F.T?) -> Void = { _ in }) {
//        let (promise, resolver) = Promise<Data>.pending()
        let wrapper = FunctionWrapper(function: function)
        do {
            try self.client.send(wrapper)
        } catch {
//            resolver.reject(error)
        }
        let extra = Extra(type: F.T.type, extra: wrapper.extra)
        self.runningFunctions[extra] = { data in
            do {
                callback(try JSONDecoder.td.decode(F.T.self, from: data))
            } catch {
//                throw error
                callback(nil)
            }
        }
//        return promise.map { data in
//
//        }
    }
}
