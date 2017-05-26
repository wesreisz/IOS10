//
//  ViewController.swift
//  User Phone Number
//
//  Created by Wesley Reisz on 5/26/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var usr = UserModel()

    @IBAction func addUser(_ sender: Any) {
        selectUser()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func selectUser(){
        print("Calling Show Users")
        
        let alert = UIAlertController(title: "Register", message: "Please choose a demo user...", preferredStyle: .alert)
    
        alert.addAction(UIAlertAction(title: "Add User",  style: .default, handler: { _ in
            self.addUserForm()
        }))

        alert.addAction(UIAlertAction(title: "Cancel",  style: .default, handler: { _ in
            //nothing
        }))

        
        if let users = UserDefaults.standard.object(forKey: "users") as? [UserModel] {
            for var usr in users{
                alert.addAction(UIAlertAction(title: usr.userName,  style: .default, handler: { _ in
                    self.confirmUser(usr.userName, phone:usr.userNumber)
                }))
            }
        }
        
        self.show(alert, sender: self)
    }
    
    func addUserForm(){
        print("Calling Show Users")
        
        let alert = UIAlertController(title: "Register", message: "Please choose a demo user...", preferredStyle: .alert)
       
        alert.addTextField(configurationHandler: {(textField : UITextField!) -> Void in
            textField.placeholder = "Name"
        })
        
        alert.addTextField(configurationHandler: {(textField : UITextField!) -> Void in
            textField.placeholder = "Number"
        })
        
        alert.addAction(UIAlertAction(title: "Add",  style: .default, handler: { _ in
            print("Adding")
            self.addUser(name:"Wes", phone:"1231231233")
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel",  style: .default, handler: { _ in
            print("Canceling")
        }))
        
        self.show(alert, sender: self)
    }
    
    func addUser(name:String, phone:String){
        let usr = UserModel(name: name, number: phone)
        self.usr = usr
        var usrs = [UserModel]()
        if UserDefaults.standard.object(forKey: "users") as? [UserModel]!==nil{
            usrs = (UserDefaults.standard.object(forKey: "users") as? [UserModel])!
        }else{
            usrs = [UserModel]()
        }
        usrs.append(usr)
        UserDefaults.standard.set(usrs, forKey: "users")
        print("users: \(String(describing: usrs))")
    }
    
    
    func confirmUser(_ name:String, phone:String) {
        //select a user then place an order
        let alert = UIAlertController(title: "CONFIRM '\(name)' as DEMO USER", message: "Is '\(name)' the correct name?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                print("Setting User: \(name) & \(phone)")
                let usr = UserModel(name: name, number: phone)
                self.usr = usr
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel",  style: .cancel, handler: { _ in
            //nothing
        }))
        
        self.show(alert, sender: self)
    }
}

