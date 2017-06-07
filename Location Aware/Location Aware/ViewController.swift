//
//  ViewController.swift
//  Location Aware
//
//  Created by Wesley Reisz on 6/6/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var lblLatitude: UILabel!
    @IBOutlet weak var lblLongitude: UILabel!
    @IBOutlet weak var lblCourse: UILabel!
    @IBOutlet weak var lblSpeed: UILabel!
    @IBOutlet weak var lblAltitude: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    
    var locationManager = CLLocationManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadLocationManager()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count>0 {
            let loc = locations[0]
            lblLatitude.text = String(loc.coordinate.latitude)
            lblLongitude.text = String(loc.coordinate.longitude)
            lblCourse.text = String(loc.course)
            lblSpeed.text = String(loc.speed)
            lblAltitude.text = String(loc.altitude)
            
            CLGeocoder().reverseGeocodeLocation(loc){
                placemarks, error in
                if error==nil{
                    print(error)
                }
               
                guard let place = placemarks?[0] else{
                    return
                }
                print(place)
                
                var subThoroughfare = ""
                if place.subThoroughfare != nil {
                    subThoroughfare = place.subThoroughfare!
                }
                
                var thoroughfare = ""
                if place.thoroughfare != nil {
                    thoroughfare = place.thoroughfare!
                }
                
                var subLocality = ""
                if place.subLocality != nil {
                    subLocality = place.subLocality!
                }
                
                var subAdministrativeArea = ""
                if place.subAdministrativeArea != nil {
                    subAdministrativeArea = place.subAdministrativeArea!
                }
                
                var postalCode = ""
                if place.postalCode != nil {
                    postalCode = place.postalCode!
                }
                
                self.lblAddress.text = "\(subThoroughfare) \(thoroughfare)\n \(subLocality) \(subAdministrativeArea) \(postalCode)"
                
            
            }
        }
        
    }


}

