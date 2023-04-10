//
//  SizeItemCell.swift
//  Pizza_app
//
//  Created by Ahmed Hussien on 10/04/2023.
//

import UIKit

class SizeItemCell: UICollectionViewCell {

    //outlet
    @IBOutlet weak var selectView: UIView!
    @IBOutlet weak var checkMarkView: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var sizelabel: UILabel!
    @IBOutlet weak var quntityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
