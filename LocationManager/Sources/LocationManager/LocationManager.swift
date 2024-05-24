//
//  LocationManager.swift
//  A class that manages location updates and authorization status using `CLLocationManager`.
//  This class is designed to work with iOS 17 and later versions.
//
//  Created by Jared William Tamulynas on 5/23/24.
//

import Foundation
import CoreLocation
import SwiftUI

@available(iOS 17.0, *)
@Observable class LocationManager: NSObject, CLLocationManagerDelegate {
    /// The current location of the device.
    var location: CLLocation?
    
    /// A boolean indicating whether the app is authorized to access location services.
    var isAuthorized: Bool
    
    /// The current authorization status of the app regarding location services.
    var authorizationStatus: CLAuthorizationStatus

    /// The internal `CLLocationManager` instance used to request and monitor location updates.
    private let locationManager = CLLocationManager()

    /// Initializes a new instance of `LocationManager`.
    /// Sets up the delegate and requests authorization to use location services when the app is in use.
    override init() {
        self.isAuthorized = locationManager.authorizationStatus == .authorizedWhenInUse || locationManager.authorizationStatus == .authorizedAlways
        self.authorizationStatus = locationManager.authorizationStatus
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }

    /// Requests permission to use location services when the app is in use.
    func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
    }

    /// Called when the authorization status changes.
    /// Updates the `authorizationStatus` and `isAuthorized` properties accordingly.
    /// - Parameter manager: The `CLLocationManager` instance reporting the change.
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus

        switch manager.authorizationStatus {
        case .notDetermined, .restricted, .denied:
            isAuthorized = false
        case .authorizedAlways, .authorizedWhenInUse:
            isAuthorized = true
            locationManager.startUpdatingLocation()
        @unknown default:
            break
        }
    }

    /// Called when new location data is available.
    /// Updates the `location` property with the latest location data.
    /// - Parameter manager: The `CLLocationManager` instance providing the data.
    /// - Parameter locations: An array of `CLLocation` objects representing the new location data.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.last
    }
}
