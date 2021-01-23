//
//  XYZString_XYZMoney_Ex.swift
//  SoHow
//
//  Created by 张子豪 on 2020/7/7.
//  Copyright © 2020 张子豪. All rights reserved.
//

import UIKit

public extension String{
    
    func 找出数字算法() -> Double {
        let 输入 = self.花了后面字符串()
        
        var double结果 = 0.0
        var 结果字符串准备输出 = ""
        
        if Double(输入) == nil{
            
            for i in 输入{
                if i != "."{
                    if let dd = Int("\(i)"){
                        结果字符串准备输出 += "\(dd)"
                    }}else{
                    结果字符串准备输出 += "."
                }}
            double结果 = Double(结果字符串准备输出) ?? 0
            
        }else{ double结果 = Double(输入)!}
        return Double(String(format: "%.2f", double结果)) ?? 0.0
    }
    
    
    func w文字转数字() -> String{
        let m = self
        
        var 暂时数字 = ""
        for i in m {
            switch i {
            case "零","0": 暂时数字 += "0"
            case "一","1":暂时数字 += "1"
            case "二","2":暂时数字 += "2"
            case "三","3":暂时数字 += "3"
            case "四","4":暂时数字 += "4"
            case "五","5":暂时数字 += "5"
            case "六","6":暂时数字 += "6"
            case "七","7":暂时数字 += "7"
            case "八","8":暂时数字 += "8"
            case "九","9":暂时数字 += "9"
            case "块",".":暂时数字 += "."
                
            default: break
                
            }
            
        }
        return 暂时数字
    }
    
    
    func 花了后面字符串(关键字:String = "花了") -> String{
        let 输入 = self
        //    输入.rep输入
        var 输出 = 输入.replacingOccurrences(of: "，", with: "")
        
        输出 = 输出.replacingOccurrences(of: "。", with: "")
        输出 = 输出.replacingOccurrences(of: "？", with: "")
        
        if 输出.contains(关键字){
            
            let 找位置 = 输出.range(of: 关键字)
            let 起始位置 = (找位置?.upperBound)!
            
            let 终止位置 = 输入.endIndex
            let 范围 = 起始位置..<终止位置
            输出 = String(输入[范围])//.substring(with: 范围)
        }
        return 输出
    }
    
}















public func 买东西条目名称整理(输入:String,关键字:String = "花了") -> String{
    var 输出 = 输入
    if 输入.contains(关键字){
        
        let 找位置 = 输出.range(of: 关键字)
        let 起始位置 = 输入.startIndex
        let 终止位置 = (找位置?.lowerBound)!
        let 范围 = 起始位置..<终止位置
        
        输出 = String(输入[范围])
    }
    return 输出
}





public func 有汉字时间格式的调整(date:Date,format:String = "yyyy年MM月dd日 HH:mm:ss") -> String  {
    // 创建一个日期格式器
    let dformatter = DateFormatter()
    // 为日期格式器设置格式字符串
    dformatter.dateFormat = format
    // 使用日期格式器格式化日期、时间
    let datestr = dformatter.string(from: date)
    let message =  "\(datestr)"
    return message
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


public func 返回整数月份(时间:Date) -> Int {
    
    let 时间格式 = DateFormatter()
    时间格式.dateFormat = "M"
    let t = 时间格式.string(from: 时间)
    
    
    return Int(t) ?? 0
}


public func Date转String不加区域(date:Date) -> String  {
    // 创建一个日期格式器
    let dformatter = DateFormatter()
    // 为日期格式器设置格式字符串
    dformatter.dateFormat = "yyyyMMddHHmmss"
    // 使用日期格式器格式化日期、时间
    let datestr = dformatter.string(from: date)
    let message =  "\(datestr)"
    return message
}

//
////添加一个+=的方法让两个词典可以融合
//func += <KeyType, ValueType> ( left: inout Dictionary<KeyType, ValueType>, right: Dictionary<KeyType, ValueType>) {
//    for (k, v) in right {
//        left.updateValue(v, forKey: k)
//    }
//}
