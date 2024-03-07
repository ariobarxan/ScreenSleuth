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
    var tableViewDataSource: [MovieTableViewCellViewModel] = []
    var movies: [PopularMovie] = []
    var searchText: String = "" {
        didSet{
            searchForMovies(WithTitle: searchText)
        }
    }
    init(popularMovieRepository: PopularMovieRepositoryProtocol = PopularMovieRepository(),
         reloadTableView: @escaping () -> (),
         showError: @escaping (String) -> (),
         handleShowLoading: @escaping (Bool) -> ()) {
        self.popularMovieRepository = popularMovieRepository
        self.reloadTableView = reloadTableView
        self.showError  = showError
        self.handleShowLoading = handleShowLoading
    }
    
    private func getData() async throws -> [PopularMovie] {
        return try await popularMovieRepository.fetchPopularMovies(forPage: 1)
    }
    
    func fillTableViewDataSource() {
        Task {
            do {
                let popularMovies = try await getData()
                self.movies = popularMovies
                for movie in popularMovies {
                    let movieCell = MovieTableViewCellViewModel(movieId: movie.id, posterImageURLString: movie.posterString ?? "", title: movie.title, genresFirst: "")
                    tableViewDataSource.append(movieCell)
                }
                
                reloadTableView()
            }
            catch let errr {
                showError(errr.localizedDescription)
            }
        }
    }
    
    func searchForMovies(WithTitle title: String) {
        Task {
            do {
                let searchedMovies = try await popularMovieRepository.fetchSearchMovies(contatingTitle: title)
                // TODO: - Remove this, it's just for debugging purpose
                tableViewDataSource.removeAll()
                self.movies = searchedMovies
                for movie in searchedMovies {
                    let movieCell = MovieTableViewCellViewModel(movieId: movie.id, posterImageURLString: movie.posterString ?? "", title: movie.title, genresFirst: "")
                    tableViewDataSource.append(movieCell)
                }
                
                reloadTableView()
            }
            catch let errr {
                showError(errr.localizedDescription)
            }
        }
    }
    
}
