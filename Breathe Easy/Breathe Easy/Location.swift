//
//  Location.swift
//  Breathe Easy
//
//  Created by William Wang on 4/8/23.
//

import Foundation

struct Location {
    var latitude: Double
    var longitude: Double
}

extension Location: CustomStringConvertible {
    var description: String {
        return "latitude: \(latitude), Longitude: \(longitude)"
    }
}
