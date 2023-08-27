//
//  ShopHubViewModel.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/13/23.
//

import Foundation

class ShopHubViewModel: ObservableObject {
    /// public storage to store all the products with only read access
    public private(set) var allProducts: [Product]
    
    /// filtered products to be shown to the users. Filtered based on the search text.
    @Published var filteredProducts: [Product]
    
    /// the search text to filter out the products
    var searchText = ""
    
    
    init() {
        allProducts = Bundle.main.decode("ProductList.json")
        filteredProducts = allProducts.filter(searchText: searchText)
    }
    
    /// update and filter the search text
    /// - Parameters searchText:  A `String` used to filter out the products
    func update(searchText: String) {
        self.searchText = searchText
        filteredProducts = allProducts.filter(searchText: searchText)
    }
}

extension Array where Element == Product {
    
    /// filter out the products based on the searchText.
    /// choose the products whose name is contained the searchText.
    /// - Parameters searchText:  A `String` used to filter out the products
    /// - Returns: An array of `Products` that satisfied teh searching citeria
    func filter(searchText: String) -> Self {
        filter {
            searchText.isEmpty ? true : 
            $0.name.contains(searchText) || $0.type.contains(searchText)
        }
    }
}
