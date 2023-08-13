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
                            VStack(alignment: .center){
                                    ZStack(alignment: .topTrailing) {
                                        Image(product.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                            .padding()
                                        
                                        // Header
                                        Text("\(product.type)")
                                            .padding(7)
                                            .background(Color.orange.opacity(0.7))
                                            .foregroundColor(.white)
                                            .font(.custom("header", size: 11))
                                            .cornerRadius(8)
                                    }
                                    
                                    // Production name and price label
                                VStack{
                                    HStack {
                                        Text(product.name)
                                            .font(.subheadline)
                                            .fontWeight(.bold)
                                        Text(product.price, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                    }
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity)
//                                    
//                                    Text(product.description ?? "N/A")
//                                        .lineLimit(2)
//                                        .truncationMode(.tail)
                                    
                                }
                                }
                                .fixedSize()
                                .background(Color.bloodOrange.opacity(0.7))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Sales")
        }
    }
}

#Preview {
    SalesView()
}
