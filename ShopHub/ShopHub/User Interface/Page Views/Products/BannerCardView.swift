//
//  BannerCardView.swift
//  ShopHub
//
//  Created by CHENGTAO on 8/15/23.
//

import SwiftUI

struct BannerCardView: View {
    // Parameter
    let product: Product
    
    var body: some View {
        Image(product.image)
            .resizable()
            .scaledToFit()
            .frame(height: 180)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .mask(RoundedRectangle(cornerRadius: 25))
            .shadow(radius: 5)
            .padding(.horizontal, 15)
            .overlay(alignment: .bottomTrailing, content: {
                TypeTagView(productType: product.name, backgroundColor: .greenCyan)
                // MARK: Uncomment to use watermark style (You must need to comment line 24 before uncomment watermark style)
//                Text(product.name)
//                    .bold()
//                    .foregroundStyle(.white)
                    .padding(.horizontal)
            })
    }
}

#Preview("card") {
    let products: [Product] = Bundle.main.decode("ProductList.json")
    let product: Product = products[1]
    return BannerCardView(product: product)
}

#Preview("cardview") {
    BannerView()
        .environmentObject(ShopHubViewModel())
}
