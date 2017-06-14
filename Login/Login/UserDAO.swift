//
//  UserDAO.swift
//  Login
//
//  Created by Wesley Reisz on 6/14/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import Foundation
import CoreData

class UserDAO{
    let appDelegate: AppDelegate
    
    init(withAppDelegate appDelegate: AppDelegate){
        self.appDelegate = appDelegate
    }
    
    func authenticateUser(withUsername usrname:String, andWithPassword password:String) -> (Bool, UserDTO){
        
        let context = self.appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        request.returnsObjectsAsFaults = false
        do{
            let results = try context.fetch(request)
            
            let usr = UserDTO()
            
            if results.count>0{
                for result in results as! [NSManagedObject]{
                    
                    guard let usrName = result.value(forKey: "userName") else {
                        print("No Username found")
                        return (false, UserDTO())
                    }
                    
                    guard let firstName = result.value(forKey: "firstName") else{
                        print("No first name found")
                        return (false, UserDTO())
                    }
                    guard let lastName = result.value(forKey: "lastName") else{
                        print("No last name found")
                        return (false, UserDTO())
                    }
                    
                    usr.firstName = firstName as! String
                    usr.lastName = lastName as! String
                    usr.userName = usrName as! String
                    
                    usr.fullName = usr.firstName + " " + usr.lastName
                    
                    continue
                }
                
                return (true, usr)
            }else{
                print("No Data Found")
                return (false, UserDTO())
            }
        }catch{
            print("Unable to fetch data")
            return (false, UserDTO())
        }
    }
    
    func createUser(withFirstName firstName:String,
                    withLastName lastName:String,
                    withUserName usrName:String,
                    withPass pass:String) -> Bool{
        let context = self.appDelegate.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "user", into: context)
        newUser.setValue(usrName, forKey: "userName")
        newUser.setValue(firstName, forKey: "firstName")
        newUser.setValue(lastName, forKey: "lastName")
        newUser.setValue(pass, forKey: "pass")
        
        do{
            try context.save()
            return true
        }catch{
            print("Unable to add account")
            return false
        }
    }
    
}
