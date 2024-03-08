//
//  RequestURLManager.swift
//  ScreenSleuth
//
//  Created by Home on 3/3/2024.
//

import Foundation

enum RequestURLManager {
    
    static var baseURL: String {
        get {
            return "https://api.themoviedb.org/3"
        }
    }
    
    static var baseURLForImages: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}

extension RequestURLManager {
    
    static func getURL(for request : RequestManager) -> URL? {
        switch request {
        case .image(let url):
            return URL(string: baseURLForImages + url)
        case .popularMovies, .authenticate:
            return URL(string: RequestURLManager.baseURL + "/movie/popular?language=en-US&page=1")
        case .serchMovieWith(let title):
            return URL(string: RequestURLManager.baseURL + "/search/movie")
        }
    }
}
