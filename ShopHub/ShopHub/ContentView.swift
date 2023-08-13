//
//  ContentView.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/11/23.

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ShopHubViewModel = ShopHubViewModel()
    var body: some View {
        TabView {
            MenuTabView()
        }
        .tabViewStyle(DefaultTabViewStyle())
        .environmentObject(viewModel)
    }
}

#Preview("Content View") {
    ContentView()
}
