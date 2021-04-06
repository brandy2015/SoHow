//
//  XYZDataEncode.swift
//  SoHow
//
//  Created by zhangzihao on 2021/3/27.
//  Copyright © 2021 张子豪. All rights reserved.
//

import UIKit

class XYZDataEncode: NSObject {

}

 

public extension Data {

    func base64Encoded() -> String {
        let plainData = self.base64EncodedData()

        //        data(using: String.Encoding.utf8)
        let base64String = plainData.base64EncodedString(options: [])
        return base64String
    }
}

public extension String {

    //Encode base64
    func base64Encoded() -> String? {
        let plainData = self.data(using: String.Encoding.utf8)
        let base64String = plainData?.base64EncodedString(options: [])
        return base64String ?? ""
    }

    //Decode base64
    func base64Decoded() -> String? {
        let decodedData = Data(base64Encoded: self, options: [])
        let decodedString = NSString(data: decodedData!, encoding: String.Encoding.utf8.rawValue)
        return decodedString as String?
    }
}

