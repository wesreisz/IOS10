//
//  UserExtension.swift
//  User Phone Number
//
//  Created by Wesley Reisz on 5/27/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
    
    //method for selecting which user to use
    func selectUser(){
        print("Calling Show Users")
        
        let alert = UIAlertController(title: "Register", message: "Please choose a demo user...", preferredStyle: .alert)
        
        if let users = UserDefaults.standard.object(forKey: "users") as? [String] {
            for var phone in users{
                alert.addAction(UIAlertAction(title: phone,  style: .default, handler: { _ in
                    self.confirmUser(phone: phone)
                }))
            }
        }
        
        alert.addAction(UIAlertAction(title: "New User",  style: .default, handler: { _ in
            self.addUserForm()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel",  style: .default, handler: { _ in
            //nothing
        }))
        
        self.show(alert, sender: self)
    }
    
     //method to display the add user form
    func addUserForm(){
        print("Calling Show Users")
        
        let alert = UIAlertController(title: "Register", message: "Please choose a demo user...", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: {(textField : UITextField!) -> Void in
            textField.placeholder = "Number"
        })
        
        alert.addAction(UIAlertAction(title: "Add",  style: .default, handler: { _ in
            if let txtPhone = alert.textFields?[0]{
                if let phoneNumber = txtPhone.text{
                    if !phoneNumber.isEmpty{
                        print("Adding \(phoneNumber)")
                        self.addUser(phone:phoneNumber)
                    }else{
                        print("No Phone Entered")
                    }
                }
            }
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel",  style: .default, handler: { _ in
            print("Canceling")
        }))
        
        self.show(alert, sender: self)
    }
    
    //method for adding a user
    func addUser(phone:String){
        var usrs = [String]()
        if UserDefaults.standard.object(forKey: "users") as? [String]!==nil{
            usrs = (UserDefaults.standard.object(forKey: "users") as? [String])!
        }
        usrs.append(phone)
        self.usr = phone
        
        print("users: \(String(describing: usrs))")
        UserDefaults.standard.set(usrs, forKey: "users")
        updateDisplay()
    }
    
    
    //confirm the user
    func confirmUser(phone:String) {
        //select a user then place an order
        let alert = UIAlertController(title: "CONFIRM '\(phone)' as DEMO USER", message: "Is '\(phone)' the correct number?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("Setting User: \(phone)")
            self.usr = phone
            var tabledata = UserDefaults.standard.array(forKey: "users")
            tabledata?.append(self.usr)
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel",  style: .cancel, handler: { _ in
            //nothing
        }))
        
        updateDisplay()
        self.show(alert, sender: self)
    }
    
    
    //update the display
    func updateDisplay(){
        if let users = UserDefaults.standard.object(forKey: "users") as? [String] {
            if users.count>0{
                txtPhoneDisplay.text=users[0]
            }
        }
    }
}
