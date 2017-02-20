//
//  Location.swift
//  RainyShiny
//
//  Created by Leo Fontes on 20/02/17.
//  Copyright © 2017 Leo Fontes. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
