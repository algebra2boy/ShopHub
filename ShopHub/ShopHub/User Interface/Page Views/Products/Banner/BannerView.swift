//
//  BannerView.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/15/23.
//

import SwiftUI

struct BannerView: View {
        
    // Environment
    
    @Environment(ShopHubViewModel.self) private var viewModel

    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(viewModel.allProducts) { product in
                    BannerCardView(product: product)
                }
            }
            .scrollTargetLayout(isEnabled: true)
        }
        .scrollIndicators(.hidden)
        .frame(height: 200)
        // TODO: (Optional) add Animation
    }
}

#Preview {
    BannerView()
        .environment(ShopHubViewModel())
}
