//
//  CartView.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/12/23.
//

import SwiftUI

struct CartView: View {
    @State private var searchText: String = ""
    @State private var isLogoPressed = false
    @StateObject var cart = CartViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                // MARK: Product list in users' cart
                List {
                    ForEach(cart.sectionHeaders, id: \.self) { type in
                        Section(header: Text(cart.sectionHeader(type)).font(.subheadline)) {
                            ForEach(cart.sectionContent(type)) { product in
                                CartProductView(product: product)
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
struct CartProductView: View {
    let product: Product
    var body: some View {
        VStack {
            Text(product.name)
        }
    }
}
