//
//  Place.swift
//  Memorable Places
//
//  Created by Wesley Reisz on 6/10/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import Foundation
import MapKit


class Place{
    var name: String = ""
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    
    init(){}
    
    init(WithName:String, WithLatitude:Double, WithLongitude:Double){
        name = WithName
        latitude = WithLatitude
        longitude = WithLongitude
    }
}
