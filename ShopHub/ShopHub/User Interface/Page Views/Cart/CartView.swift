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
    @State private var selectedColor = "Red"
    @StateObject var cart = CartListViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                // MARK: Product list in users' cart
                List {
                    ForEach(cart.sectionHeaders, id: \.self) { type in
                        Section(header: Text(cart.sectionHeader(type)).font(.subheadline)) {
                            ForEach(cart.sectionContent(type)) {product in
                                ExtractedView(product: product)
                            }
                        }
                    }
                }
            }
            .searchBar(title: "Shopping Cart", titleImage: "cart.fill", isLogoPressed: $isLogoPressed)
            .searchable(text: $searchText, prompt: "Search for your product in cart")
        }
    }
}

#Preview {
    let products: [Product] = Bundle.main.decode("ProductList.json")
    let cart = CartListViewModel()
    cart.products = products
    return CartView(cart: cart)
}

struct ExtractedView: View {
    let product: Product
    var body: some View {
        VStack {
            Text(product.name)
        }
    }
}
