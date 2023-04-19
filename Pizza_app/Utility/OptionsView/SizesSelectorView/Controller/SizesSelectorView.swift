//
//  QuantityView.swift
//  Pizza_app
//
//  Created by Ahmed Hussien on 10/04/2023.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class SizesSelectorView : NibLoadingView{
    
    @IBOutlet weak var collectionView: UICollectionView!

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCollection()
    }
    
    func setupCollection(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "SizeItemCell", bundle: .main), forCellWithReuseIdentifier: "SizeItemCell")
      //  collectionView.registerCell(cellClass: SizeItemCell.self)
        
    }
}

extension SizesSelectorView:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       // let cell = collectionView.dequeue(indexPath: indexPath) as!  SizeItemCell
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "SizeItemCell", for: indexPath) as! SizeItemCell
        return cell
    }
    
    
}

extension SizesSelectorView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
  
        let width = collectionView.frame.size.width/2
        let hight = collectionView.frame.size.height
        return CGSize(width: width, height: hight)


    }
}
