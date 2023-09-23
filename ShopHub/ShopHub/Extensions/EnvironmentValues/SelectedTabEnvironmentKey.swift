//
//  SelectedTabEnvironmentKey.swift
//  ShopHub
//
//  Created by Yongye Tan on 9/20/23.
//

import Foundation
import SwiftUI

struct SelectedTabEnvironmentKey: EnvironmentKey {
    static let defaultValue: Binding<MenuTab> = .constant(.user)
}

extension EnvironmentValues {
    var selectedMenuTab: Binding<MenuTab> {
        get { self[SelectedTabEnvironmentKey.self] }
        set { self[SelectedTabEnvironmentKey.self] = newValue }
    }
}
