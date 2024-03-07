//
//  UITableViewCell.swift
//  ScreenSleuth
//
//  Created by Home on 7/3/2024.
//

import UIKit

extension UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static func register(for tableView: UITableView)  {
        let cellName = String(describing: self)
        let cellNib = UINib(nibName: cellName, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: cellName)
    }
}
