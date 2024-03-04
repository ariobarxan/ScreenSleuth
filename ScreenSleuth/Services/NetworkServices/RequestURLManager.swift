//
//  RequestURLManager.swift
//  ScreenSleuth
//
//  Created by Home on 3/3/2024.
//

import Foundation

enum RequestURLManager {
    
    var baseURL: String {
        get {
            return "https://api.spacexdata.com/v5/launches/"
        }
    }
    
    func getURL(for request : RequestManager) -> URL? {
        switch request {
        default:
            return URL(string: baseURL)
        }
    }
}
