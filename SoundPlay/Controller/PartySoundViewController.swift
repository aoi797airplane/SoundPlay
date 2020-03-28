//
//  PartySoundViewController.swift
//  SoundPlay
//
//  Created by 守本蒼生 on 2020/03/27.
//  Copyright © 2020 blueforestapps. All rights reserved.
//

import UIKit
import AVFoundation
import GoogleMobileAds

class PartySoundViewController: UIViewController {
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    var playList = ["reggaeHorn", "drumRollStart", "drumRollFinish"]
    
    let soundFile = SoundFile()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //音の読み込み
        soundFile.loadSound(fileList: playList, extensionName: "mp3")
        
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func button0(_ sender: Any) {
        soundFile.playSound(SoundNumber: 0)
    }
    
    @IBAction func button1(_ sender: Any) {
        soundFile.playSound(SoundNumber: 1)
    }
    
    @IBAction func button2(_ sender: Any) {
        if soundFile.playerList[1].isPlaying {
            soundFile.stopSound(SoundNumber: 1)
            soundFile.playSound(SoundNumber: 2)
        } else {
            soundFile.playSound(SoundNumber: 2)
        }
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
