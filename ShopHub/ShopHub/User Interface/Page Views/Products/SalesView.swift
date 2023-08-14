//
//  SalesView.swift
//  ShopHub
//
//  Created by CHENGTAO on 8/12/23.
//

import Foundation
import SwiftUI

struct SalesView: View {
    
    // Enviornment
    
    @EnvironmentObject var viewModel: ShopHubViewModel
    
    // internal
    
    let columns = [GridItem](repeating: GridItem(.flexible()), count: 2)
    
    
    var body: some View {
        ScrollView {
            HStack {
                Text("Sales")
                    .font(.system(size: 45))
                    .padding(.horizontal, 20)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(-2)
            
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(viewModel.filteredProducts) { product in
                    NavigationLink {
                        // View for Production Detail
                        Text(product.name)
                    } label: {
                        ProductView(product: product)
                    }
                }
            }
        }
    }
}

#Preview {
    SalesView()
        .environmentObject(ShopHubViewModel())
}
