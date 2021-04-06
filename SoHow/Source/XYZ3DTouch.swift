//
//  XYZ3DTouch.swift
//  SoHow
//
//  Created by 张子豪 on 2019/6/13.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit



//XYZ3DTouch.Add3DTouchDemo()
public class XYZ3DTouch: NSObject {
    
    //    添加进#didFinishLaunchingWithOptions
    public static func Add3DTouchDemo()  {
        //3D Touch
        let homeIcon = UIApplicationShortcutIcon(type: .compose)
        let homeItem = UIApplicationShortcutItem(type: "homeAnchor", localizedTitle: "小胡同学", localizedSubtitle: "是不是要这个", icon: homeIcon, userInfo: nil)
        let playIcon = UIApplicationShortcutIcon(type: .play)
        let playItem = UIApplicationShortcutItem(type: "play", localizedTitle: "播放", localizedSubtitle: "", icon: playIcon, userInfo: nil)
        let userIcon = UIApplicationShortcutIcon(type: .search)
        let userItem = UIApplicationShortcutItem(type: "username", localizedTitle: "用户名", localizedSubtitle: "", icon: userIcon, userInfo: nil)
        
        UIApplication.shared.shortcutItems = [homeItem, playItem, userItem]
        
    }
    
    
//    public static func AddDeleteAllRealmAndCaches()  {
//        //3D Touch
//
//        let SettingIcon = UIApplicationShortcutIcon(templateImageName: "Setting3DTouch")//UIApplicationShortcutIcon(type: .compose)
//        let SettingItem = UIApplicationShortcutItem(type: "SettingAnchor", localizedTitle: "急速救援".localized(), localizedSubtitle: "修复闪退清除索引文件".localized(), icon: SettingIcon, userInfo: nil)
//
//
//        let DeleteSnapshotIcon = UIApplicationShortcutIcon(templateImageName: "DeleteSnapshot3DTouch")
//        let DeleteSnapshotItem = UIApplicationShortcutItem(type: "DeleteSnapshot", localizedTitle: "清除软件Snapshot".localized(), localizedSubtitle: "清理软件悬停时的快照".localized(), icon: DeleteSnapshotIcon, userInfo: nil)
//        //        let userIcon = UIApplicationShortcutIcon(type: .search)
//        //        let userItem = UIApplicationShortcutItem(type: "username", localizedTitle: "清除提醒事项的闹钟", localizedSubtitle: "清除全部提醒事项的闹钟不再提醒", icon: userIcon, userInfo: nil)
//
//        UIApplication.shared.shortcutItems = [SettingItem,DeleteSnapshotItem]//, playItem, userItem]
//
//    }
}

public extension XYZ3DTouch{
    
//    public
    static func AddDeleteAllRealmAndCaches()  {
        //3D Touch

        let SettingIcon = UIApplicationShortcutIcon(templateImageName: "Setting3DTouch")//UIApplicationShortcutIcon(type: .compose)
        let SettingItem = UIApplicationShortcutItem(type: "SettingAnchor", localizedTitle: "急速救援", localizedSubtitle: "修复闪退清除索引文件", icon: SettingIcon, userInfo: nil)


        let DeleteSnapshotIcon = UIApplicationShortcutIcon(templateImageName: "DeleteSnapshot3DTouch")
        let DeleteSnapshotItem = UIApplicationShortcutItem(type: "DeleteSnapshot", localizedTitle: "清除软件Snapshot", localizedSubtitle: "清理软件悬停时的快照", icon: DeleteSnapshotIcon, userInfo: nil)
        //        let userIcon = UIApplicationShortcutIcon(type: .search)
        //        let userItem = UIApplicationShortcutItem(type: "username", localizedTitle: "清除提醒事项的闹钟", localizedSubtitle: "清除全部提醒事项的闹钟不再提醒", icon: userIcon, userInfo: nil)

        UIApplication.shared.shortcutItems = [SettingItem,DeleteSnapshotItem]//, playItem, userItem]

    }

    
}


//Swift开发之3DTouch实用

//用户现在可以按主屏幕图标立即访问应用程序提供的功能。
//在您的应用程序中，用户现在可以按视图来查看其他内容的预览，并获得对功能的加速访问
//在日常开发中,我们经常需要使用3D Touch中的两个功能
//在主屏幕上对应用图标使用3DTouch操作
//在应用程序内对某一控件使用3DTouch操作
//功能需要iOS9以上系统和iphone6s/iphone6s Plus及以上机型(模拟机现在也是可以的)

//Peek and Pop
//
//对界面内某一控件的3DTouch操作
//Peek和Pop是应用内的一种全新交互模式,当用户不断增加力量在控件上按压,会依次进入四个阶段
//轻按控件,除触发Peek的控件外,其他区域全部虚化
//继续用力Peek被触发,展示Pop界面快照
//向上滑动展示快捷选项
//继续用力跳转进入Pop界面


//1. 静态设置
//
//在info.plist中添加UIApplicationShortcutItems关键字,以如下方式配置即可
//
//
//其中各个关键字释义如下:
//- UIApplicationShortcutItemType: 快捷可选项的特定字符串(必填)
//- UIApplicationShortcutItemTitle: 快捷可选项的标题(必填)
//- UIApplicationShortcutItemSubtitle: 快捷可选项的子标题(可选)
//- UIApplicationShortcutItemIconType: 快捷可选项的图标(可选)
//- UIApplicationShortcutItemIconFile: 快捷可选项的自定义图标(可选)
//- UIApplicationShortcutItemUserInfo: 快捷可选项的附加信息(可选)
//---------------------



//2. 动态添加UIApplicationShortcutItem
//
//2-1. UIApplicationShortcutItem初始化方法
//UIApplicationShortcutItem(type: String, localizedTitle: String, localizedSubtitle: String?, icon: UIApplicationShortcutIcon?, userInfo: [AnyHashable : Any]?)

//参数介绍
//type: 快捷可选项的特定字符串(必填)
//localizedTitle: 快捷可选项的标题(必填)
//localizedSubtitle: 快捷可选项的子标题(可选)
//icon: 快捷可选项的图标(可选)
//userInfo: 快捷可选项的附加信息(可选)
//2-1. 图标
//
//2-1-1. 初始化方式
//
////方式一: 自定义图标
////注: 自定义图标需要使用镂空图标,同时建议1倍图标大小为35*35
//UIApplicationShortcutIcon(templateImageName: String)
//
////方式二: 使用系统图标
//UIApplicationShortcutIcon(type: UIApplicationShortcutIconType)
//2-3. 具体实现代码如下

//XYZ3DTouch.Add3DTouchDemo()


//2-4. item点击跳转
//
//可根据type标识判断
//可根据localizedTitle标识判断
////菜单跳转
//func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
//    guard let tabBarVC = window?.rootViewController as? MainViewController else { return }
//
//    //根据type唯一标识进行判断跳转, 或者根据localizedTitle判断
//    switch shortcutItem.type {
//    case "homeAnchor":
//        tabBarVC.selectedIndex = 1
//    case "play":
//        let username = ShowRoomViewController()
//        username.hidesBottomBarWhenPushed = true
//        tabBarVC.selectedViewController?.childViewControllers.first?.present(username, animated: true, completion: nil)
//    case "username":
//        let username = NameViewController()
//        username.hidesBottomBarWhenPushed = true
//        tabBarVC.selectedViewController?.childViewControllers.last?.navigationController?.pushViewController(username, animated: true)
//    default:
//        tabBarVC.selectedIndex = 0
//    }
//}






//三. Peek and Pop
//
//Peek和Pop是应用内的一种全新交互模式,当用户不断增加力量在控件上按压,会依次进入四个阶段
//这里小编将通过ViewController里面的UITableViewCell进行延时功能



//1. 判断是否支持3D Touch功能
//func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
//    let model = happyVM.anchorGroups[indexPath.section].anchors[indexPath.row]
//    if cell == nil {
//        cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
//        cell?.textLabel?.text = model.room_name
//        cell?.accessoryType = .disclosureIndicator
//    }
//
//    ---
//    //这里是添加判断是否支持3D Touch的代码
//    if #available(iOS 9.0, *) {
//        if traitCollection.forceTouchCapability == .available {
//            //支持3D Touch
//            //注册Peek & Pop功能
//            registerForPreviewing(with: self, sourceView: cell!)
//        }
//    }
//    ---
//
//    return cell!
//}


//2. 给对应view注册3Dtouch事件
//
//在判断支持3Dtouch里面注册
////注册Peek & Pop功能
//self.registerForPreviewing(with: self, sourceView: cell!)


//3. 遵守UIViewControllerPreviewingDelegate协议
//
//需要实现Peek & Pop交互的控件所在的控制器遵循协议并实现两个代理方法
//3-1. 当进入Peek状态时,系统会回调如下方法

//func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
//    //1. 获取按压的cell所在的行
//    guard let cell = previewingContext.sourceView as? UITableViewCell else { return UIViewController() }
//    let indexPath = tableVIew.indexPath(for: cell) ?? IndexPath(row: 0, section: 0)
//
//    //2. 设定预览界面
//    let vc = ShowRoomViewController()
//    // 预览区域大小(可不设置), 0为默认尺寸
//    vc.preferredContentSize = CGSize(width: 0, height: 0)
//    vc.showStr =  "我是第\(indexPath.row)行用力按压进来的"
//
//    //调整不被虚化的范围，按压的那个cell不被虚化（轻轻按压时周边会被虚化，再少用力展示预览，再加力跳页至设定界面）
//    let rect = CGRect(x: 0, y: 0, width: kScreenWidth, height: 44)
//    //设置触发操作的视图的不被虚化的区域
//    previewingContext.sourceRect = rect
//
//    //返回预览界面
//    return vc
//}


//3-2. 当进入Pop状态时,系统会回调如下方法
//
//用力按压进入viewControllerToCommit
//func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
//    viewControllerToCommit.hidesBottomBarWhenPushed = true
//    show(viewControllerToCommit, sender: self)
//}
//---------------------




//3-4. 当弹出预览时，上滑预览视图，出现预览视图中快捷选项
//
//var previewActionItems: [UIPreviewActionItem] { get }
//

//previewActionItems用户在3D Touch预览上向上滑动时显示的快速操作
//在将要弹出的页面内重写previewActionItems的get属性

//extension ShowRoomViewController {
//    //重写previewActionItems的get方法
//    override var previewActionItems: [UIPreviewActionItem] {
//        let action1 = UIPreviewAction(title: "跳转", style: .default) { (action, previewViewController) in
//            let showVC = ShowRoomViewController()
//            showVC.hidesBottomBarWhenPushed = true
//            previewViewController.navigationController?.pushViewController(showVC, animated: true)
//        }
//
//        let action3 = UIPreviewAction(title: "取消", style: .destructive) { (action, previewViewController) in
//            print("我是取消按钮")
//        }
//
//        ////该按钮可以是一个组，点击该组时，跳到组里面的按钮。
//        let subAction1 = UIPreviewAction(title: "测试1", style: .selected) { (action, previewViewController) in
//            print("我是测试按钮1")
//        }
//        let subAction2 = UIPreviewAction(title: "测试2", style: .selected) { (action, previewViewController) in
//            print("我是测试按钮2")
//        }
//        let subAction3 = UIPreviewAction(title: "测试3", style: .selected) { (action, previewViewController) in
//            print("我是测试按钮3")
//        }
//        let groupAction = UIPreviewActionGroup(title: "更多", style: .default, actions: [subAction1, subAction2, subAction3])
//
//        return [action1, action3, groupAction]
//    }
//}





//3-5. force 和 maximumPossibleForce
//
//到此，3DTouch在APP中的集成就先介绍这些，3DTouch中还有个重要的属性–压力属性（force 和 maximumPossibleForce）这里简单介绍下
//手指在屏幕上慢慢增加力度在减少力度，可以看到view背景色的变化
//程序运行后找到我的 -> 头像(用户名)查看效果
//代码找到NameViewController.swift查看
//    ---------------------

//override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//    let touch = touches.first ?? UITouch()
//    //获取重按力度
//    print("平均触摸的力--\(touch.force)")
//    print("触摸的最大可能力--\(touch.maximumPossibleForce)")
//
//    let change = touch.force / touch.maximumPossibleForce
//    view.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: change, alpha: 1)
//}
//---------------------


//var tapCount: Int
////手指触摸此次触摸的次数。
//
//var timestamp: TimeInterval
////触摸发生的时间或最后一次突变的时间。
//
//var type: UITouchType
////触摸的类型。
//
//enum UITouchType
////接收的触摸类型。
//
//var phase: UITouchPhase
////触摸的阶段。
//
//enum UITouchPhase
////手指触摸的阶段。
//
//var maximumPossibleForce: CGFloat
////触摸的最大可能力。
//
//var force: CGFloat
////触摸力，其中值表示平均触摸的力（由系统预定，不是用户特定的）。1.0
//
//var altitudeAngle: CGFloat
////手写笔的高度（弧度）。
//
//func azimuthAngle(in: UIView?)
////返回触控笔的方位角（弧度）。
//
//func azimuthUnitVector(in: UIView?)
////返回指向触控笔方位角方向的单位向量。
//---------------------
