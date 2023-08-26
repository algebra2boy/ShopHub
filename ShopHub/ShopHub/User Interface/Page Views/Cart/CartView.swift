//
//  CartView.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/12/23.
//

import SwiftUI

struct CartView: View {
    
    // Environment Object
    @EnvironmentObject var cart: CartViewModel
    
    // Internal State
    @State private var searchText: String = ""
    @State private var isLogoPressed = false

    var body: some View {
        NavigationStack {
            VStack {
                // MARK: Product list in users' cart
                List {
                    ForEach(cart.sectionHeaders, id: \.self) { type in
                        Section(header: Text(cart.sectionHeader(type)).font(.subheadline)) {
                            ForEach(cart.sectionContent(type)) { product in
                                ProductCardView(product: product)
                            }
                        }
                    }
                }
            }
            .toolBarStyle(title: "Shopping Cart", titleImage: "cart.fill", isLogoPressed: $isLogoPressed)
            .searchable(text: $searchText, prompt: "Search for your product in cart")
        }
    }
}

#Preview {
    CartView()
}

// TODO: Design UI
struct ProductCardView: View {
    let product: Product
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(10)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(product.name)
                    .font(.headline)

                Text(product.description ?? "N/A")
                    .font(.subheadline)
                    .lineLimit(2)
            }
        }
    }
}

#Preview("Product Card") {
    let products: [Product] = Bundle.main.decode("ProductList.json")

    return ProductCardView(product: products[1])
}
