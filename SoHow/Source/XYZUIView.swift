//
//  XYZUIView.swift
//  XYZMoney
//
//  Created by 张子豪 on 2019/12/12.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit

class XYZUIView: NSObject {

}
public extension UIView{
    //    今日收入View
    func gradient处理View界面渐变元素(FirstColor:UIColor = UIColor(red: 255.0/255, green: 255.0/255, blue: 255.0/255, alpha: 0.2),SecondColor:UIColor = UIColor(red: 26/255, green: 22.0/255, blue: 41/255, alpha: 0.2))  {
       let gradientFirstColor = FirstColor.cgColor
       let gradientSecondColor = SecondColor.cgColor
       //        let cellsShadowColor = UIColor.gray.cgColor
       let gradientLayer = CAGradientLayer()
       gradientLayer.frame = self.bounds
       //定义每种颜色所在的位置
       let gradientLocations:[NSNumber] = [0.0, 0.93]//, 0.33, 0.5, 0.67, 0.83, 1.0]
       gradientLayer.locations = gradientLocations
       //设置横向渐变
       gradientLayer.startPoint = CGPoint(x: 0, y: 0)
       gradientLayer.endPoint = CGPoint(x: 1, y: 0)
       gradientLayer.colors = [gradientFirstColor, gradientSecondColor]
       gradientLayer.cornerRadius = 9
       gradientLayer.masksToBounds = true
       self.layer.insertSublayer(gradientLayer, at: 0)
       //        今日支出View.layer.shadowColor = cellsShadowColor
       self.layer.shadowOpacity = 0.6
       self.layer.shadowRadius = 20
       //        今日支出View.layer.shadowOffset = CGSize(width: 0.0, height: 30)
   }
}
