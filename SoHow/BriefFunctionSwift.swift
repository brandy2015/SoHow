//
//  BriefFunctionSwift.swift
//  SoHow
//
//  Created by 张子豪 on 2017/12/12.
//  Copyright © 2017年 张子豪. All rights reserved.
//

import UIKit
import AVFoundation



public var url = URL(fileURLWithPath: "")
// MARK://读取当前登录用户的方法 func 当前登录用户() -> String
public func 颜色(red:CGFloat,green:CGFloat,blue:CGFloat,alpha:CGFloat = 1.0) -> UIColor {
    return UIColor(red:red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
}



public func 时间格式的调整(date:Date,format:String = "yyyy年MM月dd日 HH:mm:ss") -> String  {
    // 创建一个日期格式器
    let dformatter = DateFormatter()
    // 为日期格式器设置格式字符串
    dformatter.dateFormat = format
    // 使用日期格式器格式化日期、时间
    let datestr = dformatter.string(from: date)
    let message =  "\(datestr)"
    return message
}

//添加一个+=的方法让两个词典可以融合
public func += <KeyType, ValueType> ( left: inout Dictionary<KeyType, ValueType>, right: Dictionary<KeyType, ValueType>) {
    for (k, v) in right {
        left.updateValue(v, forKey: k)
    }
}

public func 时间格式的调整2只剩年月日时间创建录音(date:Date) -> String  {
    // 创建一个日期格式器
    let dformatter = DateFormatter()
    // 为日期格式器设置格式字符串
    dformatter.dateFormat = "yyyyMMddHHmmss"
    // 使用日期格式器格式化日期、时间
    let datestr = dformatter.string(from: date)
    let message =  "\(datestr)"
    return message
}

public func 返回设备类型() -> String{
    
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
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
            
        case "iPhone9,1":                               return "iPhone 7 (CDMA)"
        case "iPhone9,3":                               return "iPhone 7 (GSM)"
        case "iPhone9,2":                               return "iPhone 7 Plus (CDMA)"
        case "iPhone9,4":                               return "iPhone 7 Plus (GSM)"
        case "iPhone10,1","iPhone10,4":                 return "iPhone 8"
        case "iPhone10,2","iPhone10,5":                 return "iPhone 8 Plus"
        case "iPhone10,3","iPhone10,6":                 return "iPhone X"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
            
        case  "iPad6,3", "iPad6,4":                      return "iPad Pro 1(9.7)"
        case "iPad6,7", "iPad6,8":                      return "iPad Pro 1(12.9)"
            
        case "iPad7,1", "iPad7,2":                      return "iPad Pro 2(12.9)"
        case "iPad7,3", "iPad7,4":                      return "iPad Pro 2(10.5)"
            
            
        case "AppleTV5,3":                              return "Apple TV"
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return identifier
        }
    }
    return modelName
}





public extension UIDevice {
    public var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
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
            
        case "iPhone9,1":                               return "iPhone 7 (CDMA)"
        case "iPhone9,3":                               return "iPhone 7 (GSM)"
        case "iPhone9,2":                               return "iPhone 7 Plus (CDMA)"
        case "iPhone9,4":                               return "iPhone 7 Plus (GSM)"
        case "iPhone10,1","iPhone10,4":                 return "iPhone 8"
        case "iPhone10,2","iPhone10,5":                 return "iPhone 8 Plus"
        case "iPhone10,3","iPhone10,6":                 return "iPhone X"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
            
        case  "iPad6,3", "iPad6,4":                      return "iPad Pro 1(9.7)"
        case "iPad6,7", "iPad6,8":                      return "iPad Pro 1(12.9)"
            
        case "iPad7,1", "iPad7,2":                      return "iPad Pro 2(12.9)"
        case "iPad7,3", "iPad7,4":                      return "iPad Pro 2(10.5)"
            
            
        case "AppleTV5,3":                              return "Apple TV"
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return identifier
        }
    }
    
}

public func 返回设备信息() -> (设备类型:String,设备名称:String,系统版本号:String,设备唯一标识符:String,设备的大类型:String,App的版本号:String,App的build版本:String,App的build版本:String,appName:[String]){
    
    var 返回数组:[String] = []
    let UIDeviceCurrent = UIDevice.current
    
    //获取设备名称
    let modelName = "设备类型" + ":  " + UIDeviceCurrent.modelName
    //获取设备名称
    let deviceName = "设备名称" + ":  " + UIDeviceCurrent.name
    //获取系统版本号
    let sysVersion = "系统版本号" + ":  " + UIDeviceCurrent.systemVersion
    //获取设备唯一标识符
    let deviceUUID = "设备唯一标识符" + ":  " + (UIDeviceCurrent.identifierForVendor?.uuidString)!
    //获取设备的型号
    let deviceModel = "设备的大类型" + ":  " + UIDeviceCurrent.model
    //获取App相关的信息
    let infoDic = Bundle.main.infoDictionary
    // 获取App的版本号
    let appVersion = "App的版本号" + ":  " + (infoDic?["CFBundleShortVersionString"] as! String) + "beta"
    // 获取App的build版本
    let appBuildVersion = "App的build版本" + ":  " +  (infoDic?["CFBundleVersion"] as! String)
    // 获取App的名称
    let appName = "App的名称" + ":  " + ((infoDic?["CFBundleDisplayName"] as? String) ?? "")
    
    
    返回数组.append(modelName)
    返回数组.append(deviceName)
    返回数组.append(sysVersion)
    返回数组.append(deviceUUID)
    返回数组.append(deviceModel)
    返回数组.append(appVersion)
    返回数组.append(appBuildVersion)
    返回数组.append(appName)
    
    
    return  (modelName,deviceName,sysVersion,deviceUUID,deviceModel,appVersion,appBuildVersion,appName,返回数组)
    
}


//MARK: - 压缩图片大小
public func y压缩imageCompress(originalImage: UIImage,压缩比:CGFloat = 0.5) -> UIImage{
    guard let imageData = UIImageJPEGRepresentation(originalImage, 压缩比) else{
        return originalImage
    }
    let compressImage = UIImage(data: imageData)!
    return compressImage
}

public func share分享功能(文件地址:URL,测试:Bool = false,显示的框:UIView) -> UIActivityViewController?{
    let fileURL = 文件地址
    let activityController = UIActivityViewController(activityItems: [fileURL], applicationActivities: nil)
    let excludedActivities = [UIActivityType.postToFlickr, UIActivityType.postToWeibo, UIActivityType.message, UIActivityType.mail, UIActivityType.print, UIActivityType.copyToPasteboard, UIActivityType.assignToContact, UIActivityType.saveToCameraRoll, UIActivityType.addToReadingList, UIActivityType.postToFlickr, UIActivityType.postToVimeo, UIActivityType.postToTencentWeibo]
    activityController.excludedActivityTypes = excludedActivities
    activityController.popoverPresentationController?.sourceRect = CGRect(x: 4.0, y: 0.0, width: 1.0, height: 1.0)
    activityController.popoverPresentationController?.sourceView = 显示的框
    
    return activityController
}

public func share批量分享功能(文件地址:[URL],显示的框:UIView) -> UIActivityViewController?{
    //    let fileURL = 文件地址
    let activityController = UIActivityViewController(activityItems: 文件地址, applicationActivities: nil)
    let excludedActivities = [UIActivityType.postToFlickr, UIActivityType.postToWeibo, UIActivityType.message, UIActivityType.mail, UIActivityType.print, UIActivityType.copyToPasteboard, UIActivityType.assignToContact, UIActivityType.saveToCameraRoll, UIActivityType.addToReadingList, UIActivityType.postToFlickr, UIActivityType.postToVimeo, UIActivityType.postToTencentWeibo]
    activityController.excludedActivityTypes = excludedActivities
    activityController.popoverPresentationController?.sourceRect = CGRect(x: 4.0, y: 0.0, width: 1.0, height: 1.0)
    activityController.popoverPresentationController?.sourceView = 显示的框
    
    return activityController
}
//public func share分享功能(文件地址:String,测试:Bool = false) -> UIActivityViewController{
//    //    if let
//    var fileURL:URL? = URL(fileURLWithPath: "")
//    
//    if 测试{
//        fileURL = fileToURL(文件地址)
//    }else{
//        
//        fileURL = URL(fileURLWithPath: 文件地址)
//    }
//    
//    
//    let activityController = UIActivityViewController(activityItems: [fileURL!], applicationActivities: nil)
//    let excludedActivities = [UIActivityType.postToFlickr, UIActivityType.postToWeibo, UIActivityType.message, UIActivityType.mail, UIActivityType.print, UIActivityType.copyToPasteboard, UIActivityType.assignToContact, UIActivityType.saveToCameraRoll, UIActivityType.addToReadingList, UIActivityType.postToFlickr, UIActivityType.postToVimeo, UIActivityType.postToTencentWeibo]
//    
//    activityController.excludedActivityTypes = excludedActivities
//    //        present(activityController, animated: true, completion: nil)
//    return activityController
//}


public func 处理头像圆角(处理的ImageView:UIImageView,圆角大小:CGFloat = 2)   {
    处理的ImageView.layer.masksToBounds = true
    处理的ImageView.layer.cornerRadius =  处理的ImageView.bounds.width/圆角大小
}

public func sendTime发布时间转文字方法(发布时间:Date) -> String {
    let date = DateFormatter()
    date.dateFormat = "Y.M.d H:mm"
    let datetostring = date.string(from: 发布时间)
    return datetostring
}

public func fileToURL(_ file: String) -> URL? {
    // Get the full path of the file
    let fileComponents = file.components(separatedBy: ".")
    
    if let filePath = Bundle.main.path(forResource: fileComponents[0], ofType: fileComponents[1]) {
        return URL(fileURLWithPath: filePath)
    }
    
    return nil
}



public func 删除无关字符(str:String) -> String  {
    var str = str
    if str == ""{return ""}else if str.contains("http://"){
        str = 处理http(httpstring: str, 标志: "http://")
    }else if str.contains("https://"){
        str = 处理http(httpstring: str, 标志: "https://")
    }
    print(str)
    return str
}


public func 删除http链接无关字符只留主题文字(str:String) -> String  {
    var str = str
    if str == ""{return "" }else if str.contains("http://"){
        str = 处理http(httpstring: str, 标志: "http://")
    }else if str.contains("https://"){
        str = 处理http(httpstring: str, 标志: "https://")
    }
    print(str)
    return str
}


public func 处理http(httpstring: String,标志:String) -> String {
    
    var httpstring = httpstring
    let rangeForstr = httpstring.range(of: 标志)
    let t = (rangeForstr?.lowerBound)!
    let f = httpstring.startIndex
    
    print(httpstring)
    let strRange = f..<t
    httpstring.removeSubrange(strRange)
    return httpstring
}


public func f发音内容(内容:String)  {
    let audioSession = AVAudioSession.sharedInstance()
    do {try audioSession.setCategory(AVAudioSessionCategoryPlayback)
    }catch let error as NSError{
        print(error.code)}
    let av = AVSpeechSynthesizer.init()
    let utterance1 = AVSpeechUtterance(string: 内容)
    utterance1.postUtteranceDelay = 1
    utterance1.rate = 0.5
    av.speak(utterance1)
}

public func 有没有Htttps(httpstring:String) -> URL {
    let httpstring1 = httpstring
    if httpstring1 != "" {
        if  httpstring1.contains("http://") {
            let 找位置 = httpstring1.range(of: "http://")
            let 起始位置 = (找位置?.lowerBound)!
            let 截取 = httpstring1[起始位置..<httpstring1.endIndex]
            print(截取)
            return URL(string: String(截取))!
        }else if httpstring1.contains("https://"){
            let 找位置 = httpstring1.range(of: "https://")
            let 起始位置 = (找位置?.lowerBound)!
            let 截取 = httpstring1[起始位置..<httpstring1.endIndex]
            print(截取)
            return URL(string: String(截取))!
        }else{ return URL(string: "https://www.baidu.com")!}}
    
    return URL(string: "https://www.baidu.com")!
}


public func 打开网页(网路WebView:UIWebView,地址:String)  {
    
    let url = 有没有Htttps(httpstring:地址)// websiteTextField.text!)
    // 2.建立网络请求
    let request = URLRequest(url: url);
    // 3.加载网络请求
    网路WebView.loadRequest(request)
    //    websiteTextField.resignFirstResponder()
}




public extension String{
    
    public func transformToPinYin() -> String{//(String,String){
        
        let mutableString = NSMutableString(string: self)
        
        //把汉字转为拼音
        
        CFStringTransform(mutableString, nil, kCFStringTransformToLatin, false)
        //去掉拼音的音标
        //        let 没有去掉音标 = mutableString
        
        CFStringTransform(mutableString, nil, kCFStringTransformStripDiacritics, false)
        let string = String(mutableString)
        //去掉空格
        let 去掉空格 = string.replacingOccurrences(of: " ", with: "")
        return 去掉空格//(去掉空格//,没有去掉音标 as String)
        
    }
    
}


//func HUD(添加到的窗口:UIView,LabelText:String,消失时间:Double = 3.0)  {
//    let hud = MBProgressHUD.showAdded(to: 添加到的窗口, animated: true)
//    hud.label.text = LabelText
//    hud.hide(animated: true, afterDelay: 消失时间)
//}

//延迟调用

public func afterDelay(_ seconds: Double, closure: @escaping () -> ()) {
    let when = DispatchTime.now() + Double(Int64(seconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
    DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
}
public func 延迟调用(_ seconds: Double, closure: @escaping () -> ()) {
    let when = DispatchTime.now() + Double(Int64(seconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
    DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
}

class BriefFunctionSwift: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

