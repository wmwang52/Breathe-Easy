//
//  ProfileView.swift
//  Breathe Easy
//
//  Created by William Wang on 4/8/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var vm: BreatheEasyViewModel

    var body: some View {
        NavigationStack {
            List {
                PollenView(vm: vm)

                PollutionView(vm: vm)

                WeatherView(vm: vm)

                OverallView(vm: vm)
            }

            .navigationTitle("How do you feel today?")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(vm: BreatheEasyViewModel())
    }
}

struct PollenView: View {
    @StateObject var vm: BreatheEasyViewModel

    var body: some View {
        Section("Pollen Rating") {
            NavigationLink("How bad are your pollen allergies on a scale of 1 to 10 today? ") {
                VStack {
                    Text("Would you like to talk a little more on why you think your allergies are like this today?")
                        .padding(.horizontal, 10)

                    TextEditor(text: $vm.dailyProfileInformation.pollen)
                        .cornerRadius(10.0)

                        .padding(.horizontal, 10)
                        .shadow(radius: 2)
                }
            }
            VStack {
                Text("(0 is nonexistant and 10 is terrible)")
                    .foregroundColor(Color.gray)
                HStack {
                    Slider(value: $vm.dailyProfileInformation.pollenScale, in: 0 ... 10, step: 1)
                        .padding()
                        .accentColor(.green)
                    Text("\(Int(vm.dailyProfileInformation.pollenScale))")
                }
            }
        }
    }
}

struct PollutionView: View {
    @StateObject var vm: BreatheEasyViewModel

    var body: some View {
        Section("Pollution Rating") {
            NavigationLink("How bad do you think the pollution is today?") {
                Text("Would you like to talk a little more on why the air feels especially bad today?")
                    .padding(.horizontal, 10)

                TextEditor(text: $vm.dailyProfileInformation.pollution)
                    .cornerRadius(10.0)

                    .padding(.horizontal, 10)
                    .shadow(radius: 2)
            }
            VStack {
                Text("(0 is nonexistant and 10 is terrible)")
                    .foregroundColor(Color.gray)

                HStack {
                    Slider(value: $vm.dailyProfileInformation.pollutionScale, in: 0 ... 10, step: 1)
                        .padding()
                        .accentColor(.green)
                    Text("\(Int(vm.dailyProfileInformation.pollutionScale))")
                }
            }
        }
    }
}

struct WeatherView: View {
    @StateObject var vm: BreatheEasyViewModel

    var body: some View {
        Section("Weather Rating") {
            NavigationLink("How do you rate the weather today?") {
                Text("Would you like to talk a little more on why you enjoy or don't enjoyt the weather today?")
                    .padding(.horizontal, 10)

                TextEditor(text: $vm.dailyProfileInformation.weather)
                    .cornerRadius(10.0)

                    .padding(.horizontal, 10)
                    .shadow(radius: 2)
            }
            VStack {
                Text("(0 is bad and 10 is amazing)")
                    .foregroundColor(Color.gray)

                HStack {
                    Slider(value: $vm.dailyProfileInformation.weatherScale, in: 0 ... 10, step: 1)
                        .padding()
                        .accentColor(.green)
                    Text("\(Int(vm.dailyProfileInformation.weatherScale))")
                }
            }
        }
    }
}

struct OverallView: View {
    @StateObject var vm: BreatheEasyViewModel

    var body: some View {
        Section("Overall Rating") {
            NavigationLink("How did you feel today? ") {
                VStack {
                    Text("Would you like to talk a little more on why you feel this way?")
                        .padding(.horizontal, 10)

                    TextEditor(text: $vm.dailyProfileInformation.pollen)
                        .cornerRadius(10.0)

                        .padding(.horizontal, 10)
                        .shadow(radius: 2)
                }
            }
            VStack {
                Text("(0 is terrible and 10 is fantastic)")
                    .foregroundColor(Color.gray)
                HStack {
                    Slider(value: $vm.dailyProfileInformation.overallScale, in: 0 ... 10, step: 1)
                        .padding()
                        .accentColor(.green)
                    Text("\(Int(vm.dailyProfileInformation.overallScale))")
                }
            }
        }
    }
}
