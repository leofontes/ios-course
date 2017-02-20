//
//  CurrentWeather.swift
//  RainyShiny
//
//  Created by Leo Fontes on 17/02/17.
//  Copyright © 2017 Leo Fontes. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    var cityName: String {
        get {
            if _cityName == nil {
                _cityName = ""
            }
            
            return _cityName
        }
        
        set {
            _cityName = newValue
        }
    }
    
    var date:String {
        get {
            if _date == nil {
                _date = ""
            }
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .none
            let currentDate = dateFormatter.string(from: Date())
            self._date = "Today, \(currentDate)"
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
    
    var currentTemp: Double {
        get {
            if _currentTemp == nil {
                _currentTemp = 0.0
            }
            
            return _currentTemp
        }
        
        set {
            _currentTemp = newValue
        }
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        //Alamofire download
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherURL).responseJSON { response in
            if let dict = response.value as? Dictionary<String, Any> {
                if let name = dict["name"] as? String {
                    self.cityName = name.capitalized
                    print(self.cityName)
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, Any>] {
                    if let main = weather[0]["main"] as? String {
                        self.weatherType = main.capitalized
                        print(self.weatherType)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, Any> {
                    if let currentTemperature = main["temp"] as? Double {
                        self.currentTemp = convertKelvinToCelsius(tempKelvin: currentTemperature);
                        print(self.currentTemp)
                    }
                }
            }
            completed()
        }
        
    }
}
