//
//  用户名和用户数组.swift
//  SoHow
//
//  Created by 张子豪 on 2017/12/20.
//  Copyright © 2017年 张子豪. All rights reserved.
//

import UIKit


public var 用户数组和密码 = ["丝丝大兄弟":"58ce","Fandel":"78del","Linda":"15nda","Phoebe":"37eb","default":"default","子豪":"zhangqian333","David":"vid2016","Ian":"Ian2016","Sky":"ky2016","iElaine":"ine2016","Nancy":"ac7y256","Carrie":"r0ie321","孙经淞":"sun201758"]//,"陈睿":"cheni203"]
public var 用户数组 =  ["丝丝大兄弟","Linda","Phoebe","default","子豪","David","Ian","Sky","iElaine","Nancy","Carrie","孙经淞"]//"陈睿"


//var 用户数组2 =
public var 用户数组和新增评论数是否查看了 = ["丝丝大兄弟":0,"Fandel":0,"Linda":0,"Phoebe":0,"default":0,"子豪":0,"Ian":0,"David":0,"Sky":0,"iElaine":0,"Nancy":0,"Carrie":0,"陈睿":0,"孙经淞":0]


//返回当前登录用户

public func 当前登录用户() -> String{
    let _UserName:String! = UserDefaults.standard.string(forKey: "Username")
    if _UserName != nil{ return _UserName}else{ return "default"}
}

//判断当前是否登录
public func 判断当前是否登录() -> Bool{
    return 当前登录用户() != ""
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





public func b保存数组到文件testSaveDicPlist(字典:[String:String],写入地址:String = ""){
    let filePath:String = NSHomeDirectory() + "/Documents/" + 写入地址 + "tfDic.plist"
    NSDictionary(dictionary: 字典).write(to: URL(fileURLWithPath: filePath), atomically: true)
}

public func d从文件读取数组(路径:String = "") -> [String:String] {
    let 路径2 = NSHomeDirectory() + "/Documents/tfDic.plist"
    let dict = NSDictionary(contentsOfFile: 路径2) as? [String:String]
    return dict ?? [:]
}



public func 读取好友列表() -> [String] {
    let _FriendsList = UserDefaults.standard.array(forKey: "FriendsList") as? [String]
    return _FriendsList ?? [""]
}


public func j计算时间差剩余保护时间(时间保护的时间:Date) -> String  {
    //获取现在的时间
    let date1 = Date()
    let interval:TimeInterval = 时间保护的时间.timeIntervalSince(date1)
    return "\(interval)"
}


public func j计算时间差和返回是否受时间保护(时间保护的时间:Date) -> Bool  {
    
    var 是否受保护 = true
    //获取现在的时间
    let date1 = Date()
    let interval:TimeInterval = 时间保护的时间.timeIntervalSince(date1)
    if (interval as Double) <= 0{是否受保护 = false}
    return 是否受保护
}






public func d读取图片(图片名字:String) -> UIImage  {
    let userDefault = UserDefaults.standard
    let objData = userDefault.object(forKey: 图片名字) as? Data
    let 解包objData = objData ?? userDefault.object(forKey: "default") as? Data
    let myImage = NSKeyedUnarchiver.unarchiveObject(with: 解包objData ?? Data()) as? UIImage
    return myImage ?? #imageLiteral(resourceName: "default")
}



public func b保存string到本地(保存的内容:String,文件名称:String)  {
    var sp = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
    if sp.count > 0 {
        url = URL(fileURLWithPath: "\(sp[0])/" + "\(文件名称)" + "data.txt")
        print(url)
        let data = NSMutableData()
        
        let x = 保存的内容
        let m = x.data(using: String.Encoding.utf8, allowLossyConversion:true)!
        let mtodata = NSData(data: m) as Data
        
        
        data.append(mtodata)
        data.write(toFile: url.path, atomically: true)
        print("end")
    }
}


public func b保存数组array到本地(保存的内容:Array<String>,文件名称:String)  {
    var sp = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
    if sp.count > 0 {
        url = URL(fileURLWithPath: "\(sp[0])/" + "\(文件名称)" + "data.txt")
        print(url)
        let m = 保存的内容 as NSArray
        m.write(toFile: url.path, atomically: true)
        print("保存文件成功" + 文件名称)
    }
}


public func d从文件读取数组返回数组(文件名称:String = "") -> Array<String> {
    var url2 = URL(fileURLWithPath: "")
    var sp = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
    if sp.count > 0 {
        url2 = URL(fileURLWithPath: "\(sp[0])/" + "\(文件名称)" + "data.txt")
        print(url2)
    }
    
    let 路径2 = url2.relativeString//NSHomeDirectory() + "/Documents/tfDic.plist"
    
    let array1 = NSArray(contentsOfFile: 路径2) as? Array<String>
    return array1 ?? []
}

public func b保存字典dic到本地(保存的内容:Dictionary<String,String>,文件名称:String)  {
    var sp = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
    if sp.count > 0 {
        url = URL(fileURLWithPath: "\(sp[0])/" + "\(文件名称)" + "data.plist")
        print(url)
        let m = 保存的内容 as NSDictionary
        m.write(toFile: url.path, atomically: true)
        print("保存文件成功" + 文件名称)
    }
}

public func d从文件读取字典返回字典(文件名称:String = "") -> [String:String] {
    
    var url2 = URL(fileURLWithPath: "")
    var sp = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
    if sp.count > 0 {
        url2 = URL(fileURLWithPath: "\(sp[0])/" + "\(文件名称)" + "data.plist")
        print(url2)
    }
    
    let 路径2 = url2.relativeString//NSHomeDirectory() + "/Documents/tfDic.plist"
    
    print("路径2" + 路径2)
    
    var dict = NSMutableDictionary(contentsOf: url2) as? [String:String]
    if dict == nil{dict = [:]}
    return dict!
}










