//
//  RegisterViewController.swift
//  Login
//
//  Created by Wesley Reisz on 6/14/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var lblPageTitle: UILabel!
    
    @IBAction func createClicked(_ sender: Any) {
        guard let firstName = txtFirstName.text else{ return}
        guard let lastName = txtLastName.text else{ return}
        guard let userName = txtUserName.text else{ return}
        guard let pass = txtPassword.text else{ return}
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let result =
            UserDAO(withAppDelegate: appDelegate)
                .createUser(withFirstName: firstName, withLastName: lastName, withUserName: userName, withPass: pass)
        
        if result{
            performSegue(withIdentifier: "showLogin", sender: nil)
        }else{
            lblMessage.text = "Unable to create Account"
            print("Unable to create account... form bad")
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //if a segue was called to get her from the edit account page, change the title of the page to edit and load the account from the data storage. 
        //if create an account is called make it blank.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
