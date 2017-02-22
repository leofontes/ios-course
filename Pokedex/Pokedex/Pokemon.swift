//
//  Pokemon.swift
//  Pokedex
//
//  Created by Leo Fontes on 22/02/17.
//  Copyright © 2017 Leo Fontes. All rights reserved.
//

import Foundation

class Pokemon {
    
    private var _name: String!
    private var _pokedexId: Int!
    
    var name: String {
        get {
            return _name
        }
        set {
            self._name = newValue
        }
    }
    
    var pokedexId: Int {
        get {
            return _pokedexId
        }
        set {
            self._pokedexId = newValue
        }
    }
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
    }
    
}
