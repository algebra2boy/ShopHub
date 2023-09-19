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
            ScrollView {
                BannerView()
                SalesView()
            }
            .toolBarStyle(title: "ShopHub", titleImage: "basket.fill" , isLogoPressed: $isLogoPressed)
            .searchable(text: $searchText, prompt: "Search for products")
            .searchSuggestions(searchSuggestionListView)
            .onChange(of: searchText) {
                viewModel.update(searchText: searchText)
            }
        }
    }
    
    
    @ViewBuilder
    func searchSuggestionListView() -> some View {
        Section {
            ForEach(viewModel.filteredProducts) { product in
                NavigationLink {
                    ProductDetailView(product: product)
                } label: {
                    searchSuggestionView(product: product)
                }
            }
        } header: {
            Text("Top Searches").bold()
        }
    }
    
    @ViewBuilder
    func searchSuggestionView(product: Product) -> some View {
        HStack {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            
            VStack(alignment: .leading) {
                Text(product.name)
                
                Text(product.description ?? "")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
            .frame(height: 30)
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
