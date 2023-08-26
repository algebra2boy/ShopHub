//
//  TypeTagView.swift
//  ShopHub
//
//  Created by CHENGTAO on 8/14/23.
//

import SwiftUI

struct TypeTagView: View {
    
    // Parameters
    
    let productType: String
    let paddingValue: CGFloat
    let backgroundColor: Color
    let foreGroundColor: Color
    let fontSize: CGFloat
    
    init(productType: String = "N/A", paddingValue: CGFloat = 7, backgroundColor: Color = .pink, foreGroundColor: Color = .white, fontSize: CGFloat = 10) {
        self.productType = productType
        self.paddingValue = paddingValue
        self.backgroundColor = backgroundColor
        self.foreGroundColor = foreGroundColor
        self.fontSize = fontSize
    }
    
    var body: some View {
        Text(productType)
            .padding(paddingValue)
            .background(backgroundColor.opacity(0.7))
            .foregroundColor(foreGroundColor)
            .font(.system(size: fontSize))
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    TypeTagView()
}
