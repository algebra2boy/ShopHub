//
//  SalesView.swift
//  ShopHub
//
//  Created by CHENGTAO on 8/12/23.
//

import Foundation
import SwiftUI

struct SalesView: View {
    let columns = [
        GridItem(),
        GridItem()
    ]
    let products: [Product] = Bundle.main.decode("ProductList.json")
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(products) { product in
                        NavigationLink {
                            // View for Production Detail
                            Text(product.name)
                        } label: {
                            ProductView(product: product)
                        }
                        .padding()
                    }
                }
                
            }
        }
    }
}

#Preview {
    SalesView()
}
