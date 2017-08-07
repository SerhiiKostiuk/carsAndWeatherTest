//
//  LocationManager.swift
//  CarsAndWeatherTest
//
//  Created by Serhii Kostiuk on 8/7/17.
//  Copyright © 2017 Serhii Kostiuk. All rights reserved.
//

import Foundation
import CoreLocation

class locationManager:NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    let geocoder = CLGeocoder()
    var userLocation = CLLocation()
    
    override init() {
        super .init()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userLocation = locations[0]
        
    }
}
