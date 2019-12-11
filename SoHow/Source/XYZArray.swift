//
//  XYZArray.swift
//  SoHow
//
//  Created by 张子豪 on 2019/12/11.
//  Copyright © 2019 张子豪. All rights reserved.
//

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
