//
//  Cast.swift
//  BridFlix
//
//  Created by Leonardo Fontes on 20/03/17.
//  Copyright © 2017 Leonardo Fontes. All rights reserved.
//

import Foundation

class Cast {
    private var _actor: String!
    private var _character: String!
    
    var actor: String {
        get {
            if _actor == nil {
                _actor = ""
            }
            return _actor
        }
        set {
            _actor = newValue
        }
    }
    
    var character: String {
        get {
            if _character == nil {
                _character = ""
            }
            return _character
        }
        set {
            _character = newValue
        }
    }
}
