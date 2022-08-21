//
//  AppDelegate.swift
//  FinalIOS
//
//  Created by Tân Phù on 19/07/2022.
//

import UIKit

// Global access
let cardItemManager = CardItemsManager()
let orderItemManager = OrderTransactionManager()
let favoriteItemManager = ProductFavoriteManager()

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
//        let navi = UINavigationController(rootViewController: WelcomeViewController())
//        window?.rootViewController = navi
        
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
        
        let tabbarController = UITabBarController()
        tabbarController.viewControllers = [HomeNavi,CartNavi,HistoryNavi,ProfileNavi]
        window?.rootViewController = tabbarController
        
        window?.makeKeyAndVisible()
        return true
    }
}

