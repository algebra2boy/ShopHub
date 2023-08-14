//
//  ProductsView.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/12/23.
//

import SwiftUI

struct ProductsView: View {
    
    // Environment
    
    @EnvironmentObject var viewModel: ShopHubViewModel
    
    // Internal
    
    @State private var isLogoPressed = false
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                SalesView()
            }
            .toolBarStyle(isLogoPressed: $isLogoPressed)
            // search bar
            .searchable(text: $searchText, prompt: "Search for products")
            // use the view model to filter out product (separate the view logic)
            .onChange(of: searchText) {
                viewModel.update(searchText: searchText)
            }
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
