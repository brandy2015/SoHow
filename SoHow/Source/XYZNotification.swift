//
//  XYZNotification.swift
//  WoZaiX
//
//  Created by 张子豪 on 2019/12/7.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit
import UserNotifications//推送需要框架

//APNs Token
public class XYZNotification: NSObject {

    public static func GetNotiRights() {
        print("LeanCloud注册通知")
        //处理通知
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            switch settings.authorizationStatus {
            case .authorized:
               DispatchQueue.main.async {
                   UIApplication.shared.registerForRemoteNotifications()
               }
            case .notDetermined:
               UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .alert, .sound]) { (granted, error) in
                   if granted {
                       DispatchQueue.main.async {
                           UIApplication.shared.registerForRemoteNotifications()
                       }
                   }
               }
            default:break
            }
        }
    }
}

