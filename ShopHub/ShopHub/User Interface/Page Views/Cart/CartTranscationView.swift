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
                Text("Subtotal:")
                    .fontWeight(.light)
                    
                Spacer()
                
                Text(10.00, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .fontWeight(.bold)
            }
            
            HStack {
                Text("Delivery Fee:")
                    .fontWeight(.light)
                
                Spacer()
                
                Text(10.00, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .fontWeight(.bold)
            }
            
            Divider()
            
            HStack {
                Text("Total:")
                    .fontWeight(.light)
                
                Spacer()
                
                Text(20.00, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .foregroundStyle(Color.green)
            }
            .padding(.bottom, 10)
            
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
