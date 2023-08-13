//
//  Product.swift
//  ShopHub
//
//  Created by CHENGTAO on 8/12/23.
//

import Foundation
import SwiftUI

struct Product: Codable, Identifiable {
    let id: Int
    let name: String
    let price: Double
    let type: String
    let description: String?
    let image: String
}
