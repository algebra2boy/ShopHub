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
                        .containerRelativeFrame(.horizontal)
                }
            }
            .scrollTargetLayout(isEnabled: true)
        }
        .scrollTargetBehavior(.paging)
        .safeAreaPadding(.horizontal, 20)
        .frame(height: 200)
        // TODO: (Optional) add Animation
    }
}

#Preview {
    return BannerView()
}
