//
//  ViewController.swift
//  ScreenSleuth
//
//  Created by Home on 1/3/2024.
//

import UIKit

class SearchMovieViewController: UIViewController, StoryBoarded {

    weak var coordinator: Coordinator?
    
    @IBOutlet weak var headerContainer: UIView!
    @IBOutlet weak var movieTableView: UITableView!
    @IBOutlet weak var headerContainerTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchTextField: UITextField!
    
    private var viewModel: SearchMovieViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupViewModel()
    }
}

// MARK: - Setup Functions
extension SearchMovieViewController {
    
    private func setupViews() {
        setupHeaderContainer()
        setupMovieTableView()
        setupSearchTextField()
    }
    
    private func setupHeaderContainer() {
        
    }
    
    private func setupMovieTableView() {
        MovieTableViewCell.register(for: movieTableView)
        movieTableView.delegate = self
        movieTableView.dataSource = self
    }
    
    private func setupSearchTextField() {
        
    }
    
    private func showError(withMessage message: String) {
        // TODO: - Implement Error Message
    }
    
    private func handleShowLoading(shouldShowLoading: Bool) {
        // TODO: - Implement Loading
    }
}

// MARK: - Action Functions
extension SearchMovieViewController {
    
    private func setupViewModel() {
        viewModel = SearchMovieViewModel(
            reloadTableView: { [unowned self] in
                self.reloadTableView()
            },
            showError: { [unowned self] message in
                self.showError(withMessage: message)
            },
            handleShowLoading: { [unowned self] shouldShowLoading in
                self.handleShowLoading(shouldShowLoading: shouldShowLoading)
            })
        
        viewModel.fillTableViewDataSource()
    }
    
    func reloadTableView() {
        mainThread {
            self.movieTableView.reloadData()
        }
    }
    
}

// MARK: - TableView Functions
extension SearchMovieViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tableViewDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
        cell.setup(with: viewModel.tableViewDataSource[indexPath.row])
        return cell
        
    }
}

