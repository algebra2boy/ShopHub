//
//  ContentView.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/11/23.

import SwiftUI

struct ContentView: View {
    
    // Environment
    
    @Environment(LaunchScreenManager.self) private var launchScreenManager
    
    // Internal State
    
    @State var viewModel: ShopHubViewModel = ShopHubViewModel()
    @State var cartViewModel: CartViewModel = CartViewModel()
    
    @State var selectedTab: MenuTab = .products
    
    // App Storage
    
    @AppStorage("dark-mode") private var isDarkModeOn: Bool = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MenuTabView()
        }
        .onAppear(perform: dismissLaunchScreen)
        .environment(viewModel)
        .environment(cartViewModel)
        .environment(\.selectedMenuTab, $selectedTab)
        .preferredColorScheme(isDarkModeOn ? .dark : .light)
    }
                   
    func dismissLaunchScreen() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: launchScreenManager.dismiss)
    }
}

#Preview("Content View") {
    ContentView()
        .environment(LaunchScreenManager())
}
