////
////  XYZString_XYZMoney_Ex.swift
////  SoHow
////
////  Created by 张子豪 on 2020/7/7.
////  Copyright © 2020 张子豪. All rights reserved.
////
//
//import UIKit
//
//public extension String{
//    
//    func 找出数字算法() -> Double {
//        let 输入 = self.花了后面字符串()
//        
//        var double结果 = 0.0
//        var 结果字符串准备输出 = ""
//        
//        if Double(输入) == nil{
//            
//            for i in 输入{
//                if i != "."{
//                    if let dd = Int("\(i)"){
//                        结果字符串准备输出 += "\(dd)"
//                    }}else{
//                    结果字符串准备输出 += "."
//                }}
//            double结果 = Double(结果字符串准备输出) ?? 0
//            
//        }else{ double结果 = Double(输入)!}
//        return Double(String(format: "%.2f", double结果)) ?? 0.0
//    }
//    
//    
//    func w文字转数字() -> String{
//        let m = self
//        
//        var 暂时数字 = ""
//        for i in m {
//            switch i {
//            case "零","0": 暂时数字 += "0"
//            case "一","1":暂时数字 += "1"
//            case "二","2":暂时数字 += "2"
//            case "三","3":暂时数字 += "3"
//            case "四","4":暂时数字 += "4"
//            case "五","5":暂时数字 += "5"
//            case "六","6":暂时数字 += "6"
//            case "七","7":暂时数字 += "7"
//            case "八","8":暂时数字 += "8"
//            case "九","9":暂时数字 += "9"
//            case "块",".":暂时数字 += "."
//                
//            default: break
//                
//            }
//            
//        }
//        return 暂时数字
//    }
//    
//    
//    func 花了后面字符串(关键字:String = "花了") -> String{
//        let 输入 = self
//        //    输入.rep输入
//        var 输出 = 输入.replacingOccurrences(of: "，", with: "")
//        
//        输出 = 输出.replacingOccurrences(of: "。", with: "")
//        输出 = 输出.replacingOccurrences(of: "？", with: "")
//        
//        if 输出.contains(关键字){
//            
//            let 找位置 = 输出.range(of: 关键字)
//            let 起始位置 = (找位置?.upperBound)!
//            
//            let 终止位置 = 输入.endIndex
//            let 范围 = 起始位置..<终止位置
//            输出 = String(输入[范围])//.substring(with: 范围)
//        }
//        return 输出
//    }
//    
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//public func 买东西条目名称整理(输入:String,关键字:String = "花了") -> String{
//    var 输出 = 输入
//    if 输入.contains(关键字){
//        
//        let 找位置 = 输出.range(of: 关键字)
//        let 起始位置 = 输入.startIndex
//        let 终止位置 = (找位置?.lowerBound)!
//        let 范围 = 起始位置..<终止位置
//        
//        输出 = String(输入[范围])
//    }
//    return 输出
//}
//
//
//
//
//
//public func 有汉字时间格式的调整(date:Date,format:String = "yyyy年MM月dd日 HH:mm:ss") -> String  {
//    // 创建一个日期格式器
//    let dformatter = DateFormatter()
//    // 为日期格式器设置格式字符串
//    dformatter.dateFormat = format
//    // 使用日期格式器格式化日期、时间
//    let datestr = dformatter.string(from: date)
//    let message =  "\(datestr)"
//    return message
//}
//
//public func 时间格式的调整2只剩年月日时间创建录音(date:Date) -> String  {
//    // 创建一个日期格式器
//    let dformatter = DateFormatter()
//    // 为日期格式器设置格式字符串
//    dformatter.dateFormat = "yyyyMMddHHmmss"
//    // 使用日期格式器格式化日期、时间
//    let datestr = dformatter.string(from: date)
//    let message =  "\(datestr)"
//    return message
//}
//
//
//public func 返回整数月份(时间:Date) -> Int {
//    
//    let 时间格式 = DateFormatter()
//    时间格式.dateFormat = "M"
//    let t = 时间格式.string(from: 时间)
//    
//    
//    return Int(t) ?? 0
//}
//
//
//public func Date转String不加区域(date:Date) -> String  {
//    // 创建一个日期格式器
//    let dformatter = DateFormatter()
//    // 为日期格式器设置格式字符串
//    dformatter.dateFormat = "yyyyMMddHHmmss"
//    // 使用日期格式器格式化日期、时间
//    let datestr = dformatter.string(from: date)
//    let message =  "\(datestr)"
//    return message
//}

 

//
//  XYZString_XYZMoney_Ex.swift
//  SoHow
//
//  Created by 张子豪 on 2020/7/7.
//  Copyright © 2020 张子豪. All rights reserved.
//

import UIKit

// MARK: - String Extensions
public extension String {

    /// 找出字符串中的数字并转换为 Double
    /// - Returns: 转换后的 Double，保留两位小数
    /// - Warning: This method will be removed in the next version. Please refactor your code accordingly.
    func 找出数字算法() -> Double {
        let 输入 = self.花了后面字符串()
        
        var double结果 = 0.0
        var 结果字符串准备输出 = ""
        
        if Double(输入) == nil {
            for i in 输入 {
                if i != "." {
                    if let dd = Int("\(i)") {
                        结果字符串准备输出 += "\(dd)"
                    }
                } else {
                    结果字符串准备输出 += "."
                }
            }
            double结果 = Double(结果字符串准备输出) ?? 0
        } else {
            double结果 = Double(输入)!
        }
        return Double(String(format: "%.2f", double结果)) ?? 0.0
    }
    
    /// 将中文数字转换为阿拉伯数字
    /// - Returns: 返回转换后的阿拉伯数字字符串
    /// - Warning: This method will be removed in the next version. Please refactor your code accordingly.
    func w文字转数字() -> String {
        let m = self
        var 暂时数字 = ""
        for i in m {
            switch i {
            case "零","0": 暂时数字 += "0"
            case "一","1": 暂时数字 += "1"
            case "二","2": 暂时数字 += "2"
            case "三","3": 暂时数字 += "3"
            case "四","4": 暂时数字 += "4"
            case "五","5": 暂时数字 += "5"
            case "六","6": 暂时数字 += "6"
            case "七","7": 暂时数字 += "7"
            case "八","8": 暂时数字 += "8"
            case "九","9": 暂时数字 += "9"
            case "块",".": 暂时数字 += "."
            default: break
            }
        }
        return 暂时数字
    }
    
    /// 获取指定关键字后面的字符串
    /// - Parameter 关键字: 指定的关键字，默认值为 "花了"
    /// - Returns: 关键字后面的字符串
    /// - Warning: This method will be removed in the next version. Please refactor your code accordingly.
    func 花了后面字符串(关键字: String = "花了") -> String {
        var 输出 = self.replacingOccurrences(of: "，", with: "")
        输出 = 输出.replacingOccurrences(of: "。", with: "")
        输出 = 输出.replacingOccurrences(of: "？", with: "")
        
        if 输出.contains(关键字) {
            let 找位置 = 输出.range(of: 关键字)
            let 起始位置 = (找位置?.upperBound)!
            let 终止位置 = self.endIndex
            let 范围 = 起始位置..<终止位置
            输出 = String(self[范围])
        }
        return 输出
    }
}

// MARK: - Utility Functions

/// 整理购买物品条目名称
/// - Parameters:
///   - 输入: 包含购买物品信息的字符串
///   - 关键字: 需要查找的关键字，默认为 "花了"
/// - Returns: 整理后的条目名称
/// - Warning: This function will be removed in the next version. Please refactor your code accordingly.
public func 买东西条目名称整理(输入: String, 关键字: String = "花了") -> String {
    var 输出 = 输入
    if 输入.contains(关键字) {
        let 找位置 = 输出.range(of: 关键字)
        let 起始位置 = 输入.startIndex
        let 终止位置 = (找位置?.lowerBound)!
        let 范围 = 起始位置..<终止位置
        输出 = String(输入[范围])
    }
    return 输出
}

// MARK: - Date Extensions

/// 将日期转换为汉字格式的字符串
/// - Parameters:
///   - date: 输入的日期
///   - format: 日期格式，默认为 "yyyy年MM月dd日 HH:mm:ss"
/// - Returns: 格式化后的日期字符串
/// - Warning: This function will be removed in the next version. Please refactor your code accordingly.
public func 有汉字时间格式的调整(date: Date, format: String = "yyyy年MM月dd日 HH:mm:ss") -> String {
    let dformatter = DateFormatter()
    dformatter.dateFormat = format
    return dformatter.string(from: date)
}

/// 将日期格式化为年月日
/// - Parameter date: 输入的日期
/// - Returns: 格式化后的年月日字符串
/// - Warning: This function will be removed in the next version. Please refactor your code accordingly.
public func 时间格式的调整2只剩年月日时间创建录音(date: Date) -> String {
    let dformatter = DateFormatter()
    dformatter.dateFormat = "yyyyMMddHHmmss"
    return dformatter.string(from: date)
}

/// 获取日期的月份（整数形式）
/// - Parameter 时间: 输入的日期
/// - Returns: 整数形式的月份
/// - Warning: This function will be removed in the next version. Please refactor your code accordingly.
public func 返回整数月份(时间: Date) -> Int {
    let 时间格式 = DateFormatter()
    时间格式.dateFormat = "M"
    let t = 时间格式.string(from: 时间)
    return Int(t) ?? 0
}

/// 将日期转换为字符串，不带区域设置
/// - Parameter date: 输入的日期
/// - Returns: 转换后的日期字符串
/// - Warning: This function will be removed in the next version. Please refactor your code accordingly.
public func Date转String不加区域(date: Date) -> String {
    let dformatter = DateFormatter()
    dformatter.dateFormat = "yyyyMMddHHmmss"
    return dformatter.string(from: date)
}


/////////////////////上面内容准备删除👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻
///
///

import UIKit

// MARK: - Dictionary Extensions (字典扩展)

// Remove this comment and the Chinese version if the English version is preferred.
// 如果使用英文版本，移除此注释及中文版本。
public extension Dictionary {
    
    /// Merges two dictionaries by updating the values from the right dictionary into the left dictionary
    /// - Parameters:
    ///   - left: The dictionary that will be updated with the new values
    ///   - right: The dictionary whose key-value pairs will be added or used to update the left dictionary
    static func += (left: inout Dictionary, right: Dictionary) {
        for (key, value) in right {
            left.updateValue(value, forKey: key)
        }
    }
}
 


import UIKit

// MARK: - String Extensions
public extension String {

    /// Extracts numbers from a string and converts them to a Double
    /// - Returns: The extracted number as Double, formatted to two decimal places
    /// - Note: Remove the Chinese version if the English version is preferred.
    /// - 注: 如果使用英文版本，请移除中文注释。
    func extractNumber() -> Double {
        let input = self.getSubstring(after: "花了")
        var resultString = ""
        var resultDouble = 0.0

        if Double(input) == nil {
            for i in input {
                if i != "." {
                    if let num = Int("\(i)") {
                        resultString += "\(num)"
                    }
                } else {
                    resultString += "."
                }
            }
            resultDouble = Double(resultString) ?? 0.0
        } else {
            resultDouble = Double(input)!
        }
        return Double(String(format: "%.2f", resultDouble)) ?? 0.0
    }
    
    /// Converts Chinese numbers to Arabic numerals
    /// - Returns: A string containing the converted Arabic numerals
    func convertChineseNumbers() -> String {
        var result = ""
        for char in self {
            switch char {
            case "零", "0": result += "0"
            case "一", "1": result += "1"
            case "二", "2": result += "2"
            case "三", "3": result += "3"
            case "四", "4": result += "4"
            case "五", "5": result += "5"
            case "六", "6": result += "6"
            case "七", "7": result += "7"
            case "八", "8": result += "8"
            case "九", "9": result += "9"
            case "块", ".": result += "."
            default: break
            }
        }
        return result
    }
    
    /// Gets the substring after the specified keyword
    /// - Parameter keyword: The keyword to search for, default is "花了"
    /// - Returns: Substring after the keyword
    func getSubstring(after keyword: String = "花了") -> String {
        var output = self.replacingOccurrences(of: "，", with: "")
        output = output.replacingOccurrences(of: "。", with: "")
        output = output.replacingOccurrences(of: "？", with: "")

        if output.contains(keyword) {
            let range = output.range(of: keyword)!
            let start = range.upperBound
            let end = self.endIndex
            return String(self[start..<end])
        }
        return ""
    }
    
    /// Cleans up the item name from a string
    /// - Parameters:
    ///   - input: The full string containing the item name
    ///   - keyword: The keyword to split the string, default is "花了"
    /// - Returns: The cleaned item name
    static func cleanItemName(input: String, keyword: String = "花了") -> String {
        if input.contains(keyword) {
            let range = input.range(of: keyword)!
            let start = input.startIndex
            let end = range.lowerBound
            return String(input[start..<end])
        }
        return input
    }
}

// MARK: - Date Extensions
public extension Date {
    
    /// Formats a Date to a string with Chinese characters
    /// - Parameters:
    ///   - format: The date format string, default is "yyyy年MM月dd日 HH:mm:ss"
    /// - Returns: Formatted date string
    func toChineseDateString(format: String = "yyyy年MM月dd日 HH:mm:ss") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }

    /// Formats a Date to a string with "yyyyMMddHHmmss" format
    /// - Returns: Formatted date string in "yyyyMMddHHmmss" format
    func toRecordingDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMddHHmmss"
        return formatter.string(from: self)
    }

    /// Returns the integer month from a Date
    /// - Returns: The month as an integer
    func getMonthAsInt() -> Int {
        let formatter = DateFormatter()
        formatter.dateFormat = "M"
        return Int(formatter.string(from: self)) ?? 0
    }

    /// Formats a Date to a string without locale settings
    /// - Returns: Formatted date string without locale settings
    func toSimpleDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMddHHmmss"
        return formatter.string(from: self)
    }
}
