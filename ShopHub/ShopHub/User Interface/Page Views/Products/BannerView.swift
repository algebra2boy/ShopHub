//
//  BannerView.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/15/23.
//

import SwiftUI

struct BannerView: View {
    
    // the images to be displayed to user
    let images: [String] = ["House1", "Art1", "Food1", "Fitness1", "SteamDeck", "Clothing1"]
    
    @State private var itemPosition: String?
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(images, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 150)
                    // position size relative to the nearest container.
                        .containerRelativeFrame(.horizontal)
                }
            }
            // Configures the lazyHStack as a scroll target layout.
            .scrollTargetLayout(isEnabled: true)
        }
        // try .paging effect
        .scrollTargetBehavior(.viewAligned(limitBehavior: .automatic))
        .scrollPosition(id: $itemPosition) // attach the item position automatically
        
        if let itemPosition {
            Text(itemPosition)
        }
        // TODO: make dots effect to show which item is being displayed
        /* Save for experiment
        Button("Scroll To SteamDeck") {
            // adding animiation would create a smooth scrolling effect
            withAnimation {
                itemPosition = "SteamDeck"
            }
        } */
    }
}

#Preview {
    BannerView()
}
