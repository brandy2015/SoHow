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



import UIKit

extension UIView{
    //添加View的边缘效果线
    func AddBorder(borderWidth:Double = 1.0,borderColor:UIColor = .lightGray)  {
        self.layer.borderWidth = CGFloat(borderWidth)
        self.layer.borderColor = borderColor.cgColor
        
        //
        //            // 设置UIView的边框为圆角和展现
        //
        //            cell.layer.cornerRadius = 10
        //
        //            //自动遮罩不可见区域,超出的不显示
        //
        //            cell.layer.masksToBounds = true
        //
        //            cell.backgroundColor = UIColor.whiteColor()

    }
}


extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
             
            return UIApplication.shared.windows.last { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
    
}

//获取屏幕宽度和高度
extension UIScreen{
    
    static var width: CGFloat {return UIScreen.main.bounds.width}
    static var height: CGFloat {return UIScreen.main.bounds.height}
}
 
//设置圆角
public extension UIView{
    func CornerRadiusWithDesign(左上:Bool = true,左下:Bool = true,右上:Bool = true,右下:Bool = true,cornerRadius:CGFloat = 10)  {
//        layerMinXMinYCorner 左上       CACornerMask.layerMinXMinYCorner.rawValue |
//        layerMinXMaxYCorner 左下       CACornerMask.layerMinXMaxYCorner.rawValue |
//        layerMaxXMinYCorner 右上       CACornerMask.layerMaxXMinYCorner.rawValue |
//        layerMaxXMaxYCorner 右下       CACornerMask.layerMaxXMaxYCorner.rawValue |
        var pp = UInt(0)
            
        pp = 左上 ? pp | CACornerMask.layerMinXMinYCorner.rawValue : pp | 0
        pp = 左下 ? pp | CACornerMask.layerMinXMaxYCorner.rawValue : pp | 0
        pp = 右上 ? pp | CACornerMask.layerMaxXMinYCorner.rawValue : pp | 0
        pp = 右下 ? pp | CACornerMask.layerMaxXMaxYCorner.rawValue : pp | 0
 
        print(pp)
         //选择位置
        self.layer.maskedCorners = CACornerMask(rawValue: pp)
        self.layer.cornerRadius = cornerRadius
    }
}


//设置UIVIew的阴影
public extension UIView{
    
    func setShadowXx(width:CGFloat = CGFloat(0.5),bColor:UIColor = .clear ,
                     sColor:UIColor = .orange,offset:CGSize = CGSize(width: -0.10, height: -0.10),opacity:Float = 0.8,radius:CGFloat = 8) {
        
        setShadowx(view: self, width: width, bColor: bColor, sColor: sColor, offset: offset, opacity: opacity, radius: radius)
    }
    
    
    private func setShadowx(view:UIView,width:CGFloat,bColor:UIColor,
                           sColor:UIColor,offset:CGSize,opacity:Float,radius:CGFloat) {
        view.layer.masksToBounds = false
        //设置视图边框宽度
        view.layer.borderWidth = width
        //设置边框颜色
        view.layer.borderColor = bColor.cgColor
        //设置边框圆角
        view.layer.cornerRadius = radius
        //设置阴影颜色
        view.layer.shadowColor = sColor.cgColor
        //设置透明度
        view.layer.shadowOpacity = opacity
        //设置阴影半径
        view.layer.shadowRadius = radius
        //设置阴影偏移量
        view.layer.shadowOffset = offset
    }
}
