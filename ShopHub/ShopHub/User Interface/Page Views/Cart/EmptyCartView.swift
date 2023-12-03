//
//  EmptyCartView.swift
//  ShopHub
//
//  Created by Yongye Tan on 12/2/23.
//

import SwiftUI

struct EmptyCartView: View {
    
    @Environment(\.selectedMenuTab) private var selectMenuTab
    @Environment(\.colorScheme) private var colorScheme // detect whether dark mode is turned on
    
    var body: some View {
        VStack(spacing: 20) {
            
            Image("empty-cart")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .shadow(radius: 10)
                .offset(x: -15)
                .padding(.top, 50)
            
            Text("Add items to start a cart")
                .foregroundStyle(.primary)
                .font(.system(.title2, weight: .semibold))
            
            Text("Once you add items from the store, your products from cart will appear.")
                .multilineTextAlignment(.center)
                .padding(.horizontal, 10)
                .font(.system(size: 18))
                .foregroundStyle(.primary)
            
            Button {
                selectMenuTab.wrappedValue = .products
            } label: {
                Text("Start shopping")
                    .frame(maxWidth: 120)
                    .font(.system(.subheadline, weight: .medium))
                    .foregroundStyle(.primary)
            }
            .padding(.vertical, 10)
            .buttonStyle(.bordered)
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.1))
    }
}

#Preview("Empty cart") {
    EmptyCartView()
}
