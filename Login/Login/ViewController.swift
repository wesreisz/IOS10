//
//  ViewController.swift
//  Login
//
//  Created by Wesley Reisz on 6/14/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import UIKit

var authUser:UserDTO = UserDTO()

class ViewController: UIViewController {
    
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblMessages: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblMessages.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        print("Calling seqway: \(identifier)")
        if identifier=="loginSeqway"{
            return checkLogin()
        }else{
            return true
        }

    }
    
    internal func checkLogin() -> Bool{
        guard let usrnm = txtUserName.text else {
            lblMessages.text = "Please Enter a User Name"
            return false
        }
        guard let pass = txtPassword.text else{
            lblMessages.text = "Please Enter a Password"
            return false
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let (result, usr) = UserDAO(withAppDelegate: appDelegate).authenticateUser(withUsername: usrnm, andWithPassword: pass)
        
        if result{
            authUser = usr
            
            return true
        }else {
            lblMessages.text = "Invalid Login"
            return false
        }
    }
}

