//
//  Breathe Easy View Model.swift
//  Breathe Easy
//
//  Created by William Wang on 4/8/23.
//

import Foundation

@MainActor
class BreatheEasyViewModel: ObservableObject {
    private let service = BreatheEasyPollenService()
    
    var emptyDict: [Date: DailyInformation] = [:]

    
    @Published var dailyProfileInformation: DailyInformation = .init(pollenScale: 0, pollen: "", pollution: "", pollutionScale: 0, weather: "", weatherScale: 0, overall: "", overallScale: 0)
    
    @Published var lat: Double = 35.9132

    @Published var long: Double = -79.0558
    
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
    
    func pollenRequest() {
        Task {
            do {
                let pollen = try await service.fetchPollen(lat: lat, long: long)
                self.pollenData = pollen
            } catch {
                print(String(describing: error))
            }
        }
    }

}
