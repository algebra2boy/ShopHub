//
//  BannerView.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/15/23.
//

import SwiftUI

struct BannerView: View {
        
    let products: [Product] = Bundle.main.decode("ProductList.json")
    
    @State private var itemPosition: String?
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(products) {product in
                    BannerCardView(product: product)
                }
            }
            .padding()
            // Configures the lazyHStack as a scroll target layout.
            .scrollTargetLayout(isEnabled: true)
        }
        // try .paging effect
        .scrollTargetBehavior(.viewAligned(limitBehavior: .automatic))
//        .scrollPosition(id: $itemPosition) // attach the item position automatically
//        
//        if let itemPosition {
//            Text(itemPosition)
//        }
        // TODO: make dots effect to show which item is being displayed
        /* Save for experiment
        Button("Scroll To SteamDeck") {
            // adding animiation would create a smooth scrolling effect
            withAnimation {
                itemPosition = "SteamDeck"
            }
        } */
        .frame(height: 200)
        // TODO: (Optional) add Animation
    }
}

#Preview {
    return BannerView()
}
