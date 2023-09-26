//
//  OrderIconView.swift
//  ShopHub
//
//  Created by CHENGTAO on 9/26/23.
//

import SwiftUI

struct OrderIconView: View {
    var body: some View {
        HStack {
            IconView(iconImg: "box.truck.fill")
            Text("Order").font(.title2)
        }
    }
}

#Preview {
    OrderIconView()
}
