//
//  XYZXib.swift
//  SoHow
//
//  Created by 张子豪 on 2019/5/31.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit

class XYZXib: NSObject {
    var test:String = ""
}



//解决开发cocoapods时无法使用xib的问题
//@(编程笔记)[iOS开发]
//在使用Cocoapods官方模板进行pod开发时，会遇到Bundle问题导致初始化VC时同名的xib不会正常引用，这和之前使用Cocoapods 开发引用图片是一样的问题，文件名需要加上Bundle信息。
//区别在于VC要使用xib不仅要加上Bundle信息，还要重写loadView方法
//podspec里：
//s.resource_bundles = {
//    'WorkbenchModule' => ['WorkbenchModule/Assets/*.{png,xib}']
//}
//
//VC里：
//public override func loadView() {
//    Bundle(for: type(of: self)).loadNibNamed("WorkbenchModule.bundle/WorkbenchViewController", owner: self, options: nil)
//}



//https://stackoverflow.com/questions/25433110/how-do-i-load-a-xib-file-from-my-cocoapod
