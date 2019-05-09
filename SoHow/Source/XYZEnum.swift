//
//  XYZEnum.swift
//  SoHow
//
//  Created by 张子豪 on 2019/4/25.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit

class XYZEnum: NSObject {

}

//enum TodoRealm {
//    case bundle
//    case plain
//    case encrypted
//    
//    var url: URL {
//        do {
//            switch self {
//            case .bundle: return try Path.inBundle("bundled.realm")
//            case .plain: return try Path.inDocuments("mytodo.realm")
//            case .encrypted: return try Path.inDocuments("mytodoenc.realm")
//            }
//        } catch let err {
//            fatalError("Failed finding expected path: \(err)")
//        }
//    }
//    
//    var fileExists: Bool {
//        return FileManager.default.fileExists(atPath: path)
//    }
//    
//    var path: String {
//        return url.path
//    }
//}
