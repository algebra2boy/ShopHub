//
//  CartProductGroupList.swift
//  ShopHub
//
//  Created by CHENGTAO on 8/20/23.
//

import SwiftUI

struct CartListView: View {
    let products: [Product]
    var body: some View {
        List {
            ForEach(products) {product in
                Text(product.name)
            }
        }
    }
}

#Preview {
    let products: [Product] = Bundle.main.decode("ProductList.json")
    return CartListView(products: products)
}
