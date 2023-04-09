//
//  Breathe Easy Decision View.swift
//  Breathe Easy
//
//  Created by William Wang on 4/8/23.
//

import SwiftUI

struct BreatheEasyDecisionView: View {
    @StateObject var vm: BreatheEasyViewModel
    var body: some View {
        VStack {
            TopView(vm: vm)
            BottomView(vm: vm)
        }
    }
}

struct BreatheEasyDecisionViewPreviews: PreviewProvider {
    static var previews: some View {
        BreatheEasyDecisionView(vm: BreatheEasyViewModel())
    }
}

struct TopView: View {
    @StateObject var vm: BreatheEasyViewModel

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(hex: "#14c2f5"),
                                                       Color(hex: "#1475f5")]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack {
                Text("\(vm.city)")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .bold()

                HStack {
                    Image(systemName: "cloud.sun.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .symbolRenderingMode(.multicolor)
                        .padding(.vertical, 80)
                        .shadow(radius: 25)
                    Spacer()
                    Text("\(String(format: "%.0f", ceil(vm.weatherData.data.temperature)))° degrees")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        .bold()
                }
                .padding(.horizontal, 30)

                Text("Today, you should open your windows!")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .bold()
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom, 20)

                Spacer()
            }
            .padding(.horizontal, 20)
//            .onAppear {
//                vm.requestAllServices()
//            }
        }
    }
}

struct BottomView: View {
    @StateObject var vm: BreatheEasyViewModel

    var body: some View {
        ZStack {
            Color(hex: "#1475f5")

            ScrollView {
                VStack(alignment: .leading) {
                    Text("Focused review")
                        .font(.title)
                        .foregroundColor(.white)
                        .bold()

                    WeatherElementRowItemView(label: "Grass Pollen Risk", icon: "Grass", data: vm.pollenData.data[0].risk.grassPollen, symbol: false)
                        .padding(.bottom, 10)

                    WeatherElementRowItemView(label: "Tree Pollen Risk", icon: "tree.fill", data: vm.pollenData.data[0].risk.treePollen, symbol: true)
                        .padding(.vertical)

                    WeatherElementRowItemView(label: "Weed Pollen Risk", icon: "leaf", data: vm.pollenData.data[0].risk.weedPollen, symbol: true)
                        .padding(.vertical)

                    WeatherElementRowItemView(label: "Air Polluion", icon: "wind", data: vm.pollutionData.stations[0].aqiInfo.category, symbol: true)
                        .padding(.vertical)

                }.font(.title2)
                    .foregroundColor(.white)
                    .fontDesign(.default)
                    .padding(.horizontal)
            }
            .navigationTitle("Today's weather")
        }
    }
}
