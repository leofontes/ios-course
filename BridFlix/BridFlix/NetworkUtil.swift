//
//  NetworkUtil.swift
//  BridFlix
//
//  Created by Leonardo Fontes on 16/03/17.
//  Copyright © 2017 Leonardo Fontes. All rights reserved.
//

import Foundation

class NetworkUtil {
    static var API_BASE_URL :String = "http://localhost:8080/"
    static var API_MOVIES   :String = "movies"
    static var API_REGISTER :String = "register"
    static var API_TOKEN    :String = "?token="
    
    static var BODY_USERNAME :String = "userName"
    static var BODY_PASSWORD :String = "password"
    
    static func buildRegisterRequest() -> URL {
        return URL(string: "\(API_BASE_URL)\(API_REGISTER)")!
    }
    
    static func buildMoviesRequest() -> URL {
        return URL(string: "\(API_BASE_URL)\(API_MOVIES)\(API_TOKEN)\(getToken())")!
    }
    
    static var TOKEN_KEY :String = "token"
    
    static func setToken(token : String) {
        let preferences = UserDefaults.standard
        preferences.set(token, forKey: TOKEN_KEY)
        
        preferences.synchronize()
    }
    
    static func getToken() -> String {
        let preferences = UserDefaults.standard
        
        if preferences.object(forKey: TOKEN_KEY) == nil {
            return "error"
        } else {
            return preferences.string(forKey: TOKEN_KEY)!
        }
    }
}
