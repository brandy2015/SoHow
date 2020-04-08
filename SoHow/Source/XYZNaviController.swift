//
//  UINavigationController_Extension.swift
//  VTLMaker
//
//  Created by 张子豪 on 2019/10/31.
//  Copyright © 2019 zhangqian. All rights reserved.
//

import UIKit
public extension UINavigationController{
    func SetNaviClear()  {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.tintColor = .clear
        self.navigationBar.barTintColor = .clear
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.navigationBar.standardAppearance.configureWithTransparentBackground()//Xcode11.4后必须加
    }
    
    func SetTitleAttributes(FontSize:CGFloat = 20.0)  {
        self.navigationBar.titleTextAttributes =  [NSAttributedString.Key.foregroundColor:UIColor.white,NSAttributedString.Key.font:UIFont(name: "Heiti SC", size: FontSize)!]
    }
    
    func configureNavBarImagePosition() {
        navigationItem.leftBarButtonItem?.image = navigationItem.leftBarButtonItem?.image!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
    }
}
