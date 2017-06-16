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
    
    var action: String = "create"
    
    @IBAction func createClicked(_ sender: Any) {
        guard let firstName = txtFirstName.text else{ return}
        guard let lastName = txtLastName.text else{ return}
        guard let userName = txtUserName.text else{ return}
        guard let pass = txtPassword.text else{ return}
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        if action=="edit"{
            let userDao = UserDAO(withAppDelegate: appDelegate)
            let (isAuthenticated, _) = userDao.authenticateUser(withUsername: userName, andWithPassword: pass)
            if isAuthenticated{
                let result = userDao.updateUser(withFirstName: firstName, withLastName: lastName, withUserName: userName, withPass: pass)
                
                if result{
                    authUser = userDao.getUser(withId: userName)
                    performSegue(withIdentifier: "mainSegway", sender: nil)
                }else{
                    lblMessage.text = "Unable to Update Try Again"
                }
            }else{
                lblMessage.text = "Please Validate your Password"
            }
        }
        else{
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
            
    }
    
    @IBAction func cancelClicked(_ sender: Any) {
        if action=="edit"{
             performSegue(withIdentifier: "mainSegway", sender: nil)
        }else{
             performSegue(withIdentifier: "showLogin", sender: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblMessage.text = ""
        // Do any additional setup after loading the view, typically from a nib.
        
        //if a segue was called to get her from the edit account page, change the title of the page to edit and load the account from the data storage. 
        //if create an account is called make it blank.
        
        if action=="edit"{
            lblPageTitle.text = "Edit Account"
            
            //populate form
            txtFirstName.text = authUser.firstName
            txtLastName.text = authUser.lastName
            txtUserName.text = authUser.userName
        }else{
            lblPageTitle.text = "Create Account"
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
