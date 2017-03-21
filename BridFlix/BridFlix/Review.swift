//
//  Review.swift
//  BridFlix
//
//  Created by Leonardo Fontes on 20/03/17.
//  Copyright © 2017 Leonardo Fontes. All rights reserved.
//

import Foundation

class Review {
    private var _userName: String!
    private var _rating: Int!
    private var _description: String!
    
    var userName: String {
        get {
            if _userName == nil {
                _userName = ""
            }
            return _userName
        }
        set {
            _userName = newValue
        }
    }
    
    var rating: Int {
        get {
            if _rating == nil {
                _rating = 0
            }
            return _rating
        }
        set {
            _rating = newValue
        }
    }
    
    var description: String {
        get {
            if _description == nil {
                _description = ""
            }
            return _description
        }
        set {
            _description = newValue
        }
    }
}
