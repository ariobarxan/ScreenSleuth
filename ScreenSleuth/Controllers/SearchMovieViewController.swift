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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

