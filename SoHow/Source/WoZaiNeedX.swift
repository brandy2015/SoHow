//
//  WoZaiNeedX.swift
//  SoHow
//
//  Created by 张子豪 on 2019/3/13.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit

class WoZaiNeedX: NSObject {

}
public func 读取好友列表() -> [String] {
    let _FriendsList = UserDefaults.standard.array(forKey: "FriendsList") as? [String]
    return _FriendsList ?? [""]
}
