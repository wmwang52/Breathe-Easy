//
//  ProfileInformationModel.swift
//  Breathe Easy
//
//  Created by William Wang on 4/8/23.
//

import Foundation

struct DailyInformation:Codable, Hashable, Identifiable{
    var id:UUID = UUID()
    var pollenScale:Double
    var pollen:String
    
    var date:Date
    
    var pollution:String
    var pollutionScale:Double
    
    var weather:String
    var weatherScale:Double
    
    var overall:String
    var overallScale:Double
}
