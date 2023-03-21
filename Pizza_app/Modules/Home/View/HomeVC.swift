//
//  HomeVC.swift
//  Pizza_app
//
//  Created by Ahmed Hussien on 14/03/2023.
//

import UIKit
import RxSwift
import RxCocoa

class HomeVC: UIViewController {
    
    let homeVM = HomeVM()
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var sliderCollectionView : UICollectionView!{
        didSet{
            sliderCollectionView.dataSource = self
            sliderCollectionView.delegate = self
            sliderCollectionView.registerCell(cellClass:SliderCell.self)
        }
    }
    
    @IBOutlet weak var popularTableView: UITableView!{
        didSet{
            popularTableView.rowHeight = 100
            
            popularTableView.rx.setDelegate(self).disposed(by: disposeBag)
            
            homeVM.popularItems.asObservable().bind(to: popularTableView.rx.items(cellIdentifier: String(describing:PopularCell.self),cellType: PopularCell.self)){index,model,cell in
                cell.ratingView.setupRating(rating: 3,style: .compact)
            }.disposed(by: disposeBag)
            
            
            popularTableView.registerCellNib(cellClass: PopularCell.self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeVM.setupTimer()
        binde()
        
    }
    init(){
        super.init(nibName: "HomeVC", bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func binde(){
        homeVM.scrollToItemAtIndex.subscribe(onNext: { [weak self ] (index) in
            self?.sliderCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .centeredHorizontally, animated: true)
        }).disposed(by: disposeBag)
        
        
//        popularTableView.rx.setDelegate(self).disposed(by: disposeBag)
////        homeVM.popularItems.asObservable().bind(to: popularTableView.rx.items(cellIdentifier: String(describing:PopularCell.self),cellType: PopularCell.self)){index,model,cell in
////
////        }.disposed(by: disposeBag)
//
//
//        homeVM.popularItems.bind(to: popularTableView.rx.items(cellIdentifier: String(describing:PopularCell.self),cellType: PopularCell.self)){index,model,cell in
//
//        }.disposed(by: disposeBag)
//

        
        //        homeVM.slides.subscribe { [weak self] (numberOfSlide) in
        //            <#code#>
        //        }
        //
    }
}

extension HomeVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sliderCollectionView.dequeue(indexPath: indexPath) as SliderCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return sliderCollectionView.bounds.size
    }
    
}

