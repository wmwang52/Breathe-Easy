//
//  ContentView.swift
//  Breathe Easy
//
//  Created by William Wang on 4/8/23.
//

import SwiftUI

struct MainTabView: View {
    let appearance: UITabBarAppearance = UITabBarAppearance()
    init() {
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    var body: some View {
        TabView {
            BreatheEasyDecisionView()
                .tabItem {
                    Label("Breathe easy", systemImage: "cloud.sun")
                    
                }
            Text("HEllo")
                .tabItem {
                    Label("Profile", systemImage: "face.smiling")
                }
            Text("Final")
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
