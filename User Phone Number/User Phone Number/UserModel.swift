//
//  UserModel.swift
//  User Phone Number
//
//  Created by Wesley Reisz on 5/26/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import Foundation

class UserModel{
    var userName:String
    var userNumber:String
    
    init(){
        self.userName = ""
        self.userNumber = ""
    }
    
    init(name: String, number: String){
        self.userName = name
        self.userNumber = number
    }
    
    init(coder aDecoder: NSCoder!){
        self.userName = aDecoder.decodeObject(forKey: "userName") as! String
        self.userNumber = aDecoder.decodeObject(forKey: "userNumber") as! String
    }
    
    func initWithCoder(aDecoder: NSCoder) -> UserModel {
        self.userName = aDecoder.decodeObject(forKey: "userName") as! String
        self.userNumber = aDecoder.decodeObject(forKey: "userNumber") as! String

        return self
    }
    
    func encodeWithCoder(aCoder: NSCoder!){
        aCoder.encode(userName, forKey: "userName")
        aCoder.encode(userNumber, forKey: "userNumber")
    }
}
