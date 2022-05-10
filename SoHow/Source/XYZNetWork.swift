//
//  XYZNetWork.swift
//  SoHow
//
//  Created by zhangzihao on 2022/5/10.
//  Copyright © 2022 张子豪. All rights reserved.
//

import UIKit

//class XYZNetWork: UIView {
//
//    /*
//    // Only override draw() if you perform custom drawing.
//    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
//        // Drawing code
//    }
//    */
//
//}

//UIDevice.getDeviceCellularIP()
public extension UIDevice{
    static var DeviceCName     :String = ""
    static var Devicecid        :String = ""
    static var DeviceCIP        :String = ""

    
    
    static func getDeviceCellularIP(){
        getcname_cid_cip { DeviceCNamex, Devicecidx, DeviceCIPx in
             
             DeviceCName     = DeviceCNamex
             Devicecid       = Devicecidx
             DeviceCIP       = DeviceCIPx
//            print( DeviceCName, Devicecid, DeviceCIP )
        }
    }
    
    static func getcname_cid_cip(backBlock: @escaping ((String,String,String)->())){
        
          let ipURL = URL(string: "https://pv.sohu.com/cityjson?ie=utf-8")
           
          var ip: String? = nil
          do {
              if let ipURL = ipURL {
                  ip = try String(contentsOf: ipURL, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
              }
          } catch {
          }
          //判断返回字符串是否为所需数据
          if ip?.hasPrefix("var returnCitySN = ") ?? false {
              //对字符串进行处理，然后进行json解析
              //删除字符串多余字符串
              let range = NSRange(location: 0, length: 19)
              if let subRange = Range<String.Index>(range, in: ip ?? "") { ip?.removeSubrange(subRange) }
              let nowIp = (ip as NSString?)?.substring(to: (ip?.count ?? 0) - 1)
              //将字符串转换成二进制进行Json解析
              let data = nowIp?.data(using: .utf8)
              var dict: [String : Any]? = nil
              do {
                  if let data = data {
                      dict = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any]
                  }
              } catch {
              }
              guard let dict = dict else{return}//print("\(dict)")
              
              let cname = dict["cname"] as? String ?? ""
              let cid = dict["cid"] as? String ?? ""
              let cip = dict["cip"] as? String ?? ""
               
              backBlock(cname,cid,cip)
          }else{
              backBlock("","","")
          }
          
      }
}
