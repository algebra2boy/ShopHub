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
                SalesView()
            }
            .toolBarStyle(isLogoPressed: $isLogoPressed)
            .searchable(text: $searchText, prompt: "Search for products")
        }
    }
}

#Preview {
    TabView {
        ProductsView()
            .environmentObject(ShopHubViewModel())
            .tabItem {
                Label("Product", systemImage: "bag")
            }
    }

}
