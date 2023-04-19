//
//  ItemDetailsVC.swift
//  Pizza_app
//
//  Created by Ahmed Hussien on 27/03/2023.
//

import UIKit
import RxSwift
import RxCocoa

class ItemDetailsVC: UIViewController {
    
    @IBOutlet weak var pizzaName: UILabel!
    @IBOutlet weak var pizzaDescription: UILabel!
    @IBOutlet weak var descPizza: UITextView!
    @IBOutlet weak var pizzaOptionView: OptionsView!
    @IBOutlet weak var ratingView: RatingView!
    
    var product : Product
    var coordinator : AppCoordinator
    var disposed = DisposeBag()
    lazy var itemDetailsVM : ItemDetailsVM = {
        return ItemDetailsVM(product: product)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProductView()
       // binde()
    }
    init(product: Product,coordinator:AppCoordinator) {
        self.product = product
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//    func binde(){
//        itemDetailsVM.displayMainData.subscribe { [weak self] (product) in
//            self?.setupProductView(with: viewModel)
//        }.disposed(by: disposeBag)
//    }
    
    func setupProductView(){
        pizzaName.text = product.title
        ratingView.setupRating(rating: 5)
    }
}
