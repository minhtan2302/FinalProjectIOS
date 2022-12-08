//
//  AppDelegate.swift
//  FinalIOS
//
//  Created by Tân Phù on 19/07/2022.
//

import UIKit
import IQKeyboardManagerSwift

// Global access
let cardItemManager = CardItemsManager()
let orderItemManager = OrderTransactionManager()
let favoriteItemManager = ProductFavoriteManager()
var userIsLoggin: RegisterInfo?

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
        moveToTutorial()
        window?.makeKeyAndVisible()
        return true
    }
    
    func moveToTutorial() {
        let navi = UINavigationController(rootViewController: TutorialViewController())
        navi.navigationBar.isHidden = true
        window?.rootViewController = navi
    }
    
    func moveToLogin() {
        let navi = UINavigationController(rootViewController: WelcomeViewController())
        navi.navigationBar.isHidden = true
        window?.rootViewController = navi
    }
    
    func moveToHome() {
        let navi = UINavigationController(rootViewController: BaseTabBarController())
        navi.navigationBar.isHidden = true
        window?.rootViewController = navi
    }
    
   
}

