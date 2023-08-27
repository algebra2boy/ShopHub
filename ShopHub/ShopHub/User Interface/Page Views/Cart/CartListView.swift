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
                    .onDelete(perform: { indexSet in
                        deleteItems(at: indexSet, for: type)
                    })
                } header: {
                    Text(cart.sectionHeader(type))
                        .font(.subheadline)
                }
                
            }
            
        }
    }
    
    func deleteItems(at offsets: IndexSet, for type: String) {
        // Get the product to delete
        let productToDelete = cart.sectionContent(type)[offsets.first!]

        // Remove the product from the products array
        if let index = cart.products.firstIndex(of: productToDelete) {
            cart.products.remove(at: index)
        }

        // Remove the product from the uniqueItemsSet
        cart.uniqueItemsSet.remove(productToDelete)
    }

}

#Preview {
    CartListView()
        .environmentObject(CartViewModel())
}
