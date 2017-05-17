//
//  ViewController.swift
//  Dog Years
//
//  Created by Wesley Reisz on 5/17/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    final let BASE : Int = 7
    
    @IBOutlet weak var txtInput: UITextField!
    @IBOutlet weak var txtOutput: UILabel!
    
    @IBAction func btnClicked(_ sender: Any) {
        var displayText: String = ""
        if let inputAge:Int = Int(txtInput.text!){
            displayText = "Your dog is \(inputAge * BASE)"
            print(displayText)
        }else{
            displayText = "Please Enter an Integer"
        }
        txtOutput.text = displayText
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

