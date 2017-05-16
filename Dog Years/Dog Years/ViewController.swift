
//
//  ViewController.swift
//  Dog Years
//
//  Created by Wesley Reisz on 5/16/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let BASE_MULTIPLIER: Int = 7

    @IBOutlet weak var txtDisplay: UILabel!
    @IBOutlet weak var inputPersonYears: UITextField!
    
    @IBAction func btnSubbmit(_ sender: Any) {
        
        if let age = Int((inputPersonYears.text)!) {
            txtDisplay.text = "Your dog is \(age*BASE_MULTIPLIER)"
        }else {
            txtDisplay.text = "Please enter a number"
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

   

}

