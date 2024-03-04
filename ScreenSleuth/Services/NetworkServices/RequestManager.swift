//
//  RequestManager.swift
//  ScreenSleuth
//
//  Created by Home on 3/3/2024.
//

import Foundation

enum RequestManager {
    
    
    
    func asURLRequest() throws -> URLRequest {
        guard let url = RequestURLManager.shared.getURL(for: self) else {
            throw NetworkError.invalidURLString
        }
        
        var urlRequest = URLRequest(url: url)
        var urlComponents = URLComponents(string: "\(urlRequest)")
        //MARK: - Adding Query Parameters
        if let parameters = RequestQueryParamManager.shared.getQueryParam(for: self) {
            var params = [URLQueryItem]()
            parameters.keys.forEach({ key in
                params.append(URLQueryItem(name: key, value: "\(parameters[key]!)"))
            })
            // TODO:
            if !params.isEmpty {
                // why do we reverse it
                urlComponents?.queryItems = params.reversed()
            }
        }
        
        //MARK: - Adding Body
        urlRequest = URLRequest(url: (urlComponents?.url)!)
        if let body = RequestBodyManager.shared.getBody(for: self) {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: body)
        }
        
        //MARK: - Adding Header
        let headers = RequestHeaderManager.shared.getHeader(for: self)
        headers.forEach { header in
            urlRequest.setValue(header.value, forHTTPHeaderField: header.field)
        }
        
        urlRequest.httpMethod = RequestMethodManager.getHTTPMethod(for: self)
        return urlRequest
    }
}
