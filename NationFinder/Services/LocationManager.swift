//
//  LocationManager.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 04/02/2025.
//

import CoreLocation
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    private var locationManager = CLLocationManager()
    @Published var userCountry: String = ""

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func requestLocation() {
            locationManager.startUpdatingLocation()
        }

    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        if let location = locations.last {
            fetchCountry(from: location)
            locationManager.stopUpdatingLocation()
        }
    }
    
    private func fetchCountry(from location: CLLocation) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let country = placemarks?.first?.country {
                DispatchQueue.main.async {
                    self.userCountry = country
                }
            }
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            requestLocation()
        case .denied, .restricted:
            DispatchQueue.main.async {
                self.userCountry = ""
            }
        default:
            break
        }
    }
}
