//
//  APIConstants.swift
//  Movies
//
//  Created by Leo Fontes on 20/02/17.
//  Copyright © 2017 Leo Fontes. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

typealias DownloadComplete = () -> ()

let BASE_URL: String        = "https://api.themoviedb.org/3/"
let API_KEY: String         = "?api_key=ac6ebfcd9300aeee710aef10fe23e547"
let SORT_POPULAR: String    = "&sort_by=popularity.desc"
let POPULAR_URL: String     = "discover/movie"
let UPCOMING_URL: String    = "movie/upcoming"
let MOVIE: String           = "movie/"
let VIDEOS_URL: String      = "/videos"
let REVIEWS_URL: String     = "/reviews"
let BASE_IMAGE_PATH: String = "http://image.tmdb.org/t/p/w185/"

func getPopularUrl() -> String {
    return "\(BASE_URL)\(POPULAR_URL)\(API_KEY)\(SORT_POPULAR)"
}

func getUpcomingUrl() -> String {
    return "\(BASE_URL)\(UPCOMING_URL)\(API_KEY)"
}

func getTrailersUrl(id: String) -> String {
    return "\(BASE_URL)\(MOVIE)\(id)\(VIDEOS_URL)\(API_KEY)"
}

func getReviewsUrl(id: String) -> String {
    return "\(BASE_URL)\(MOVIE)\(id)\(REVIEWS_URL)\(API_KEY)"
}


