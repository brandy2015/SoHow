
//
//  XYZAlert.swift
//  SoHow
//
//  Created by 张子豪 on 2019/3/13.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit

class XYZAlert: NSObject {

}

public var XYZAlertX = AlertPresentObject()
public class AlertPresentObject: NSObject {
    
    public static var current = AlertPresentObject()
    public var alert = UIAlertController()
    public func dismiss(){ alert.dismiss(animated: true, completion: nil)}
    public func 正在导入Alert(VC:UIViewController,completion: @escaping ()->Void)  {
        self.alert.dismiss(animated: true, completion: nil);print("准备弹出")
        self.alert = UIAlertController(title: "正在导入", message: "请稍等", preferredStyle: .alert)
        self.alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: { (_) in
            self.alert.dismiss(animated: true, completion: nil)
        }))
        VC.present(self.alert, animated: true, completion: {completion()})
    }
    //        百分比需要保留两位小数//让alert消失
    public func 导入第几个文件(VC:UIViewController,第N个文件:String,completion: @escaping ()->Void)  {
        self.alert.dismiss(animated: true, completion: nil)
        self.alert = UIAlertController(title: "正在导入", message: 第N个文件, preferredStyle: .alert)
        VC.present(self.alert, animated: true) { completion()}
    }
}

public func SoHowAlertSingleAction(title:String,message:String,actiontitle:String) -> UIAlertController {
    let alert = UIAlertController(title: title,message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: actiontitle, style: .default,handler: nil)
    alert.addAction(action)
    return alert
}
//    view.layer.add(添加过渡动画(), forKey: nil)具体使用方法
public func 添加过渡动画(持续时间:Double = 0.5) -> CATransition {
    let transition = CATransition()
    transition.type = CATransitionType.fade
    transition.duration = CFTimeInterval(持续时间)
    transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeOut)
    return transition
}


//为了要当前ViewController
//public func getCurrentVC()->UIViewController?{
//    var result:UIViewController?
//    var window = UIApplication.shared.keyWindow
//    if window?.windowLevel != UIWindow.Level.normal{
//        let windows = UIApplication.shared.windows
//        for tmpWin in windows{
//            if tmpWin.windowLevel == UIWindow.Level.normal{
//                window = tmpWin
//                break
//            }
//        }
//    }
//
//    let fromView = window?.subviews[0]
//    if let nextRespnder = fromView?.next{
//
//        if nextRespnder.isKind(of: UIViewController.self){
//            result = nextRespnder as? UIViewController
//        }else{
//            result = window?.rootViewController
//        }
//    }
//    return result
//}


//具体使用
//SoHowAlert.showAlert(title: title, meg: message, btn1: "Awesome", handler1: { _ in
//    self.startNewRound()
//
//}, btn2: nil, handler2: nil)
//public class SoHowAlert {
//    static func showAlert(title:String = "提示",meg:String,btn1:String,handler1:((UIAlertAction) -> Void)?,btn2:String?,handler2:((UIAlertAction) -> Void)?){
//        guard let vc = getCurrentVC()else{ return }
//        let alertController = UIAlertController(title:title,message:meg ,preferredStyle: .alert)
//        let cancelAction = UIAlertAction(title: btn1, style: .cancel) { (action) in
//            handler1?(action)
//        }
//        alertController.addAction(cancelAction)
//        if btn2 != nil{
//            let settingsAction = UIAlertAction(title: btn2, style: .default, handler: { (action) -> Void in
//                handler2?(action)
//            })
//            alertController.addAction(settingsAction)
//        }
//        vc.present(alertController, animated: true, completion: nil)
//    }
//    
//    static func showAlert(title:String = "提示",meg:String,按钮名称:String = "确定"){
//        showAlert(title: title, meg: meg, btn1: 按钮名称, handler1: nil, btn2: nil, handler2: nil)
//    }
//}

import UIKit

public func userInputAlert(VC:UIViewController,title: String, isSecure: Bool = false, text: String? = nil, callback: @escaping (String) -> Void) {
    let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
    alert.addTextField(configurationHandler: { field in
        field.isSecureTextEntry = isSecure
        field.text = text
    })

    alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
        guard let text = alert.textFields?.first?.text, !text.isEmpty else {
            userInputAlert(VC:VC ,title: title, callback: callback);return} ;callback(text)
    })

    //    let root = UIApplication.shared.keyWindow?.rootViewController
    VC.present(alert, animated: true, completion: nil)
}

//public extension UIViewController {
//    func showExceededMaximumAlert(vc: UIViewController) {
//        let alert = UIAlertController(title: "", message: "Exceed Maximum Number Of Selection", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//        vc.present(alert, animated: true, completion: nil)
//    }
//}
//XYZQRCode中需要
public extension UIViewController{
    func showMsg(title:String?,message:String?){
        let alertController = UIAlertController(title: title, message:message, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title:  "知道了", style: UIAlertAction.Style.default) { (alertAction) -> Void in }
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}

//func userInputAlert(_ title: String, isSecure: Bool = false, callback: @escaping (String)->Void) {
//    let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
//    alert.addTextField(configurationHandler: {field in
//        field.isSecureTextEntry = isSecure
//    })
//
//    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
//        guard let text = alert.textFields?.first?.text, !text.isEmpty else {
//            userInputAlert(title, callback: callback)
//            return
//        }
//
//        callback(text)
//    }))
//
//    let root = UIApplication.shared.keyWindow?.rootViewController
//    root?.present(alert, animated: true, completion: nil)
//}
