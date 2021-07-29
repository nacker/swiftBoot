//
//  NSObject+Extensions.swift
//  swiftBoot
//
//  Created by nacker on 2021/7/29.
//

import Foundation

public extension NSObject{
     var className:String{
             get{
               let name =  type(of: self).description()
                 if(name.contains(".")){
                     return name.components(separatedBy: ".")[1];
                 }else{
                     return name;
                 }

             }
         }
}
