//
//  XYZSegmentControl.swift
//  SoHow
//
//  Created by zhangzihao on 2021/11/26.
//  Copyright © 2021 张子豪. All rights reserved.
//

import UIKit

public extension UISegmentedControl{
//    UIColor(hexString: "5D54C1")
    func SettitleArribute(titleColor:UIColor = .black,font:UIFont = UIFont.boldSystemFont(ofSize: 16) )  {
        let dic:NSDictionary = [NSAttributedString.Key.foregroundColor:titleColor,NSAttributedString.Key.font:font];
               
        self.setTitleTextAttributes((dic as! [NSAttributedString.Key : Any]), for: .normal);
    }
     
}
