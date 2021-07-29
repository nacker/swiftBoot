//
//  UIBarButtonItem+Extension.swift
//  swiftBoot
//
//  Created by nacker on 2021/7/10.
//

import UIKit

extension UIBarButtonItem
{
    /**
    创建item
    
    - parameter imageName: item显示图片
    - parameter target:    谁来监听
    - parameter action:    监听到之后执行的方法
    */
    convenience init(imageName: String, target: AnyObject?, action: Selector)
    {
        let btn = UIButton()

        btn.setImage(UIImage(named: imageName), for:.normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        btn.addTarget(target, action: action, for: .touchUpInside)
        
        btn.sizeToFit()
        // 实例化 UIBarButtonItem
        self.init(customView: btn)
    }
}
