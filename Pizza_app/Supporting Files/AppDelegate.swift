//
//  AppDelegate.swift
//  Pizza_app
//
//  Created by Ahmed Hussien on 13/03/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var Coordinator : AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Coordinator = AppCoordinator()
        Coordinator?.start()
//        window = UIWindow()
//        window?.rootViewController = CustomTablBarController()//HomeVC()
//        window?.makeKeyAndVisible()
        return true
    }

}

