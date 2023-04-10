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
    
    
    
    func setupCollection(){
        collectionView.registerCell(cellClass: SizeItemCell.self)
    }
}

//extension SizesSelectorView: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = collectionView.bounds.size.width / CGFloat(viewModel.numberOfItems)
//        return CGSize(width: width, height: collectionView.bounds.size.height)
//    }
//
//}
