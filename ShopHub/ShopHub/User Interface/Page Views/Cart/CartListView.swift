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
            if cart.isEmpty() {
                EmptyCartView()
            } else {
                List {
                    
                    ForEach(cart.sectionHeaders, id: \.self) { type in
                        
                        Section {
                            
                            ForEach(cart.sectionContent(type), id: \.self) { product in
                                CartItemView(product: product,
                                             quantity: cart.products[product] ?? 0)
                                
                            }
                            .listRowInsets(.init(top: 5, leading: 10, bottom: 5, trailing: 10)) // add padding to each list item to make the view less tight
    
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
}

struct EmptyCartView: View {
    var body: some View {
        VStack(spacing: 20) {
            
            Image("empty-cart")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .shadow(radius: 10)
                .offset(x: -15)
                .padding(.top, 50)
            
            Text("Your shopping cart is empty.")
                .font(.title2)
                .fontWeight(.semibold)
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.1))
    }
}


#Preview {
    CartListView()
        .environmentObject(CartViewModel())
}

#Preview("Empty cart") {
    EmptyCartView()
}

//#Preview("Cart Item View") {
//    let products: [Product] = Bundle.main.decode("ProductList.json")
//    let product = products[1]
//    return CartItemView(product: product, quantity: 3)
//}
