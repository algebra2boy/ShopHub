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
    
    @State var selectedTab: MenuTab = .products
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MenuTabView()
        }
        .onAppear(perform: dismissLaunchScreen)
        .environmentObject(viewModel)
        .environmentObject(cartViewModel)
        .environment(\.selectedMenuTab, $selectedTab)
        
    }
                   
    func dismissLaunchScreen() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: launchScreenManager.dismiss)
    }
}

#Preview("Content View") {
    ContentView()
        .environmentObject(LaunchScreenManager())
}
