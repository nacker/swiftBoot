//
//  Deivices.swift
//  swiftBoot
//
//  Created by nacker on 2021/7/29.
//


import Foundation
import UIKit

extension UIDevice {
    //刘海屏， 获取底部高度
    public func getBottomHeight() -> CGFloat {
        let tabHeight = UIApplication.shared.statusBarFrame.size.height > 20 ? 34.0 : 0.0
        return CGFloat(tabHeight)
    }
}
