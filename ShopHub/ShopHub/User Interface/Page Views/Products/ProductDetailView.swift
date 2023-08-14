//
//  ProductDetailView.swift
//  ShopHub
//
//  Created by CHENGTAO on 8/14/23.
//

import SwiftUI

struct ProductDetailView: View {
    
    // Parameter
    let product: Product
    
    // Internal
    @State private var count = 0
    
    var totalPrice: Double {
        let singlePrice = product.price
        let count = Double(count)
        let total = singlePrice * count
        return total
    }
    
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Image("\(product.image)")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                
                Divider()
                
                // name and type stack
                HStack {

                    TypeTagView(productType: product.type, backgroundColor: .red, fontSize: 12)
                    Spacer()
                    
                    Text(product.name)
                        .fontWeight(.bold)
                        .font(.system(size: 20))

                }
                .padding()
                
                
                Text(product.description ?? "N/A")
                    .font(.body)
                    .fontWeight(.light)
                
                HStack {
                    Text(totalPrice, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .font(.system(size: 18))
                        .fontWeight(.heavy)
                    
                    Spacer()
                    
                    HStack {
                        Button {
                            if count > 0 {
                                count -= 1
                            } else {
                                count = 0
                            }
                        } label: {
                            Image(systemName: "minus.square")
                        }
                        
                        Text("\(count)")
                        
                        Button {
                                count += 1
                        } label: {
                            Image(systemName: "plus.square")
                        }
                    }
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                }
                .padding()
                
                Button {
                    // MARK: ShoppingCartView
                    // TODO: adding total amount of product to cart
                } label: {
                    Text("Add to cart")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
        }
        .navigationTitle("Product Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview("SteamDeck") {
    let products: [Product] = Bundle.main.decode("ProductList.json")
    let product: Product = products[1]
    return ProductDetailView(product: product)
}

