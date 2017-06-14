//
//  MainViewController.swift
//  Login
//
//  Created by Wesley Reisz on 6/14/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import Foundation
import UIKit


class MainViewController: UIViewController {
    
    @IBOutlet weak var lblUserName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblUserName.text = authUser.fullName
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
