//
//  IconView.swift
//  ShopHub
//
//  Created by CHENGTAO on 9/26/23.
//

import SwiftUI

struct IconView: View {
    var iconLabel: String
    var systemName: String
    var foregroundColor: Color
    var backgroundColor: Color
    var cornerRadius: CGFloat
    var imageWidth: CGFloat
    var imageHeight: CGFloat
    
    public init(iconLabel: String = "Shophub",
                systemName: String = "apple.logo",
                foregroundColor: Color = .white,
                backgroundColor: Color = .blue,
                cornerRadius: CGFloat = 4,
                imageWidth: CGFloat = 20,
                imageHeight: CGFloat = 20) {
        self.iconLabel = iconLabel
        self.systemName = systemName
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
    }
    
    var body: some View {
        Label {
            Text(iconLabel)
        } icon: {
            Image(systemName: systemName)
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)
                .foregroundStyle(foregroundColor)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 28, height: 28)
                        .foregroundColor(backgroundColor)
                )
        }
    }
}

#Preview {
    UserView()
}
