//
//  TDJsonClient.swiftb
//  TDLib
//
//  Created by Leo Mehlig on 26.02.18.
//  Copyright © 2018 Leo Mehlig. All rights reserved.
//

import Foundation
import libtdjson

public class TDJsonClient {
    private let queue = DispatchQueue(label: "tdjsonclient", qos: .userInitiated)
    private let streamQueue = DispatchQueue(label: "tdjsonclient_stream", qos: .userInitiated)

    private let client = td_json_client_create()
    
    public let stream = Stream<Data?>()
    public private(set) var isListing = true
    
    public init() {
        td_set_log_verbosity_level(2)
        self.queue.async { [weak self] in
            while self?.isListing ?? false {
                if let response = td_json_client_receive(self!.client, 10) {
                    let string = String(cString: response)
                    self?.streamQueue.async {
                        if let data = string.data(using: .utf8) {
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
        td_json_client_send(self.client, query)
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
