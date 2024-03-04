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
            return "https://api.themoviedb.org/3/movie/11?api_key=126cb736c2d6c5dcb3aa726b1e16f81e"
        }
    }
}

extension RequestURLManager {
    
    static func getURL(for request : RequestManager) -> URL? {
        switch request {
        default:
            return URL(string: RequestURLManager.baseURL)
        }
    }
}
