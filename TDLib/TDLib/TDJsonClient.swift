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
    
    private let event: (String, TDJsonClient) -> Void
    
    public private(set) var isListing = true
    
    public init(event: @escaping (String, TDJsonClient) -> Void) {
        self.event = event
        self.queue.async {
            while self.isListing {
                if let event = td_json_client_receive(self.client, 10) {
                    self.event(String(cString: event), self)
                }
            }
        }
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
