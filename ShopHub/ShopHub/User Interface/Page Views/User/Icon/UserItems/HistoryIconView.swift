//
//  HistoryIconView.swift
//  ShopHub
//
//  Created by CHENGTAO on 9/26/23.
//

import SwiftUI

struct HistoryIconView: View {
    var body: some View {
        HStack {
            IconView(iconImg: "book.fill")
            Text("History").font(.title2)
        }
    }
}

#Preview {
    HistoryIconView()
}
