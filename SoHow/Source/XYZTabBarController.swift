//
//  UITabBarController_Extension.swift
//  VTLMaker
//
//  Created by 张子豪 on 2019/10/31.
//  Copyright © 2019 zhangqian. All rights reserved.
//

import UIKit

public extension UITabBarController{
    func SetTabBarHide()  {
        self.tabBarController?.tabBar.isHidden = true //不想要底边栏
    }
    
    //让TabBar透明
    func SetBarClear() {
       self.tabBar.backgroundImage = UIImage()
       self.tabBar.shadowImage = UIImage()
    }
}
