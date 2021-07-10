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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 1.创建Window
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        // 2.设置窗口根控制器
        window?.rootViewController = ViewController()
        
        // 3.显示窗口
        window?.makeKeyAndVisible()
        
        return true
    }



}

