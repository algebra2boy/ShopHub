//
//  ContentView.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/11/23.

import SwiftUI

struct ContentView: View {
    
    // State Object
    
    @StateObject var viewModel: ShopHubViewModel = ShopHubViewModel()
    @StateObject var cartViewModel: CartViewModel = CartViewModel()
    
    // Environment
    
    @Environment(LaunchScreenManager.self) private var launchScreenManager
    
    // App Storage
    
    @AppStorage("dark-mode") private var isDarkModeOn: Bool = false
    
    // Internal State
    
    @State var selectedTab: MenuTab = .products
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MenuTabView()
        }
        .onAppear(perform: dismissLaunchScreen)
        .environmentObject(viewModel)
        .environmentObject(cartViewModel)
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
