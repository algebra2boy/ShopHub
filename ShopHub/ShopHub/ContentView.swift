//
//  ContentView.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                MenuTabView()
            }
            .tabViewStyle(DefaultTabViewStyle())
            .navigationTitle("ShopHub")

        }
    }
}

#Preview {
    ContentView()
}
