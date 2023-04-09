//
//  WeatherModel.swift
//  Breathe Easy
//
//  Created by William Wang on 4/8/23.
//

import Foundation

struct Weather: Codable {
    let message: String
    let data: WeatherData
}

struct WeatherData: Codable {
    let time: Int
    let dewPoint: Double
    let temperature: Double
    let apparentTemperature: Double
    let humidity: Int
    let pressure: Int
    let windSpeed: Double
    let windBearing: Int
    let windGust: Double
    let cloudCover: Double
    let visibility: Double
    let uvIndex: Double
    let summary: String
    let icon: String
    let precipIntensity: Double
    let lat: Double
    let lng: Double
    let ozone: Double
}
