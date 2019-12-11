//
//  XYZWeb.swift
//  SoHow
//
//  Created by 张子豪 on 2019/3/13.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit

class XYZWeb: NSObject {
    
}


public func 处理website并跳转打开(Website:String){
    
    
    let websiteString = 删除无关字符(str: Website.lowercased()).trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
    
    
    if  Validate.URL(websiteString).isRight{
        print("这里是采用跳转")
        if websiteString.contains("http"){   //包含了Https
            
            let websiteX = websiteString
            
            guard let WebsiteURL = URL(string: websiteX) ,UIApplication.shared.canOpenURL(WebsiteURL)else{
                print("WebsiteURL转换失败")
                return
            }
            UIApplication.shared.open(WebsiteURL, options: [:], completionHandler: nil)
            
            
        }else{//需要添加https
            
            let websiteX = "https://" + websiteString
            guard let WebsiteURL = URL(string: websiteX) ,UIApplication.shared.canOpenURL(WebsiteURL)else{
                print("WebsiteURL转换失败")
                return
            }
            UIApplication.shared.open(WebsiteURL, options: [:], completionHandler: nil)
            
        }
    }else{
        
        print("识别结果中不含网址或可能混杂别的字符")
        
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




public func 有没有Htttps(httpstring:String) -> URL? {
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
        }else{ return nil}}
    
    return nil
}




import Foundation

enum Validate {
    
    
    //        Validate.email("blog@@csdn.com").isRight //false
    //
    //        Validate.URL("https://www.baidu.com").isRight //true
    //
    //        Validate.IP("114.114.114.114").isRight //true
    
    
    
    case email(_: String)
    case phoneNum(_: String)
    case carNum(_: String)
    case username(_: String)
    case password(_: String)
    case nickname(_: String)
    
    case URL(_: String)
    case IP(_: String)
    
    
    var isRight: Bool {
        var predicateStr:String!
        var currObject:String!
        switch self {
        case let .email(str):
            predicateStr = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
            currObject = str
        case let .phoneNum(str):
            predicateStr = "^((13[0-9])|(15[^4,\\D]) |(17[0,0-9])|(18[0,0-9]))\\d{8}$"
            currObject = str
        case let .carNum(str):
            predicateStr = "^[A-Za-z]{1}[A-Za-z_0-9]{5}$"
            currObject = str
        case let .username(str):
            predicateStr = "^[A-Za-z0-9]{6,20}+$"
            currObject = str
        case let .password(str):
            predicateStr = "^[a-zA-Z0-9]{6,20}+$"
            currObject = str
        case let .nickname(str):
            predicateStr = "^[\\u4e00-\\u9fa5]{4,8}$"
            currObject = str
        case let .URL(str):
            predicateStr = "^(https?:\\/\\/)?([\\da-z\\.-]+)\\.([a-z\\.]{2,6})([\\/\\w \\.-]*)*\\/?$"
            currObject = str
        case let .IP(str):
            predicateStr = "^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"
            currObject = str
        }
        
        let predicate =  NSPredicate(format: "SELF MATCHES %@" ,predicateStr)
        return predicate.evaluate(with: currObject)
    }
    
}
