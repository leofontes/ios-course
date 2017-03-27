//
//  TestLoginVC.swift
//  BridFlix
//
//  Created by Leonardo Fontes on 27/03/17.
//  Copyright © 2017 Leonardo Fontes. All rights reserved.
//

import XCTest

@testable import BridFlix
class TestLoginVC: XCTestCase {
    let viewController: LoginVC = LoginVC()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetParameters() {
        viewController.usernameTF = UITextField()
        viewController.passwordTF = UITextField()
        
        viewController.usernameTF?.text = "Teste"
        viewController.passwordTF?.text = "Senha"
        
        let dict:Dictionary<String, Any> = [
            NetworkUtil.BODY_USERNAME : "Teste" as Any,
            NetworkUtil.BODY_PASSWORD : "Senha" as Any
        ]
        
        XCTAssertTrue(NSDictionary(dictionary: dict).isEqual(to: viewController.getParameters(usernameTF: viewController.usernameTF!, passwordTF: viewController.passwordTF!)))
    }
    
}
