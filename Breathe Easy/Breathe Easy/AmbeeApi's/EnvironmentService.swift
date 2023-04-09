//
//  BreatheEasyService.swift
//  Breathe Easy
//
//  Created by William Wang on 4/8/23.
//

import Foundation

@MainActor
struct EnvironmentService {
    private let session = URLSession.shared
    private let decoder = JSONDecoder()

    public func fetchPollen(lat: Double, long: Double) async throws -> Pollen {
        var components = URLComponents(string: "https://api.ambeedata.com/latest/pollen/by-lat-lng?")

        components?.queryItems = [
            URLQueryItem(name: "lat", value: "\(lat)"),
            URLQueryItem(name: "lng", value: "\(long)")
        ]

        guard let url = components?.url else {
            fatalError("Invalid URL")
        }

        var request = URLRequest(url: url)
        request.addValue("3b4f09107bbbef63657c324d6137290404e1c662c8bc3be701fad911aa3ab797", forHTTPHeaderField: "x-api-key")
        request.addValue("application/json", forHTTPHeaderField: "Content-type")

        let (data, _) = try await session.data(for: request)

        let pollenData = try decoder.decode(Pollen.self, from: data)
        print(pollenData)

        return pollenData
    }

    public func fetchPollution(lat: Double, long: Double) async throws -> Pollution {
        var components = URLComponents(string: "https://api.ambeedata.com/latest/by-lat-lng?")

        components?.queryItems = [
            URLQueryItem(name: "lat", value: "\(lat)"),
            URLQueryItem(name: "lng", value: "\(long)")
        ]

        guard let url = components?.url else {
            fatalError("Invalid URL")
        }

        var request = URLRequest(url: url)
        request.addValue("3b4f09107bbbef63657c324d6137290404e1c662c8bc3be701fad911aa3ab797", forHTTPHeaderField: "x-api-key")
        request.addValue("application/json", forHTTPHeaderField: "Content-type")

        let (data, _) = try await session.data(for: request)

        let pollutionData = try decoder.decode(Pollution.self, from: data)

        return pollutionData
    }

    public func fetchWeather(lat: Double, long: Double) async throws -> Weather {
        var components = URLComponents(string: "https://api.ambeedata.com/weather/latest/by-lat-lng?")

        components?.queryItems = [
            URLQueryItem(name: "lat", value: "\(lat)"),
            URLQueryItem(name: "lng", value: "\(long)")
        ]

        guard let url = components?.url else {
            fatalError("Invalid URL")
        }

        var request = URLRequest(url: url)
        request.addValue("3b4f09107bbbef63657c324d6137290404e1c662c8bc3be701fad911aa3ab797", forHTTPHeaderField: "x-api-key")
        request.addValue("application/json", forHTTPHeaderField: "Content-type")

        let (data, _) = try await session.data(for: request)

        let weatherData = try decoder.decode(Weather.self, from: data)

        return weatherData
    }
}
