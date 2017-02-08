//
//  PartyRock.swift
//  PartyRockApp
//
//  Created by Leo Fontes on 07/02/17.
//  Copyright © 2017 Leo Fontes. All rights reserved.
//

import Foundation

class PartyRock {
    
    private var _imageURL:String!
    private var _videoURL:String!
    private var _videoTitle:String!

    //Constructor
    init(imageURL:String, videoURL:String, videoTitle:String) {
        _imageURL = imageURL
        _videoURL = videoURL
        _videoTitle = videoTitle
    }
    
    //Getters
    var imageURL: String {
        get {
            return _imageURL
        }
    }
    
    var videoURL: String {
        get {
            return _videoURL
        }
    }
    
    var videoTitle: String {
        get {
            return _videoTitle
        }
    }
}
