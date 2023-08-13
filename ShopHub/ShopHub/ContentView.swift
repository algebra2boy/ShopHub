//
//  ContentView.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/11/23.

import SwiftUI

struct ContentView: View {
    @State private var isLogoPressed = false
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            TabView {
                MenuTabView()
            }
            .tabViewStyle(DefaultTabViewStyle())
            .toolBarStyle(isLogoPressed: $isLogoPressed)
        }
    }
}

#Preview {
    ContentView()
}
