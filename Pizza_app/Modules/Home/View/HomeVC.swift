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
