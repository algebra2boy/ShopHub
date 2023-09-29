//
//  BookmarkIconView.swift
//  ShopHub
//
//  Created by CHENGTAO on 9/26/23.
//

import SwiftUI

struct BookmarkIconView: View {
    var body: some View {
        HStack {
            IconView(iconLabel: "Bookmark", systemName: "star.fill")
        }
    }
}

#Preview {
    BookmarkIconView()
}
