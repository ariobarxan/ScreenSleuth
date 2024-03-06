//
//  SearchMovieViewModel.swift
//  ScreenSleuth
//
//  Created by Home on 6/3/2024.
//

import Foundation

final class SearchMovieViewModel {
    
    private var popularMovieRepository: PopularMovieRepositoryProtocol
    private var reloadTableView: () -> ()
    private var showError: (_ message: String) -> ()
    private var handleShowLoading: (Bool) -> ()
    
    init(popularMovieRepository: PopularMovieRepositoryProtocol = PopularMovieRepository(),
         reloadTableView: @escaping () -> (),
         showError: @escaping (String) -> (),
         handleShowLoading: @escaping (Bool) -> ()) {
        self.popularMovieRepository = popularMovieRepository
        self.reloadTableView = reloadTableView
        self.showError  = showError
        self.handleShowLoading = handleShowLoading
    }
    
    func getData() async throws -> [PopularMovie] {
        return try await popularMovieRepository.fetchPopularMovies(forPage: 1)
    }
}
