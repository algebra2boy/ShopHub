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
            IconView(iconSystemImage: "star.fill")
            Text("Bookmark")
                .font(.title2)
        }
    }
}

#Preview {
    BookmarkIconView()
}
