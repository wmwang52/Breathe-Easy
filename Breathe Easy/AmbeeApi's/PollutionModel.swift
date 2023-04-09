//
//  PollutionModel.swift
//  Breathe Easy
//
//  Created by William Wang on 4/8/23.
//

import Foundation

struct Pollution: Codable {
    let message: String
    let stations: [Station]
}

struct Station: Codable {
    let CO: Double
    let NO2: Double
    let OZONE: Double
    let PM10: Double
    let PM25: Double
    let SO2: Double
    let city: String
    let countryCode: String
    let division: String
    let lat: Double
    let lng: Double
    let placeName: String
    let postalCode: String
    let state: String
    let updatedAt: String
    let AQI: Int
    let aqiInfo: AqiInfo
}

struct AqiInfo: Codable {
    let pollutant: String
    let concentration: Double
    let category: String
}
