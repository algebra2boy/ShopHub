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
    
    private var deliveryFee: Double {
        let fee: Double = 10.00
        // No fee when a user buys more than three products
        let finalFee = shoppingCart.totalQuantities > 3 ? 0.0 : fee
        return finalFee
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
                
                TransactionTextView(bill: deliveryFee)
            }
            
            Divider()
            
            HStack {
                TransactionTextView(text: "Total:")
                
                Spacer()
                
                TransactionTextView(bill: shoppingCart.calculateTotalPrice(with: deliveryFee))
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
//
//#Preview {
//    Form {
//        Section {
//            CartTransactionView()
//        } header: {
//            Text("Transaction")
//        }
//    }
//}
