//
//  CartTranscationView.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/27/23.
//

import SwiftUI

struct CartTranscationView: View {
    
    // Environment object
    @EnvironmentObject var shoppingCart: CartViewModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                TranscationTextView(text: "Subtotal")
                    
                Spacer()
                
                TranscationTextView(bill: 10.00)
            }
            
            HStack {
                TranscationTextView(text: "Delivery fee:")
                
                Spacer()
                
                TranscationTextView(bill: 10.00)
            }
            
            Divider()
            
            HStack {
                TranscationTextView(text: "Total:")
                
                Spacer()
                
                TranscationTextView(bill: 20.00)
                    .font(.system(size: 20))
                    .foregroundStyle(Color.green)
            }
            .padding([.top, .bottom], 5)
            
        }
    }
}

struct TranscationTextView: View {
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

#Preview {
    Form {
        Section {
            CartTranscationView()
        } header: {
            Text("Transacation")
        }
    }
}
