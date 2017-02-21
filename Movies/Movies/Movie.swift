//
//  Movie.swift
//  Movies
//
//  Created by Leo Fontes on 20/02/17.
//  Copyright © 2017 Leo Fontes. All rights reserved.
//

import Foundation
import UIKit

class Movie {
    var _id: Int!
    var _originalTitle: String!
    var _posterPath: String!
    var _overview: String!
    var _voteAverage: Double!
    var _releaseDate: String!
    
    //Constructors
    init() {}
    
    init(dict: Dictionary<String, Any>) {
        if let id = dict["id"] as? Int {
            self.id = id
        }
        if let originalTitle = dict["original_title"] as? String {
            self.originalTitle = originalTitle
        }
        if let posterPath = dict["backdrop_path"] as? String {
            self.posterPath = posterPath
        }
        if let overview = dict["overview"] as? String {
            self.overview = overview
        }
        if let voteAverage = dict["vote_average"] as? Double {
            self.voteAverage = voteAverage
        }
        if let releaseDate = dict["release_date"] as? String {
            self.releaseDate = releaseDate
        }
    }
    
    init(id: Int, originalTitle: String, posterPath: String, overview: String, voteAverage: Double, releaseDate: String) {
        self.id = id
        self.originalTitle = originalTitle
        self.posterPath = posterPath
        self.overview = overview
        self.voteAverage = voteAverage
        self.releaseDate = releaseDate
    }
    
    //Getters and Setters
    var id: Int {
        get {
            if _id == nil {
                _id = 0
            }
            return _id
        }
        set {
            _id = newValue
        }
    }
    
    var originalTitle: String {
        get {
            if _originalTitle == nil {
                _originalTitle = ""
            }
            return _originalTitle
        }
        set {
            _originalTitle = newValue
        }
    }
    
    var posterPath: String {
        get {
            if _posterPath == nil {
                _posterPath = ""
            }
            return _posterPath
        }
        set {
            _posterPath = newValue
        }
    }
    
    var overview: String {
        get {
            if _overview == nil {
                _overview = ""
            }
            return _overview
        }
        set {
            _overview = newValue
        }
    }
    
    var voteAverage: Double {
        get {
            if _voteAverage == nil {
                _voteAverage = 0.0
            }
            return _voteAverage
        }
        set {
            _voteAverage = newValue
        }
    }
    
    var releaseDate: String {
        get {
            if _releaseDate == nil {
                _releaseDate = ""
            }
            return _releaseDate
        }
        set {
            _releaseDate = newValue
        }
    }
}
