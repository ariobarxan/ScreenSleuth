//
//  Network.swift
//  ScreenSleuth
//
//  Created by Home on 3/3/2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURLString
    case invalidResponse
    case badUrl
    case decodingError
    case noConnection
}
