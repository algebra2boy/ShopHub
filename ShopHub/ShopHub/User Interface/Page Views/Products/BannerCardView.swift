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
            .overlay(alignment: .bottomTrailing, content: {
                TypeTagView(productType: product.name, backgroundColor: .greenCyan)
                // MARK: Uncomment to use watermark style (You must need to comment line 20 before uncomment watermark style)
//                Text(product.name)
//                    .bold()
//                    .foregroundStyle(.white)
                    .padding()
            })
    }
}

#Preview("card") {
    let products: [Product] = Bundle.main.decode("ProductList.json")
    let product: Product = products[1]
    return BannerCardView(product: product)
}
