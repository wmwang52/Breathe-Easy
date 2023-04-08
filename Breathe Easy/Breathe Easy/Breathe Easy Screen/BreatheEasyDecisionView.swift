//
//  Breathe Easy Decision View.swift
//  Breathe Easy
//
//  Created by William Wang on 4/8/23.
//

import SwiftUI

struct BreatheEasyDecisionView: View {
    @StateObject var vm = BreatheEasyViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(hex: "#14c2f5"),
                                                       Color(hex: "#1475f5")]), startPoint: .topTrailing, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text("Put location name here!")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .bold()
                
                Button("TEST") {
                    vm.pollenRequest()
                }.buttonStyle(.borderedProminent)
                
                    .foregroundColor(.white)
                
                Text("Today, you should open your windows!")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .bold()
                
                Image(systemName: "cloud.sun.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.background)
                        
                Text("\(String(format: "%.0f", "temperature"))°F")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding()
            }
            .padding(.horizontal, 20)
        }
    }
}

struct BreatheEasyDecisionViewPreviews: PreviewProvider {
    static var previews: some View {
        BreatheEasyDecisionView()
    }
}
