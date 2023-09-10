//
//  AddToCartView.swift
//  ShopHub
//
//  Created by Yongye Tan on 9/10/23.
//

import SwiftUI

struct AddToCartView: View {
    var body: some View {
        HStack {
            Circle()
                .stroke(.blue, lineWidth: 2.0)
                .frame(width: 25)
                .overlay {
                    Image(systemName: "checkmark")
                        .foregroundStyle(.green)
                }
            Text("Added to cart")
                .foregroundStyle(.white)
                .font(.headline)
                .bold()
        }
        .frame(width: 150, height: 35)
        .background(Color.gray)
    }
}

#Preview {
    AddToCartView()
}
