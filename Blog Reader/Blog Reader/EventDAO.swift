//
//  EventDAO.swift
//  Blog Reader
//
//  Created by Wesley Reisz on 6/19/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import Foundation
import CoreData

class EventDAO{
    func insertEvent(_ newEvent:Event)->Bool{
        guard let context = newEvent.managedObjectContext else{
            return false
        }
        
        // Save the context.
        do {
            try context.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    
        return true
    }
    
    func listEvents(){
    
    }
    
    func getEvent(ByIdentifier id:Int)->Event{
        return Event()
    }
    
}
