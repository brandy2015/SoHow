//
//  XYZArray.swift
//  SoHow
//
//  Created by 张子豪 on 2019/3/13.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit

import UIKit
//用法
//var ArrayX = Array()
//ArrayX.unique
//#数组有序排重
public extension Array where Element:Hashable{
    var unique : [Element] {
        var keys:[Element:()] = [:]
        return filter{keys.updateValue((), forKey:$0) == nil}
    }
}

//Array方法扩展，支持根据索引数组删除
extension Array {
    
    mutating func removeAt(indexes: [Int]) {
        _ = indexes.sorted(by: >).map { i in self.remove(at: i)}
    }
}





//
//
//
//public func b保存数组array到本地(保存的内容:Array<String>,文件名称:String)  {
//    var  url :URL! = nil
//    var sp = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
//    if sp.count > 0 {
//        url = URL(fileURLWithPath: "\(sp[0])/" + "\(文件名称)" + "data.txt")
//        print(url as Any)
//        let m = 保存的内容 as NSArray
//        m.write(toFile: url.path, atomically: true)
//        print("保存文件成功" + 文件名称)
//    }
//}
//
//public func b保存字典dic到本地(保存的内容:Dictionary<String,String>,文件名称:String)  {
//    var  url :URL! = nil
//    var sp = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
//    if sp.count > 0 {
//        url = URL(fileURLWithPath: "\(sp[0])/" + "\(文件名称)" + "data.plist")
//        print(url as Any)
//        let m = 保存的内容 as NSDictionary
//        m.write(toFile: url.path, atomically: true)
//        print("保存文件成功" + 文件名称)
//    }
//}
//
//public func d从文件读取字典返回字典(文件名称:String = "") -> [String:String] {
//
//    var url2 = URL(fileURLWithPath: "")
//    var sp = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
//    if sp.count > 0 {
//        url2 = URL(fileURLWithPath: "\(sp[0])/" + "\(文件名称)" + "data.plist")
//        print(url2)
//    }
//
//    let 路径2 = url2.relativeString//NSHomeDirectory() + "/Documents/tfDic.plist"
//
//    print("路径2" + 路径2)
//
//    var dict = NSMutableDictionary(contentsOf: url2) as? [String:String]
//    if dict == nil{dict = [:]}
//    return dict!
//}
//
//public func d从文件读取数组返回数组(文件名称:String = "") -> Array<String> {
//    var url2 = URL(fileURLWithPath: "")
//    var sp = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
//    if sp.count > 0 {
//        url2 = URL(fileURLWithPath: "\(sp[0])/" + "\(文件名称)" + "data.txt")
//        print(url2)
//    }
//
//    let 路径2 = url2.relativeString//NSHomeDirectory() + "/Documents/tfDic.plist"
//
//    let array1 = NSArray(contentsOfFile: 路径2) as? Array<String>
//    return array1 ?? []
//}
//
//public func b保存数组到文件testSaveDicPlist(字典:[String:String],写入地址:String = ""){
//    let filePath:String = NSHomeDirectory() + "/Documents/" + 写入地址 + "tfDic.plist"
//    NSDictionary(dictionary: 字典).write(to: URL(fileURLWithPath: filePath), atomically: true)
//}
//
//public func d从文件读取数组(路径:String = "") -> [String:String] {
//    let 路径2 = NSHomeDirectory() + "/Documents/tfDic.plist"
//    let dict = NSDictionary(contentsOfFile: 路径2) as? [String:String]
//    return dict ?? [:]
//}
