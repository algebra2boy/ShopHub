//
//  CartProductGroupList.swift
//  ShopHub
//
//  Created by CHENGTAO on 8/20/23.
//  Source1: https://sarunw.com/posts/swiftui-list-section-header-footer/
//  Source2: https://www.hackingwithswift.com/quick-start/swiftui/how-to-control-the-tappable-area-of-a-view-using-contentshape

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
                    CartTransactionView()
                } header: {
                    Text("Transaction")
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
                
                Color.clear
                    // because swipe action is another gesture
                    // swiftui is confused on which gesture should perform first
                    // give this view for hit testing
                    .contentShape(Rectangle())  // make entire view tappable
                    .onTapGesture {
                        showSubmissionView.toggle()
                    }
                
                CartSubmissionView(showSubmission: $showSubmissionView)
            }
        }
    }
    
}

#Preview {
    CartListView()
        .environmentObject(CartViewModel())
}
