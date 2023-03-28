//
//  ItemDetailsVC.swift
//  Pizza_app
//
//  Created by Ahmed Hussien on 27/03/2023.
//

import UIKit

class ItemDetailsVC: UIViewController {
    
    var product : Product
    var coordinator : AppCoordinator
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    init(product: Product,coordinator:AppCoordinator) {
        self.product = product
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
