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
                ProductsView()
                    .tabItem {
                        Label("Product", systemImage: "bag")
                    }
                CartView()
                    .tabItem {
                        Label("Cart", systemImage: "cart")
                    }
                UserView()
                    .tabItem {
                        Label("User", systemImage: "person")
                    }
            }
            .tabViewStyle(DefaultTabViewStyle())
            .navigationTitle("ShopHub")

        }
    }
}

#Preview {
    ContentView()
}
