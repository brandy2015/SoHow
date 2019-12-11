//
//  XYZDictionary.swift
//  SoHow
//
//  Created by 张子豪 on 2019/12/11.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit

//添加一个+=的方法让两个词典可以融合
public func += <KeyType, ValueType> ( left: inout Dictionary<KeyType, ValueType>, right: Dictionary<KeyType, ValueType>) {
    for (k, v) in right {
        left.updateValue(v, forKey: k)
    }
}
