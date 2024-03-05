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
            return "https://api.themoviedb.org/3/movie/"
        }
    }
}

extension RequestURLManager {
    
    static func getURL(for request : RequestManager) -> URL? {
        switch request {
        case .popularMovies, .authenticate:
            return URL(string: RequestURLManager.baseURL + "popular?language=en-US&page=1")
        }
    }
}
