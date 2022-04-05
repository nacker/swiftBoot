//
//  AppDelegate.swift
//  swiftBoot
//
//  Created by nacker on 2021/7/10.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    
    var defaultViewController : UIViewController? {
//        let isLogin = UserAccountViewModel.shareIntance.isLogin
//        return isLogin ? WelcomeViewController() : UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        
//        let tabBarVC = MYTabBarController()
        
        return MYWelcomeViewController()
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 1.创建Window
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        // 2.设置窗口根控制器
        window?.rootViewController = defaultViewController
        
        // 3.显示窗口
        window?.makeKeyAndVisible()
        
        return true
    }



}

