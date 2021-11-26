//
//  XYZButton.swift
//  SoHow
//
//  Created by 张子豪 on 2019/8/6.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit

public extension UIButton{
    
    func AddAniPulse(addResponse: (() -> ())? = nil) {
        //添加震动反馈
//        XYZResponse.D点按马达震动反馈(style: .medium)
        addResponse?()
        //按钮动画
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.damping = 7.5
        pulse.fromValue = 1.25
        pulse.toValue = 1.0
        pulse.duration = pulse.settlingDuration
        
        self.layer.add(pulse, forKey: nil)
    }
}


//按钮添加下划线
public extension UIButton{
    func SetBottomLine()  {
        let attributedString = NSMutableAttributedString(string:self.titleLabel?.text ?? "")
        var range = NSRange()
        range.location = 0
        range.length = attributedString.length
        attributedString.addAttributes([NSAttributedString.Key.underlineStyle : NSNumber(value: NSUnderlineStyle.single.rawValue),NSAttributedString.Key.foregroundColor:UIColor.darkGray], range: range)
        self.setAttributedTitle(attributedString, for: .normal)
    }
}

