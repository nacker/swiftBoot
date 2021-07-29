//
//  UIColor+Extension.swift
//  swiftBoot
//
//  Created by nacker on 2021/7/29.
//

import UIKit

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0 , blue: b / 255.0, alpha: alpha)
    }
    
    /// 十六进制颜色转换RGB数字方法
    convenience init?(hex: String, alpha: CGFloat = 1.0) {
        // 0xff0000
        // 1.判断字符串的长度是否符合
        guard hex.count >= 6 else {
            return nil
        }
        
        // 2.将字符串装成大写
        var tempHex = hex.uppercased()
        
        // 3.判断字符串开头： 0x/#/##
        if tempHex.hasPrefix("0X") || tempHex.hasPrefix("##") {
            tempHex = (tempHex as NSString).substring(from: 2)
        }

        if tempHex.hasPrefix("#") {
            tempHex = (tempHex as NSString).substring(from: 1)
        }
        
        // 4.分别却出RGB
        // FF -> 255
        var range = NSRange(location: 0, length: 2)
        let rHex = (tempHex as NSString).substring(with: range)
        range.location = 2
        let gHex = (tempHex as NSString).substring(with: range)
        range.location = 4
        let bHex = (tempHex as NSString).substring(with: range)
        
        // 5.将十六进制装成数字
        var r: UInt32 = 0, g: UInt32 = 0, b: UInt32 = 0
        Scanner(string: rHex).scanHexInt32(&r)
        Scanner(string: gHex).scanHexInt32(&g)
        Scanner(string: bHex).scanHexInt32(&b)
        
        self.init(r: CGFloat(r), g: CGFloat(g), b: CGFloat(b), alpha: alpha)
    }
    
    /// 获取随机色方法
    ///
    /// - Returns: 随机色
    class func randomColor() -> UIColor {
        return UIColor.init(r: CGFloat(arc4random_uniform(256)),
                            g: CGFloat(arc4random_uniform(256)),
                            b: CGFloat(arc4random_uniform(256)))
    }
}
