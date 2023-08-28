//
//  CartProductGroupList.swift
//  ShopHub
//
//  Created by CHENGTAO on 8/20/23.
//  Source: https://sarunw.com/posts/swiftui-list-section-header-footer/

import SwiftUI

struct CartListView: View {
    
    @EnvironmentObject var cart: CartViewModel
    
    @State private var showSubmissionView: Bool = false
    
    var body: some View {
        ZStack {
            List {
                
                ForEach(cart.sectionHeaders, id: \.self) { type in
                    
                    Section {
                        
                        ForEach(cart.sectionContent(type), id: \.self) { product in
                            CartItemView(product: product,
                                         quantity: cart.products[product] ?? 0)
                        }
                    } header: {
                        Text(cart.sectionHeader(type))
                            .font(.subheadline)
                    }
                    
                }
                
                Section {
                    CartTranscationView()
                } header: {
                    Text("Transacation")
                }
                
                
                Section {
                    EmptyView()
                } footer: {
                    Button {
                        // TODO: Connect to db and show pop up
                        showSubmissionView.toggle()
                    } label: {
                        Text("Continue")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .listStyle(.insetGrouped)
            .blur(radius: showSubmissionView ? 8 : 0)
            
            if showSubmissionView {
                CartSubmissionView(showSubmission: $showSubmissionView)
            }
        }
        .onTapGesture { // dismiss the view after clicking on the outside
            if showSubmissionView {
                showSubmissionView.toggle()
            }
        }
        
    }
}

#Preview {
    CartListView()
        .environmentObject(CartViewModel())
}
