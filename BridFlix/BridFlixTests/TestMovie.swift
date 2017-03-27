//
//  TestMovie.swift
//  BridFlix
//
//  Created by Leonardo Fontes on 22/03/17.
//  Copyright © 2017 Leonardo Fontes. All rights reserved.
//

import XCTest

@testable import BridFlix
class TestMovie: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit() {
        let movie: Movie = Movie(id: 1, title: "Titanic", description: "Iceberg")
        
        XCTAssertEqual(movie.id, 1)
        XCTAssertEqual(movie.title, "Titanic")
        XCTAssertEqual(movie.description, "Iceberg")
    }
    
    func testSetters() {
        let movie: Movie = Movie(id: 1, title: "Titanic", description: "Iceberg")
        
        movie.id = 2
        movie.title = "Porta dos fundos"
        movie.description = "Porchato"
        
        XCTAssertEqual(movie.id, 2)
        XCTAssertEqual(movie.title, "Porta dos fundos")
        XCTAssertEqual(movie.description, "Porchato")
    }
}
