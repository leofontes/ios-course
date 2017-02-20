//
//  Constants.swift
//  RainyShiny
//
//  Created by Leo Fontes on 17/02/17.
//  Copyright © 2017 Leo Fontes. All rights reserved.
//

import Foundation

let BASE_URL_CURR   = "http://api.openweathermap.org/data/2.5/weather?"
let BASE_URL_FORE   = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let LATITUDE        = "lat="
let LONGITUDE       = "&lon="
let APP_ID          = "&appid="
let API_KEY         = "f0fd56c7ca410576e8dd1de704add1fb"
let COUNT           = "&cnt=10"


let CURRENT_WEATHER_URL = "\(BASE_URL_CURR)\(LATITUDE)0\(LONGITUDE)0\(APP_ID)\(API_KEY)"
let FORECAST_URL        = "\(BASE_URL_FORE)\(LATITUDE)0\(LONGITUDE)0\(COUNT)\(APP_ID)\(API_KEY)"

typealias DownloadComplete = () -> ()

func convertKelvinToCelsius(tempKelvin: Double) -> Double {
    return Double(round(10 * (tempKelvin - 273.15)) / 10)
}
