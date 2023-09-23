//
//  LaunchScreenView.swift
//  ShopHub
//
//  Created by CHENGTAO on 9/22/23.
// Resource: https://www.youtube.com/watch?v=5A1HR-rL2Cs&t=34s

import SwiftUI

struct LaunchScreenView: View {
    @State private var firstPhaseIsAnimating: Bool = false
    @State private var secondPhaseIsAnimating: Bool = false

    @EnvironmentObject var launchScreenManager: LaunchScreenManager
    
    private let timer = Timer.publish(every: 0.65, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            background
            logo
        }
        .onReceive(timer) { _ in
            switch launchScreenManager.state {
            case .first:
                withAnimation(.spring()) {
                    firstPhaseIsAnimating.toggle()
                }
            case .second:
                withAnimation(.easeInOut) {
                    secondPhaseIsAnimating.toggle()
                }
            default: break
            }
        }
        .opacity(secondPhaseIsAnimating ? 0 : 1)
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
            .scaleEffect(secondPhaseIsAnimating ? (UIApplication.shared.connectedScenes.first as! UIWindowScene).screen.nativeBounds.size.height / 4 : 1)
    }
}
