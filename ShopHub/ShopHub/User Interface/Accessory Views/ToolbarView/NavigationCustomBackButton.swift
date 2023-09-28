//
//  NavigationCustomBackButton.swift
//  ShopHub
//
//  Created by Yongye Tan on 9/17/23.
//

import SwiftUI

struct NavigationCustomBarBackButton: ViewModifier {
    
    @Environment(\.dismiss) var dismiss
    
    @ViewBuilder
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(.primary)
                            .font(.title3)
                    }
                }
            }
        
    }
}

extension View {
    @ViewBuilder
    public func navigationCustomBarBackButton() -> some View {
        self.modifier(NavigationCustomBarBackButton())
    }
}
