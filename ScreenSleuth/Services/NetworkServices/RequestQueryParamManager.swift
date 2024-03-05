//
//  RequestQueryParamManager.swift
//  ScreenSleuth
//
//  Created by Home on 3/3/2024.
//

import Foundation

enum RequestQueryParamManager {
        
}

extension RequestQueryParamManager {
    static func getQueryParam(for request: RequestManager) -> [String: Any]? {
        switch request {
        case .popularMovies(let page):
            return [
                "language": "en-US",
                "page": page,
                "region": "AU" // Can changes based on the user loc
            ]
        case .authenticate:
            return nil
        }
    }
}
