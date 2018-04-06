//
//  TDLibTests.swift
//  TDLibTests
//
//  Created by Leo Mehlig on 26.02.18.
//  Copyright © 2018 Leo Mehlig. All rights reserved.
//

import XCTest
@testable import TDLib

internal class TDLibTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let client = TDJsonClient()
        let coordinator = Coordinator(client: client)
        while true { }
    }
}
