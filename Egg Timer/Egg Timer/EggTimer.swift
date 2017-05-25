//
//  EggTimer.swift
//  Egg Timer
//
//  Created by Wesley Reisz on 5/24/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import Foundation

class EggTimer{
    final let MAX_TIMER_COUNT:Int = 210
    
    var currentCounter: Int = 0
    var timer : Timer
    
    init(){
        currentCounter=MAX_TIMER_COUNT
        timer = Timer()
    }
    
    init(withCountOf:Int){
        currentCounter=withCountOf
        timer = Timer()
    }
    
    func runTimer(){
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
            _ in self.adjustTimer(amountToAdjust: -1)
        }
    }
    
    func resetTimer(){
        timer.invalidate()
        currentCounter = MAX_TIMER_COUNT
        timer = Timer()
    }
    
    func pauseTimer(){
        timer.invalidate()
    }
    
    func adjustTimer(amountToAdjust: Int){
        if currentCounter + amountToAdjust > 0{
            currentCounter += amountToAdjust
        }else{
            currentCounter = 0
            timer.invalidate()
        }
    }


}
