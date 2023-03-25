//
//  Navigator.swift
//  Pizza_app
//
//  Created by Ahmed Hussien on 23/03/2023.
//

import Foundation
import UIKit

enum navigatorType{
    case push
    case present
    case root
}

protocol Navigator{
    associatedtype Destination
    func navigate(to destination: Destination,with type: navigatorType)
    func makeViewController(for destination: Destination) -> UIViewController
    var coordinator : AppCoordinator {get}
    init(coordinator:AppCoordinator)
}
extension Navigator {
    // default navigation type is .push
    public func navigate(to destination: Destination,with type: navigatorType = .push) {
        let viewController = self.makeViewController(for: destination)
        switch type {
        case .push:
            coordinator.navigationController?.pushViewController(viewController,animated:true)
        case .present:
            coordinator.navigationController?.present (viewController, animated: true)
        case .root:
            coordinator .navigationController?.setViewControllers([viewController], animated: true)
        }
    }
}
