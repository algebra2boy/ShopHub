//
//  NavigationBarItemsView.swift
//  ShopHub
//
//  Created by CHENGTAO on 10/1/23.
//

import SwiftUI

/// A custom navigation toolbar button designed for dismissing the current view and navigating back to the previous page.
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
                            .foregroundStyle(Color.black)
                            .font(.title3)
                    }
                }
            }
    }
}

/// A custom navigation toolbar button designed for sharing product link
struct NavigationShareLinkButton: ViewModifier {
    let product: Product
    @ViewBuilder
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ShareLink(item: product, preview: SharePreview(product.name, image: product.image))
                }
            }
    }
}

extension View {
    @ViewBuilder
    public func navigationCustomBarBackButton() -> some View {
        self.modifier(NavigationCustomBarBackButton())
    }
    
    @ViewBuilder
    func navigationShareLinkButton(product: Product) -> some View {
        self.modifier(NavigationShareLinkButton(product: product))
    }
}

