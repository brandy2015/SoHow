//
//  XYZplayerHelper.swift
//  WozaiChat
//
//  Created by zhangzihao on 2021/3/9.
//
import UIKit
import AVFoundation


public class XYZplayerHelper: NSObject {
    //第一种方式，简单的音频播放
//    func playSound(audioUrl: NSURL, isAlert: Bool , playFinish: ()->()) {
//        // 一. 获取 SystemSoundID
//        //   参数1: 文件路径
//        //   参数2: SystemSoundID, 指针
//        let urlCF = audioUrl as CFURL
//        var systemSoundID: SystemSoundID = 0
//        AudioServicesCreateSystemSoundID(urlCF, &systemSoundID)
////        AudioServicesDisposeSystemSoundID(systemSoundID)
//        // 二. 开始播放
//        if isAlert {
//            // 3. 带振动播放, 可以监听播放完成(模拟器不行)
//            AudioServicesPlayAlertSound(systemSoundID)
//        }else {
//            // 3. 不带振动播放, 可以监听播放完成
//            AudioServicesPlaySystemSound(systemSoundID)
//        }
//        playFinish()
//
//    }
    
    //第二种使用AVAudioPlayer播放
    // 获取音频会话
    public let session = AVAudioSession.sharedInstance()
    public var player: AVAudioPlayer?
    public var currentURL : URL?
    public var playingX = false
    
    
    public weak var delegateX: AVAudioPlayerDelegate? = nil
    
    public override init() {
        super.init()
        do{
            //  设置会话类别
            try session.setCategory(AVAudioSession.Category.playback)
            //  激活会话
            try session.setActive(true)
        }catch {
            print(error)
            return
        }
    }
    
    //paly music
    public func playMusic(filePath: String) {
        guard let url =  URL(string: filePath) else {
            return//url不存在
        }
        do{
            //AVAudioSessionCategoryPlayback扬声器模式
            try session.setCategory(AVAudioSession.Category.playback)
        }catch {
            print(error)
            return
        }
       //如果播放的音乐与之前的一样，则继续播放
        if currentURL == url {
            player?.play()
            playingX = true
            return
        }
        do {
            player = try AVAudioPlayer(data: FileManager.default.contents(atPath: filePath)!)
            
            currentURL = url
            player?.delegate = delegateX//self
            //开启红外感知功能
//            UIDevice.currentDevice().proximityMonitoringEnabled = true
//            NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(proxumityStateChange), name: "UIDeviceProximityStateDidChangeNotification", object: nil)
            player?.prepareToPlay()
            player?.play()
            print("播放成功，文件路径 ==\(url)")
        }catch {
            print(error)
            return
        }
    }
    
     //配合红外感知功能
//    func proxumityStateChange(notification:NSNotification){
//        if UIDevice.currentDevice().proximityState == true{
//            //使用听筒模式，屏幕变暗
//            do{
//                try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
//            }catch {
//                print(error)
//                return
//            }
//        }else{
//            //使用扬声器模式
//            do{
//                try session.setCategory(AVAudioSessionCategoryPlayback)
//            }catch {
//                print(error)
//                return
//            }
//        }
//    }
    
    // 暂停当前歌曲/pause current music
    public func pauseCurrentMusic() -> () {
        player?.pause()
    }
    
    // 继续播放当前歌曲/continue to play current music
    public func resumeCurrentMusic() -> () {
        player?.play()
    }
    
    // 播放到指定时间/play music to specified time
    public func seekToTime(time: TimeInterval) -> () {
        player?.currentTime = time
    }
    
    
    public class func getFormatTime(timeInterval: TimeInterval) -> String {
        let min = Int(timeInterval) / 60
        let sec = Int(timeInterval) % 60
        let timeStr = String(format: "%02d:%02d", min, sec)
        return timeStr
    }
    
    public class func getTimeInterval(formatTime: String) -> TimeInterval {
        // 00:00.89 == formatTime
        let minSec = formatTime.components(separatedBy: ":")
        if minSec.count == 2 {
            let min = TimeInterval(minSec[0]) ?? 0
            let sec = TimeInterval(minSec[1]) ?? 0
            return min * 60 + sec
        }
        return 0
    }
}
 
