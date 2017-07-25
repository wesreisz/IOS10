//
//  ViewController.swift
//  Instagram Clone
//
//  Created by Wesley Reisz on 7/25/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var gameScore = PFObject(className:"GameScore")
        gameScore["score"] = 1337
        gameScore["playerName"] = "Sean Plott"
        gameScore["cheatMode"] = false
        gameScore.saveInBackground{
            (success, error ) in
            if (success) {
                // The object has been saved.
                print("Object was saved")
            } else {
                // There was a problem, check error.description
                print("Object failed to save")
            }
        } 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

