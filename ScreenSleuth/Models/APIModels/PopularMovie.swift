//
//  PopularMovies.swift
//  ScreenSleuth
//
//  Created by Home on 4/3/2024.
//

import Foundation

struct PopularMovie: Decodable {
    
    var adult: Bool
    var backdropPath: String
    var genreIDs: [Int]
    var id: Int
    var originalLanguage: String
    var originalTitle: String
    var synopsis: String
    var popularity: Double
    var posterString: String
    var title: String
    var rate: Double
    var voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDs = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case synopsis = "overview"
        case popularity
        case posterString = "poster_path"
        case title
        case rate = "vote_average"
        case voteCount = "vote_count"
    }
}


