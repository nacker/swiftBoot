//
//  Bundle+Extension.swift
//  swiftBoot
//
//  Created by nacker on 2021/7/29.
//

import Foundation

extension Bundle {
    var namespace: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
}
