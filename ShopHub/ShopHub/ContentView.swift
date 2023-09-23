//
//  ContentView.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/11/23.

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: ShopHubViewModel = ShopHubViewModel()
    @StateObject var cartViewModel: CartViewModel = CartViewModel()
    @EnvironmentObject var launchScreenManager: LaunchScreenManager
    
    var body: some View {
        TabView {
            MenuTabView()
                .onAppear {
                    DispatchQueue
                        .main
                        .asyncAfter(deadline: .now() + 3) {
                            launchScreenManager.dismiss()
                        }
                }
        }
        .environmentObject(viewModel)
        .environmentObject(cartViewModel)
        
    }
}

#Preview("Content View") {
    ContentView()
        .environmentObject(LaunchScreenManager())
}
