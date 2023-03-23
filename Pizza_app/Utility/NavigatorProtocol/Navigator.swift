//
//  Navigator.swift
//  Pizza_app
//
//  Created by Ahmed Hussien on 23/03/2023.
//

import Foundation
import UIKit

protocol Navigator{
    associatedtype Destination
    func navigate(to destination: Destination)->UIViewController
}
