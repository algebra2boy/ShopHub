//
//  CartProductGroupList.swift
//  ShopHub
//
//  Created by CHENGTAO on 8/20/23.
//

import SwiftUI

struct CartListView: View {
    
    @EnvironmentObject var cart: CartViewModel
    
    var body: some View {
        List {
            
            ForEach(cart.sectionHeaders, id: \.self) { type in
                
                Section {
                    
                    ForEach(cart.sectionContent(type)) { product in
                        CartItemView(product: product)
                    }
                    
                } header: {
                    Text(cart.sectionHeader(type))
                        .font(.subheadline)
                }
                
            }
            
        }
    }
}

#Preview {
    CartListView()
        .environmentObject(CartViewModel())
}
