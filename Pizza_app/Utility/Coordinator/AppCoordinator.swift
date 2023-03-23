//
//  AppCoordinator.swift
//  Pizza_app
//
//  Created by Ahmed Hussien on 23/03/2023.
//

import Foundation
import UIKit

class AppCoordinator{
    let window: UIWindow
    var mainNavigator : MainNavigator
    
    init(window: UIWindow = UIWindow()) {
        self.window = window
        self.mainNavigator = .init()
    }
    func start(){
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    var rootViewController : UIViewController{
        return CustomTablBarController(coordinator: self)
    }
}
