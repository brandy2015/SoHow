//
//  BriefActionAlert.swift
//  TestFirst
//
//  Created by 张子豪 on 2018/2/8.
//  Copyright © 2018年 张子豪. All rights reserved.
//

import UIKit
public class AlertPresentObject: NSObject {
    
    public static var current = AlertPresentObject()
    
    public var alert = UIAlertController()
    public var vc : UITableViewController? = nil
    
    public func 正在导入Alert(completion: @escaping ()->Void)  {
        print("准备弹出")
        
        self.alert = UIAlertController(title: "正在导入", message: "请稍等", preferredStyle: .alert)
        
        self.alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: { (_) in
            self.alert.dismiss(animated: true, completion: nil)
        }))
        vc?.present(self.alert, animated: true, completion: {
            completion()
        })
        
        
    }
    
    public func 显示百分比(百分比:Float,completion: @escaping ()->Void)  {
        
        //        百分比需要保留两位小数
        
        self.alert = UIAlertController(title: "正在导入", message: "进度\(百分比)", preferredStyle: .alert)
        vc?.present(self.alert, animated: true, completion: {
            completion()
        })
    }
}






public func SoHowAlertSingleAction(title:String,message:String,actiontitle:String) -> UIAlertController {
    let alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: .alert)
    let action = UIAlertAction(title: actiontitle, style: .default,
                               handler: nil)
    alert.addAction(action)

    return alert
}

func 添加过渡动画(持续时间:Double = 0.5) -> CATransition {
    let transition = CATransition()
    transition.type = CATransitionType.fade
    transition.duration = CFTimeInterval(持续时间)
    transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeOut)
    return transition
//    view.layer.add(添加过渡动画(), forKey: nil)具体使用方法
}

public func 加载主文件夹中HTML文件到WebView(名称:String,加载到的WebView:UIWebView)  {
    if let url = Bundle.main.url(forResource: 名称, withExtension: "html"){
        
        if let htmlData = try? Data(contentsOf: url){
            
            let baseURL = URL(fileURLWithPath: Bundle.main.bundlePath)
            print("\n\nbaseURL")
            print(baseURL)
            
            加载到的WebView.load(htmlData, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
            
        }
        
    }
}

//为了要当前ViewController
func getCurrentVC()->UIViewController?{
    var result:UIViewController?
    var window = UIApplication.shared.keyWindow
    if window?.windowLevel != UIWindow.Level.normal{
        let windows = UIApplication.shared.windows
        for tmpWin in windows{
            if tmpWin.windowLevel == UIWindow.Level.normal{
                window = tmpWin
                break
            }
        }
    }
    
    let fromView = window?.subviews[0]
    if let nextRespnder = fromView?.next{
        
        if nextRespnder.isKind(of: UIViewController.self){
            result = nextRespnder as? UIViewController
        }else{
            result = window?.rootViewController
        }
    }
    return result
}


//具体使用
//SoHowAlert.showAlert(title: title, meg: message, btn1: "Awesome", handler1: { _ in
//    self.startNewRound()
//
//}, btn2: nil, handler2: nil)
class SoHowAlert {
    
    
    static func showAlert(title:String = "提示",meg:String,btn1:String,handler1:((UIAlertAction) -> Void)?,btn2:String?,handler2:((UIAlertAction) -> Void)?){
        guard let vc = getCurrentVC()else{ return }
        
     
//        DispatchQueue.main.async(execute: {
        
        
       
            let alertController = UIAlertController(title:title,
                                                    message:meg ,
                                                    preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: btn1, style: .cancel) { (action) in
                handler1?(action)
            }
        
        
            alertController.addAction(cancelAction)
            
            if btn2 != nil{
                let settingsAction = UIAlertAction(title: btn2, style: .default, handler: { (action) -> Void in
                    handler2?(action)
                })
                alertController.addAction(settingsAction)
            }
            vc.present(alertController, animated: true, completion: nil)
//        })
    }
    
    static func showAlert(title:String = "提示",meg:String,按钮名称:String = "确定"){
        showAlert(title: title, meg: meg, btn1: 按钮名称, handler1: nil, btn2: nil, handler2: nil)
//        (title:title,meg: meg, btn1: 按钮名称, btn2: nil, handler: nil)
    }
    
   
    
    
}

