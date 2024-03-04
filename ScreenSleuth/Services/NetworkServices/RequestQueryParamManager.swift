//
//  RequestQueryParamManager.swift
//  ScreenSleuth
//
//  Created by Home on 3/3/2024.
//

import Foundation

final class RequestQueryParamManager {
    
    static let shared = RequestQueryParamManager()
    
    func getQueryParam(for request: RequestManager) -> [String: String]? {
        switch request {
        default:
            return nil
        }
    }
}
