//
//  TestAddReviewVC.swift
//  BridFlix
//
//  Created by Leonardo Fontes on 22/03/17.
//  Copyright © 2017 Leonardo Fontes. All rights reserved.
//

import XCTest

@testable import BridFlix
class TestAddReviewVC: XCTestCase {
    let viewController: AddReviewVC = AddReviewVC()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetParameters() {
        viewController.usernameTextField.text = "Teste"
        viewController.reviewTextField.text = "Muito bom"
        viewController.ratingTextField.text = "10"
        
        var dictWithData: Dictionary<String, Any> = [
            NetworkUtil.BODY_USERNAME : "Teste" as Any,
            NetworkUtil.BODY_DESCRIPTION : "Muito bom" as Any,
            NetworkUtil.BODY_STAR : 10 as Any
        ]
    }
    
}
