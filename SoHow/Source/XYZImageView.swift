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



import AVFoundation
public extension UIImageView{
    func GetPreviewImageWith(URL:URL)  {
        //需要做异步处理
        let asset = AVURLAsset.init(url: URL, options: nil)
        let gen = AVAssetImageGenerator.init(asset: asset)
        gen.appliesPreferredTrackTransform = true
        let time = CMTimeMakeWithSeconds(0.0, preferredTimescale: 1)
        var actualTime : CMTime = CMTimeMakeWithSeconds(0, preferredTimescale: 0)
        do {
            let image = try gen.copyCGImage(at: time, actualTime: &actualTime)
            self.image = UIImage.init(cgImage: image)
        } catch  {
            print("错误")
        }
    }
}
 



//如果出现图片颠倒，用这个方法
public extension UIImage{
    var GetCorrectPhoto:UIImage?{
        return  Normalizedimage(image:self)
    }
    private func Normalizedimage(image:UIImage)->UIImage{
        if image.imageOrientation == .up{return image}else{
            UIGraphicsBeginImageContext(image.size)
            image.draw(in: CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: image.size))
            let normalizedimage = UIGraphicsGetImageFromCurrentImageContext()
            return normalizedimage ?? UIImage()
        }
    }
}

//从字符串用作照片名字获取照片UIImage
public extension String{
    var ToImg:UIImage?{
        return UIImage(named: self)
    }
    
    var ToColor:UIColor?{
        return UIColor(named: self)
    }
}


//取圆头像
public extension UIImageView{
    func ToCircle()   {
        self.layer.masksToBounds = true
        self.layer.cornerRadius =  self.bounds.width/2
    }
    
}

//圆角
public extension UIView{
    func CornerRadius(cornerRadius:CGFloat = 20) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
}
//MARK: - 压缩图片大小
public func y压缩imageCompress(originalImage: UIImage,压缩比:CGFloat = 0.5) -> UIImage?{
    guard let imageData = originalImage.jpegData(compressionQuality: 压缩比)else{return originalImage}
    return UIImage(data: imageData) ?? nil
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


//public func b保存图片(image:UIImage,图片名称:String = "imageData",是否保存:Bool){
//    if 是否保存{
//        let userDefault = UserDefaults.standard
//        let imageData:Data = NSKeyedArchiver.archivedData(withRootObject: image)
//        userDefault.set(imageData, forKey: 图片名称)
//    }else{ print("没有保存")}
//}
//
//
//
//
//public func b保存GIF图片(image:UIImage,图片名称:String = "imageData",是否保存:Bool){
//    if 是否保存{
//        let userDefault = UserDefaults.standard
//        let imageData:Data = NSKeyedArchiver.archivedData(withRootObject: image)
//        userDefault.set(imageData, forKey: 图片名称)
//        print("\n\n\n\n\n\n\n\n")
//        print("保存了GIF" + 图片名称)
//
//        print("\n\n\n\n\n\n\n\n")
//    }else{ print("没有保存")}
//}



//public func d读取图片(图片名字:String) -> UIImage  {
//    let userDefault = UserDefaults.standard
//    let objData = userDefault.object(forKey: 图片名字) as? Data
//    let 解包objData = objData ?? userDefault.object(forKey: "default") as? Data
//    let myImage = NSKeyedUnarchiver.unarchiveObject(with: 解包objData ?? Data()) as? UIImage
//    return myImage ?? #imageLiteral(resourceName: "default")
//}



import Foundation
import UIKit
import QuartzCore

public extension UIImageView {
    
    /**
     Loads an image from a URL. If cached, the cached image is returned. Otherwise, a place holder is used until the image from web is returned by the closure.
     
     - Parameter url: The image URL.
     - Parameter placeholder: The placeholder image.
     - Parameter fadeIn: Weather the mage should fade in.
     - Parameter closure: Returns the image from the web the first time is fetched.
     
     - Returns A new image
     */
    func imageFromURL(_ url: String, placeholder: UIImage, fadeIn: Bool = true, shouldCacheImage: Bool = true, closure: ((_ image: UIImage?) -> ())? = nil){
        self.image = UIImage.image(fromURL: url, placeholder: placeholder, shouldCacheImage: shouldCacheImage) {
            (image: UIImage?) in
            
            guard let imageX = image else{closure?(nil);return}
            self.image = imageX
            if fadeIn {
                let transition = CATransition()
                transition.duration = 0.5
                transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                transition.type = .fade
                self.layer.add(transition, forKey: nil)
            }
            closure?(image)
        }
    }
    
    
}


//图片添加阴影
//override func viewDidLoad() {
//    super.viewDidLoad()
//
//    //图片添加阴影
//    self.imageView1.layer.shadowOpacity = 0.8
//    self.imageView1.layer.shadowColor = UIColor.blackColor().CGColor
//    self.imageView1.layer.shadowOffset = CGSize(width: 1, height: 1)
//
//    //图片添加阴影(透明背景)
//    self.imageView2.layer.shadowOpacity = 0.8
//    self.imageView2.layer.shadowColor = UIColor.blackColor().CGColor
//    self.imageView2.layer.shadowOffset = CGSize(width: 1, height: 1)
//    self.imageView2.layer.shadowRadius = 1
//
//    //按钮添加阴影
//    self.button1.layer.shadowOpacity = 0.8
//    self.button1.layer.shadowColor = UIColor.blackColor().CGColor
//    self.button1.layer.shadowOffset = CGSize(width: 1, height: 1)
//}




//1，扩展UIImage
//这里先对 UIImage 进行扩展，增加两个方法，分别用于尺寸的重置和大小缩放。
//
//原文出自：www.hangge.com  转载请保留原文链接：http://www.hangge.com/blog/cache/detail_1344.html
//import UIKit
//
//extension UIImage {
//    /**
//     *  重设图片大小
//     */
//    func reSizeImage(reSize:CGSize)->UIImage {
//        //UIGraphicsBeginImageContext(reSize);
//        UIGraphicsBeginImageContextWithOptions(reSize,false,UIScreen.mainScreen().scale);
//        self.drawInRect(CGRectMake(0, 0, reSize.width, reSize.height));
//        let reSizeImage:UIImage = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        return reSizeImage;
//    }
//
//    /**
//     *  等比率缩放
//     */
//    func scaleImage(scaleSize:CGFloat)->UIImage {
//        let reSize = CGSizeMake(self.size.width * scaleSize, self.size.height * scaleSize)
//        return reSizeImage(reSize)
//    }
//}
//import UIKit
//
//class ViewController: UIViewController {
//    
//    let image = UIImage(named:"img.jpg")
//    
//    @IBOutlet weak var imageView: UIImageView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//    
//    //显示原始图片
//    @IBAction func btn1Click(sender: AnyObject) {
//        imageView.image = image
//    }
//    
//    //将图片修改成指定尺寸（160*100）
//    @IBAction func btn2Click(sender: AnyObject) {
//        let reSize = CGSize(width: 240, height: 150)
//        imageView.image = image?.reSizeImage(reSize)
//    }
//    
//    //将图片缩小成原来的一半
//    @IBAction func btn3Click(sender: AnyObject) {
//        imageView.image = image?.scaleImage(0.5)
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//}


//        //首先创建一个模糊效果
//        let blurEffect = UIBlurEffect(style: .light)
//        //接着创建一个承载模糊效果的视图
//        let blurView = UIVisualEffectView(effect: blurEffect)
//        //设置模糊视图的大小（全屏）
//        blurView.frame.size = CGSize(width: view.frame.width, height: view.frame.height)
//        //添加模糊视图到页面view上（模糊视图下方都会有模糊效果）
//        self.view.addSubview(blurView)


//
//public extension UIView{
//    public var width :CGFloat { return self.frame.width  }
//    public var height:CGFloat { return self.frame.height }
//
//    public func widthX(_ separateBy:Double) -> CGFloat {
//        return self.frame.width * CGFloat(separateBy)
//    }
//    public func height(_ separateBy:Double) -> CGFloat {
//        return self.frame.height * CGFloat(separateBy)
//    }
//    public func addShadow(backgroundColor:UIColor = UIColor.white){
//        self.backgroundColor = backgroundColor
//        self.layer.shadowOffset = CGSize(width: 0, height: 2)
//        self.layer.shadowRadius = 2
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowOpacity = 0.5
//    }
//    public func addImage(UIImageX:UIImage?){
//        let RectX = CGRect(x: 0, y: 0, width: self.width, height: self.height)
//        let x = UIImageView(frame: RectX)
//        x.image = UIImageX
//        self.addSubview(x)
//    }
//}
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
