//
//  MYTabBar.swift
//  swiftBoot
//
//  Created by nacker on 2021/7/29.
//

import UIKit

class MYTabBar: UITabBar {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder)")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        //当前tabbai的宽度和高度
        
        let width = frame.width
        let height = frame.height - UIDevice.init().getBottomHeight()
        
        
        //设置其他按钮的frame
        let buttonW:CGFloat = width * 0.25
        let buttonH:CGFloat = height
        let buttonY:CGFloat = 0
        
        var index = 0
        for button in subviews{
            
            if !button.isKind(of: NSClassFromString("UITabBarButton")!){
                continue
            }
            
            let buttonX = buttonW * CGFloat(index)
            button.frame = CGRect(x: buttonX, y: buttonY, width: buttonW, height: buttonH)
            
            index+=1
        }
        
    }
    
}
