//
//  MovieTableViewDelegateAndDataSource.swift
//  ScreenSleuth
//
//  Created by Home on 6/3/2024.
//

import UIKit

protocol MovieTableViewDelegateProtocol: AnyObject {
    func didSelectCell(_ tableView: UITableView, indexPath: IndexPath, isToggleOn: Bool, selectedItem item: PopularMovie)
}

final class MovieTableViewDelegateAndDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {

    public let reuseIdentifier = String(describing: MovieTableViewCell.self)
    private var dataSource: [PopularMovie]
    private let headerHeight: CGFloat = 50
    private weak var delegate: MovieTableViewDelegateProtocol?
    
    init(dataSource: [PopularMovie], delegate: MovieTableViewDelegateProtocol? = nil) {
        self.dataSource = dataSource
        self.delegate = delegate
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
}

