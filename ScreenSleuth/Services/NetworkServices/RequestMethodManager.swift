//
//  RequestMethodManager.swift
//  ScreenSleuth
//
//  Created by Home on 3/3/2024.
//

import Foundation

enum RequestMethodManager: String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

extension RequestMethodManager {
    
    static func getHTTPMethod(for request: RequestManager) -> String {
        switch request {
        case .authenticate:
            return RequestMethodManager.get.rawValue
        default:
            return RequestMethodManager.post.rawValue
            
        }
    }
}
