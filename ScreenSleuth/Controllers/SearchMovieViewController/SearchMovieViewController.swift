//
//  ViewController.swift
//  ScreenSleuth
//
//  Created by Home on 1/3/2024.
//

import UIKit
import Combine

class SearchMovieViewController: UIViewController, StoryBoarded {

    weak var coordinator: Coordinator?

    var cancellables: Set<AnyCancellable> = []

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
        setupTextFieldPublisher()
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
    
    func setupTextFieldPublisher() {
       let publisher = NotificationCenter.default.publisher(for: UISearchTextField.textDidChangeNotification, object: searchTextField)
       publisher
           .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
           .map({($0.object as! UITextField).text})
           .sink { [weak self] text in
               self?.viewModel.searchText = text ?? ""
           }
       .store(in: &cancellables)
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
}

