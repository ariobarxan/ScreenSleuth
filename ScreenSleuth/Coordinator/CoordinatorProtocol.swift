//
//  CoordinatorProtocol.swift
//  ScreenSleuth
//
//  Created by Home on 1/3/2024.
//

import UIKit

protocol Coordinator: NSObject {
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
        
    func start()
}
