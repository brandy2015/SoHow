//
//  AppDelegate.swift
//  SoHow
//
//  Created by 张子豪 on 2018/10/17.
//  Copyright © 2018 张子豪. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        XYZ3DTouch.Add3DTouchDemo()
        
        
        return true
    }
    
    //处理3DTouch的回调...
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        
        print(shortcutItem.type,"点按了")
//        guard let tabBarVC = window?.rootViewController as? MainViewController else { return }
//
//        //根据type唯一标识进行判断跳转, 或者根据localizedTitle判断
//        switch shortcutItem.type {
//        case "homeAnchor":
//            tabBarVC.selectedIndex = 1
//        case "play":
//            let username = ShowRoomViewController()
//            username.hidesBottomBarWhenPushed = true
//            tabBarVC.selectedViewController?.childViewControllers.first?.present(username, animated: true, completion: nil)
//        case "username":
//            let username = NameViewController()
//            username.hidesBottomBarWhenPushed = true
//            tabBarVC.selectedViewController?.childViewControllers.last?.navigationController?.pushViewController(username, animated: true)
//        default:
//            tabBarVC.selectedIndex = 0
//        }
       
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}
//
//Swift - AppDelegate.swift类中默认方法的介绍
//2015-07-21发布：hangge阅读：3727
//项目创建后，AppDelegate类中默认带有如下几个方法，具体功能如下：
//
//1，应用程序第一次运行时执行
//这个方法只有在App第一次运行的时候被执行过一次，每次App从后台激活时都不会再执行该方法。
//（注：所有一般我们都在这里获取用户许可，比如本地消息推送的许可等）
//1
//2
//3
//4
//func application(application: UIApplication,
//                 didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
//    return true
//}
//
//2，应用程序挂起时执行
//当有电话进来或者锁屏时，应用程序便会挂起。
//1
//func applicationWillResignActive(application: UIApplication)
//
//3，应用程序进入后台时执行
//1
//func applicationDidEnterBackground(application: UIApplication)
//
//4，应用程序将要重新回到前台时执行
//1
//func applicationWillEnterForeground(application: UIApplication)
//
//5，应用程序重新进入活动状态时执行
//1
//func applicationDidBecomeActive(application: UIApplication)
//
//6，应用程序将要退出时执行
//这里通常是用来保存数据和做一些退出前的清理工作。可参考我的另一篇文章“Swift - 程序进入后台，以及应用终止时调用的方法”
//1
//func applicationWillTerminate(application: UIApplication)
//
//原文出自：www.hangge.com  转载请保留原文链接：http://www.hangge.com/blog/cache/detail_795.html
