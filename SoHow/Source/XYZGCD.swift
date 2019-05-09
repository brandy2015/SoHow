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
//    Async.userInitiated {}.main {

//    }
//     @discardableResult



//DispatchQueue.global(qos: .background).async {
//    let objects = messages.map { message in
//        return Message(from: message.0, text: message.1)
//    }
//    let realm = try! Realm()
//    try! realm.write {
//        realm.add(objects)
//    }
//}





//DispatchQueue.global(qos: .background).async {}
