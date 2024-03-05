//
//  RequestHeaderManager.swift
//  ScreenSleuth
//
//  Created by Home on 3/3/2024.
//

import Foundation

enum RequestHeaderManager {
        
    enum HTTPDefaultHeaderField: String {
        case contentType = "accept"
        case authorizationBearer = "Authorization"
    }

    enum HTTPDefaultHeaderValue: String {
        case json = "application/json"
        case accessToken = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMjZjYjczNmMyZDZjNWRjYjNhYTcyNmIxZTE2ZjgxZSIsInN1YiI6IjY1ZTNkZjQ5Mjc4ZDhhMDE4NWJmYzQwNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.VbDQqJA1H8rb3Qo0YO_MpfQzSqnyhx9pNAiMpdjiO5I"
    }
}

extension RequestHeaderManager {
    
    static func getHeader(for request: RequestManager) -> [(value: String, field: String)] {
        
        
        switch request {
        default:
            return  getDefaultHeaders()
        }
    }

    fileprivate static func getDefaultHeaders() -> [(value: String, field: String)] {
        let contentTypeValue = HTTPDefaultHeaderValue.json.rawValue
        let contentTypeField = HTTPDefaultHeaderField.contentType.rawValue
       
        let authorizationValue = HTTPDefaultHeaderValue.accessToken.rawValue
        let authorizationField = HTTPDefaultHeaderField.authorizationBearer.rawValue
       
        let defaultHeaders = [(value: contentTypeValue, field:contentTypeField),
                              (value: authorizationValue, field: authorizationField)]
        return defaultHeaders
    }
}
