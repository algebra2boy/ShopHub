//
//  DayNightToggleView.swift
//  ShopHub
//
//  Created by CHENGTAO on 9/26/23.
//

import SwiftUI

struct DayNightToggleView: View {
    
    @AppStorage("dark-mode") var isDarkModeOn: Bool = false

    var body: some View {
        HStack {
            Toggle(isOn: $isDarkModeOn, label: {
                DayNightToggleIconView()
            })
            
        }
    }
}

#Preview {
    DayNightToggleView()
}

