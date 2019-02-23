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

//添加一个+=的方法让两个词典可以融合
public func += <KeyType, ValueType> ( left: inout Dictionary<KeyType, ValueType>, right: Dictionary<KeyType, ValueType>) {
    for (k, v) in right {
        left.updateValue(v, forKey: k)
    }
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
    do {
        try audioSession.setCategory(.playback, mode: .default, options: .allowAirPlay)
        
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
public func cornerRadius处理Image的圆角(layer: CALayer,cornerRadius:CGFloat = 20)  {
    layer.masksToBounds = true
    layer.cornerRadius = cornerRadius
}





var  url :URL! = nil
public func b保存图片(image:UIImage,图片名称:String = "imageData",是否保存:Bool){
    if 是否保存{
        let userDefault = UserDefaults.standard
        let imageData:Data = NSKeyedArchiver.archivedData(withRootObject: image)
        userDefault.set(imageData, forKey: 图片名称)
    }else{ print("没有保存")}
}




public func b保存GIF图片(image:UIImage,图片名称:String = "imageData",是否保存:Bool){
    if 是否保存{
        let userDefault = UserDefaults.standard
        let imageData:Data = NSKeyedArchiver.archivedData(withRootObject: image)
        userDefault.set(imageData, forKey: 图片名称)
        print("\n\n\n\n\n\n\n\n")
        print("保存了GIF" + 图片名称)
        
        print("\n\n\n\n\n\n\n\n")
    }else{ print("没有保存")}
}





public func d读取图片地址(图片名字:String) -> String  {  //未真正启用
    let userDefault = UserDefaults.standard
    var objData = userDefault.object(forKey: 图片名字) as? Data
    if let objData1 = objData {
        objData = objData1
    }else{
        objData = userDefault.object(forKey: "default") as? Data
    }
    let myImage = ""
    return myImage
}





public func b保存数组到文件testSaveDicPlist(字典:[String:String],写入地址:String = ""){
    let filePath:String = NSHomeDirectory() + "/Documents/" + 写入地址 + "tfDic.plist"
    NSDictionary(dictionary: 字典).write(to: URL(fileURLWithPath: filePath), atomically: true)
}

public func d从文件读取数组(路径:String = "") -> [String:String] {
    let 路径2 = NSHomeDirectory() + "/Documents/tfDic.plist"
    let dict = NSDictionary(contentsOfFile: 路径2) as? [String:String]
    return dict ?? [:]
}



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






public func d读取图片(图片名字:String) -> UIImage  {
    let userDefault = UserDefaults.standard
    let objData = userDefault.object(forKey: 图片名字) as? Data
    let 解包objData = objData ?? userDefault.object(forKey: "default") as? Data
    let myImage = NSKeyedUnarchiver.unarchiveObject(with: 解包objData ?? Data()) as? UIImage
    return myImage ?? #imageLiteral(resourceName: "default")
}



public func b保存string到本地(保存的内容:String,文件名称:String)  {
    var sp = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
    if sp.count > 0 {
        url = URL(fileURLWithPath: "\(sp[0])/" + "\(文件名称)" + "data.txt")
        print(url)
        let data = NSMutableData()
        
        let x = 保存的内容
        let m = x.data(using: String.Encoding.utf8, allowLossyConversion:true)!
        let mtodata = NSData(data: m) as Data
        
        
        data.append(mtodata)
        data.write(toFile: url.path, atomically: true)
        print("end")
    }
}


public func b保存数组array到本地(保存的内容:Array<String>,文件名称:String)  {
    var sp = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
    if sp.count > 0 {
        url = URL(fileURLWithPath: "\(sp[0])/" + "\(文件名称)" + "data.txt")
        print(url)
        let m = 保存的内容 as NSArray
        m.write(toFile: url.path, atomically: true)
        print("保存文件成功" + 文件名称)
    }
}


public func d从文件读取数组返回数组(文件名称:String = "") -> Array<String> {
    var url2 = URL(fileURLWithPath: "")
    var sp = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
    if sp.count > 0 {
        url2 = URL(fileURLWithPath: "\(sp[0])/" + "\(文件名称)" + "data.txt")
        print(url2)
    }
    
    let 路径2 = url2.relativeString//NSHomeDirectory() + "/Documents/tfDic.plist"
    
    let array1 = NSArray(contentsOfFile: 路径2) as? Array<String>
    return array1 ?? []
}

public func b保存字典dic到本地(保存的内容:Dictionary<String,String>,文件名称:String)  {
    var sp = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
    if sp.count > 0 {
        url = URL(fileURLWithPath: "\(sp[0])/" + "\(文件名称)" + "data.plist")
        print(url)
        let m = 保存的内容 as NSDictionary
        m.write(toFile: url.path, atomically: true)
        print("保存文件成功" + 文件名称)
    }
}

public func d从文件读取字典返回字典(文件名称:String = "") -> [String:String] {
    
    var url2 = URL(fileURLWithPath: "")
    var sp = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
    if sp.count > 0 {
        url2 = URL(fileURLWithPath: "\(sp[0])/" + "\(文件名称)" + "data.plist")
        print(url2)
    }
    
    let 路径2 = url2.relativeString//NSHomeDirectory() + "/Documents/tfDic.plist"
    
    print("路径2" + 路径2)
    
    var dict = NSMutableDictionary(contentsOf: url2) as? [String:String]
    if dict == nil{dict = [:]}
    return dict!
}

