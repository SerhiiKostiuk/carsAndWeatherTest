//
//  LocationManager.swift
//  CarsAndWeatherTest
//
//  Created by Serhii Kostiuk on 8/7/17.
//  Copyright © 2017 Serhii Kostiuk. All rights reserved.
//

import Foundation
import CoreLocation

protocol locationManagerDelegate: class {
    func userlocation(cityName: String, location:CLLocation)
}

class locationManager:NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    let geocoder = CLGeocoder()
    var userLocation = CLLocation()

    weak var delegate:locationManagerDelegate?

    override init() {
        super .init()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userLocation = locations[0]
        
        geocoder.reverseGeocodeLocation(userLocation) { (placemarks: [CLPlacemark]?, error) in
            print(placemarks!)

            let placemark = placemarks?.last
            print((placemark?.locality)!)
            print((placemark?.location)!)

            self.delegate?.userlocation(cityName:(placemark?.locality)!, location:(placemark?.location)!)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(status)

    }
    
    
}
