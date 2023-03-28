//
//  HomeVM.swift
//  Pizza_app
//
//  Created by Ahmed Hussien on 16/03/2023.
//

import Foundation
import RxCocoa
import RxSwift

class HomeVM {
    //
    var timer : Timer?
    var currentSlideIndex = 0
    var slides : BehaviorRelay<[Int]> = .init(value: [1,2,3])
   // var popularItems : BehaviorRelay<[Int]> = .init(value: [1,2,3])
    var popularItems : BehaviorRelay<[Product]> = .init(value:
                                                            [.init(title: "pizza1"),
                                                             Product(title: "pizza) beaf"),
                                                             Product(title: "pizza 4")])
    
   // outputs var scrollToItemAtIndex : ((Int)-> Void)?
    var scrollToItemAtIndex :PublishSubject<Int> = .init()
    var navigateToItemDetails :PublishSubject<Product> = .init()
    var didselctedIndex : PublishSubject<Product> = .init()
   
    
    func setupTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToIndex), userInfo: nil, repeats: true)
    }
    
    @objc func moveToIndex(){
        let nextSlide = currentSlideIndex+1
        currentSlideIndex = nextSlide % slides.value.count
        scrollToItemAtIndex.onNext(currentSlideIndex)
       // scrollToItemAtIndex?(currentSlideIndex)
    }
    
}
