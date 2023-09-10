//
//  ProductDetailView.swift
//  ShopHub
//
//  Created by CHENGTAO on 8/14/23.
//

import SwiftUI

struct ProductDetailView: View {
    
    // Parameters
    let product: Product
    
    // Internal State
    @State private var quantity = 1
    @State private var isAddButtonPressed = false
    @FocusState var isQuantityFocused: Bool
    
    @EnvironmentObject var shoppingCart: CartViewModel

    // Calculate total price base on products' quantity
    private var totalPrice: Double {
        let singlePrice = product.price
        let quantities = Double(quantity)
        let total = singlePrice * quantities
        return total
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    // MARK: Top image
                    ZStack {
                        Image("\(product.image)")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    
                    Divider()
                    
                    // MARK: Name and type stack
                    HStack {
                        
                        TypeTagView(productType: product.type,
                                    backgroundColor: .red,
                                    fontSize: 12)
                        
                        Spacer()
                        
                        Text(product.name)
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                        
                    }
                    .padding()
                    
                    // MARK: Description
                    Text(product.description ?? "N/A")
                        .multilineTextAlignment(.leading)
                        .font(.body)
                        .fontWeight(.light)
                        .padding()
                    
                    // MARK: Price && Quantity
                    HStack {
                        
                        Text(totalPrice, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .font(.system(size: 20))
                            .fontWeight(.heavy)
                        
                        Spacer()
                        
                        HStack {
                            Button {
                                quantity -= 1
                            } label: {
                                Image(systemName: "minus.square")
                            }
                            .disabled(quantity == 1)
                            
                            TextFieldQuantityView(value: $quantity, focusState: _isQuantityFocused)
                            
                            Button {
                                quantity += 1
                            } label: {
                                Image(systemName: "plus.square")
                            }
                        }
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                    }
                    .padding()
                    
                    Button {
                        isAddButtonPressed.toggle()
                        shoppingCart.add(product: product, with: quantity)
                    } label: {
                        Text("Add to cart")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                    .sensoryFeedback(.success, trigger: isAddButtonPressed) // add haptic effect when item adds to cart
                }
                .blur(radius: isAddButtonPressed ? 0.5 : 0)
                .disabled(isAddButtonPressed)
                
                if isAddButtonPressed {
                    Color.clear
                    AddToCartView()
                }
            }
        }
        .navigationTitle("Product Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            // add a submit button to disable the focus
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button {
                    isQuantityFocused = false
                } label: {
                    Text("Submit").foregroundStyle(.blue)
                }
            }
            
        }
    }
}

#Preview("Clothing") {
    let products: [Product] = Bundle.main.decode("ProductList.json")
    let product: Product = products[1]
    return ProductDetailView(product: product)
        .environmentObject(CartViewModel())
}

