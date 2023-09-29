//
//  CartTransactionView.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/27/23.
//

import SwiftUI

struct CartTransactionView: View {
    
    // Environment object
    
    @EnvironmentObject var shoppingCart: CartViewModel
    
    private var isEligibleForFreeDelivery: Bool {
        // No fee when a user buys more than two products
        shoppingCart.totalQuantities > 2
    }
    
    private var adjustedDeliveryFee: Double {
        isEligibleForFreeDelivery ? 0.0 : 10.00
    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                TransactionTextView(text: "Subtotal")
                
                Spacer()
                
                TransactionTextView(bill: shoppingCart.calculateTotalPrice())
            }
            
            HStack {
                TransactionTextView(text: "Delivery fee:")
                
                Spacer()
                
                TransactionTextView(bill: adjustedDeliveryFee)
                    .foregroundStyle(isEligibleForFreeDelivery ? .gray : .black)
                    .strikethrough(isEligibleForFreeDelivery, color: .gray)
                
            }
            
            Divider()
            
            HStack {
                TransactionTextView(text: "Total:")
                
                Spacer()
                
                TransactionTextView(bill: shoppingCart.calculateTotalPrice(with: adjustedDeliveryFee))
                    .font(.system(size: 20))
                    .foregroundStyle(Color.green)
            }
            .padding([.top, .bottom], 5)
        }
    }

}

struct TransactionTextView: View {
    var text: String?
    var bill: Double?
    
    var body: some View {
        if let text {
            Text(text)
                .fontWeight(.light)
        } else if let bill {
            Text(bill, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .fontWeight(.bold)
        }
    }
}

#Preview("Cart List View") {
    CartListView()
        .environmentObject(CartViewModel())
}



