//
//  CartProductGroupList.swift
//  ShopHub
//
//  Created by CHENGTAO on 8/20/23.
//  Source1: https://sarunw.com/posts/swiftui-list-section-header-footer/
//  Source2: https://www.hackingwithswift.com/quick-start/swiftui/how-to-control-the-tappable-area-of-a-view-using-contentshape

import SwiftUI

struct CartListView: View {
    
    // Environment
    
    @Environment(CartViewModel.self) private var cart
    
    // Internal State
    
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
                .disabled(showSubmissionView)
                
                
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
    
    @Environment(\.selectedMenuTab) private var selectMenuTab
    @Environment(\.colorScheme) private var colorScheme // detect whether dark mode is turned on
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text(colorScheme == .dark ? "dark" : "light")
            
            Image("empty-cart")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .shadow(radius: 10)
                .offset(x: -15)
                .padding(.top, 50)
            
            Text("Add items to start a cart")
                .foregroundStyle(.primary)
                .font(.system(.title2, weight: .semibold))
            
            Text("Once you add items from the store, your products from cart will appear.")
                .multilineTextAlignment(.center)
                .padding(.horizontal, 10)
                .font(.system(size: 18))
                .foregroundStyle(.primary)
            
            Button {
                selectMenuTab.wrappedValue = .products
            } label: {
                Text("Start shopping")
                    .frame(maxWidth: 120)
                    .font(.system(.subheadline, weight: .medium))
                    .foregroundStyle(.primary)
            }
            .padding(.vertical, 10)
            .buttonStyle(.bordered)
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.1))
    }
}


#Preview {
    CartListView()
        .environment(CartViewModel())
}

#Preview("Empty cart") {
    EmptyCartView()
}

//#Preview("Cart Item View") {
//    let products: [Product] = Bundle.main.decode("ProductList.json")
//    let product = products[1]
//    return CartItemView(product: product, quantity: 3)
//}
