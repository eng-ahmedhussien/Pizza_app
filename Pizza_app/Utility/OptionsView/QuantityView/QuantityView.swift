//
//
//  QuantityView.swift
//  Pizza_app
//
//  Created by Ahmed Hussien on 10/04/2023.
//

import UIKit
import RxSwift
import RxCocoa

class QuantityView:NibLoadingView{
    //
    @IBOutlet weak var vlaueLable: UILabel!
    //
    var currentValue: BehaviorRelay<Int> = .init(value: 0)
    let disposeBag = DisposeBag()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    
    func setup(){
        currentValue.subscribe { [weak self] (quantity) in
            self?.vlaueLable.text = "\(quantity.element ?? 0)"
        }.disposed(by: disposeBag)
    }
    
    public var value: Int {
        return currentValue.value
    }
    
    @IBAction func PresPlus(_ sender: Any) {
        var value = currentValue.value
        currentValue.accept(value+1)
    }
    
    
    @IBAction func PresMinus(_ sender: Any) {
        
        var value = currentValue.value
        guard value > 0 else { return }
        currentValue.accept(value - 1)
        
    }
    
    
    
}
