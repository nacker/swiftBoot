//
//  MYTabBarController.swift
//  swiftBoot
//
//  Created by nacker on 2021/7/10.
//

import UIKit

class MYTabBarController: UITabBarController {

    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
//            print(tabBar.subviews)
        }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabbar = UITabBar.appearance()
        
        tabbar.tintColor = UIColor.init(r: 14, g: 180, b: 0)
        
        // 添加子控制器
        addChildViewControllers()
    }

/// 添加子控制器
    func addChildViewControllers() {
        setChildViewController(MYHomeViewController(), title: "首页", imageName: "tabbar_mainframe", selectedImageName: "tabbar_mainframeHL")
        setChildViewController(MYConversationViewController(), title: "通讯录", imageName: "tabbar_contacts", selectedImageName: "tabbar_contactsHL")
        setChildViewController(MYDiscoverViewController(), title: "发现", imageName: "tabbar_discover", selectedImageName: "tabbar_discoverHL")
        setChildViewController(MYMeViewController(), title: "我", imageName: "tabbar_me", selectedImageName: "tabbar_meHL")
        // tabBar 是 readonly 属性，不能直接修改，利用 KVC 把 readonly 属性的权限改过来
        setValue(MYTabBar(), forKey: "tabBar")
    }
    
    /// 初始化子控制器
    func setChildViewController(_ childController: UIViewController, title: String, imageName: String, selectedImageName: String) {
        // 设置 tabbar 文字和图片
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: selectedImageName)
        childController.title = title
        // 添加导航控制器为 TabBarController 的子控制器
        let navVc = MYNavigationController(rootViewController: childController)
 
        addChild(navVc)
    }
}
