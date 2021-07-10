//
//  NSDate+Extension.swift
//  swiftBoot
//
//  Created by nacker on 2021/7/10.
//

import UIKit

extension NSDate {
    /**
    *  根据字符串转换时间
    */
    class func dateWithString(str: String) -> NSDate? {
        // 1.创建时间格式化对象
        let formatter = DateFormatter()
        // 2.指定时间格式
        formatter.dateFormat = "EEE MM dd HH:mm:ss Z yyyy"
        // 3.指定时区
        formatter.locale = NSLocale(localeIdentifier: "en") as Locale
        // 4.转换时间
        return formatter.date(from: str) as NSDate?
    }
    

}
