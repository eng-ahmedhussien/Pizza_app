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
    lazy var mainNavigator : MainNavigator = {
        return.init(coordinator: self)
    }()
    
    //MARK: tabBar to access selectedViewController and redturn all vc
    lazy var tabBar : CustomTablBarController = {
        return CustomTablBarController(coordinator: self)
    }()
    
    var navigationController: UINavigationController?{
        if let navigationController =  tabBar.selectedViewController as? UINavigationController{
            return navigationController
        }
        return nil
    }
    
    var rootViewController : UIViewController{
        return tabBar//CustomTablBarController(coordinator: self)
    }
    
    init(window: UIWindow = UIWindow()) {
        self.window = window
    }
    func start(){
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
}
