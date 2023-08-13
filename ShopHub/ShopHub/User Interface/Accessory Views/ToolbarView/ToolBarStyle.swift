//
//  ToolBarStyle.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/12/23.
//  Source: https://sarunw.com/posts/custom-navigation-bar-title-view-in-swiftui/

import SwiftUI

/// a view modifier that is used for customize the top bar leading logo and brand name
struct ToolBarStyleModifier: ViewModifier {
    @Binding var isLogoPressed: Bool
    
    @ViewBuilder
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Image(systemName: "basket.fill")
                            .symbolEffect(.bounce.up, value: isLogoPressed)
                        Text("ShopHub")
                            .font(.system(size: 25))
                            .fontDesign(.monospaced)
                    }
                    .onTapGesture {
                        isLogoPressed.toggle()
                    }
                }
            }
    }
}

extension View {
    @ViewBuilder
    public func toolBarStyle(isLogoPressed: Binding<Bool>) -> some View {
        self.modifier(ToolBarStyleModifier(isLogoPressed: isLogoPressed))
    }
}
