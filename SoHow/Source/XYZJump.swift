//
//  JumpToSystem.swift
//  SoHow
//
//  Created by 张子豪 on 2019/1/22.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit

public class XYZJump: NSObject {
    public static var To = XYZJump()
    
    //MARK: -跳转到系统相册 - Jump to System Album
    /// 跳转到系统相册 - Jump to System Album
    /// - Parameters:
    ///   - a: not
    ///   - b: not
    public func Album() {decodejump(To: "cGhvdG9zLXJlZGlyZWN0Oi8v")}
    public func iBooks(){saveJump(To: "ibooks://")}
    public func Music() {saveJump(To: "music://")}
    public func Videos(){saveJump(To: "videos://")}
    public func SMS(To Num:String)   {
        saveJump(To: "sms://" + Num)
    }
    public func EMail(To Emails:[String])  {
        var eMails = ""
        for i in Emails{
            eMails += i + ","
        }
        saveJump(To: "mailto://" + eMails)
    }
        
    public func Tel(To Num:String)   {saveJump(To: "tel://" + Num)}
//    备忘录
    public func Note()  {saveJump(To: "mobilenotes://")}
    public func Maps()  {saveJump(To: "maps://")}
    public func Safari(URLString:String)  {
        if URLString.contains("https://"){
            saveJump(To: URLString )
        }else if URLString.contains("http://"){
            saveJump(To: URLString )
        }else{
            saveJump(To: "https://" + URLString )
        }
    }
    public func AppStore(AppURLString:String? = nil)  {
        if let AppURL = AppURLString,AppURL.contains("https"){
            guard let x = URL(string: AppURL) else{return};print(x)
            UIApplication.shared.open(x, options: Dictionary(), completionHandler: nil)
        }else{saveJump(To: "itms-apps://")}
    }
    public func Setting()  {
        guard let Setting = URL(string: UIApplication.openSettingsURLString) else{return}
        DispatchQueue.main.async {
            UIApplication.shared.open(Setting, options: Dictionary(), completionHandler: nil)
        }
        
    }
    
    
    public func 在AppStore评论(AppURLString:String)  {
        if let AppURL = URL(string: AppURLString), UIApplication.shared.canOpenURL(AppURL) {
            UIApplication.shared.open(AppURL, options: [:]) { (succeed) in
                if succeed{
                    print("已经打开")
                }else{
                    print("打开不开")
                }
            }
            
            
        }
    }
    
    
    
    
    //跳转到日历
    public func Calendar(){saveJump(To: "calshow://")}
    //跳转到提醒事项
    public func Reminder(){
        if #available(iOS 13.0, *) {
            
            //高于 iOS 13.0
            saveJump(To: "x-apple-reminderkit://")
        } else {
            
            //低于 iOS 13.0
             saveJump(To: "x-apple-reminder://")
        }
       
        
        
        
    }
        
//    public func ()  {saveJump(To: )}
//    public func ()  {saveJump(To: )}
//    public func ()  {saveJump(To: )}
//    public func ()  {saveJump(To: )}
    
    
    
    
    
    //需要商榷
//    TOUCHID
    public func TOUCHID()  {
        decodejump(To: "QXBwLVByZWZzOnJvb3Q9VE9VQ0hJRF9QQVNTQ09ERQ==")
    }
    
    
    
    
    
    public func saveJump(To code:String) {
        guard let x = URL(string: code) else{return}
    
        UIApplication.shared.open(x, options: Dictionary(), completionHandler: nil)
    }
    
    private func decodejump(To code:String) {
        //跳转
        let urlStr = decode(code)
        if let url = URL(string:urlStr) {
            if #available(iOS 10.0, *) {
                DispatchQueue.main.async {
                    UIApplication.shared.open(url, options: Dictionary(), completionHandler: nil)
                }
            } else { UIApplication.shared.openURL(url)}}
    }
    
    //base64解码
    private func decode(_ string: String) -> String {
        let data = Data(base64Encoded: string, options: [])
        let decodedStr = String(data: data ?? Data(), encoding: .utf8)
        return decodedStr ?? ""
    }

    
    // FIXME:要解决的BUG
}

//第三方软件 需要添加白名单
extension XYZJump{
    
    
    func Wechat()   {saveJump(To: "weixin://")}
    func TaoBao()   {saveJump(To:"taobao://") }
    func 大众点评()  {saveJump(To:"dianping:// ") }
    func Weibo()    {saveJump(To:"sinaweibo://") }
    func 名片全能王() {saveJump(To:"camcard://") }
    func Alipay()   {saveJump(To:"alipay://") }
    func 豆瓣fm()    {saveJump(To:"doubanradio://") }
    func 京东()      {saveJump(To:"jdmoble://") }
    func 人人()      {saveJump(To:"renren://") }
    func 知乎()      {saveJump(To:"zhihu://") }
    func 优酷()      {saveJump(To:"youku://") }
    func QQ()       {saveJump(To:"mqq://") }
}
