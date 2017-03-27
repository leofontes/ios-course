//
//  TestReview.swift
//  BridFlix
//
//  Created by Leonardo Fontes on 22/03/17.
//  Copyright © 2017 Leonardo Fontes. All rights reserved.
//

import XCTest

@testable import BridFlix
class TestReview: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSetters() {
        let review: Review = Review()
        
        review.description = "Loved it"
        review.rating = 10
        review.userName = "Ze"
        
        XCTAssertEqual(review.description, "Loved it")
        XCTAssertEqual(review.rating, 10)
        XCTAssertEqual(review.userName, "Ze")
    }
    
}
