//
//  XYZNumberAndString.swift
//  SoHow
//
//  Created by 张子豪 on 2019/3/13.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit

class XYZNumberAndString: NSObject {

}
public extension Double{
    public var To2位小数:String  {
        return String(format: "%.2f", self)
    }
    public var To2位小数Double:Double? {
        return Double(String(format: "%.2f", self))
    }
    
    
}

public func b保存string到本地(保存的内容:String,文件名称:String)  {
    var sp = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
    if sp.count > 0 {
        url = URL(fileURLWithPath: "\(sp[0])/" + "\(文件名称)" + "data.txt")
        print(url)
        let data = NSMutableData()
        
        let x = 保存的内容
        let m = x.data(using: String.Encoding.utf8, allowLossyConversion:true)!
        let mtodata = NSData(data: m) as Data
        
        
        data.append(mtodata)
        data.write(toFile: url.path, atomically: true)
        print("end")
    }
}
