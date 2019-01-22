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
    public var DeviceType: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
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
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,7", "iPad6,8":                      return "iPad Pro 12.9inch"
        case "iPad6,3", "iPad6,4":                      return "iPad Pro 9.7inch"
        case "iPad6,11", "iPad6,12":                    return "iPad 5"
        case "iPad7,1", "iPad7,2":                      return "iPad Pro 12.9inch G2"
        case "iPad7,3", "iPad7,4":                      return "iPad Pro 10.5inch"
        case "iPad7,5", "iPad7,6":                      return "iPad 6"
        case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":return "iPad Pro 11inch"
        case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":return "iPad Pro 12.9inch G3"
        case "iPod1,1":                                 return "iPod touch"
        case "iPod2,1":                                 return "iPod touch 2"
        case "iPod3,1":                                 return "iPod touch 3"
        case "iPod4,1":                                 return "iPod touch 4"
        case "iPod5,1":                                 return "iPod touch 5"
        case "iPod7,1":                                 return "iPod touch 6"
        case "Watch1,1", "Watch1,2":                    return "Apple Watch 1"
        case "Watch2,6", "Watch2,7":                    return "Apple Watch Series 1"
        case "Watch2,3", "Watch2,4":                    return "Apple Watch Series 2"
        case "Watch3,1", "Watch3,2", "Watch3,3", "Watch3,4":return "Apple Watch Series 3"
        case "Watch4,1", "Watch4,2", "Watch4,3", "Watch4,4":return "Apple Watch Series 4"
        case "AudioAccessory1,1", "AudioAccessory1,2":  return "HomePod"
        case "AppleTV1,1":                              return "Apple TV"
        case "AppleTV2,1":                              return "Apple TV 2"
        case "AppleTV3,1", "AppleTV3,2":                return "Apple TV 3"
        case "AppleTV5,3":                              return "Apple TV 4"
        case "AppleTV6,2":                              return "Apple TV 4K"
        case "AirPods1,1":                              return "AirPods"
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
    public var infoDic: [String : Any]? {
        return Bundle.main.infoDictionary
    }
//    获取App的版本号
    public var VersionNum:String?{
        return infoDic?["CFBundleShortVersionString"] as? String
    }
//    Build号
    public var BuildVersionNum:String?{
        return infoDic?["CFBundleVersion"] as? String
    }
//    App名称
    public var appName:String?{
        return infoDic?["CFBundleDisplayName"] as? String
    }
    
}
