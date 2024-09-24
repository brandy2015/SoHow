//
//  XYZString.swift
//  SoHow
//
//  Created by zhangzihao on 2022/4/4.
//  Copyright © 2022 张子豪. All rights reserved.
//

import UIKit

// MARK: - String Extensions (通用扩展)
public extension String {
    /// 检查字符串是否为空
    var NotEmpty: Bool {
        return !self.isEmpty
    }
    
    /// 打印字符串
    func printSelf() {
        print(self)
    }
    
    /// 将字符串转换为 Double，转换失败时返回 0.0
    var toDouble: Double {
        return Double(self) ?? 0.0
    }
    
    /// 去除字符串的首尾空白字符和换行符
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// 将字符串转换为日期，指定格式
    /// - Parameter format: 日期格式，例如 "yyyy-MM-dd"
    /// - Returns: 转换后的 `Date` 对象，转换失败时为 `nil`
    func toDate(withFormat format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self)
    }
    
    /// 将字符串按指定分隔符分割成数组
    /// - Parameter separator: 分隔符，默认为空格
    /// - Returns: 分割后的字符串数组
    func splitString(separator: Character = " ") -> [String] {
        return self.split(separator: separator).map { String($0) }
    }
    
    /// 字符串本地化
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

// MARK: - String Extensions (验证扩展)
public extension String {
    
    /// 检查是否为有效的手机号码
    var isValidPhoneNumber: Bool {
        let phoneRegex = "^1\\d{10}$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phonePredicate.evaluate(with: self)
    }
    
    /// 检查是否为有效的电子邮件
    var isValidEmail: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
    
    /// 检查是否为六位数字
    var isSixDigitNumber: Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", "^\\d{6}$")
        return predicate.evaluate(with: self)
    }
}

// MARK: - Double Extensions (通用扩展)
public extension Double {
    
    /// 将 Double 四舍五入到指定的小数位数
    /// - Parameter places: 保留的小数位数，默认为2
    /// - Returns: 四舍五入后的 Double
    func roundToPlaces(places: Int = 2) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    /// 格式化 Double 为货币字符串
    /// - Parameter locale: 使用的区域设置，默认为当前
    /// - Returns: 格式化后的货币字符串
    func toCurrencyString(locale: Locale = Locale.current) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = locale
        return formatter.string(from: NSNumber(value: self))
    }
    
    /// 格式化 Double 为百分比字符串
    /// - Returns: 格式化后的百分比字符串
    func toPercentageString() -> String {
        return String(format: "%.2f%%", self)
    }
    
    /// 转换为 Int，如果需要向下取整
    var toInt: Int {
        return Int(self)
    }
    
    /// 转换为字符串，保留指定的小数位数
    /// - Parameter places: 小数位数，默认为2
    /// - Returns: 转换后的字符串
    func toString(places: Int = 2) -> String {
        return String(format: "%.\(places)f", self)
    }
}

// MARK: - Int Extensions (通用扩展)
public extension Int {
    
    /// 将 Int 转换为 Double
    var toDouble: Double {
        return Double(self)
    }
    
    /// 将 Int 转换为字符串
    var toString: String {
        return String(self)
    }
    
    /// 判断一个整数是否为质数
    var isPrime: Bool {
        if self < 2 { return false }
        if self == 2 { return true }
        for i in 2...Int(Double(self).squareRoot()) {
            if self % i == 0 {
                return false
            }
        }
        return true
    }
}

// MARK: - Date Extensions (通用扩展)
public extension Date {
    
    /// 将日期格式化为字符串
    /// - Parameter format: 日期格式，例如 "yyyy-MM-dd"
    /// - Returns: 格式化后的字符串
    func toString(withFormat format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    /// 获取日期的年份
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }
    
    /// 获取日期的月份
    var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    
    /// 获取日期的日
    var day: Int {
        return Calendar.current.component(.day, from: self)
    }
}

// MARK: - String Extensions (中文扩展)
public extension String {
   
    /// 打印字符串（中文版本）
    func 打印() {
        print(self)
    }
    
    /// 检查字符串是否为空（中文版本）
    var 非空: Bool {
        return !self.isEmpty
    }
    
    /// 将字符串转换为 Double，转换失败时返回 0.0（中文版本）
    var 转为Double: Double {
        return Double(self) ?? 0.0
    }
    
    /// 去除字符串的首尾空白字符和换行符（中文版本）
    var 去除空格: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// 检查是否为有效的手机号码（中文版本）
    var 是有效手机号码: Bool {
        let phoneRegex = "^1\\d{10}$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phonePredicate.evaluate(with: self)
    }
    
    /// 检查是否为有效的电子邮件（中文版本）
    var 是有效邮箱: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
    
    /// 检查是否为六位数字（中文版本）
    var 是六位数字: Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", "^\\d{6}$")
        return predicate.evaluate(with: self)
    }
    
    /// 将字符串按指定分隔符分割成数组（中文版本）
    /// - Parameter separator: 分隔符，默认为空格
    /// - Returns: 分割后的字符串数组
    func 分割字符串(分隔符 separator: Character = " ") -> [String] {
        return self.split(separator: separator).map { String($0) }
    }
    
    /// 将字符串转换为日期，指定格式（中文版本）
    /// - Parameter format: 日期格式，例如 "yyyy-MM-dd"
    /// - Returns: 转换后的 `Date` 对象，转换失败时为 `nil`
    func 转为日期(格式 format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self)
    }
    
    /// 字符串本地化（中文版本）
    var 本地化: String {
        return NSLocalizedString(self, comment: "")
    }
}

// MARK: - Double Extensions (中文扩展)
public extension Double {
    
    /// 将 Double 四舍五入到指定的小数位数（中文版本）
    /// - Parameter 位数: 保留的小数位数，默认为2
    /// - Returns: 四舍五入后的 Double
    func 四舍五入(位数: Int = 2) -> Double {
        let divisor = pow(10.0, Double(位数))
        return (self * divisor).rounded() / divisor
    }

    /// 格式化 Double 为货币字符串（中文版本）
    /// - Parameter 地区: 使用的区域设置，默认为当前
    /// - Returns: 格式化后的货币字符串
    func 转为货币字符串(地区 locale: Locale = Locale.current) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = locale
        return formatter.string(from: NSNumber(value: self))
    }

    /// 格式化 Double 为百分比字符串（中文版本）
    /// - Returns: 格式化后的百分比字符串
    func 转为百分比字符串() -> String {
        return String(format: "%.2f%%", self)
    }
    
    /// 转换为 Int，如果需要向下取整（中文版本）
    var 转为Int: Int {
        return Int(self)
    }
    
    /// 转换为字符串，保留指定的小数位数（中文版本）
    /// - Parameter 位数: 小数位数，默认为2
    /// - Returns: 转换后的字符串
    func 转为字符串(位数: Int = 2) -> String {
        return String(format: "%.\(位数)f", self)
    }
}

// MARK: - Int Extensions (中文扩展)
public extension Int {
   
    /// 将 Int 转换为 Double（中文版本）
    var 转为Double: Double {
        return Double(self)
    }
    
    /// 将 Int 转换为字符串（中文版本）
    var 转为字符串: String {
        return String(self)
    }
    
    /// 判断一个整数是否为质数（中文版本）
    var 是质数: Bool {
        if self < 2 { return false }
        if self == 2 { return true }
        for i in 2...Int(Double(self).squareRoot()) {
            if self % i == 0 {
                return false
            }
        }
        return true
    }
}

// MARK: - Date Extensions (中文扩展)
public extension Date {
    
    /// 将日期格式化为字符串（中文版本）
    /// - Parameter 格式: 日期格式，例如 "yyyy-MM-dd"
    /// - Returns: 格式化后的字符串
    func 转为字符串(格式 format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    /// 获取日期的年份（中文版本）
    var 年份: Int {
        return Calendar.current.component(.year, from: self)
    }
    
    /// 获取日期的月份（中文版本）
    var 月份: Int {
        return Calendar.current.component(.month, from: self)
    }
    
    /// 获取日期的日（中文版本）
    var 日: Int {
        return Calendar.current.component(.day, from: self)
    }
}
