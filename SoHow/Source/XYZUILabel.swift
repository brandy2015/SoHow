//
//  XYZUILabel.swift
//  SoHow
//
//  Created by 张子豪 on 2019/12/16.
//  Copyright © 2019 张子豪. All rights reserved.
//


import UIKit

//在label上长按可以复制进剪贴板
public extension UILabel{
    
    func AddLongPressToPasteBoard() {
       
        let guesture = UILongPressGestureRecognizer(target: self, action: #selector(self.longPress(_ :)))
        guesture.minimumPressDuration = 0.5
 
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(guesture)
    }
    
    @objc private func longPress(_ gusture:UILongPressGestureRecognizer){print("长按了")// 检测手势阶段
        switch gusture.state {
            case .began:XYZResponse.D点按马达震动反馈(style: .light);print("开始点按")
            case .ended:print("停止点按");
            let x = gusture.view as? UILabel
            UIPasteboard.general.string = x?.text
            XYZResponse.D点按马达震动反馈(style: .heavy)
            default: print("")
        }
    }
}

private class XYZResponse: NSObject {
    /// 创建枚举
    public enum FeedbackType: Int {case light,medium,heavy,success,warning,error,none}
    /// 创建类方法，随时调用
    public static func D点按马达震动反馈(style: FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        switch style {
            case .light:
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.impactOccurred()
            case .medium:
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
            case .heavy:
                let generator = UIImpactFeedbackGenerator(style: .heavy)
                generator.impactOccurred()
            case .success: generator.notificationOccurred(.success)
            case .warning: generator.notificationOccurred(.warning)
            case .error  : generator.notificationOccurred(.error)
            default:break
        }
    }
}
