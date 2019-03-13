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
