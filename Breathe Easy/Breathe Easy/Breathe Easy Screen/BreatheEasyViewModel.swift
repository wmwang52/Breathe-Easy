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
    
    @Published var lat: Double = 35.9132
    
    @Published var long: Double = -79.0558
    
    @Published var pollenData: Pollen = .init(message: "", lat: 0, lng: 0, data: [])
    
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
