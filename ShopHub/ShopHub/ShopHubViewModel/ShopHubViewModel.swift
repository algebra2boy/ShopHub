//
//  ShopHubViewModel.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/13/23.
//

import Foundation

class ShopHubViewModel: ObservableObject {
    @Published var products: [Product]
    
    init() {
        products = Bundle.main.decode("ProductList.json")
    }
}
