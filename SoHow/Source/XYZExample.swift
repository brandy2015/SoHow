//
//  XYZExample.swift
//  SoHow
//
//  Created by 张子豪 on 2019/4/23.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit

class XYZExample: NSObject {

}
public class Example {
    public static var beforeEach: (()->Void)? = nil
    
    public static func of(_ description: String, action: ()->Void) {
        beforeEach?()
        printHeader(description)
        action()
    }
    
    private static func printHeader(_ message: String) {
        print("\nℹ️ \(message):")
        let length = Float(message.count + 3) * 1.2
        print(String(repeating: "—", count: Int(length)))
    }
}
