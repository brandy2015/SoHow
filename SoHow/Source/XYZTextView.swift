//
//  XYZTextView.swift
//  SoHow
//
//  Created by zhangzihao on 2021/11/26.
//  Copyright © 2021 张子豪. All rights reserved.
//

import UIKit


//调整line的间距上下间距
public extension UITextView{
    
    func textViewlineSpacingChange(lineSpacing:Int = 20)  {
        _textViewlineSpacingChange(self, lineSpacing: lineSpacing)
    }
    
    private func _textViewlineSpacingChange(_ textView: UITextView,lineSpacing:Int = 20) {
        let paraph = NSMutableParagraphStyle()
        paraph.lineSpacing = CGFloat(lineSpacing);// 字体的行间距
        paraph.lineHeightMultiple = 1.5
        let attributes = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 15),NSAttributedString.Key.paragraphStyle: paraph]

        textView.attributedText = NSAttributedString(string: textView.text, attributes: attributes)

    }
}
