//
//  WeatherElementRowItemView.swift
//  Breathe Easy
//
//  Created by William Wang on 4/8/23.
//

import SwiftUI

struct WeatherElementRowItemView: View {
    var label: String
    var icon: String
    var data: String
    var symbol: Bool
    var body: some View {
        ZStack {
            Color.white.opacity(0.1)
            VStack(alignment: .leading) {
                HStack {
                    if symbol {
                        Image(systemName: icon)
                            .symbolRenderingMode(.multicolor)
                    }
                    else {
                        Image(icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35, height: 35)
                    }
                    
                    Text(" \(label): \(data)")
                }.font(.title)
                
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(10)
            }
            
        }.cornerRadius(15)
            .shadow(radius: 54)

    }
}

struct WeatherElementRowItemView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherElementRowItemView(label: "Grass Pollen", icon: "Grass", data: "Low", symbol: false)
    }
}
