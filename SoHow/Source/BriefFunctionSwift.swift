//
//  BriefFunctionSwift.swift
//  SoHow
//
//  Created by 张子豪 on 2017/12/12.
//  Copyright © 2017年 张子豪. All rights reserved.
//

import UIKit
import AVFoundation
import MobileCoreServices            //picker.mediaTypes的类型
import PhotosUI                      //LivePhoto使用的依赖库

//public var url = URL(fileURLWithPath: "")
// MARK://读取当前登录用户的方法 func 当前登录用户() -> String


var  url :URL! = nil







public func 读取好友列表() -> [String] {
    let _FriendsList = UserDefaults.standard.array(forKey: "FriendsList") as? [String]
    return _FriendsList ?? [""]
}


public func j计算时间差剩余保护时间(时间保护的时间:Date) -> String  {
    //获取现在的时间
    let date1 = Date()
    let interval:TimeInterval = 时间保护的时间.timeIntervalSince(date1)
    return "\(interval)"
}


public func j计算时间差和返回是否受时间保护(时间保护的时间:Date) -> Bool  {
    
    var 是否受保护 = true
    //获取现在的时间
    let date1 = Date()
    let interval:TimeInterval = 时间保护的时间.timeIntervalSince(date1)
    if (interval as Double) <= 0{是否受保护 = false}
    return 是否受保护
}


