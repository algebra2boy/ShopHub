//
//  AddToCartView.swift
//  ShopHub
//
//  Created by Yongye Tan on 9/10/23.
//  Source: https://www.hackingwithswift.com/books/ios-swiftui/triggering-events-repeatedly-using-a-timer

import SwiftUI

struct AddToCartView: View {
    
    @Binding var isAddToCartShown: Bool
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var second: Int = 0 // keep track of how many seconds the view has been appeared

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
        .onReceive(timer) { _ in
            if second == 2 {
                isAddToCartShown.toggle()
                timer.upstream.connect().cancel()
            }
            second += 1
        }
    }
}

#Preview {
    let products: [Product] = Bundle.main.decode("ProductList.json")
    let product: Product = products[1]
    return ProductDetailView(product: product)
        .environment(CartViewModel())
}
