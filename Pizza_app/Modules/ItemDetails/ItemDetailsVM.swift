//
//  ItemDetailsVM.swift
//  Pizza_app
//
//  Created by Ahmed Hussien on 28/03/2023.
//

import Foundation
import RxSwift
import RxCocoa


class ItemDetailsVM{
    
    let product: Product
    var displayMainData =  PublishSubject<Product>()
    
    init(product: Product) {
        self.product = product
    }
    
    
}
