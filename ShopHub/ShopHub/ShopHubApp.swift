//
//  ShopHubApp.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/11/23.
//

import SwiftUI

@main
struct ShopHubApp: App {
    @StateObject var launchScreenManager: LaunchScreenManager = LaunchScreenManager()
    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()
                if launchScreenManager.state != .completed {
                    LaunchScreenView()
                }
            }
            .environmentObject(launchScreenManager)
        }
    }
}
