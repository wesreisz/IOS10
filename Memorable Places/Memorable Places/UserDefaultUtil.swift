//
//  UserDefaultUtil.swift
//  Memorable Places
//
//  Created by Wesley Reisz on 6/10/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import Foundation

class UserDefaultUtil{
    static let PLACES_ARRAY_KEY = "placesArray"
    
    static func loadPlaces()->[Place]{
        var placesArray = [Place]()
        let places = UserDefaults.standard.array(forKey: PLACES_ARRAY_KEY)  as? [String] ?? [String]()
        for var place in places{
            let name = place.components(separatedBy: "|")[0]
            let lat = place.components(separatedBy: "|")[1]
            let lng = place.components(separatedBy: "|")[2]
            placesArray.append(Place(WithName: name, WithLatitude: Double(lat)!, WithLongitude: Double(lng)!))
        }
        
        return placesArray
    }
    
    static func flushCache(){
        UserDefaults.standard.removeObject(forKey: PLACES_ARRAY_KEY)
    }
    
    static func savePlaces(_ places:[Place]){
        for var place in places{
            savePlace(place)
        }
    }
    
    static func savePlace(_ place:Place){
        let defaults = UserDefaults.standard
        var array = defaults.array(forKey: PLACES_ARRAY_KEY)  as? [String] ?? [String]()
        array.append("\(place.name)|\(place.latitude)|\(place.longitude)")
        defaults.set(array, forKey: PLACES_ARRAY_KEY)
    }

}
