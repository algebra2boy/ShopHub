//
//  Product.swift
//  ShopHub
//
//  Created by CHENGTAO on 8/12/23.
//

import Foundation
import SwiftUI

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
