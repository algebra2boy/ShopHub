//
//  IconView.swift
//  ShopHub
//
//  Created by CHENGTAO on 9/26/23.
//

import SwiftUI

struct IconView: View {
    var iconSystemImage: String
    var foregroundColor: Color
    var backgroundColor: Color
    var cornerRadius: CGFloat
    var imageWidth: CGFloat
    var imageHeight: CGFloat
    
    public init(iconSystemImage: String = "apple.logo",
                foregroundColor: Color = .blue,
                backgroundColor: Color = .white,
                cornerRadius: CGFloat = 4,
                imageWidth: CGFloat = 20,
                imageHeight: CGFloat = 20) {
        self.iconSystemImage = iconSystemImage
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(backgroundColor)
                .frame(width: imageWidth, height: imageHeight)
            Image(systemName: iconSystemImage)
                .foregroundStyle(foregroundColor)
        }
    }
}

#Preview {
    IconView()
}
