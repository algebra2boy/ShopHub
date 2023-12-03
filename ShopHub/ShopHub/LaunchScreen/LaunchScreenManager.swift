//
//  LaunchScreenManager.swift
//  ShopHub
//
//  Created by CHENGTAO on 9/22/23.
//

import Foundation

enum LaunchScreenPhase {
    case first
    case second
    case completed
}

/// This `Observable` class is the view model that manages the life cycle of launch screen.
@Observable
final class LaunchScreenManager {
    
    private(set) var state: LaunchScreenPhase = .first
    
    func dismiss() {
        self.state = .second
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.state = .completed
        }
    }
}
