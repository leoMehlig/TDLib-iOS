//
//  TDJsonClient.swiftb
//  TDLib
//
//  Created by Leo Mehlig on 26.02.18.
//  Copyright © 2018 Leo Mehlig. All rights reserved.
//

import Foundation
import TDJSON

public class TDJsonClient {
    public enum LogLevel: Int32 {
        case fatalErrors = 0, errors, warnings, info, debug, verbose, all = 1024
    }
    private let queue = DispatchQueue(label: "tdjsonclient", qos: .userInitiated)
    private let streamQueue = DispatchQueue(label: "tdjsonclient_stream", qos: .userInitiated)

    public let rawClient = td_json_client_create()! //swiftlint:disable:this force_unwrapping
    
    public let stream = Stream<Data?>()
    public private(set) var isListing = true

    public var logLevel: LogLevel = .warnings {
        didSet {
            td_set_log_verbosity_level(self.logLevel.rawValue)
        }
    }
    
    public init() {
        td_set_log_verbosity_level(self.logLevel.rawValue)
        self.queue.async { [weak self] in
            while self?.isListing ?? false {
                if let client = self?.rawClient,
                    let response = td_json_client_receive(client: client, timeout: 10) {
                    self?.streamQueue.async {
                        if let data = response.data(using: .utf8) {
                            self?.stream.current = data
                        }
                    }
                }
            }
        }
    }
    
    public func send<T: Encodable>(_ encodable: T) throws {
        let json = try JSONEncoder.td.encode(encodable)
        self.send(String(data: json, encoding: .utf8) ?? "")
    }
    
    public func send(_ query: String) {
        print("Send: \(query)")
        td_json_client_send(client: self.rawClient, request: query)
    }
    
    public func execute(_ query: String) -> String? {
        return td_json_client_execute(client: self.rawClient, request: query)
    }
    
    public func stopListing() {
        self.isListing = false
    }
    
    deinit {
        self.stopListing()
        td_json_client_destroy(client: self.rawClient)
    }
}
