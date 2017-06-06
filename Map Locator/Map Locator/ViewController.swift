//
//  ViewController.swift
//  Map Locator
//
//  Created by Wesley Reisz on 6/3/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    var counter = 0
    let DEFAULT_LOCATION:String = "Louisville, KY"
    var locationManager = CLLocationManager()
    
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var textbox: UITextField!
    
    @IBAction func locatButtonPressed(_ sender: Any) {
        guard let locationText = textbox.text else{
            return
        }
        print("finding \(locationText)")
        locatePosition(locationText)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locatePosition()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locatePosition(_ byName:String=""){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        let userLocation: CLLocation = locations[0]
        let lat = userLocation.coordinate.latitude
        let lng = userLocation.coordinate.longitude
        
        addPin(userLocation, pinInterval: 5)
        
        let longDelta:CLLocationDegrees = 0.01
        let latDelta:CLLocationDegrees = 0.01
        
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, lng)
        
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        map.delegate = self
        map.showsUserLocation = true
        map.setRegion(region, animated: true)
    }
    
    func addPin(_ locations:CLLocation, pinInterval:Int){
        counter+=1
        if (counter % pinInterval == 0){
            let coordinate = CLLocationCoordinate2D(latitude: locations.coordinate.latitude, longitude: locations.coordinate.longitude)
            let anno = MKPointAnnotation()
            anno.coordinate = coordinate
            map.addAnnotation(anno)
        }
    }


}

