//
//  ContentView.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/11/23.

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: ShopHubViewModel = ShopHubViewModel()
    @StateObject var cartViewModel: CartViewModel = CartViewModel()
    
    var body: some View {
        TabView {
            MenuTabView()
        }
        .environmentObject(viewModel)
        .environmentObject(cartViewModel)
    }
}

#Preview("Content View") {
    ContentView()
}
