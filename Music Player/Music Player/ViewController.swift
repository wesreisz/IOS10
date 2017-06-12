//
//  ViewController.swift
//  Music Player
//
//  Created by Wesley Reisz on 6/12/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    let fileName2Play = "infoq-17-jun-podcast-Sid-Anand"
    var soundPlayer: AVAudioPlayer!
    var currentTime = 0.0
    var timer = Timer()
    
    //outlets
    @IBOutlet weak var volume: UISlider!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var fileName: UILabel!
    @IBOutlet weak var scrubber: UISlider!
    @IBOutlet weak var timerDisplay: UILabel!
    
    //actions
    @IBAction func playButton(_ sender: Any) {
        if soundPlayer==nil{
            load()
        }
        soundPlayer.play()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateSlider), userInfo: nil, repeats: true)
        
    }
    @IBAction func pauseButton(_ sender: Any) {
        soundPlayer.pause()
        timer.invalidate()
    }
    @IBAction func stopButton(_ sender: Any) {
        soundPlayer.stop()
        timer.invalidate()
        load()
    }
    @IBAction func volumeAdjust(_ sender: UISlider) {
        let val = Float(sender.value)
        soundPlayer.setVolume(val, fadeDuration: 0.5)
    }
    @IBAction func scrubberChanged(_ sender: Any) {
        if soundPlayer==nil{
            return
        }
        soundPlayer.currentTime=TimeInterval(scrubber.value)
        timerDisplay.text = String(soundPlayer.currentTime)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        load()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateSlider(){
        scrubber.value=Float(soundPlayer.currentTime)
        timerDisplay.text = String(soundPlayer.currentTime)
    }
    
    internal func load(){
        let filePath = Bundle.main.path(forResource: fileName2Play, ofType: "mp3")
        
        do{
            let url = URL(fileURLWithPath: filePath!)
            soundPlayer = try AVAudioPlayer(contentsOf: url)
            fileName.text = fileName2Play
            scrubber.maximumValue = Float(soundPlayer.duration)
         
            print("File loaded and prepared")
        }catch{
            print("Couldn't Load file")
        }
    }
    
}

