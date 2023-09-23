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
        }
        .onAppear(perform: dimissLaunchScreen)
        .environmentObject(viewModel)
        .environmentObject(cartViewModel)
        
    }
                   
    func dimissLaunchScreen() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: launchScreenManager.dismiss)
    }
}

#Preview("Content View") {
    ContentView()
        .environmentObject(LaunchScreenManager())
}
