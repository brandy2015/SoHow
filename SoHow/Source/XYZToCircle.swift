//
//  XYZToCircle.swift
//  SoHow
//
//  Created by 张子豪 on 2020/2/2.
//  Copyright © 2020 张子豪. All rights reserved.
//

import UIKit

public extension  CALayer{
    func ToCircle() {
        self.masksToBounds = true
        self.cornerRadius =  self.bounds.width/2
    }
}

public extension UILabel{
    func ToCircle() {self.layer.ToCircle()}
}
