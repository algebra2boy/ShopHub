//
//  BannerView.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/15/23.
//

import SwiftUI

struct BannerView: View {
        
    // Environment Object
    
    @EnvironmentObject var viewModel: ShopHubViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(viewModel.allProducts) { product in
                    BannerCardView(product: product)
                }
            }
            .scrollTargetLayout(isEnabled: true)
        }
        .scrollTargetBehavior(.viewAligned(limitBehavior: .automatic))
        .frame(height: 200)
        // TODO: (Optional) add Animation
    }
}

#Preview {
    BannerView()
        .environmentObject(ShopHubViewModel())
}
