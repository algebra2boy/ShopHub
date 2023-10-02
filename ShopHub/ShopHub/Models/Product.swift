//
//  Product.swift
//  ShopHub
//
//  Created by CHENGTAO on 8/12/23.
//

import Foundation
import SwiftUI
import CoreTransferable

// a model that defines the Sale Product
struct Product: Codable, Identifiable, Hashable {
    
    // database required properties
    var id: Int
    var name: String
    var price: Double
    var type: String
    var description: String?
    var image: String
    
}

extension Product: Comparable {
    /// Conformation to `Comparable` protocol to allow for `sorted()` operations.
    static func <(lhs: Product, rhs: Product) -> Bool {
        if lhs.name != rhs.name {
            return lhs.name < rhs.name
        } else if lhs.price != rhs.price {
            return lhs.price < rhs.price
        } else if lhs.type != rhs.type {
            return lhs.type < rhs.type
        }
        return lhs.image < rhs.image
    }
    
}

// Make Product transferable for shareLine
extension Product: Transferable {
    static var transferRepresentation: some TransferRepresentation {
            ProxyRepresentation(exporting: \.image)
        }
}
