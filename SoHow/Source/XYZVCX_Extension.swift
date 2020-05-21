//
//  XYZVCX_Extension.swift
//  XYZManager
//
//  Created by 张子豪 on 2020/2/25.
//  Copyright © 2020 张子豪. All rights reserved.
//

import UIKit
//import XYZVCX

class XYZVCX_Extension: NSObject {

}
 
//文件重命名//需要国际化
public func RenameFileBTN(originalName:String,VC:UIViewController, BackString:@escaping ((String?) -> Void))  {
    let alert        = UIAlertController(title: "重命名", message: "输入新名字", preferredStyle: .alert)
    let cancelAction = UIAlertAction    (title: "不修改", style: .default )  { (_) in  BackString(nil)}
    let jiesuoAction = UIAlertAction    (title: "修改"              , style: .default ) { (action) in  BackString(alert.textFields?.first?.text ?? "未命名")}
    jiesuoAction.isEnabled = false
    
    alert.addTextField { (textField2:UITextField) -> Void in
        textField2.text         = originalName
        textField2.placeholder  = originalName
        NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification, object: textField2, queue: OperationQueue.main) { (notification) in
            jiesuoAction.isEnabled  = textField2.text != ""
        }
    }
    alert.addAction(cancelAction)
    alert.addAction(jiesuoAction)
    VC.present(alert, animated: true, completion: nil)
}

