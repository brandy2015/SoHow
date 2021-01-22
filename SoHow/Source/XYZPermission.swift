////
////  XYZPermission.swift
////  SoHow
////
////  Created by 张子豪 on 2020/8/17.
////  Copyright © 2020 张子豪. All rights reserved.
////
//
//import UIKit
//
//class XYZPermission: NSObject {
//
//}
//检测相机权限
//
//static func checkCamera() -> (Bool, AVAuthorizationStatus) {
//    let status = AVCaptureDevice.authorizationStatus(for: .video)
//    return (status == .authorized, status)
//}
//1
//2
//3
//4
//检测相册权限
//
//// (iOS 8, *)
//static func checkPhotoLibrary() -> (Bool, PHAuthorizationStatus) {
//    let status = PHPhotoLibrary.authorizationStatus()
//    return (status == .authorized, status)
//}
//// (iOS, introduced: 6.0, deprecated: 9.0, message: "Use PHAuthorizationStatus in the Photos framework instead")
//static func checkPhotoLibrary4oldVersion() -> (Bool, ALAuthorizationStatus) {
//    let status = ALAssetsLibrary.authorizationStatus()
//    let authorized = status == .authorized
//    return (authorized, status)
//}
//1
//2
//3
//4
//5
//6
//7
//8
//9
//10
//11
//获取相册权限
//
//static func openPhotoLibraryAlert() -> (Bool, PHAuthorizationStatus) {
//    let sema = DispatchSemaphore(value: 0)
//    var status: PHAuthorizationStatus = .notDetermined
//    PHPhotoLibrary.requestAuthorization { (authStatus) in
//        status = authStatus
//        sema.signal()
//    }
//    let _ = sema.wait(timeout: DispatchTime.distantFuture)
//    return (status == .authorized, status)
//}
//1
//2
//3
//4
//5
//6
//7
//8
//9
//10
//检测定位权限
//
//static func checkLocation() -> (Bool, CLAuthorizationStatus) {
//    let status = CLLocationManager.authorizationStatus()
//    return (status == .authorizedAlways || status == .authorizedWhenInUse, status)
//}
//1
//2
//3
//4
//检测通知权限
//
//static func checkNotification() -> (Bool, Any?) {
//    if #available(iOS 10.0, *) {
//        let sema = DispatchSemaphore(value: 0)
//        var status: UNAuthorizationStatus = .notDetermined
//        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
//            status = settings.authorizationStatus
//            sema.signal()
//        }
//        let _ = sema.wait(timeout: DispatchTime.distantFuture)
//        return (status == .authorized, status)
//    } else {
//        let settings = UIApplication.shared.currentUserNotificationSettings
//        let types = settings?.types
//        let isEnabled = types == [.alert, .badge, .sound]
//        return (isEnabled, types)
//    }
//}
//1
//2
//3
//4
//5
//6
//7
//8
//9
//10
//11
//12
//13
//14
//15
//16
//17
//ViewModel：SystemPermissionViewModel.swift
//App需要用到的权限枚举
//
//enum PermissionType: Int {
//    case PhotoLibrary
//    case Camera
//    case Location
//    case Notification
//    case Audio
//    case Others
//}
//1
//2
//3
//4
//5
//6
//7
//8
//实体
//
//struct PermissionModel {
//    var name: String?
//    var status: Any?
//    var authorized: Bool = false
//    var permissionType: PermissionType = .Others
//    init(_ name: String?, permissionType: PermissionType) {
//        self.name = name
//        self.permissionType = permissionType
//    }
//}
//1
//2
//3
//4
//5
//6
//7
//8
//9
//10
//数据初始化
//
//var permissionArray: [PermissionModel] = []
//override func setup() {
//    super.setup()
//    let permissionNameArray = ["相册","相机","地理位置","通知", "麦克风", "其他"]
//    let permissionTypeArray: [PermissionType] = [.PhotoLibrary, .Camera, .Location, .Notification, .Audio, .Others]
//    permissionArray = []
//    for (i, name) in permissionNameArray.enumerated() {
//        let model = PermissionModel(name, permissionType: permissionTypeArray[i])
//        permissionArray.append(model)
//    }
//    // Check permission
//    checkPermission()
//    // Reload tableView
//    updateDataArray(permissionArray)
//}
//1
//2
//3
//4
//5
//6
//7
//8
//9
//10
//11
//12
//13
//14
//15
//检测是否开启各权限
//
//private func checkPermission() {
//    let (authorized4photoLibrary, status4photoLibrary) = SystemPermissionMonitor.checkPhotoLibrary()
//    filterPermissionArray(authorized4photoLibrary, status: status4photoLibrary, permissionType: .PhotoLibrary)
//
//    let (authorized4camera, status4camera) = SystemPermissionMonitor.checkCamera()
//    filterPermissionArray(authorized4camera, status: status4camera, permissionType: .Camera)
//
//    let (authorized4location, status4location) = SystemPermissionMonitor.checkLocation()
//    filterPermissionArray(authorized4location, status: status4location, permissionType: .Location)
//
//    let (authorized4notification, status4notification) = SystemPermissionMonitor.checkNotification()
//    filterPermissionArray(authorized4notification, status: status4notification, permissionType: .Notification)
//
//    let (authorized4audio, status4audio) = SystemPermissionMonitor.checkAudio()
//    filterPermissionArray(authorized4audio, status: status4audio, permissionType: .Audio)
//}
//1
//2
//3
//4
//5
//6
//7
//8
//9
//10
//11
//12
//13
//14
//15
//16
//过滤不需要显示的权限&更新权限实体状态
//
//private func filterPermissionArray(_ authorized: Bool, status: Any?, permissionType: PermissionType) {
//    for (i, model) in permissionArray.enumerated() {
//        if model.permissionType != permissionType { continue }
//
//        if isNotDetermined(status, permissionType: permissionType) {
//            // Remove permissions that user has not yet made a choice with regards to this application
//            permissionArray.remove(at: i)
//        } else {
//            // Update the value of the property
//            permissionArray[i].authorized = authorized
//            permissionArray[i].status = status
//        }
//        break
//    }
//}
//1
//2
//3
//4
//5
//6
//7
//8
//9
//10
//11
//12
//13
//14
//15
//判断用户是否尚未对此应用程序的权限作出选择(.notDetermined)
//
///// Whether user has not yet made a choice with regards to this application
//private func isNotDetermined(_ status: Any?, permissionType: PermissionType) -> Bool {
//    switch permissionType {
//    case .PhotoLibrary:
//        let status: PHAuthorizationStatus? = status as? PHAuthorizationStatus
//        return status == .notDetermined
//    case .Camera, .Audio:
//        let status: AVAuthorizationStatus? = status as? AVAuthorizationStatus
//        return status == .notDetermined
//    case .Location:
//        let status: CLAuthorizationStatus? = status as? CLAuthorizationStatus
//        if #available(iOS 13, *) {
//            // “Allow once”, your app will be notified that the CLAuthorizationStatus changed to authorizedWhenInUse. Just like you’re used to in older iOS version when you get a permanent permission. It is now allowed for your app to start requesting locations, no code changes necessary.
//            // Users can jump out and back into your app, and you will still have location permission. It’s only after a (longer) period of inactivity that iOS will revoke the permission and turn the CLAuthorizationStatus back to notDetermined
//            // Return false, adapting to the new 'allow just once' location permission in iOS 13
//            return false
//        }
//        return status == .notDetermined
//    case .Notification:
//        if #available(iOS 10.0, *) {
//            let status: UNAuthorizationStatus? = status as? UNAuthorizationStatus
//            return status == .notDetermined
//        }
//        break
//    default:
//        break
//}
