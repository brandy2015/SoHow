//
//  XYZUIImage_Extension.swift
//  VTLMaker
//
//  Created by 张子豪 on 2019/11/10.
//  Copyright © 2019 zhangqian. All rights reserved.
//

import UIKit


extension UIImage {
    /**
     *  重设图片大小
     */
    func reSizeImage(reSize:CGSize)->UIImage {
        //UIGraphicsBeginImageContext(reSize);
        UIGraphicsBeginImageContextWithOptions(reSize,false,UIScreen.main.scale);
        let 尺寸 = CGRect(x: 0, y: 0, width: reSize.width, height: reSize.height)
        self.draw(in: 尺寸);
        let reSizeImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext();
        return reSizeImage;
    }
    /**
     *  等比率缩放
     */
    func scaleImage(scaleSize:CGFloat)->UIImage {
        let reSize = CGSize(width: self.size.width * scaleSize, height: self.size.height * scaleSize)
        return reSizeImage(reSize: reSize)
    }
}
