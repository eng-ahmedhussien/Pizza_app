//
//  PopularCell.swift
//  Pizza_app
//
//  Created by Ahmed Hussien on 19/03/2023.
//

import UIKit

class PopularCell: UITableViewCell {

    @IBOutlet weak var ratingView: RatingView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
