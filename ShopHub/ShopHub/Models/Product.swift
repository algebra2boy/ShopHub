//
//  Product.swift
//  ShopHub
//
//  Created by CHENGTAO on 8/12/23.
//

import Foundation
import SwiftUI

/// a model that defines the Sale Product.
public struct Product: Codable, Identifiable, Hashable {
    
    // database required properties
    public var id: Int
    
    public var name: String
    
    public var price: Double
    
    public var type: String
    
    public var description: String?
    
    public var image: String
    
    public init(id: Int, name: String, price: Double, type: String, description: String? = nil, image: String) {
        self.id = id
        self.name = name
        self.price = price
        self.type = type
        self.description = description
        self.image = image
    }
    
}

extension Product: Comparable {
    /// Conformation to `Comparable` protocol to allow for `sorted()` operations.
    public static func <(lhs: Product, rhs: Product) -> Bool {
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

