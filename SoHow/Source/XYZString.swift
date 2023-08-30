//
//  XYZString.swift
//  SoHow
//
//  Created by zhangzihao on 2022/4/4.
//  Copyright © 2022 张子豪. All rights reserved.
//

import UIKit

public extension String{ var NotEmpty:Bool{return !self.isEmpty}}

public extension String{
    
    var isValidPhoneNumber: Bool {
        let phoneRegex = "^1\\d{10}$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phonePredicate.evaluate(with: self)
    }
    
    var isValidEmail: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
}

public extension String {
    var isSixDigitNumber: Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", "^\\d{6}$")
        return predicate.evaluate(with: self)
    }
}
