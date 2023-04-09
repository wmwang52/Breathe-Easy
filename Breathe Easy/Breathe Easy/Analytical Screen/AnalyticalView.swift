//
//  AnalyticalView.swift
//  Breathe Easy
//
//  Created by William Wang on 4/8/23.
//

import Charts
import SwiftUI

struct AnalyticalView: View {
    @StateObject var vm: BreatheEasyViewModel
     
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Pollution")
                    Chart {
                        ForEach(Array(vm.analyticalDictInformation.values)) { item in
                                
                            LineMark(
                                x: .value("Month", item.date),
                                y: .value("Pollution", item.pollutionScale)
                            )
                        }
                    }
                    .scaledToFit()
                }
                
                VStack {
                    Text("Pollen")
                    Chart {
                        ForEach(Array(vm.analyticalDictInformation.values)) { item in
                                
                            LineMark(
                                x: .value("Month", item.date),
                                y: .value("Pollen", item.pollenScale)
                            )
                        }
                    }.scaledToFit()
                }
            }.padding(.horizontal)

            HStack {
                VStack {
                    Text("Weather")
                    Chart {
                        ForEach(Array(vm.analyticalDictInformation.values)) { item in

                            LineMark(
                                x: .value("Month", item.date),
                                y: .value("Weather", item.weatherScale)
                            )
                        }
                    }
                    .scaledToFit()
                }
                
                VStack {
                    Text("Happiness")
                    Chart {
                        ForEach(Array(vm.analyticalDictInformation.values)) { item in
                                
                            LineMark(
                                x: .value("Month", item.date),
                                y: .value("Happiness", item.overallScale)
                            )
                        }
                    }.scaledToFit()
                }
            }.padding(.horizontal)
        }
    }
}

struct AnalyticalView_Previews: PreviewProvider {
    static var previews: some View {
        AnalyticalView(vm: BreatheEasyViewModel())
    }
}
