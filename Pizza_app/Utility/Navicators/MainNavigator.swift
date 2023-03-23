//
//  MainNavigator.swift
//  Pizza_app
//
//  Created by Ahmed Hussien on 23/03/2023.
//

import Foundation
import UIKit

class MainNavigator : Navigator{
    
    enum Destination{
        case Home
    }
    
    func navigate(to destination: Destination)->UIViewController {
        switch destination.self{
        case .Home :
            return HomeVC()
        }
    }
}
