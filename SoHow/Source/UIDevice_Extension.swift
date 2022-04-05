//
//  UIDevice_Extension.swift
//  SoHow
//
//  Created by 张子豪 on 2019/1/22.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit

public extension UIDevice {
//    返回设备类型
    var DeviceType: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        //iPhone
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
        case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
        case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
        case "iPhone10,3", "iPhone10,6":                return "iPhone X"
        case "iPhone11,8":                              return "iPhone XR"
        case "iPhone11,2":                              return "iPhone XS"
        case "iPhone11,6", "iPhone11,4":                return "iPhone XS Max"
        case "iPhone12,1":                              return "iPhone 11"
        case "iPhone12,3":                              return "iPhone 11 Pro"
        case "iPhone12,5":                              return "iPhone 11 Pro Max"
        case "iPhone12,8":                              return "iPhone SE2"
        case "iPhone13,1":                              return "iPhone 12 mini"
        case "iPhone13,2":                              return "iPhone 12"
        case "iPhone13,3":                              return "iPhone 12 Pro"
        case "iPhone13,4":                              return "iPhone 12 Pro Max"
        case "iPhone14,4":                              return "iPhone 13 mini"
        case "iPhone14,5":                              return "iiPhone 13"
        case "iPhone14,2":                              return "iPhone 13 Pro"
        case "iPhone14,3":                              return "iPhone 13 Pro Max"
            
            
            
            
            
        //iPad
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad6,11", "iPad6,12":                    return "iPad 5"
        case "iPad7,5", "iPad7,6":                      return "iPad 6"
        case "iPad7,11", "iPad7,12":                    return "iPad 7"
        case "iPad11,6","iPad11,7" :                    return "iPad 8"
        case "iPad12,1","iPad12,2" :                    return "iPad 9"
                 
        ///iPad Air
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3","iPad5,4" :                      return "iPad Air 2"
        case "iPad11,3","iPad11,4" :                    return "iPad Air 3"
        case "iPad13,1","iPad13,2" :                    return "iPad Air 4"
                
                
                
        ///iPad Mini
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1","iPad5,2" :                      return "iPad mini 4"
        case "iPad11,1","iPad11,2" :                    return "iPad mini 5"
        case "iPad14,1","iPad14,2" :                    return "iPad mini 6"
                
                
        ///iPad  pro
        case "iPad6,3","iPad6,4" :                      return "iPad Pro (9.7-inch)"
        case "iPad6,7","iPad6,8" :                      return "iPad Pro (12.9-inch)"
        case "iPad7,1","iPad7,2" :                      return "iPad Pro 2(12.9-inch)"
        case "iPad7,3","iPad7,4" :                      return "iPad Pro (10.5-inch)"
        case "iPad8,1","iPad8,2","iPad8,3","iPad8,4" :  return "iPad Pro (11-inch)"
        case "iPad8,5","iPad8,6","iPad8,7","iPad8,8" :  return "iPad Pro 3 (12.9-inch)"
        case "iPad8,9","iPad8,10" :                     return "iPad Pro 2 (11-inch)"
        case "iPad8,11","iPad8,12" :                    return "iPad Pro 4 (12.9-inch)"
        case "iPad13,4","iPad13,5","iPad13,6","iPad13,7"   : return "iPad Pro 4 (11-inch)"
        case "iPad13,8","iPad13,9","iPad13,10","iPad13,11" : return "iPad Pro 5 (12.9-inch)"
                      
                
                
                 
        //iPod touch
        case "iPod1,1":                                 return "iPod touch"
        case "iPod2,1":                                 return "iPod touch 2"
        case "iPod3,1":                                 return "iPod touch 3"
        case "iPod4,1":                                 return "iPod touch 4"
        case "iPod5,1":                                 return "iPod touch 5"
        case "iPod7,1":                                 return "iPod touch 6"
        case "iPod9,1":                                 return "iPod touch 7"
        //Apple Watch
        case "Watch1,1", "Watch1,2":                    return "Apple Watch 1"
        case "Watch2,6", "Watch2,7":                    return "Apple Watch Series 1"
        case "Watch2,3", "Watch2,4":                    return "Apple Watch Series 2"
        case "Watch3,1", "Watch3,2", "Watch3,3", "Watch3,4":return "Apple Watch Series 3"
        case "Watch4,1", "Watch4,2", "Watch4,3", "Watch4,4":return "Apple Watch Series 4"
        case "Watch5,1", "Watch5,2", "Watch5,3", "Watch5,4":return "Apple Watch Series 4"
        //HomePod
        case "AudioAccessory1,1", "AudioAccessory1,2":  return "HomePod"
        //Apple TV
        case "AppleTV1,1":                              return "Apple TV"
        case "AppleTV2,1":                              return "Apple TV 2"
        case "AppleTV3,1", "AppleTV3,2":                return "Apple TV 3"
        case "AppleTV5,3":                              return "Apple TV 4"
        case "AppleTV6,2":                              return "Apple TV 4K"
                
        ///iMac
        case "iMac21,1","iMac21,2" : return "iMac (24-inch, M1, 2021)"

        ///Mac mini
        case "Macmini9,1" : return "Mac mini (M1, 2020)"

        ///MacBook Air
        case "MacBookAir10,1" : return "MacBook Air (Late 2020)"

        ///MacBook Pro
        case "MacBookPro17,1" : return "MacBook Pro (13-inch, M1, 2020)"
        case "MacBookPro18,3","MacBookPro18,4" : return "MacBook Pro (14-inch, 2021)"
        case "MacBookPro18,1","MacBookPro18,2" : return "MacBook Pro (16-inch, 2021)"
                
                
        //AirPods
        case "AirPods1,1":                              return "AirPods"
        //Simulator
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return identifier
        }
        
    }
    
}


public extension UIDevice {
//    "设备类型"              modelName
//    获取设备名称             name
//    获取系统版本号           systemVersion
//    获取系统类型             systemName
//    获取设备唯一标识符  identifierForVendor?.uuidString
//    设备的大类型             model
//    获取App相关的信息
    static var infoDic: [String : Any]? {
        return Bundle.main.infoDictionary
    }
    //    获取App的版本号
    static var VersionNum:String{
        return (UIDevice.infoDic?["CFBundleShortVersionString"] as? String) ?? "未知"
    }
    //    Build号
    static var BuildVersionNum:String{
        return (UIDevice.infoDic?["CFBundleVersion"] as? String)  ?? "未知"
    }
    //    App名称
    static var appName:String{ //更新
        return (UIDevice.infoDic?["CFBundleDisplayName"] as? String)  ?? "未知"
    }
    // 获取设备名称
    static var deviceName:String{return UIDevice.current.name}
    // 获取系统版本号
    static var  deviceSystemVer:String{return  UIDevice.current.systemVersion}
    //        设备类型 // 获取设备的型号
    static var  deviceModel:String{return UIDevice.current.DeviceType}
    //    获取设备唯一标识符
    static var  deviceUUID:String{return   UIDevice.current.identifierForVendor?.uuidString ?? "未知"}
}


//
////获取设备名称
//let deviceName = UIDevice.current.name
//print("deviceName:\(deviceName)")
////获取系统名称
//let sysName = UIDevice.current.systemName
//print("sysName:\(sysName)")
////获取系统版本
//let sysVersion = UIDevice.current.systemVersion
//print("sysVersion:\(sysVersion)")
////获取设备唯一标识符
//let deviceUUID = UIDevice.current.identifierForVendor?.uuidString
//print("deviceUUID:\(deviceUUID!)")
////获取设备的型号
//let deviceModel = UIDevice.current.model
//print("deviceModel:\(deviceModel)")
////电池电量
////UIDevice.current.isBatteryMonitoringEnabled 方法必须使用
//UIDevice.current.isBatteryMonitoringEnabled = true
//let batteryLevel = UIDevice.current.batteryLevel
//print("batteryLevel:\(batteryLevel)")
////电池状态
//let batteryState = UIDevice.current.batteryState
//switch batteryState {
//case .unknown: print("未识别")
//case .charging: print("充电中")
//case .full: print("充满状态")
//case .unplugged: print("非充电状态")
//}
//UIDevice.current.isBatteryMonitoringEnabled = false
//
//let infoDictionary = Bundle.main.infoDictionary!
////app版本号
//if let appVersion = infoDictionary["CFBundleVersion"]{
//    print("appVersion:\(appVersion)")
//}
//
////app名称
//if let appName = infoDictionary["CFBundleDisplayName"]{
//    print("appName:\(appName)")
//}
//
////主程序版本号
//if let shortVersion = infoDictionary["CFBundleShortVersionString"]{
//    print("shortVersion:\(shortVersion)")
//}
