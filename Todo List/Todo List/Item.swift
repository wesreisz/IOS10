//
//  Item.swift
//  Todo List
//
//  Created by Wesley Reisz on 5/28/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import Foundation

class Item{
    var itemName = String()
    var status = String()
    
    init(itemName:String){
        self.itemName = itemName
        self.status = "ADDED"
    }
    
    func updateStatus(status:String){
        self.status = status
    }

}
