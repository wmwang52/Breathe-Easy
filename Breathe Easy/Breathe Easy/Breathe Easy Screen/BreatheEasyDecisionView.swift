//
//  Breathe Easy Decision View.swift
//  Breathe Easy
//
//  Created by William Wang on 4/8/23.
//

import SwiftUI

struct BreatheEasyDecisionView: View {
    @StateObject var vm:BreatheEasyViewModel
    var body: some View {
        VStack {
            TopView(vm: vm)
            BottomView(vm: vm)
        }
    }
}

struct BreatheEasyDecisionViewPreviews: PreviewProvider {
    static var previews: some View {
        BreatheEasyDecisionView(vm:BreatheEasyViewModel())
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
                Text("Chapel Hill")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .bold()
                Spacer()
                
                Text("Today, you should open your windows!")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .bold()
                    .fixedSize(horizontal: false, vertical: true)
                
                Image(systemName: "cloud.sun.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .symbolRenderingMode(.multicolor)
                    .padding(.vertical, 80)
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .onAppear {
                vm.pollenRequest()
            }
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
                    Text("Grass Pollen Risk: \(vm.pollenData.data[0].risk.grassPollen)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical)
                            
                    Text("Tree Pollen Risk: \(vm.pollenData.data[0].risk.treePollen)")
                        .padding(.vertical)

                    Text("Weed Pollen Risk: \(vm.pollenData.data[0].risk.weedPollen)")
                        .padding(.vertical)

                }.font(.title2)
                    .foregroundColor(.white)
                    .fontDesign(.default)
                    .padding(.horizontal)
            }
        }
        .ignoresSafeArea()
    }
}
