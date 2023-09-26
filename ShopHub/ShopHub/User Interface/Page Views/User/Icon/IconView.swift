//
//  IconView.swift
//  ShopHub
//
//  Created by CHENGTAO on 9/26/23.
//

import SwiftUI

struct IconView: View {
    let iconImg: String
    var foregroundColor: Color = .blue
    var backgroundColor: Color = .white
    var cornerRadius: CGFloat = 4
    var imageWidth: CGFloat = 20
    var imageHeight: CGFloat = 20
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius).fill(backgroundColor)
                .frame(width: imageWidth, height: imageHeight)
            Image(systemName: iconImg).foregroundStyle(foregroundColor)
        }
    }
}

