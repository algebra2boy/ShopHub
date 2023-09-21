//
//  ContentView.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/11/23.

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: ShopHubViewModel = ShopHubViewModel()
    @StateObject var cartViewModel: CartViewModel = CartViewModel()
    
    @State var selectedTab: MenuTab = .products
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MenuTabView()
        }
        .environmentObject(viewModel)
        .environmentObject(cartViewModel)
        .environment(\.selectedMenuTab, $selectedTab)
    }
}

#Preview("Content View") {
    ContentView()
}
