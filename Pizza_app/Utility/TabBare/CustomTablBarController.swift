//
//  CustomTablBarVC.swift
//  Pizza_app
//
//  Created by Ahmed Hussien on 21/03/2023.
//

import UIKit

class CustomTablBarController: UITabBarController {
    
    lazy var middleButton: UIButton = {
        let middleButton = UIButton()
        middleButton.setImage(UIImage(systemName: "cart"), for: .normal)
        middleButton.backgroundColor = .red
        middleButton.layer.cornerRadius = 35
       // middleButton.imageEdgeInsets = .init(top:10, left: 0, bottom: 0, right: 0)
        return middleButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setValue(CustomTabBar(), forKey: "tabBar")
        setupTabBarViewControllers()
        createMiddleButton()
        
    }
   
    
    func createMiddleButton(){
        self.tabBar.addSubview(middleButton)
        
        middleButton.addTarget(self, action: #selector(action(_:)), for: .touchUpInside)
        
        //MARK: constrians
        //to add constrinas programtly must write  button.translatesAutoresizingMaskIntoConstraints=false
        middleButton.translatesAutoresizingMaskIntoConstraints=false
        
        NSLayoutConstraint.activate([
            middleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            middleButton.widthAnchor.constraint(equalToConstant:70),
            middleButton.heightAnchor.constraint(equalToConstant:70),
            //middleButton.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor, constant: -60)
            middleButton.topAnchor.constraint(equalTo: tabBar.bottomAnchor,constant: -125)
        ])
    }
    
    @objc func action(_ sender:UIButton){
        sender.backgroundColor = .blue
        //print("button cliced ")
    }
    
    enum tabBarItems:Int,CaseIterable{
        case Home
        case pizzaMaker
        case cart
    }
    
    func setupTabBarViewControllers(){
        
        self.viewControllers = tabBarItems.allCases.map({
            return viewControllerInTabBar(item: $0)
        })
        
        tabBar.items?[tabBarItems.pizzaMaker.rawValue].isEnabled = false
        //setup tabBar item UI
        tabBar.tintColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        tabBar.unselectedItemTintColor =  #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        
        
    }
    
    func viewControllerInTabBar(item:tabBarItems)->UIViewController{
        switch item{
        case .Home:
            let vc = HomeVC()
            vc.tabBarItem = setupViewControllerInTabBar(item:item)
            //vc.tabBarItem = .init(title: "Home", image: UIImage(systemName: "homekit"), selectedImage: UIImage(systemName: "homekit"))
            return vc
        case .pizzaMaker:
            let vc = HomeVC()
           // vc.tabBarItem = setupViewControllerInTabBar(item:item)
            return vc
        case .cart:
            let vc = HomeVC()
            vc.tabBarItem = setupViewControllerInTabBar(item:item)
            return vc
        }
    }
    
    private func setupViewControllerInTabBar(item:tabBarItems)->UITabBarItem{
        //An object that describes an item in a tab bar.
        var tabBarItem :UITabBarItem
        
        switch item{
        case .Home:
            tabBarItem = .init(title: "Home", image: UIImage(systemName: "homekit"), selectedImage: UIImage(systemName: "homekit"))
        case .pizzaMaker:
            tabBarItem = .init(title: "Home", image: UIImage(systemName: "homekit"), selectedImage: UIImage(systemName: "homekit"))
        case .cart:
            tabBarItem = .init(title: "cart", image: UIImage(systemName: "cart"), selectedImage: UIImage(systemName: "homekit"))
        }
        //setup tabBar item UI
        tabBarItem.titlePositionAdjustment = .init(horizontal: 0, vertical: 15)
        tabBarItem.imageInsets = .init(top: 10, left: 0, bottom: -10, right: 0)
        return tabBarItem
    }
    
       

    
    

}
