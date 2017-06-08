//
//  ViewController.swift
//  Memorable Places
//
//  Created by Wesley Reisz on 6/8/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, UIGestureRecognizerDelegate {
    
    /*
    Memoriable Places Requirements:
     - center map if no location is passed (done)
     - locate an address and center map (done)
     - long press to drop a marker for a memorable location (done)
     - Ask the user what the title of the memorable location is
     - persist saved markers to system memory
     - show all items from system memory on the table view when the app starts
     - when a user clicks on an item directly in the table view, load that item into the mapview
     - swip to remove the item from the table view
     - design the table view cell to be nicer than the basic look
     - create an icon for the app
 
    */
    
    
    @IBOutlet weak var txtInputLocation: UITextField!
    @IBOutlet weak var map: MKMapView!
    
    let locationManager = CLLocationManager()
    
    @IBAction func findLocationPressed(_ sender: Any) {
        guard let location2find = txtInputLocation.text else{
            return
        }
        
        findLocation(forLocation: location2find)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        registerEvents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func findLocation(forLocation: String){

        print("find \(forLocation)")
            
        CLGeocoder().geocodeAddressString(forLocation){
            placemarks , error in
            if error != nil{
                print("Geo Location failed")
                return
            }
                
            if (placemarks?.count)!>0{
                let placemark = placemarks![0]
                    
                let center = CLLocationCoordinate2D(latitude: (placemark.location?.coordinate.latitude)!, longitude: (placemark.location?.coordinate.longitude)!)
                let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
                    
                self.map.setRegion(region, animated: true)
            }
                
        }
    }
    
    func registerEvents(){
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(addAnnotationOnLongPress(gesture:)))
        longPressGesture.minimumPressDuration = 1.0
        self.map.addGestureRecognizer(longPressGesture)
    }
    
    func addAnnotationOnLongPress(gesture: UILongPressGestureRecognizer){
        if gesture.state == .ended {
            let point = gesture.location(in: self.map)
            let coordinate = self.map.convert(point, toCoordinateFrom: self.map)
            print(coordinate)
            //Now use this coordinate to add annotation on map.
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            
            //TODO: Ask user what the title should be
            annotation.title = "Title"
            annotation.subtitle = "One of my Memorable Spots"
            self.map.addAnnotation(annotation)
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count>0{
            let location = locations[0]
            print(location)
            
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            
            self.map.setRegion(region, animated: true)
            locationManager.stopUpdatingLocation()
        }
    }
    
}

