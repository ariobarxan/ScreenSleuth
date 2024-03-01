//
//  StoryBoarded.swift
//  ScreenSleuth
//
//  Created by Home on 1/3/2024.
//

import UIKit

enum StoryBoardName: String {
    case Main
    
    fileprivate var instance: UIStoryboard {
        return UIStoryboard(name: rawValue, bundle: Bundle.main)
    }
}

protocol StoryBoarded {
    static func instantiate(_ storyBoardName: StoryBoardName) -> Self
}

extension StoryBoarded where Self: UIViewController {
    
    static func instantiate(_ storyBoardName: StoryBoardName) -> Self {
        let storyboard = storyBoardName.instance
        let viewController = storyboard.instantiateViewController(withIdentifier: self.identifier) as! Self
        return viewController
    }
}
