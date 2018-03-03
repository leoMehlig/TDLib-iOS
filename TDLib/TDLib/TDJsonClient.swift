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
    
    private let client = td_json_client_create()
    
    public let stream = Stream<LoadingFailableEvent<Update>>()
    
    public private(set) var isListing = true
    
    public init() {
        td_set_log_verbosity_level(3)
        self.queue.async {
            while self.isListing {
                if let response = td_json_client_receive(self.client, 10),
                    let data = String(cString: response).data(using: .utf8) {
                    do {
                        let event = try JSONDecoder().decode(Update.self, from: data)
                        print(event)
                        self.stream.current = .value(event)
                    } catch {
                        print(error, String(data: data, encoding: .utf8)!)
                        self.stream.current = .error(error)
                    }
                }
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
