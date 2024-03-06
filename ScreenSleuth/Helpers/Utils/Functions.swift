//
//  Functions.swift
//  ScreenSleuth
//
//  Created by Home on 6/3/2024.
//

import Foundation

func mainThread(function: @escaping () -> Void) {
    DispatchQueue.main.async(execute: function)
}
