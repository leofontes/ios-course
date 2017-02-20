//
//  Forecast.swift
//  RainyShiny
//
//  Created by Leo Fontes on 17/02/17.
//  Copyright © 2017 Leo Fontes. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    var _date: String!
    var _weatherType: String!
    var _highTemp: Double!
    var _lowTemp: Double!
    
    init(weatherDict: Dictionary<String, Any>) {
        if let temp = weatherDict["temp"] as? Dictionary<String, Any> {
            //Low temperature
            if let min = temp["min"] as? Double {
                self.lowTemp = convertKelvinToCelsius(tempKelvin: min)
            }
            //High temperature
            if let max = temp["max"] as? Double {
                self.highTemp = convertKelvinToCelsius(tempKelvin: max)
            }
        }
        if let weather = weatherDict["weather"] as? [Dictionary<String, Any>] {
            if let main = weather[0]["main"] as? String {
                self.weatherType = main
            }
        }
        if let date = weatherDict["dt"] as? Double {
            let epochTimeConverted = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self.date = epochTimeConverted.dayOfTheWeek()
        }
    }
    
    var date: String {
        get {
            if _date == nil {
                _date = ""
            }
            return _date
        }
        set {
            _date = newValue
        }
    }
    
    var weatherType: String {
        get {
            if _weatherType == nil {
                _weatherType = ""
            }
            return _weatherType
        }
        set {
            _weatherType = newValue
        }
    }
    
    var highTemp: Double {
        get {
            if _highTemp == nil {
                _highTemp = 0.0
            }
            return _highTemp
        }
        set {
            _highTemp = newValue
        }
    }
    
    var lowTemp: Double {
        get {
            if _lowTemp == nil {
                _lowTemp = 0.0
            }
            return _lowTemp
        }
        set {
            _lowTemp = newValue
        }
    }
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}

