//
//  ProductsView.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/12/23.
//

import SwiftUI

struct ProductsView: View {
    @State private var isLogoPressed = false
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Product")
            }
            .toolBarStyle(isLogoPressed: $isLogoPressed)
            .searchable(text: $searchText, prompt: "Search for products")
        }
    }
}

#Preview {
    NavigationView {
        TabView {
            ProductsView()
                .tabItem {
                    Label("Product", systemImage: "bag")
                }
        }
    }

}
