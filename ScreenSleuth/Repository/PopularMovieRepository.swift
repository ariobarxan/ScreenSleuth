//
//  PopularMovieRepository.swift
//  ScreenSleuth
//
//  Created by Home on 6/3/2024.
//

import Foundation

enum RepositoryError: Error {
    case noData
}

protocol PopularMovieRepositoryProtocol {
    func fetchPopularMovies(forPage page: Int) async throws -> [PopularMovie]
}

final class PopularMovieRepository: PopularMovieRepositoryProtocol {
    
    private var popularMoviePage: PopularMoviesPage!
    private var hasNextPage: Bool = true

    
    func fetchPopularMovies(forPage page: Int) async throws -> [PopularMovie] {
        if hasNextPage {
            popularMoviePage = try await WebService.shared.fetchPopularMovies(forPage: page)
            guard let movies = popularMoviePage.results else {
                throw RepositoryError.noData
            }
            return movies
        } else {
            return []
        }

    }
    
    
    
}
