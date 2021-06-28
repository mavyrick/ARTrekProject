//
//  ShareLocationViewController.swift
//  ARTrekProject
//
//  Created by Josh Sorokin on 25/06/2021.
//

import UIKit
import CoreLocation
import Firebase
import GeoFire

class ShareLocationViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    var userLocation = CLLocation()
    var geofireRef: DatabaseReference!
    var geoFire: GeoFire?
    var headingRef: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        //        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
        geofireRef = Database.database().reference()
        geoFire = GeoFire(firebaseRef: geofireRef.child("user_locations"))
        headingRef = Database.database().reference()
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
}

extension ShareLocationViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.last {
            userLocation = location
            geoFire?.setLocation(CLLocation(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude), forKey: "userLocations")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        headingRef.child("user_locations").child("heading").setValue(newHeading.magneticHeading)
    }
    
}
