//
//  XYZAudio.swift
//  SoHow
//
//  Created by 张子豪 on 2019/8/6.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit
//
//iOS音频开发(录音+播放+剪辑+合成+压缩转码)
//https://blog.csdn.net/feng2qing/article/details/67655175



//https://www.jianshu.com/p/f851970cb8ee
//https://github.com/D-james/EditAudioVideo-swift
//https://www.jianshu.com/p/f851970cb8ee
/*
class XYZAudio: NSObject {
    override func viewDidLoad() {
        super.viewDidLoad()
        //裁剪音频
        seeMuisc()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func seeMuisc() {
        //找到本地文件所在的目录地址
        let filePathFive = Bundle.main .path(forResource: "five", ofType: "mp3")
        //开始裁剪
        audioCrop(url: NSURL.fileURL(withPath: filePathFive!) as NSURL, startTime: CMTime.init(value: 0, timescale: 1), endTime: CMTime.init(value: 88, timescale: 1))
        
    }
    func audioCrop(url:NSURL ,startTime:CMTime ,endTime:CMTime) {
        //拼接输出地址
        let outPath = composeDir() + "fiveM.m4a"
        //输出地址
        let audioFileOutput = URL.init(fileURLWithPath: outPath)
        do {
            //如果有与该文件同名的删除
            try FileManager.default.removeItem(at: audioFileOutput)
        } catch  {
            
        }
        //取出本地的数据
        let asset = AVAsset(url: url as URL)
        //开始裁剪
        let exportSession = AVAssetExportSession.init(asset: asset, presetName: AVAssetExportPresetAppleM4A)
        let exportTimeRange = CMTimeRangeMake(startTime, endTime)
        exportSession?.outputFileType = AVFileType.m4a
        exportSession?.outputURL = audioFileOutput
        exportSession?.timeRange = exportTimeRange
        exportSession?.exportAsynchronously(completionHandler: {
            if AVAssetExportSessionStatus.completed == exportSession?.status {
                print("\(outPath)")
            }else if AVAssetExportSessionStatus.failed == exportSession?.status {
                print("\(String(describing: exportSession?.error?.localizedDescription))")
            }
        })
        
    }
    func composeDir() -> (String)  {
        //获取本地存储的地址
        let cacheDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let fileManage = FileManager.default
        let composeDir =  cacheDir[0] + "/MMMMM/"
        let existed = fileManage.fileExists(atPath: composeDir)
        if existed == false {
            do {
                try fileManage.createDirectory(atPath: composeDir, withIntermediateDirectories: true, attributes: nil)
            }catch{
                
            }
            
        }
        return composeDir
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
*/
