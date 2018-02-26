//
//  TDJsonClient.swift
//  TDLib
//
//  Created by Leo Mehlig on 26.02.18.
//  Copyright © 2018 Leo Mehlig. All rights reserved.
//

import Foundation
import libtdjson_static

public class TDJsonClient {
    let client = td_json_client_create()
    
    let event: (String, TDJsonClient) -> Void
    
    public init(event: @escaping (String, TDJsonClient) -> Void) {
        self.event = event
        DispatchQueue.global().async {
            while true {
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
    
    deinit {
        td_json_client_destroy(client)
    }
}
