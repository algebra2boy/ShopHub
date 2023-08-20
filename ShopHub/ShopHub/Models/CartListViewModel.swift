//
//  CartListViewModel.swift
//  ShopHub
//
//  Created by CHENGTAO on 8/20/23.
//

import SwiftUI

class CartListViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    var sectionHeaders: [String] {
        return Array(Set(products.map {
            $0.type
        })).sorted(by: <)
    }
    
    func sectionHeader(_ type: String) -> String {
        type
    }
    
    var groupedProducts : [String: [Product]] {
        Dictionary(grouping: products) { $0.type }
    }
    
    func sectionContent(_ type: String) -> [Product] {
        groupedProducts[type] ?? []
    }
    
}
