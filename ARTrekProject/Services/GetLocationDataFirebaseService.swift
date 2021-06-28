//
//  GetLocationDataFirebase.swift
//  ARTrekProject
//
//  Created by Josh Sorokin on 28/06/2021.
//

import Foundation
import Firebase
import GeoFire

class GetLocationDataFirebaseService: GetLocationDataProtocol {
    
    func getLocationData(completion: @escaping (Location) -> ()) {
        
        let geofireRef = Database.database().reference()
        let geoFire = GeoFire(firebaseRef: geofireRef.child("user_locations"))
        
        geofireRef.child("user_locations").observe(DataEventType.value, with: { (snapshot) in
            
            if let value = snapshot.value as? NSDictionary {
                let userLocations = value["userLocations"] as? NSDictionary
                let locations = userLocations?["l"] as? NSArray
                let latitude = locations?[0] as? Double
                let longitude = locations?[1] as? Double
                let heading = value["heading"] as? Double
                
                let locationData = Location(latitude: latitude ?? 0, longitude: longitude ?? 0, heading: heading ?? 0)
                
                completion(locationData)
            }
        })
    }
    
}
