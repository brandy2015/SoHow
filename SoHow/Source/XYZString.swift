//
//  XYZString.swift
//  SoHow
//
//  Created by 张子豪 on 2019/5/6.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit

class XYZString: NSObject {

}

//XYZQRcode需要

//剪贴板快捷方法
public extension String{
    
    func toPasteboard() {
        print("已复制进剪贴板")
        print(self)
        UIPasteboard.general.string = self
    }
    
    mutating func FromPasteboard() {
        print("已从剪贴板复制")
        self = UIPasteboard.general.string ?? "无内容"
        print(self)
    }
    
}


//extension String {
//    
//    //将原始的url编码为合法的url
//    func urlEncoded() -> String {
//        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters:
//            .urlQueryAllowed)
//        return encodeUrlString ?? ""
//    }
//    
//    //将编码后的url转换回原始的url
//    func urlDecoded() -> String {
//        return self.removingPercentEncoding ?? ""
//    }
//}
//let urlStr = "http://hanggge.com?name=航歌&key=!*'();:@&=+$,/?%#[]"
//print("转义后的url：\(urlStr.urlEncoded())")
//print("还原后的url：\(urlStr.urlEncoded().urlDecoded())")
