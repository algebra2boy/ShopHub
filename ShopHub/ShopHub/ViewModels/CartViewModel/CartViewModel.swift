//
//  CartListViewModel.swift
//  ShopHub
//
//  Created by CHENGTAO on 8/20/23.
//  Source: https://www.youtube.com/watch?v=L_x5MkTrQ0o&t=1393s


import SwiftUI
import Foundation

class CartViewModel: ObservableObject, Cartable {

    @Published var products: [Product: Int] = [:]
    
    
    var sectionHeaders: [String] {
        Set(products.keys.map { $0.type }).sorted(by: <)
    }
    
    func sectionHeader(_ type: String) -> String {
        type
    }
    
    var groupedProducts : [String: [Product]] {
        Dictionary(grouping: products.keys) { $0.type }
    }
    
    func sectionContent(_ type: String) -> [Product] {
        Array(products
            .filter { $0.key.type == type }
            .keys)
    }
    
    init() {
        let products: [Product] = Bundle.main.decode("ProductList.json")
        self.products = [products[1]: 1]
    }
    
}

extension CartViewModel {
    /// Add product to local shopping cart
    func add(product: Product, with count: Int) {
        if products.keys.contains(product) {
            products[product]! += count
        } else {
            products[product] = count
        }
    }
    
    /// update the product quantity to local shopping cart
    func update(product: Product, with count: Int) {
        products[product] = count
    }
    
    /// A `Boolean` value that indicates whether the shopping cart is empty.
    func isEmpty() -> Bool {
        products.isEmpty
    }
    
    /// Get and manipulate the quantity of product
    func getQuantity(of product: Product) -> Int {
        products[product] ?? -1
    }
    
    /// Delete product from the local shopping cart
    func delete(product: Product) {
        products.removeValue(forKey: product)
    }
}

extension CartViewModel {
    /// Calculate the total quantities of all the products in the cart
    var totalQuantities: Int {
        products.values.reduce(0, +)
    }
    

    func incrementQuantity(of product: Product) {
        if let currentQuantity = products[product], currentQuantity <= 999 {
            products[product]! += 1
        }
    }
    
    func decrementQuantity(of product: Product) {
        if let currentQuantity = products[product], currentQuantity > 0 {
            products[product]! -= 1
        }
    }
    
    /// Calculate the total price of all the products in the cart
    func calculateTotalPrice(with fee: Double = 0.0) -> Double {
        var subtotal: Double = 0.0
        for (product, quantity) in products {
            subtotal += product.price * Double(quantity)
        }
        return subtotal + fee
    }
}

