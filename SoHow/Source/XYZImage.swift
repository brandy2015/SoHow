//
//  XYZImage.swift
//  SoHow
//
//  Created by 张子豪 on 2019/8/6.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit
import PDFKit

public class XYZImage: NSObject {
    static func GetthumbnailImageFromPDF(URLX:URL?,sizeX:CGSize,atPage:Int = 0) -> UIImage? {
        guard let URLX = URLX else {return nil}
        
        if #available(iOS 11.0, *) {
            let x = PDFDocument(url: URLX)
            let imagX = x?.page(at: atPage)?.thumbnail(of: sizeX, for: .trimBox)
            
            return imagX
        } else {
            return nil
            // Fallback on earlier versions
        }
        
    }
//    static func GetImageFromPDF(URLX:URL?,atPage:Int = 0) -> UIImage? {
//        guard let URLX = URLX else {return nil}
//
//        if #available(iOS 11.0, *) {
//            let x = PDFDocument(url: URLX)
//            let imagX = x?.page(at: atPage)?.pageRef
//            thumbnail(of: (self.view?.bounds.size)!, for: .trimBox)
//        } else {
//            return nil
//            // Fallback on earlier versions
//        }
//
//    }
}
