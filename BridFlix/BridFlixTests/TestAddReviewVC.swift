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
        viewController.usernameTextField = UITextField()
        viewController.ratingTextField = UITextField()
        viewController.reviewTextField = UITextField()
        
        viewController.usernameTextField.text = "Teste"
        viewController.reviewTextField.text = "Muito bom"
        viewController.ratingTextField.text = "10"
        
        let star: Dictionary<String, Any> = [NetworkUtil.BODY_VALUE : "10" as Any]
        
        let dictWithData: Dictionary<String, Any> = [
            NetworkUtil.BODY_USERNAME : "Teste" as Any,
            NetworkUtil.BODY_DESCRIPTION : "Muito bom" as Any,
            NetworkUtil.BODY_STAR : star as Any
        ]
        
        XCTAssertTrue(NSDictionary(dictionary: dictWithData).isEqual(to: viewController.getParameters(userTF: viewController.usernameTextField, ratingTF: viewController.ratingTextField, reviewTF: viewController.reviewTextField)))
    }
    
    func testValidateRating() {
        viewController.ratingTextField = UITextField()
        viewController.ratingTextField.text = "5"
        
        XCTAssertTrue(viewController.validateRating(viewController.ratingTextField))
        
        //viewController.ratingTextField.text = "11"
        
        //XCTAssertFalse(viewController.validateRating(viewController.ratingTextField))
    }
}
