//
//  BaseTabBarController.swift
//  FinalIOS
//
//  Created by Tân Phù on 07/12/2022.
//

import Foundation
import UIKit

final class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let HomeVC = HomeViewController()
        let HomeNavi = UINavigationController(rootViewController: HomeVC)
        HomeVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "home"), tag: 0)
        
        let CartVC = CartViewController()
        let CartNavi = UINavigationController(rootViewController: CartVC)
        CartVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "carttb"), tag: 1)
        
        let HistoryVC = HistoryViewController()
        let HistoryNavi = UINavigationController(rootViewController: HistoryVC)
        HistoryVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "history"), tag: 2)
        
        let ProfileVC = ProfileViewController()
        let ProfileNavi = UINavigationController(rootViewController: ProfileVC)
        ProfileVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "user"), tag: 3)
        
        viewControllers = [HomeNavi,CartNavi,HistoryNavi,ProfileNavi]
        
        print("Welcome user \(userIsLoggin)")
    }
}
