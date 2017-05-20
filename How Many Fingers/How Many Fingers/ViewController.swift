//
//  ViewController.swift
//  How Many Fingers
//
//  Created by Wesley Reisz on 5/19/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private final let MAX: Int = 6
    
    @IBOutlet weak var inputNumber: UITextField!
    @IBOutlet weak var displayText: UILabel!
    @IBOutlet weak var displayImage: UIImageView!
    
    var randomNumberfromComputer: Int = 0
    
    @IBAction func guessVal(_ sender: Any) {
        
        guard let input = inputNumber.text else{
            displayText.text = "Please Choose a number less than \(MAX-1)"
            return
        }
        
        if let playerChoice = Int(inputNumber.text!) {
            if (playerChoice<=5){
                randomNumberfromComputer = Int(arc4random_uniform(UInt32(MAX)))
                
                if randomNumberfromComputer==playerChoice {
                    displayImage.image =  UIImage(named: "thumbsUp")!
                    displayText.text="Correct!!!"
                }else{
                    displayImage.image = UIImage(named: "thumbsDown")!
                    displayText.text="Try Again"
                }
            }
            else{
                displayText.text="Please Enter an Integer less than 5"
            }
        }else{
             displayText.text="Please Enter an Integer"
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

