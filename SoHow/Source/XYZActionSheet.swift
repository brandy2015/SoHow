//
//  XYZActionSheet.swift
//  SoHow
//
//  Created by zhangzihao on 2022/4/4.
//  Copyright © 2022 张子豪. All rights reserved.
//

import UIKit

public extension UIViewController{
    func MoreFuncX(isMyself:Bool,UIAlertActions:[UIAlertAction]? = nil,删除: (@escaping ()->())) {
        //需要判断是不是自己发的
        let DeleteAction = UIAlertAction(title: "删除", style: .destructive) { (_) in 删除() }
        let CancelAction = UIAlertAction(title: "取消", style: .cancel)      { (_) in       }
        let ActionSheet  = UIAlertController(title: "请选择您需要的操作", message: "", preferredStyle: .actionSheet)
        UIAlertActions?.forEach({ i in ActionSheet.addAction(i) })
        //这里判断是否是自己发的内容
        if isMyself {ActionSheet.addAction(DeleteAction)}
        ActionSheet.addAction(CancelAction)
        self.present(ActionSheet, animated: true, completion: nil)
    }
}
