//
//  CartItemView.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/25/23.
//

import SwiftUI

struct CartItemView: View {
    
    // Parameters
    let product: Product
    
    var body: some View {
        HStack(spacing: 10) {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name)
                    .font(.headline)

                Text(product.description ?? "N/A")
                    .font(.subheadline)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .truncationMode(.tail)
            }
        }
        .padding(10)
    }
}

#Preview {
    let products: [Product] = Bundle.main.decode("ProductList.json")
    let product: Product = products[1]
    return CartItemView(product: product)
}
