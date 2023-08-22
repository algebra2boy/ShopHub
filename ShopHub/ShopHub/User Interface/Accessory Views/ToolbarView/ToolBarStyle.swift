//
//  ToolBarStyle.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/12/23.
//  Source: https://sarunw.com/posts/custom-navigation-bar-title-view-in-swiftui/

import SwiftUI

/// a view modifier that is used for customize the top bar leading logo and brand name
struct ToolBarStyleModifier: ViewModifier {
    let title: String
    let titleImage: String
    @Binding var isLogoPressed: Bool
    
    @ViewBuilder
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Image(systemName: titleImage)
                            .symbolEffect(.bounce.up, value: isLogoPressed)
                        Text(title)
                            .fontDesign(.monospaced)
                    }
                    .onTapGesture {
                        withAnimation {
                            isLogoPressed.toggle()
                        }
                    }
                    .font(.system(size: 25))

                }
            }
    }
}

extension View {
    @ViewBuilder
    public func toolBarStyle(title: String, titleImage: String = "exclamationmark.circle.fill", isLogoPressed: Binding<Bool>) -> some View {
        self.modifier(ToolBarStyleModifier(title: title, titleImage: titleImage, isLogoPressed: isLogoPressed))
    }
}
