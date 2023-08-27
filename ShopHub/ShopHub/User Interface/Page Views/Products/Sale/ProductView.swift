//
//  ProductView.swift
//  ShopHub
//
//  Created by CHENGTAO on 8/12/23.
//

import Foundation
import SwiftUI

struct ProductView: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .center){
            // put the type to the top right
            ZStack(alignment: .topTrailing) {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 100)
                    .padding()
                
                // MARK: Header
                TypeTagView(productType: product.type)
            }
            
            // MARK: Product name and price label
            VStack(alignment: .leading) {
                VStack {
                    Text(product.name)
                        .font(.subheadline)
                        .fontWeight(.bold)
                                        
                    Text(product.price, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                
                // MARK: Product description
                Text(product.description ?? "N/A")
                    .multilineTextAlignment(.leading) // make sure words are left align
                    .lineLimit(2)
                    .truncationMode(.tail)
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white.opacity(0.7))
                
            }
            .frame(width: 150, height: 100)
        }
        .background(Color.darkBackground.opacity(0.7))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview("SteamDeck") {
    let products: [Product] = Bundle.main.decode("ProductList.json")
    let product: Product = products[0]
    return ProductView(product: product)
}

#Preview("Clothing") {
    let products: [Product] = Bundle.main.decode("ProductList.json")
    let product: Product = products[1]
    return ProductView(product: product)
}

#Preview("Pillow") {
    let products: [Product] = Bundle.main.decode("ProductList.json")
    let product: Product = products[2]
    return ProductView(product: product)
}

#Preview("Art") {
    let products: [Product] = Bundle.main.decode("ProductList.json")
    let product: Product = products[3]
    return ProductView(product: product)
}


#Preview("Food") {
    let products: [Product] = Bundle.main.decode("ProductList.json")
    let product: Product = products[4]
    return ProductView(product: product)
}

#Preview("Dumbell") {
    let products: [Product] = Bundle.main.decode("ProductList.json")
    let product: Product = products[5]
    return ProductView(product: product)
}
