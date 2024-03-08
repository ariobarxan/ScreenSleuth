//
//  UIView.swift
//  ScreenSleuth
//
//  Created by Home on 8/3/2024.
//

import UIKit

// MARK: - Functions
extension UIView {
    
    func dropShadowAndCornerRadius(_ value: CornerRadius, shadowOpacity: Float = 0.05) {
        roundUp(value)
        setUpDropShadow(opacity: shadowOpacity)
    }
    
    func roundUp(_ value: CornerRadius) {
        DispatchQueue.main.async { [weak self] in
            if value == .round {
                self?.layer.cornerRadius = (self?.bounds.height ?? 2) / 2
            } else {
                self?.layer.cornerRadius = value.rawValue
            }
            self?.layer.masksToBounds = true
        }
    }
    
    func setUpDropShadow(opacity:Float = 0.05) {
        DispatchQueue.main.async { [weak self] in
            self?.layer.masksToBounds = false
            self?.layer.shadowColor = UIColor.black.cgColor
            self?.layer.shadowOpacity = opacity
            self?.layer.shadowOffset = CGSize(width: 0, height: 0)
            self?.layer.shadowRadius = 8
        }
    }
}

// MARK: - Structures
extension UIView {
    enum CornerRadius: CGFloat {
        case none = 0
        case large = 15
        case regular = 10
        case small = 5
        case round = -1
        case superLarge = 25
        case massiveLarge = 40
    }
}

