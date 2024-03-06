//
//  PopularMoviesPage.swift
//  ScreenSleuth
//
//  Created by Home on 4/3/2024.
//

import Foundation

struct PopularMoviesPage: Decodable {
    var page: Int
    var results: [PopularMovie]?
    var totalPages: Int
    var totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
