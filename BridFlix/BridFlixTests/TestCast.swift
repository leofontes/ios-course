//
//  TestCast.swift
//  BridFlix
//
//  Created by Leonardo Fontes on 22/03/17.
//  Copyright © 2017 Leonardo Fontes. All rights reserved.
//

import XCTest

@testable import BridFlix
class TestCast: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSetters() {
        let cast: Cast = Cast()
        
        cast.actor = "John Doe"
        cast.character = "Bob"
        
        XCTAssertEqual(cast.actor, "John Doe")
        XCTAssertEqual(cast.character, "Bob")
    }
    
}
