//
//  XYZNumberAndString.swift
//  SoHow
//
//  Created by 张子豪 on 2019/3/13.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit

//通过记账进出在数字前添加正负
public extension Bool{
    var inOutGetString:String{
        return self ? "+ " : "- "
    }
}
public extension Double{
    var ToString:String{
        return "\(self)"
    }
}

public extension Double{
    var To2位小数:String  {
        return String(format: "%.2f", self)
    }
    var To2位小数Double:Double {
        return Double(String(format: "%.2f", self)) ?? 0.0
    }
    var To1位小数:String  {
        return String(format: "%.1f", self)
    }
    var To1位小数Double:Double {
        return Double(String(format: "%.1f", self)) ?? 0.0
    }
}


public extension String{
    var MB_extension:String{
        return "\(self) MB"
    }
}

//public func b保存string到本地(保存的内容:String,文件名称:String)  {
//    var  url :URL! = nil
//    var sp = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
//    if sp.count > 0 {
//        url = URL(fileURLWithPath: "\(sp[0])/" + "\(文件名称)" + "data.txt")
//        print(url as Any)
//        let data = NSMutableData()
//        
//        let x = 保存的内容
//        let m = x.data(using: String.Encoding.utf8, allowLossyConversion:true)!
//        let mtodata = NSData(data: m) as Data
//        
//        
//        data.append(mtodata)
//        data.write(toFile: url.path, atomically: true)
//        print("end")
//    }
//}


//extension String {
//    
//    /**
//     根据 正则表达式 截取字符串
//     
//     - parameter regex: 正则表达式
//     
//     - returns: 字符串数组
//     */
//    public func matchesForRegex(regex: String) -> [String]? {
//        
//        do {
//            let regularExpression = try NSRegularExpression(pattern: regex, options: [])
//            let range = NSMakeRange(0, self.count)
//            let results = regularExpression.matches(in: self, options: [], range: range)
//            
//            return results.map({
//                NSString.
//            })
//            
//            
//            let string = self as NSString
//            return results.map { string.substringWithRange($0.range)}
//        } catch {
//            return nil
//        }
//    }
//}
