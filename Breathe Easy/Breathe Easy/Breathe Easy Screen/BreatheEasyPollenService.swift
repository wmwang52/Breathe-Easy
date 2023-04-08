//
//  BreatheEasyService.swift
//  Breathe Easy
//
//  Created by William Wang on 4/8/23.
//

import Foundation

@MainActor
struct BreatheEasyPollenService {
    private let session = URLSession.shared
    private let decoder = JSONDecoder()

    public func fetchPollen(lat: Double, long: Double) async throws -> Pollen {
        print("HELLO")
        var components = URLComponents(string: "https://api.ambeedata.com/latest/pollen/by-lat-lng?")

        components?.queryItems = [
            URLQueryItem(name: "lat", value: "\(lat)"),
            URLQueryItem(name: "lng", value: "\(long)")
        ]

        guard let url = components?.url else {
            fatalError("Invalid URL")
        }

        var request = URLRequest(url: url)
        request.addValue("", forHTTPHeaderField: "x-api-key")
        request.addValue("application/json", forHTTPHeaderField: "Content-type")

        let (data, _) = try await session.data(for: request)
        print(data)

        let pollenData = try decoder.decode(Pollen.self, from: data)
        print(pollenData)

        return pollenData
    }
}
