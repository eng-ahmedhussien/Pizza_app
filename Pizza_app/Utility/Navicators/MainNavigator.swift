//
//  MainNavigator.swift
//  Pizza_app
//
//  Created by Ahmed Hussien on 23/03/2023.
//

import Foundation
import UIKit

class MainNavigator : Navigator{
   
    var coordinator: AppCoordinator
    
    required init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    enum Destination{
        case Home
        case ItemDetails(Product:Product)
    }

    func makeViewController(for destination: Destination) -> UIViewController {
        switch destination.self{
        case .Home :
            let vc = HomeVC(coordinator: coordinator)
          //  vc.coordinator  = coordinator
            return vc
        case .ItemDetails(let product):
            let vc = ItemDetailsVC(product: product, coordinator: coordinator)
            return vc
        }
    }
    

}
