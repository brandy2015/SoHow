//
//  XYZHUD.swift
//  VTLMaker
//
//  Created by 张子豪 on 2019/2/10.
//  Copyright © 2019 张子豪. All rights reserved.
//
//DispatchQueue.main.sync {
import UIKit
import MBProgressHUD

public var XYZHUD = XYZHUDObject()
public class XYZHUDObject: NSObject {
    public var popedView = MBProgressHUD()
    public func HUD窗口(LabelText:String,添加到的窗口:UIView,加载时间:Double = 3){
        popedView.hide(animated: true)
        popedView = MBProgressHUD.showAdded(to: 添加到的窗口, animated: true)
        popedView.label.text = LabelText
        popedView.hide(animated: true, afterDelay: 加载时间)
    }
    
    public func HudBadNetwork(title:String = "网络不好",on ViewX:UIView)  {
        HUD窗口(LabelText: title, 添加到的窗口: ViewX)
    }
    
    public func HudonLoading(title:String = "正在加载ing",on ViewX:UIView)  {
        HUD窗口(LabelText: title, 添加到的窗口: ViewX)
    }
    
    //和Hide一样
    public func dismiss() {
        popedView.hide(animated: true)
    }
}



//    Async.userInitiated {}.main {

//    }
//     @discardableResult


