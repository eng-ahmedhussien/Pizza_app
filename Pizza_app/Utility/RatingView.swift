//
//  RatingView.swift
//  Pizza_app
//
//  Created by Ahmed Hussien on 14/03/2023.
//

import Foundation
import UIKit

class RatingView: UIView {
    
    //MARK: UI Private Configurations
    private let maximumRating = 5
    
    //MARK: UI Public Configurations var rating
    var rating: Int = 5
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.spacing = 30
        return stack
    }()
    
    required init? (coder: NSCoder) {
        super.init (coder: coder)
        setupUI ( )
      //  setupRating(rating: 3 , style: .compact)
    }
    
    func setupUI ( ) {
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints=false
        stackView.topAnchor.constraint (equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive=true
        stackView.leadingAnchor.constraint (equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint (equalTo: self.trailingAnchor).isActive = true
    }
    
    func setupRating(rating:Int,style:style = .fill){
        
        switch style{
            
        case .fill:
            if rating > 0 {
                for _ in 1...rating{
                    let image = genrateStarView(staretype: .fill)
                    stackView.addArrangedSubview(image)
                }
            }
            let nofill  = maximumRating - rating
            if nofill > 0 {
                for _ in 1...nofill{
                    let image = genrateStarView(staretype: .nonfill)
                    stackView.addArrangedSubview(image)
                }
            }
        case .compact:
            let image = genrateStarView(staretype: .fill)
            stackView.addArrangedSubview(image)
        }
        
        
        
    }
    
    func genrateStarView(staretype:starType)-> UIImageView{
        let starImage: UIImage
        
        switch staretype{
            
        case .fill:
            starImage = UIImage(named: "fillstar")!
        case .nonfill:
            starImage = UIImage(named: "star")!
        }
        
        let image = UIImageView (image: starImage)
        image.contentMode = .scaleAspectFill
        image.widthAnchor.constraint(equalToConstant: 10).isActive = true
        return image
    }

    
    enum starType{
        case fill
        case nonfill
    }
    enum style{
        case fill
        case compact
    }
    
}


