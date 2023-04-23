//
//  XYZString_trim.swift
//  SoHow
//
//  Created by zhangzihao on 2022/9/5.
//  Copyright © 2022 张子豪. All rights reserved.
//

import UIKit
//
////原始字符串
//let  str1 =  "   欢迎访问 hangge.com   "
////除去前后空格
//let  str2 = str1.trimmingCharacters( in : .whitespaces)
//
////打印结果
//print ( "原字符串：\(str1)" )
//print ( "新字符串：\(str2)" )



//CharacterSet  里各个枚举类型的含义如下：
//controlCharacters：控制符
//whitespaces：空格
//newlines：换行符
//whitespacesAndNewlines：空格换行
//decimalDigits：小数
//letters：文字
//lowercaseLetters：小写字母
//uppercaseLetters：大写字母
//nonBaseCharacters：非基础
//alphanumerics：字母数字
//decomposables：可分解
//illegalCharacters：非法
//punctuationCharacters：标点
//capitalizedLetters：大写
//symbols：符号



//2，删除前后指定的字符
//（1）下面代码将  String 字符串前后的尖括号给去除掉
//
////原始字符串
//let  str1 =  "<<hangge.com>>"
////删除前后<>
//let  characterSet =  CharacterSet (charactersIn:  "<>" )
//let  str2 = str1.trimmingCharacters( in : characterSet)
//
////打印结果
//print ( "原字符串：\(str1)" )
//print ( "新字符串：\(str2)" )
//（2）运行结果
