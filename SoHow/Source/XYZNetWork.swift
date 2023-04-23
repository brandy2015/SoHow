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
        DispatchQueue.main.async {
            
            guard let url = URL(string: "https://pv.sohu.com/cityjson?ie=utf-8") else{return}
            
            var ip: String? = nil
            
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data, let ipx = String(data: data, encoding: .utf8) {
                    // 处理获取到的 IP 地址
                    ip = ipx
                } else {
                    // 处理加载失败的情况
                }
            }
            task.resume()
            
            
//            let ipURL = URL(string: "https://pv.sohu.com/cityjson?ie=utf-8")
//
//            var ip: String? = nil
//            do {
//                if let ipURL = ipURL {
//                    ip = try String(contentsOf: ipURL, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
//                }
//            } catch {
//            }
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
}


public extension UIDevice {
    static var WIFIIP:String?{
        return getWIFIIP()
    }
    /**
     Returns device ip address. Nil if connected via celluar.
     */
    static func getWIFIIP() -> String? {
        
        var address: String?
        var ifaddr: UnsafeMutablePointer<ifaddrs>?
        
        if getifaddrs(&ifaddr) == 0 {
            
            var ptr = ifaddr
            while ptr != nil {
                defer { ptr = ptr?.pointee.ifa_next } // memory has been renamed to pointee in swift 3 so changed memory to pointee
                
                guard let interface = ptr?.pointee else {
                    return nil
                }
                let addrFamily = interface.ifa_addr.pointee.sa_family
                if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                    
                    guard let ifa_name = interface.ifa_name else {
                        return nil
                    }
                    let name: String = String(cString: ifa_name)
                    
                    if name == "en0" {  // String.fromCString() is deprecated in Swift 3. So use the following code inorder to get the exact IP Address.
                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                        getnameinfo(interface.ifa_addr, socklen_t((interface.ifa_addr.pointee.sa_len)), &hostname, socklen_t(hostname.count), nil, socklen_t(0), NI_NUMERICHOST)
                        address = String(cString: hostname)
                    }
                    
                }
            }
            freeifaddrs(ifaddr)
        }
        
        return address
    }
    
}
