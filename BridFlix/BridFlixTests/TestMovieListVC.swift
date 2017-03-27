//
//  TestMovieListVC.swift
//  BridFlix
//
//  Created by Leonardo Fontes on 22/03/17.
//  Copyright © 2017 Leonardo Fontes. All rights reserved.
//

import XCTest

@testable import BridFlix
class TestMovieListVC: XCTestCase {
    let viewController: MovieListVC = MovieListVC()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSortArray() {
        var movieArr: [Movie] = [Movie]()
        
        movieArr.append(Movie(id: 1, title: "Titanic", description: "Iceberg"))
        movieArr.append(Movie(id: 2, title: "The Social Network", description: "Facebook"))
        movieArr.append(Movie(id: 3, title: "A possible dream", description: "NFL"))
        
        movieArr = viewController.sortArray(sortOption: 1, movieArr: movieArr)
        
        XCTAssertEqual(movieArr[0].title, "A possible dream")
        XCTAssertEqual(movieArr[1].title, "The Social Network")
        XCTAssertEqual(movieArr[2].title, "Titanic")
    }
    
}
