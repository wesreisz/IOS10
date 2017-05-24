//
//  ViewController.swift
//  Egg Timer
//
//  Created by Wesley Reisz on 5/23/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblTimerDisplay: UILabel!
   
    var eggTimer = EggTimer()
    var timer : Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func pausePressed(_ sender: Any) {
        eggTimer.pauseTimer()
        timer.invalidate()
        updateUI()
    }

    @IBAction func playPressed(_ sender: Any) {
        print("Timer Running")
        eggTimer.runTimer()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
            _ in self.updateUI()
        }

    }
    
    @IBAction func resetPressed(_ sender: Any) {
        eggTimer.resetTimer()
        timer.invalidate()
        updateUI()
    }
    
    @IBAction func decrementTenPressed(_ sender: Any) {
        print("-10 seconds here")
        eggTimer.adjustTimer(amountToAdjust: -10)
        updateUI()
    }
    
    @IBAction func incrementTenPressed(_ sender: Any) {
        print("-10 seconds here")
        eggTimer.adjustTimer(amountToAdjust: 10)
        updateUI()
    }
    
    func updateUI(){
        lblTimerDisplay.text = String(eggTimer.currentCounter)
    }
    
    
}

