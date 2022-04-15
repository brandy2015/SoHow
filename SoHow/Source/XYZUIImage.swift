//
//  XYZUIImage.swift
//  SoHow
//
//  Created by zhangzihao on 2022/4/15.
//  Copyright © 2022 张子豪. All rights reserved.
//

import UIKit

class XYZUIImage: NSObject {

}

//import UIKit
//import XYZPathKit
//import MobileCoreServices            //picker.mediaTypes的类型
//import Photos
// 

//Swift开发根据图片的data获取图片的格式
//可以根据自己的需求返回相应的结果

//常用的图片格式有一下几种。
//
//PNG
//JPEG
//GIF
//WebP 是 Google 制造的一个图片格式，针对网络上快速传输就行了优化
//TIFF/TIF 在数字影响、遥感、医学等领域中得到了广泛的应用。TIFF文件的后缀是.tif或者.tiff
//HEIC iOS11 后，苹果拍照图片的默认格式
//HEIF 用于存储动态图像
//enum ImageFormat {
//    case Unknow
//    case JPEG
//    case PNG
//    case GIF
//    case TIFF
//    case WebP
//    case HEIC
//    case HEIF
//}
//extension Data {
//    func getImageFormat() -> ImageFormat  {
//        var buffer = [UInt8](repeating: 0, count: 1)
//        self.copyBytes(to: &buffer, count: 1)
//
//        switch buffer {
//        case [0xFF]: return .JPEG
//        case [0x89]: return .PNG
//        case [0x47]: return .GIF
//        case [0x49],[0x4D]: return .TIFF
//        case [0x52] where self.count >= 12:
//            if let str = String(data: self[0...11], encoding: .ascii), str.hasPrefix("RIFF"), str.hasSuffix("WEBP") {
//                return .WebP
//            }
//        case [0x00] where self.count >= 12:
//            if let str = String(data: self[8...11], encoding: .ascii) {
//                let HEICBitMaps = Set(["heic", "heis", "heix", "hevc", "hevx"])
//                if HEICBitMaps.contains(str) {
//                    return .HEIC
//                }
//                let HEIFBitMaps = Set(["mif1", "msf1"])
//                if HEIFBitMaps.contains(str) {
//                    return .HEIF
//                }
//            }
//        default: break;
//        }
//        return .Unknow
//    }
//}
