//
//  SceneDelegate.swift
//  ScreenSleuth
//
//  Created by Home on 1/3/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private var coordinator: MainCoordinator?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        setupMainCoordinator(for: windowScene)
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}

@available(iOS 13.0, *)
extension SceneDelegate {
    
    private func setupMainCoordinator(for scene: UIWindowScene) {
        let window = UIWindow(windowScene: scene)
        let navController = UINavigationController()
        coordinator = MainCoordinator(navigationController: navController)
        coordinator?.start()
        window.rootViewController = navController
        self.window = window
        window.makeKeyAndVisible()
    }
}
