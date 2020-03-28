//
//  SoundFile.swift
//  QuestionApp
//
//  Created by 守本蒼生 on 2020/03/08.
//  Copyright © 2020 blueforestapps. All rights reserved.
//

import Foundation
import AVFoundation

class SoundFile{
    
    var playerList = Array<AVAudioPlayer>()
        
    func loadSound(fileList: [String], extensionName: String){
        var soundPath: String
        var soundURL: URL
        
        for i in 0..<fileList.count {
            soundPath = Bundle.main.path(forResource: fileList[i], ofType: extensionName)!
            soundURL = URL(fileURLWithPath: soundPath)
            
            do {
                let player: AVAudioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                player.prepareToPlay()
                playerList.append(player)
                
            } catch {
                print("エラーです。")
            }
        }
    }
            
        
//    func initSound(fileName: String, extensionName: String){
//
//        //再生する
//        let soundPath = Bundle.main.path(forResource: fileName, ofType: extensionName)!
//        let soundURL = URL(fileURLWithPath: soundPath)
////        let soundURL = Bundle.main.url(forResource: fileName, withExtension: extensionName)
//
//        do {
//
//            //効果音を鳴らす
//            player0 = try AVAudioPlayer(contentsOf: soundURL)
//            player0?.prepareToPlay()
//        } catch {
//            print("エラーです。")
//        }
//
//    }
    
    func playSound(SoundNumber: Int) {
        playerList[SoundNumber].play()
    }
    
    func stopSound(SoundNumber: Int) {
        playerList[SoundNumber].stop()
    }
}
