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
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(viewModel.products) { product in
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
