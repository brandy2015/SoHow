//
//  XYZDate.swift
//  SoHow
//
//  Created by 张子豪 on 2019/1/22.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit

class XYZDate: NSObject {

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
public func sendTime发布时间转文字方法(发布时间:Date) -> String {
    let date = DateFormatter()
    date.dateFormat = "Y.M.d H:mm"
    let datetostring = date.string(from: 发布时间)
    return datetostring
}
