//
//  XYZImage.swift
//  SoHow
//
//  Created by 张子豪 on 2019/1/22.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit

class XYZImage: NSObject {

}

//MARK: - 压缩图片大小
public func y压缩imageCompress(originalImage: UIImage,压缩比:CGFloat = 0.5) -> UIImage{
    
    guard let imageData = originalImage.jpegData(compressionQuality: 压缩比)else{
        return originalImage
    }
    let compressImage = UIImage(data: imageData)!
    return compressImage
}
//
////
////  ImageContentVC.swift
////  testLocation
////
////  Created by 张子豪 on 2019/1/20.
////  Copyright © 2019 张子豪. All rights reserved.
////
//
//import UIKit
//import SHPathManager
//import FileKit
//
//class ImageContentVC: UIViewController {
//    
//    
//    @IBOutlet weak var ImageViewX: UIImageView!
//    
//    
//    @IBAction func 查看具体内容BTN(_ sender: Any) {
//        let URLx = Bundle.main.path(forResource: "xxx", ofType: "png")!
//        //
//        let x = URL(fileURLWithPath: URLx)//  (string: URLx)!
//        
//        let imagex = UIImage(url: x)//(named: "xxx")
//        ImageViewX.image = imagex
//        
//        
//        
//        
//        
//        
//        //        let pathX = userDocument + "xs1.jpeg"
//        
//        let pathX = userDocument + "xs2.JPG"
//        //
//        let url = pathX.url//fileURL //NSURL(string: "http://jwphotographic.co.uk/Images/1.jpg")
//        //        let imagex2 = UIImage(url: url)//(named: "xxx")
//        //        ImageViewX.image = imagex2
//        
//        
//        //print(imagex)
//        
//        print(imagex?.observationInfo)
//        
//        
//    }
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Do any additional setup after loading the view.
//    }
//    
//    
//    /*
//     // MARK: - Navigation
//     
//     // In a storyboard-based application, you will often want to do a little preparation before navigation
//     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//     // Get the new view controller using segue.destination.
//     // Pass the selected object to the new view controller.
//     }
//     */
//    
//}
//
//
//class XYZImage: NSObject {
//    
//    static var shared = XYZImage()
//    
//    var XYZURL : URL? = nil
//    
//    var Longitude:String? = nil
//    var Latitude:String? = nil
//    var LatitudeRef:String? = nil
//    var Altitude:String? = nil
//    var LongitudeRef:String? = nil
//    
//    var creationDate:Date? = nil
//    
//    var LensModel:String? = nil
//    var LensMake:String? = nil
//    var size:(Double,Double)? = nil
//    //        let xps = XYZImage.shared.返回GPSDictionary(URLX: pathX.url)
//    //        print(xps)
//    func 返回GPSDictionary(URLX:URL) -> [String:AnyObject]? {
//        self.XYZURL = URLX
//        if let img = CIImage(contentsOf: URLX){
//            
//            
//            let metadata = img.properties
//            
//            if let gpsData = metadata[kCGImagePropertyGPSDictionary as String] as? [String:AnyObject]{
//                self.Latitude = gpsData["Latitude"] as? String
//                self.Longitude = gpsData["Longitude"]  as? String
//                self.LatitudeRef = gpsData["LatitudeRef"] as? String
//                self.LongitudeRef = gpsData["LongitudeRef"]  as? String
//                self.Altitude = gpsData["Altitude"]  as? String
//                return gpsData
//            }else{
//                return nil
//            }
//            
//            
//            
//        }
//        return nil
//    }
//    
//    
//    //    let xxxx = XYZImage.shared.返回相片具体数据(URLX: url)
//    //    print(xxxx)
//    func 返回相片具体数据(URLX:URL) -> AnyObject?{
//        let imageSource = CGImageSourceCreateWithURL(URLX as CFURL, nil)!
//        let imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil) as Dictionary?
//        if let exifDict = imageProperties?[kCGImagePropertyExifDictionary]{
//            
//            
//            if let x = exifDict as? Dictionary<String,AnyObject>{
//                if let datex = x["DateTimeDigitized"] as? String{
//                    //                    print("l🐵🐵🐵🐵🐵🐵🐵🐵")
//                    self.creationDate = String.ToDate(dateString: datex, format: "YYYY:MM:dd HH:mm:ss")
//                    
//                }
//                if let LensModelx = x["LensModel"] as? String{
//                    //                                        print("l🐵🐵🐵🐵🐵🐵🐵🐵")
//                    self.LensModel = LensModelx
//                    //                    print(LensModelx)
//                }
//                if let LensMakex = x["LensMake"] as? String{
//                    //                    print("l🐵🐵🐵🐵🐵🐵🐵🐵")
//                    self.LensMake = LensMakex
//                    //                    print(LensMakex)
//                }
//                
//                
//            }
//            
//            
//            return exifDict
//            
//        }else{
//            return nil
//        }
//        
//        
//        
//    }
//    
//    
//    func 返回UIImage的一些属性(URLX:URL)  {
//        
//        
//        //        print(imagex?.size)
//        //        print(imagex?.imageOrientation.rawValue)
//    }
//    
//    
//}
