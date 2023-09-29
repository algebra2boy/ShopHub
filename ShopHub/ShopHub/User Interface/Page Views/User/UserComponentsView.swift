//
//  UserComponentsView.swift
//  ShopHub
//
//  Created by CHENGTAO on 9/24/23.
//

import Foundation
import SwiftUI

struct UserComponentsView: View {
    @StateObject var viewModel: UserComponentsViewModel = UserComponentsViewModel()
    
    var body: some View {
        List (viewModel.pages) { page in
            NavigationLink {
                page.destination
            } label: {
                page.label
            }
        }
    }
}



/// a view model that stores the information about the UserComponents tabs
final class UserComponentsViewModel: ObservableObject {
    @Published var pages: [UserComponents] = UserComponents.allCases
}

/// A enum that represents the user component  of the screen
enum UserComponents: CaseIterable, Identifiable, Codable, Hashable {
    case wallet
    case order
    case history
    case bookmark
    
    var id: UserComponents { return self }
}

extension UserComponents {
    @ViewBuilder
    var destination: some View {
        switch self {
        case .wallet:
            WalletView()
        case .order:
            OrderView()
        case .history:
            HistoryView()
        case .bookmark:
            BookmarkView()
        }
    }
}

extension UserComponents {
    @ViewBuilder
    var label: some View {
        switch self {
        case .wallet:
            WalletIconView()
        case .order:
            OrderIconView()
        case .history:
            HistoryIconView()
        case .bookmark:
            BookmarkIconView()
        }
    }
}

#Preview {
    UserComponentsView(viewModel: UserComponentsViewModel())
}

