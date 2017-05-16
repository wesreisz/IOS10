//
//  ViewController.swift
//  Hello World
//
//  Created by Wesley Reisz on 5/16/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textbox: UITextField!

    @IBAction func buttonTapped(_ sender: Any) {
        print("Hello World")
        label.text = textbox.text
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

