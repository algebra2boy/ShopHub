//
//  CartView.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/12/23.
//

import SwiftUI

struct CartView: View {
    
    // Internal State
    @State private var searchText: String = ""
    @State private var isLogoPressed: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                CartListView()
            }
            .toolBarStyle(title: "Shopping Cart", titleImage: "cart.fill", isLogoPressed: $isLogoPressed)
            .searchable(text: $searchText, prompt: "Search for your product in cart")
        }
    }
}

//#Preview {
//    CartView()
//        .environmentObject(CartViewModel())
//}

