//
//  XYZImage.swift
//  SoHow
//
//  Created by 张子豪 on 2019/1/22.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit
import MobileCoreServices            //picker.mediaTypes的类型
import PhotosUI                      //LivePhoto使用的依赖库


public class XYZImage: NSObject {

}
//public func 处理头像圆角(处理的ImageView:UIImageView,圆角大小:CGFloat = 2)   {
//    处理的ImageView.layer.masksToBounds = true
//    处理的ImageView.layer.cornerRadius =  处理的ImageView.bounds.width/圆角大小
//}


public extension UIImageView{
    public func ToCircle()   {
        self.layer.masksToBounds = true
        self.layer.cornerRadius =  self.bounds.width/2
    }
    
}
//圆角
public extension UIView{
    public func CornerRadius(cornerRadius:CGFloat = 20) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
    
    
}
//public func cornerRadius处理Image的圆角(layer: CALayer,cornerRadius:CGFloat = 20)  {
//    layer.masksToBounds = true
//    layer.cornerRadius = cornerRadius
//}

//MARK: - 压缩图片大小
public func y压缩imageCompress(originalImage: UIImage,压缩比:CGFloat = 0.5) -> UIImage{
    
    guard let imageData = originalImage.jpegData(compressionQuality: 压缩比)else{
        return originalImage
    }
    let compressImage = UIImage(data: imageData)!
    return compressImage
}





public extension UIView{
    public var width :CGFloat { return self.frame.width  }
    public var height:CGFloat { return self.frame.height }
    
    public func widthX(_ separateBy:Double) -> CGFloat {
        return self.frame.width * CGFloat(separateBy)
    }
    public func height(_ separateBy:Double) -> CGFloat {
        return self.frame.height * CGFloat(separateBy)
    }
    public func addShadow(backgroundColor:UIColor = UIColor.white){
        self.backgroundColor = backgroundColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 2
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
    }
    public func addImage(UIImageX:UIImage?){
        let RectX = CGRect(x: 0, y: 0, width: self.width, height: self.height)
        let x = UIImageView(frame: RectX)
        x.image = UIImageX
        self.addSubview(x)
    }
}


public func d读取图片地址(图片名字:String) -> String  {  //未真正启用
    let userDefault = UserDefaults.standard
    var objData = userDefault.object(forKey: 图片名字) as? Data
    if let objData1 = objData {
        objData = objData1
    }else{
        objData = userDefault.object(forKey: "default") as? Data
    }
    let myImage = ""
    return myImage
}


public func b保存图片(image:UIImage,图片名称:String = "imageData",是否保存:Bool){
    if 是否保存{
        let userDefault = UserDefaults.standard
        let imageData:Data = NSKeyedArchiver.archivedData(withRootObject: image)
        userDefault.set(imageData, forKey: 图片名称)
    }else{ print("没有保存")}
}




public func b保存GIF图片(image:UIImage,图片名称:String = "imageData",是否保存:Bool){
    if 是否保存{
        let userDefault = UserDefaults.standard
        let imageData:Data = NSKeyedArchiver.archivedData(withRootObject: image)
        userDefault.set(imageData, forKey: 图片名称)
        print("\n\n\n\n\n\n\n\n")
        print("保存了GIF" + 图片名称)
        
        print("\n\n\n\n\n\n\n\n")
    }else{ print("没有保存")}
}



public func d读取图片(图片名字:String) -> UIImage  {
    let userDefault = UserDefaults.standard
    let objData = userDefault.object(forKey: 图片名字) as? Data
    let 解包objData = objData ?? userDefault.object(forKey: "default") as? Data
    let myImage = NSKeyedUnarchiver.unarchiveObject(with: 解包objData ?? Data()) as? UIImage
    return myImage ?? #imageLiteral(resourceName: "default")
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
