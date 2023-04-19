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
    var coordinator: AppCoordinator
    
    @IBOutlet weak var sliderCollectionView : UICollectionView!{
        didSet{
            sliderCollectionView.dataSource = self
            sliderCollectionView.delegate = self
            sliderCollectionView.registerCell(cellClass:SliderCell.self)
        }
    }
    
    @IBOutlet weak var popularTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeVM.setupTimer()
        binde()
        setupPopularTableView()
        
    }
    init(coordinator:AppCoordinator){
        self.coordinator = coordinator
        super.init(nibName: "HomeVC", bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func binde(){
        homeVM.scrollToItemAtIndex.subscribe(onNext: { [weak self ] (index) in
            self?.sliderCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .centeredHorizontally, animated: true)
        }).disposed(by: disposeBag)
        
        homeVM.navigateToItemDetails.subscribe { [weak self ] (product) in
            guard let self = self else {return}
            self.coordinator.mainNavigator.navigate(to: .ItemDetails(Product: product), with: .push)
        }.disposed(by: disposeBag)
        
    }
    
    func setupPopularTableView(){
        
        popularTableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        //MARK: !must write cell type
        homeVM.popularItems.asObservable().bind(to: popularTableView.rx.items(cellIdentifier: String(describing:PopularCell.self),cellType: PopularCell.self)){index,model,cell in
            cell.ratingView.setupRating(rating: 3,style: .compact)
        }.disposed(by: disposeBag)
        
        popularTableView.rx.itemSelected.subscribe { [weak self] (indexSelected) in
            guard let self = self, let indexSelected = indexSelected.element else { return}
            self.homeVM.didselctedIndex(indexSelected: indexSelected)
            
        }.disposed(by: disposeBag)
        
        //ui
        popularTableView.registerCellNib(cellClass: PopularCell.self)
        popularTableView.rowHeight = 100
    }
}

//MARK: - collection view
extension HomeVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sliderCollectionView.dequeue(indexPath: indexPath) as SliderCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("slected")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return sliderCollectionView.bounds.size
    }
    
}

