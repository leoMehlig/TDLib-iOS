//
//  TDLibTests.swift
//  TDLibTests
//
//  Created by Leo Mehlig on 26.02.18.
//  Copyright © 2018 Leo Mehlig. All rights reserved.
//

import XCTest
@testable import TDLib

class TDLibTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        _ = TDJsonClient { result, client in
            print("Event: ", result)
            let json = try! JSONSerialization.jsonObject(with: result.data(using: .utf8)!, options: []) as! [String: Any]
            if ((json["authorization_state"] as? [String: Any])?["@type"] as? String) == "authorizationStateWaitTdlibParameters" {
                client.send("{\"@type\": \"setTdlibParameters\", \"parameters\": { \"use_test_dc\": false, \"database_directory\": \"\", \"files_directory\":\"\", \"use_file_database\":false, \"use_chat_info_database\":false, \"use_message_database\":false, \"use_secret_chats\":false, \"api_id\": 177033, \"api_hash\":\"d61e84baf1d5da953fdabd730b0b557f\", \"system_language_code\":\"en\", \"device_model\": \"phone\", \"system_version\": \"1.0\", \"application_version\":\"1.0\" , \"enable_storage_optimizer\":false, \"ignore_file_names\":true }}")
            }
        }
        while true { }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
