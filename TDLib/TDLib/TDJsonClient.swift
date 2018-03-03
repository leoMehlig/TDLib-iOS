//
//  TDJsonClient.swift
//  TDLib
//
//  Created by Leo Mehlig on 26.02.18.
//  Copyright © 2018 Leo Mehlig. All rights reserved.
//

import Foundation
import libtdjson

public class TDJsonClient {
    private let queue = DispatchQueue(label: "tdjsonclient", qos: .userInitiated)
    
    private let client = td_json_client_create()
    
    private let event: (TDEvent, TDJsonClient) -> Void
    
    public private(set) var isListing = true
    
    public init(event: @escaping (TDEvent, TDJsonClient) -> Void) {
        self.event = event
        td_set_log_verbosity_level(3)
        self.queue.async {
            while self.isListing {
                if let response = td_json_client_receive(self.client, 10),
                    let data = String(cString: response).data(using: .utf8) {
                    do {
                        let event = try JSONDecoder().decode(TDEvent.self, from: data)
                        print(event)
                        self.event(event, self)
                        try self.act(on: event)
                    } catch {
                        print(error, String(data: data, encoding: .utf8)!)
                    }
                }
            }
        }
    }
    
    func act(on event: TDEvent) throws {
        switch event {
        case let .updateAuthorizationState(state):
            switch state {
            case .waitTdlibParameters:
                try self.send(TDFunction.setTDLibParameters(parameters: TDLibParameters(apiID: 177033, apiHash: "d61e84baf1d5da953fdabd730b0b557f")))
            case let .waitEncryptionKey(isEncrypted):
                let key = Data(repeating: 123, count: 64)
//                key.withUnsafeMutableBytes { bytes in
//                    SecRandomCopyBytes(kSecRandomDefault, 64, bytes)
//                }
                try self.send(TDFunction.checkDatabaseEncryptionKey(encryptionKey: key))
            case .waitPhoneNumber:
                try self.send(TDFunction.setAuthenticationPhoneNumber(phoneNumber: "", allowFlashCall: false, isCurrentPhoneNumber: false))
            }
        case let .connectionState(state):
            switch state {
            case .ready:
                try self.send(TDFunction.getMe)
            case .waitingForNetwork:
                break
            case .connectingToProxy:
                break
            case .connecting:
                break
            case .updating:
                break
            }
        }
    }
    
    public func send<T: Encodable>(_ encodable: T) throws {
        let json = try JSONEncoder().encode(encodable)
        self.send(String(data: json, encoding: .utf8) ?? "")
    }
    
    public func send(_ query: String) {
        query.withCString { cString in
            td_json_client_send(self.client, cString)
        }
    }
    
    public func execute(_ query: String) -> String? {
        return query.withCString { cString in
            if let result = td_json_client_execute(self.client, cString) {
                return String(cString: result)
            }
            return nil
        }
    }
    
    public func stopListing() {
        self.isListing = false
    }
    
    deinit {
        self.stopListing()
        td_json_client_destroy(self.client)
    }
}
