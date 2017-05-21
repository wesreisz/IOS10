//
//  ViewController.swift
//  Is It Prime
//
//  Created by Wesley Reisz on 5/20/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userChoice: UITextField!
    @IBOutlet weak var result: UILabel!
    
    
    @IBAction func isPrimeClickevent(_ sender: Any) {
        guard let inputVal = userChoice.text else{
            result.text = "Please Enter a number"
            return
        }
        
        if let val = Int(inputVal) {
            result.text = "isPrime -> \(isPrime(val))"
        }else{
            result.text = "Please Enter a number"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func isPrime(_ number:Int)-> Bool{
        if number == 1{
            return true
        }
        
        var y = 2
        while y < number {
            if number % y == 0{
                return false
            }
            y+=1
        }
        
        return true
    }


}

