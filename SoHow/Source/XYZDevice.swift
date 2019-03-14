//
//  XYZDevice.swift
//  SoHow
//
//  Created by 张子豪 on 2019/3/13.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit

class XYZDevice: NSObject {

}
//override func viewDidLoad() {
//    super.viewDidLoad()
//    
//    //感知设备方向 - 开启监听设备方向
//    UIDevice.currentDevice().beginGeneratingDeviceOrientationNotifications()
//    //添加通知，监听设备方向改变
//    NSNotificationCenter.defaultCenter().addObserver(self, selector: "receivedRotation",
//                                                     name: UIDeviceOrientationDidChangeNotification, object: nil)
//    
//    //关闭设备监听
//    //UIDevice.currentDevice().endGeneratingDeviceOrientationNotifications()
//}
//
////通知监听触发的方法
//func receivedRotation(){
//    var device = UIDevice.currentDevice()
//    switch device.orientation{
//    case .Portrait:
//        orientationLabel.text = "面向设备保持垂直，Home键位于下部"
//    case .PortraitUpsideDown:
//        orientationLabel.text = "面向设备保持垂直，Home键位于上部"
//    case .LandscapeLeft:
//        orientationLabel.text = "面向设备保持水平，Home键位于左侧"
//    case .LandscapeRight:
//        orientationLabel.text = "面向设备保持水平，Home键位于右侧"
//    case .FaceUp:
//        orientationLabel.text = "设备平放，Home键朝上"
//    case .FaceDown:
//        orientationLabel.text = "设备平放，Home键朝下"
//    case .Unknown:
//        orientationLabel.text = "方向未知"
//    default:
//        orientationLabel.text = "方向未知"
//    }
//}
//}
