//
//  ContentView.swift
//  Breathe Easy
//
//  Created by William Wang on 4/8/23.
//

import SwiftUI

struct MainTabView: View {
    let appearance: UITabBarAppearance = .init()
    init() {
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    @StateObject var vm = BreatheEasyViewModel()

    var body: some View {
        TabView {
            BreatheEasyDecisionView(vm: vm)
                .tabItem {
                    Label("Breathe easy", systemImage: "cloud.sun")
                }
            ProfileView(vm: vm)
                .tabItem {
                    Label("Profile", systemImage: "face.smiling")
                }
            AnalyticalView(vm: vm)
                .tabItem {
                    Label("Analytics", systemImage: "chart.xyaxis.line")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
