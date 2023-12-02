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
    
    @Environment(ShopHubViewModel.self) private var viewModel
    
    // Parameters
    
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
                ForEach(viewModel.allProducts) { product in
                    NavigationLink {
                        ProductDetailView(product: product)
                    } label: {
                        ProductView(product: product)
                    }
                }
            }
        }
    }
}

//#Preview {
//    SalesView()
//        .environmentObject(ShopHubViewModel())
//}
