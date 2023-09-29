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
            IconView(iconLabel: "History", systemName: "book.fill", backgroundColor: .orange)
        }
    }
}

#Preview {
    HistoryIconView()
}
