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
            print(tabBar.subviews)
        }
     
        override func viewDidLoad() {
            super.viewDidLoad()
            let tabbar = UITabBar.appearance()
            tabbar.tintColor = UIColor(red: 14 / 255.0, green: 180 / 255.0, blue: 0 / 255.0, alpha: 1.0)
            
            // 添加子控制器
            addChildViewControllers()
        }
    
    /// 添加子控制器
        func addChildViewControllers() {
            setChildViewController(MYAboutViewController(), title: "首页", imageName: "tabbar_mainframe", selectedImageName: "tabbar_mainframeHL")
            setChildViewController(MYAboutViewController(), title: "通讯录", imageName: "tabbar_contacts", selectedImageName: "tabbar_contactsHL")
            setChildViewController(MYAboutViewController(), title: "发现", imageName: "tabbar_discover", selectedImageName: "tabbar_discoverHL")
            setChildViewController(MYAboutViewController(), title: "我", imageName: "tabbar_me", selectedImageName: "tabbar_meHL")
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


//// 可以把相近的功能函数，放在一个extension中，便于代码维护
//// 注意：和OC的分类一样，extension 中不能定义属性
//// MARK： - 设置界面
//extension MYTabBarController {
//    private func setupChildControllers() {
//        // 0. 获取沙盒 json 路径
//        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
//        let jsonPath = (docDir as NSString).appendingPathComponent("main.json")
//
//        // 加载data
//        var data = NSData(contentsOfFile: jsonPath)
//
//        // 判断data是否内容，如果没有，说明本地沙盒没有文件
//        if data == nil {
//            let path = Bundle.main.path(forResource: "main.json", ofType: nil)
//            data = NSData(contentsOfFile: path!)
//        }
//
//        // 1.路径 2.加载nsdata 3.反序列化数组
//        guard let array = try? JSONSerialization.jsonObject(with:data! as Data , options: []) as? [[String : AnyObject]]  else {
//            return
//        }
//
//        // 将数组转化为json查看
//        //        let data = try! JSONSerialization.data(withJSONObject: array, options: [.prettyPrinted])
//        //        (data as NSData).write(toFile: "/Users/huami/Documents/ss/main.json", atomically: true)
//
//        // 验证plist格式是否正确
//        //        (array as NSArray).write(toFile: "/Users/huami/Documents/ss/demo.plist", atomically: true)
//        // 遍历数组，循环创建控制器数组
//        var arrayM  = [UIViewController]()
//        for dict  in array {
//            arrayM.append(controller(dict: dict as [String : AnyObject]))
//        }
//
//        // 设置tabbar 的子控制器
//        viewControllers = arrayM
//    }
//
//    /// 使用字典创建一个子控制器
//    /// - Parameter dict: 信息字典
//    /// - returns: 子控制器
//    private  func controller(dict:[String : AnyObject]) -> UIViewController {
//        // 1. 取得字典内容
//        guard let clsName = dict["clsName"] as? String,
//            let title = dict["title"] as? String,
//            let imageName = dict["imageName"] as? String,
//            let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? ZQBaseViewController.Type,
//            let visitorDict = dict["vistorInfo"] as? [String: String]
//            else {
//                return UIViewController()
//        }
//
//        // 2. 创建视图控制器
//        // 1> 将clsName 转化成cls
//        let vc = cls.init()
//        vc.title = title
//
//        // 设置访客的字典
//        vc.visitorInfoDictionay = visitorDict
//
//        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
//        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_highlighted")?.withRenderingMode(.alwaysOriginal)
//
//        vc.tabBarItem.setTitleTextAttributes(
//            [NSAttributedString.Key.foregroundColor:UIColor.orange],
//            for: .highlighted)
//
//        vc.tabBarItem.setTitleTextAttributes(
//            [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)],
//            for: UIControl.State.init(rawValue: 0))
//        let nav = ZQNavigationController(rootViewController: vc)
//        return nav
//    }
//}
