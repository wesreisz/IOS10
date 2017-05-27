//
//  ViewController.swift
//  User Phone Number
//
//  Created by Wesley Reisz on 5/26/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //all functions that call user actions
    //are in the userExtensions class
    var usr = String()
    
    
    @IBOutlet weak var txtPhoneDisplay: UILabel!

    @IBAction func addUser(_ sender: Any) {
        selectUser()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

