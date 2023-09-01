//
//  CartItemView.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/25/23.
//

import SwiftUI

struct CartItemView: View {
    
    // Environment object
    @EnvironmentObject var shoppingCart: CartViewModel
    
    // Parameters
    let product: Product
    let quantity: Int
    
    private var totalPrice: Double {
        let singlePrice = product.price
        let quantities = Double((shoppingCart.getQuantity(of: product)))
        let total = singlePrice * quantities
        return total
    }
    
    var body: some View {
        HStack(spacing: 20) {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name)
                    .font(.headline)
                    .foregroundColor(.primary)

                Text(product.description ?? "N/A")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .truncationMode(.tail)
                
                HStack {
                    Text(formattedPrice(price: totalPrice))
                        .foregroundColor(.black)
                        .font(.system(size: 18))
                        .fontWeight(.heavy)
                        .minimumScaleFactor(formattedPrice(price: totalPrice).count > 5 ? 0.5 : 1)  // will scale down to at most half the original font size
                        .lineLimit(1)  // ensure it remains on one line
                    
                    Spacer()
                    
                    HStack {
                        Button {
                            shoppingCart.decrementQuantity(of: product)
                        } label: {
                            Image(systemName: "minus.square")
                            
                        }
                        .disabled(shoppingCart.getQuantity(of: product) == 1)
                        
                        Text("\(shoppingCart.getQuantity(of: product))")
                            .minimumScaleFactor(quantity > 9 ? 0.5 : 1)
                            .lineLimit(1)
                        
                        Button {
                            shoppingCart.incrementQuantity(of: product)
                            
                        } label: {
                            Image(systemName: "plus.square")
                        }
                        .disabled(shoppingCart.getQuantity(of: product) == 999)
                    }
                    .buttonStyle(.borderless)
                                                
                }
                .foregroundStyle(.blue)
            }
        }
        .padding([.leading, .trailing, .top], 10)
        .background(Color(.systemBackground))
        .cornerRadius(20)
        .swipeActions(edge: .leading, allowsFullSwipe: false) {
            Button(role: .destructive) {
                shoppingCart.delete(product: product)
            } label: {
                Label("delete", systemImage: "trash.fill")
            }
            .tint(.red)
            .labelStyle(.titleAndIcon)
        }
        
    }
    
    func formattedPrice(price: Double) -> String {
        price.formatted(.currency(code: Locale.current.currency?.identifier ?? "USD"))
    }
        
}

#Preview("Cart List View") {
    CartListView()
        .environmentObject(CartViewModel())
}

