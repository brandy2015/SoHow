//
//  XYZTVCell.swift
//  WoZaiX
//
//  Created by 张子豪 on 2019/12/16.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit



public extension UITableViewCell{
    func MoreFuncX(isMyself:Bool,UIAlertActions:[UIAlertAction]? = nil,删除: (@escaping ()->())) {
        //需要判断是不是自己发的
        let DeleteAction = UIAlertAction(title: "删除", style: .destructive) { (_) in
            删除()
        }
        let CancelAction = UIAlertAction(title: "取消", style: .cancel) { (_) in}
        let ActionSheet = UIAlertController(title: "请选择您需要的操作", message: "", preferredStyle: .actionSheet)
        //这里判断是否是自己发的内容
        if isMyself {ActionSheet.addAction(DeleteAction)}
        ActionSheet.addAction(CancelAction)
        
        for i in UIAlertActions ?? [] {
            ActionSheet.addAction(i)
        }
                  
        
        self.FatherTVC?.present(ActionSheet, animated: true, completion: nil)
    }
}




//在VR照片中，好看的TableViewcell消失到显示动画
//XYZAnimation
public extension UITableViewCell{
    
    func XYZAnimation_AddRotationAnimation消失出现()  {
        var rotation = CATransform3DMakeTranslation(0, 50, 50)
        rotation = CATransform3DScale(rotation, 0.9, 0.9, 1)
        rotation.m34 = 1.0 / -600
        
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        self.alpha = 0
        self.layer.transform = rotation
        
        UIView.animate(withDuration: 0.5, animations: {
            self.layer.transform = CATransform3DIdentity  // 恢复
            self.alpha = 1
            self.layer.shadowOffset = CGSize(width: 0, height: 0)
        }) { (finished) in
            if finished{
                
            }
        }
    }
    
}
