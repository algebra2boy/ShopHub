//
//  LaunchScreenView.swift
//  ShopHub
//
//  Created by CHENGTAO on 9/22/23.
// Resource: https://www.youtube.com/watch?v=5A1HR-rL2Cs&t=34s

import SwiftUI

struct LaunchScreenView: View {
    @State private var firstPhaseIsAnimating: Bool = false
    
    private let timer = Timer.publish(every: 0.65, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            background
            logo
        }
        .onReceive(timer) {input in
            withAnimation(.spring()) {
                firstPhaseIsAnimating.toggle()
            }
        }
    }
}

private extension LaunchScreenView {
    var background: some View {
        Color("launch-screen-background")
            .ignoresSafeArea(.all)
    }
    
    var logo: some View {
        Image("logo")
            .scaleEffect(firstPhaseIsAnimating ? 0.6 : 1)
    }
}

#Preview {
    LaunchScreenView()
}
