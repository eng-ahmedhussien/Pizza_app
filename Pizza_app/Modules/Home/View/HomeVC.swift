//
//  HomeVC.swift
//  Pizza_app
//
//  Created by Ahmed Hussien on 14/03/2023.
//

import UIKit
import Combine
class HomeVC: UIViewController {
    
    var homeVM = HomeVM()
    private var cancellables = Set<AnyCancellable>()
    
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
        bind()
        
    }
    init(){
        super.init(nibName: "HomeVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func bind() {
        homeVM.$currentSlideIndex
            .sink { newValue in
                self.sliderCollectionView.scrollToItem(at: IndexPath(row:newValue, section: 0), at: .centeredHorizontally, animated: true)
            }.store(in: &cancellables)
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
