//
//  WeatherManager.swift
//  CarsAndWeatherTest
//
//  Created by Serhii Kostiuk on 8/7/17.
//  Copyright © 2017 Serhii Kostiuk. All rights reserved.
//

import Foundation
import Alamofire
import CoreLocation

enum weatherApiType: Int {
    case openWeatherMap = 1
}

class WeatherManager {
 let manager = locationManager()
    
    init() {    
        manager.delegate = self
    }
    
    func getWeatherDataFrom(apiType: weatherApiType, location:CLLocation) {
        let apiKey = weatherApiKeyForType(api: apiType)
        
        let aStr = String(format: "https://api.openweathermap.org/data/2.5/weather?lat=%f&lon=%f&units=metric&appid=%@&lang=ua",
                          location.coordinate.latitude,
                          location.coordinate.longitude,
                          apiKey)

        request(aStr).responseJSON { response in
            print(response)
        }
    }
    
    func weatherApiKeyForType(api:weatherApiType)->String {
        switch api {
        case .openWeatherMap:
          return "5ce2277ba476496b184e22c6633a1170"
            
        default:
           return ""
        }
    }
    
}

extension WeatherManager : locationManagerDelegate {
    func userlocation(cityName: String, location:CLLocation) {
        getWeatherDataFrom(apiType: .openWeatherMap, location:location)
    }

}
