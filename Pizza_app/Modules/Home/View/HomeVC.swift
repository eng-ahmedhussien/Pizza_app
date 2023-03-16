//
//  HomeVC.swift
//  Pizza_app
//
//  Created by Ahmed Hussien on 14/03/2023.
//

import UIKit

class HomeVC: UIViewController {
    
    var timer : Timer?
    var currentSlideIndex = 0
    @IBOutlet weak var sliderCollectionView : UICollectionView!{
        didSet{
            sliderCollectionView.dataSource = self
            sliderCollectionView.delegate = self
            sliderCollectionView.registerCell(cellClass:SliderCell.self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTimer()
    }
    init(){
        super.init(nibName: "HomeVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToIndex), userInfo: nil, repeats: true)
    }
    
    @objc func moveToIndex(){
        let nextSlide = currentSlideIndex+1
        currentSlideIndex = nextSlide % 3
        sliderCollectionView.scrollToItem(at: IndexPath(row: currentSlideIndex, section: 0), at: .centeredHorizontally, animated: true)
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
