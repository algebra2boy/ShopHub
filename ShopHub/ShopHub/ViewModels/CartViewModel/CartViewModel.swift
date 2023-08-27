//
//  CartListViewModel.swift
//  ShopHub
//
//  Created by CHENGTAO on 8/20/23.
//  Source: https://www.youtube.com/watch?v=L_x5MkTrQ0o&t=1393s


import SwiftUI

class CartViewModel: ObservableObject, Cartable {

    @Published var products: [Product: Int] = [:]
    
    var sectionHeaders: [String] {
        products.keys
            .map { $0.type }
            .sorted(by: <)
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

}

extension CartViewModel {
    
    // MARK: Add product to local shopping cart
    func add(product: Product, count: Int) {
        if products.keys.contains(product) {
            products[product]! += count
        } else {
            products[product] = count
        }
    }
}
