//
//  Movie.swift
//  BridFlix
//
//  Created by Leonardo Fontes on 16/03/17.
//  Copyright © 2017 Leonardo Fontes. All rights reserved.
//

import Foundation

class Movie {
    private var _id: Int!
    private var _title: String!
    private var _description: String!
    private var _posterURL: String!
    
    init(id:Int, title:String, description:String) {
        self.id = id;
        self.title = title
        self.description = description
    }
    
    //Getters and Setters
    var id: Int {
        get {
            if _id == nil {
                _id = -1
            }
            return _id
        }
        set {
            _id = newValue
        }
    }
    
    var title: String {
        get {
            if _title == nil {
                _title = ""
            }
            return _title
        }
        set {
            _title = newValue
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
    
    var posterURL: String {
        get {
            if _posterURL == nil {
                _posterURL = ""
            }
            return _posterURL
        }
        set {
            _posterURL = newValue
        }
    }
}
