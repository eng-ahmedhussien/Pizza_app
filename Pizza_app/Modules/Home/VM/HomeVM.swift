//
//  HomeVM.swift
//  Pizza_app
//
//  Created by ahmed hussien on 18/08/2024.
//

import Foundation
import Combine

class HomeVM {
    private var timer : Timer?
    @Published var currentSlideIndex : Int = 0
    
    func setupTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToIndex), userInfo: nil, repeats: true)
    }
    
    @objc func moveToIndex(){
        let nextSlide = currentSlideIndex+1
        currentSlideIndex = nextSlide % 3
    }
}
