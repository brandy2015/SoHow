//
//  XYZShadowKit.swift
//  WoZaiX
//
//  Created by 张子豪 on 2020/1/16.
//  Copyright © 2020 张子豪. All rights reserved.
//

import UIKit

class XYZShadowKit: NSObject {

}



public extension UIView{
    
    func setShadowX(width:CGFloat = CGFloat(0.5),bColor:UIColor = .clear ,
                    sColor:UIColor = .black,offset:CGSize = CGSize(width: -1.0, height: -1.0),opacity:Float = 0.8,radius:CGFloat = 20) {
        
        setShadow(view: self, width: width, bColor: bColor, sColor: sColor, offset: offset, opacity: opacity, radius: radius)
    }
    
    
    private func setShadow(view:UIView,width:CGFloat,bColor:UIColor,
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
