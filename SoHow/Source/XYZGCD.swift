//
//  XYZGCD.swift
//  SoHow
//
//  Created by 张子豪 on 2019/1/22.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit

class XYZGCD: NSObject {

}

//延迟调用
public func afterDelay(_ seconds: Double, closure: @escaping () -> ()) {
    let when = DispatchTime.now() + Double(Int64(seconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
    DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
}
