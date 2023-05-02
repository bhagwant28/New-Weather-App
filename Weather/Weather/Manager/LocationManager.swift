//
//  LocationManager.swift
//  Weather
//
//  Created by Bhagwant Sangvikar on 02/05/23.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    @Published var moveWeather: Bool = false
    
    static let shared = LocationManager()
    let manager = CLLocationManager()
    
    private override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        debugPrint("location \(String(describing: location))")
        isLoading = false
        moveWeather = true
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        debugPrint("Error getting location", error)
        isLoading = false
    }
}
