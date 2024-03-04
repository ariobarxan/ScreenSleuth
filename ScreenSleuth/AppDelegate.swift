//
//  AppDelegate.swift
//  ScreenSleuth
//
//  Created by Home on 1/3/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var coordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupMainCoordinator()
        NetworkMonitorService.shared.startMonitoring()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }


}

// MARK: - Coordinator
extension AppDelegate {
    private func setupMainCoordinator() {
        if #unavailable(iOS 13) {
            let navigationController = UINavigationController()
            navigationController.isNavigationBarHidden = true
            coordinator = MainCoordinator(navigationController: navigationController)
            coordinator?.start()
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        }
    }
}
