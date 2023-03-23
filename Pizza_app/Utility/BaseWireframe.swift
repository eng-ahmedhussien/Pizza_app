//
//  BaseWireFrame.swift
//  Pizza_app
//
//  Created by Ahmed Hussien on 23/03/2023.
//

import Foundation
import UIKit

class BaseWireframe<T>: UIViewController{
    
    let viewModel: T
    
    override func viewDidLoad() {
        super.viewDidLoad ( )
         bind(viewModel: viewModel)
    }
    
    init(viewModel:T){
        self.viewModel = viewModel
        super.init (nibName: String(describing: type(of: self)), bundle: nil)
       // super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(viewModel:T){
        fatalError("please override bind func")
    }
}

