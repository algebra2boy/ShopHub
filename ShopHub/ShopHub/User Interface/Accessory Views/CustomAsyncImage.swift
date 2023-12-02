//
//  CustomAsyncImage.swift
//  ShopHub
//
//  Created by CHENGTAO on 11/14/23.
//

import SwiftUI

struct CustomAsyncImage<ClipShape: Shape>: View {
    
    let imageUrl: String?
    let width: CGFloat
    let height: CGFloat
    var clipShape : () -> ClipShape
    
    var body: some View {
        Group {
            if let imageUrl = imageUrl, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .foregroundStyle(.blue)
            }
        }
        .frame(width: width, height: height)
        .clipShape(clipShape())
    }
    
}
