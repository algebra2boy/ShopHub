//
//  MenuTabView.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/12/23.
//

import Foundation
import SwiftUI

struct MenuTabView: View {
    
    @EnvironmentObject var shoppingCart: CartViewModel
    @StateObject var menuViewModel: MenuTabViewModel = MenuTabViewModel()
    
    var body: some View {
        ForEach(menuViewModel.tabs) { tab in
            tab.destination
                .tabItem {
                    tab.label
                }
                .badge(tab == .cart ?
                       shoppingCart.totalQuantities < 99 ? String(shoppingCart.totalQuantities) : "99+"
                       : nil)
        }
    }
}

/// a view model that stores the information about the menu tabs
final class MenuTabViewModel: ObservableObject {
    @Published var tabs: [MenuTab] = MenuTab.allCases
}

/// A enum that represents the menu tab at the bottom of the screen
enum MenuTab: CaseIterable, Identifiable, Codable, Hashable {
    case products
    case cart
    case user
    
    var id: MenuTab { return self }
}

extension MenuTab {
    @ViewBuilder
    var label: some View {
        switch self {
        case .products:
            Label("Product", systemImage: "bag")
        case .cart:
            Label("Cart", systemImage: "cart")
        case .user:
            Label("User", systemImage: "person")
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .products:
            ProductsView()
        case .cart:
            CartView()
        case .user:
            UserView()
        }
    }
}
