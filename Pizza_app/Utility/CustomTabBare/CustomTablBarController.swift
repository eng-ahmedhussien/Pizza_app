//
//  CustomTablBarVC.swift
//  Pizza_app
//
//  Created by Ahmed Hussien on 21/03/2023.
//

import UIKit

class CustomTablBarController: UITabBarController {
    
    var coordinator : AppCoordinator
    lazy var middleButton: UIButton = {
        let middleButton = UIButton()
        middleButton.setImage(UIImage(named: "20395188"), for: .normal)
        middleButton.contentMode = .center
        middleButton.backgroundColor = .red
        middleButton.layer.cornerRadius = 35
        middleButton.borderColor = .black
        middleButton.borderWidth = 3
       // middleButton.imageEdgeInsets = .init(top:10, left: 0, bottom: 0, right: 0)
        return middleButton
    }()
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setValue(CustomTabBar(), forKey: "tabBar")
        setupTabBarViewControllers()
        createMiddleButton()
        
    }
   
    
    
    enum tabBarItems:Int,CaseIterable{
        case Home
        case pizzaMaker
        case cart
    }
    
    func setupTabBarViewControllers(){
        self.viewControllers = tabBarItems.allCases.map({
            let vc = viewControllersInTabBar(item: $0)
            let navigation  = UINavigationController(rootViewController: vc)
            return navigation //viewControllersInTabBar(item: $0)
        })
        
        tabBar.items?[tabBarItems.pizzaMaker.rawValue].isEnabled = false
        //setup tabBar item UI
        tabBar.tintColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        tabBar.unselectedItemTintColor =  #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        
        
    }
    
    func viewControllersInTabBar(item:tabBarItems)->UIViewController{
        switch item{
        case .Home:
            let vc = HomeVC(coordinator: coordinator)
            vc.tabBarItem = setupViewControllerInTabBar(item:item)
            return vc
        case .pizzaMaker:
            let vc = HomeVC(coordinator: coordinator)
           // vc.tabBarItem = setupViewControllerInTabBar(item:item)
            return vc
        case .cart:
            let vc = HomeVC(coordinator: coordinator)
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
//MARK: - createMiddleButton
extension CustomTablBarController{
    
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
        coordinator.mainNavigator.navigate(to: .Home,with: .push)
        sender.backgroundColor = .blue
    }
}
