//
//  RequestHeaderManager.swift
//  ScreenSleuth
//
//  Created by Home on 3/3/2024.
//

import Foundation

enum RequestHeaderManager {
        
    enum HTTPDefaultHeaderField: String {
        case contentType = "Content-Type"
    }

    enum HTTPDefaultHeaderValue: String {
        case json = "application/json"
    }
}

extension RequestHeaderManager {
    
    static func getHeader(for request: RequestManager) -> [(value: String, field: String)] {
        let contentTypeValue = HTTPDefaultHeaderValue.json.rawValue
        let contentTypeField = HTTPDefaultHeaderField.contentType.rawValue
        let defaultHeaders = [(value: contentTypeValue, field:contentTypeField)]
        
        switch request {
        default:
            return  defaultHeaders
        }
    }


}
