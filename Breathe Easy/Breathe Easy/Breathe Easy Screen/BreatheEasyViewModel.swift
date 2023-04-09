//
//  Breathe Easy View Model.swift
//  Breathe Easy
//
//  Created by William Wang on 4/8/23.
//

import CoreLocation
import Foundation
import MapKit

@MainActor
class BreatheEasyViewModel: ObservableObject {
    private let geocoder = CLGeocoder()
    private let service = EnvironmentService()
    private let locationManager = LocationManager()

    init() {
        locationManager.delegate = self
        locationManager.requestLocation()
    }

    var emptyDict: [Date: DailyInformation] = [:]
    @Published var city: String = ""

    @Published var dailyProfileInformation: DailyInformation = .init(pollenScale: 0, pollen: "", pollution: "", pollutionScale: 0, weather: "", weatherScale: 0, overall: "", overallScale: 0)

    @Published var lat: Double = 35.9132

    @Published var long: Double = -79.0558

    @Published var weatherData: Weather = .init(message: "success", data: WeatherData(time: 1681008995, dewPoint: 43.45, temperature: 45.63, apparentTemperature: 41.13, humidity: 92, pressure: 1030, windSpeed: 8.7, windBearing: 39, windGust: 18.12, cloudCover: 1, visibility: 10, uvIndex: 0, summary: "overcast clouds", icon: "cloudy", precipIntensity: 0, lat: 37, lng: -77, ozone: 107.29))

    @Published var pollutionData: Pollution = .init(
        message: "success",
        stations: [Station(CO: 0.735,
                           NO2: 2.715,
                           OZONE: 29.611,
                           PM10: 17.045,
                           PM25: 10.863,
                           SO2: 0.585,
                           city: "VA",
                           countryCode: "US",
                           division: "Sussex",
                           lat: 36.9757,
                           lng: -76.979,
                           placeName: "Wakefield",
                           postalCode: "23888",
                           state: "Virginia",
                           updatedAt: "2023-04-09T01:00:00.000Z",
                           AQI: 45,
                           aqiInfo: AqiInfo(
                               pollutant: "PM2.5",
                               concentration: 10.863,
                               category: "Good"
                           ))]
    )

    @Published var pollenData: Pollen = .init(
        message: "success",
        lat: 35.9132,
        lng: -79.0558,
        data: [
            PollenData(
                count: PollenCount(grassPollen: 0, treePollen: 841, weedPollen: 0),
                risk: PollenRisk(grassPollen: "Low", treePollen: "Very High", weedPollen: "Low"),
                species: Species(
                    Grass: ["Grass / Poaceae": 0],
                    Others: 21,
                    Tree: ["Ash": 50, "Birch": 50, "Cypress / Juniper / Cedar": 201, "Elm": 58, "Maple": 50, "Mulberry": 84, "Oak": 252, "Pine": 42, "Poplar / Cottonwood": 33],
                    Weed: ["Ragweed": 0]
                ),
                updatedAt: "2023-04-08T19:30:12.000Z"
            )
        ]
    )

    @Published var mood = ""

//    func requestAllServices() {
//        Task {
//            do {
//                let pollen = try await service.fetchPollen(lat: lat, long: long)
//                self.pollenData = pollen
//
//                let pollution = try await service.fetchPollution(lat: lat, long: long)
//                self.pollutionData = pollution
//
//                let weatherData = try await service.fetchWeather(lat: lat, long: long)
//                self.weatherData = weatherData
//
//            } catch {
//                print(String(describing: error))
//            }
//        }
//    }
}

extension BreatheEasyViewModel: LocationManagerDelegate {
    func locationManager(_ manager: LocationManager, didUpdateLocation location: Location) {
        Task {
            do {
                let pollen = try await service.fetchPollen(lat: lat, long: long)
                self.pollenData = pollen

                let pollution = try await service.fetchPollution(lat: lat, long: long)
                self.pollutionData = pollution

                let weatherData = try await service.fetchWeather(lat: lat, long: long)
                self.weatherData = weatherData

                reverseGeolocate(location: location)

            } catch {
                print(String(describing: error))
            }
        }
    }

    func locationManager(_ manager: LocationManager, didFailError error: Error) {
        print(String(describing: error))
    }

    private func reverseGeolocate(location: Location) {
        let Newlocation = CLLocation(latitude: location.latitude, longitude: location.longitude)

        geocoder.reverseGeocodeLocation(Newlocation, completionHandler: { placemarks, error in
            if let error = error {
                print("\(error)")
                return
            }

            guard let placemark = placemarks?.first else {
                print("\(error)")

                return
            }

            self.city = placemark.locality ?? ""

        })
    }
}
