//
//  CartProductGroupList.swift
//  ShopHub
//
//  Created by CHENGTAO on 8/20/23.
//  Source: https://sarunw.com/posts/swiftui-list-section-header-footer/

import SwiftUI

struct CartListView: View {
    
    @EnvironmentObject var cart: CartViewModel
    
    var body: some View {
        List {
            
            ForEach(cart.sectionHeaders, id: \.self) { type in
                
                Section {
                    
                    ForEach(cart.sectionContent(type), id: \.self) { product in
                        CartItemView(product: product,
                                     quantity: cart.products[product] ?? 0)
                    }
                } header: {
                    Text(cart.sectionHeader(type))
                        .font(.subheadline)
                }
                
            }
            
            Section {
                CartTranscationView()
            } header: {
                Text("Transacation")
            }
            
            
            Section {
                EmptyView()
            } footer: {
                Button {
                    // TODO: Connect to db and show pop up
                } label: {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .listStyle(.insetGrouped)
        
    }
}

#Preview {
    CartListView()
        .environmentObject(CartViewModel())
}
