//
//  Cartable.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/26/23.
//

import Foundation

protocol Cartable {
    
    /// a dictionary of products that the user adds to their local shopping cart.
    var products: [Product: Int] { get }
    
    /// adds a specific product to the local shopping cart with quantity.
    func add(product: Product, with: Int)
    
    /// remove product from the local shopping cart.
    func delete(product: Product)
    
    /// update the product quantity to local shopping cart.
    func update(product: Product, with: Int)
    
    /// get the quantity of product
    func getQuantity(of product: Product) -> Int
    
}
