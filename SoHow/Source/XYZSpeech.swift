//
//  XYZSpeech.swift
//  SoHow
//
//  Created by 张子豪 on 2019/3/13.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit
import AVFoundation

public class XYZSpeech: NSObject {
    
    public static func f发音内容(内容:String)  {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback, mode: .default, options: .allowAirPlay)
            
        }catch let error as NSError{
            print(error.code)}
        let av = AVSpeechSynthesizer.init()
        let utterance1 = AVSpeechUtterance(string: 内容)
        utterance1.postUtteranceDelay = 1
        utterance1.rate = 0.5
        av.speak(utterance1)
    }
}



