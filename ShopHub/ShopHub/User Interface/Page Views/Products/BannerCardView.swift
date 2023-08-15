//
//  BannerCardView.swift
//  ShopHub
//
//  Created by CHENGTAO on 8/15/23.
//

import SwiftUI

struct BannerCardView: View {
    let product: Product
    let padding: CGFloat = 10
    var body: some View {
        Image(product.image)
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 5)
            .padding(.horizontal, 15)
            // when we scroll from one to the other
            // make the container from blurry to clear
            .scrollTransition { content, phase in
                content
                    .opacity(phase.isIdentity ? 1 : 0)
                    .blur(radius: phase.isIdentity ? 0 : 5)
                    .scaleEffect(phase.isIdentity ? 1 : 0.5)
            }
            .overlay(alignment: .bottomTrailing, content: {
                TypeTagView(productType: product.name, backgroundColor: .greenCyan)
                // MARK: Uncomment to use watermark style (You must need to comment line 32 before uncomment watermark style)
                //                Text(product.name)
                //                    .bold()
                //                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
            })
    }
}

#Preview("cardview") {
    BannerView()
        .environmentObject(ShopHubViewModel())
}
