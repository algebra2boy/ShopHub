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
    
    public init(product: Product) {
        self.product = product
    }
    
    var body: some View {
        VStack(alignment: .center){
            ZStack(alignment: .topTrailing) {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 100)
                    .padding()
                
                // MARK: Header
                Text("\(product.type)")
                    .padding(7)
                    .background(Color.orange.opacity(0.7))
                    .foregroundColor(.white)
                    .font(.custom("header", size: 11))
                    .cornerRadius(8)
            }
            
            // MARK: Production name and price label
            VStack{
                HStack {
                    Text(product.name)
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Text(product.price, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                
                Text(product.description ?? "N/A")
                    .frame(width: 100, height: 30)
                    .fontWeight(.light)
                    .foregroundStyle(Color.black.opacity(0.7))
                    .font(.custom("", size: 11))
                
            }
        }
        .fixedSize()
        .background(Color.bloodOrange.opacity(0.7))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

//#Preview {
//    var products: [Product] = Bundle.main.decode("ProductList.json") as [Product]
//    var product: Product = products[0]
//    ProductView(product: product)
//}
