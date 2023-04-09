//
//  LocationManager.swift
//  Breathe Easy
//
//  Created by William Wang on 4/8/23.
//

import Combine
import CoreLocation
import Foundation

protocol LocationManagerDelegate: AnyObject {
    func locationManager(_ manager: LocationManager, didUpdateLocation location: Location)
    func locationManager(_ manager: LocationManager, didFailError error: Error)
}

class LocationManager: NSObject {
    private let locationManager = CLLocationManager()

    weak var delegate: LocationManagerDelegate?

    private var locationPublisher = PassthroughSubject<Location, Never>()
    private var subscriber: AnyCancellable?

    override init() {
        super.init()

        locationManager.delegate = self

        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation

        locationManager.distanceFilter = 5

        locationManager.requestWhenInUseAuthorization()

        subscriber = locationPublisher
            .debounce(for: 0.25, scheduler: RunLoop.main)
            .sink { [weak self] location in
                guard let self = self else { return }
                self.delegate?.locationManager(self, didUpdateLocation: location)
            }
    }

    func requestLocation() {
        locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let clLocation = locations.last else { return }
        let location = Location(latitude: clLocation.coordinate.latitude, longitude: clLocation.coordinate.longitude)

        locationPublisher.send(location)
        locationManager.stopUpdatingLocation()
    }

    /// Called by `CLLocationManager` when there is an error
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        delegate?.locationManager(self, didFailError: error)
        locationManager.stopUpdatingLocation()
    }
}
