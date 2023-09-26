//
//  DayNightToggleView.swift
//  ShopHub
//
//  Created by CHENGTAO on 9/26/23.
//

import SwiftUI

struct DayNightToggleView: View {
    
    @State private var isDarkModeOn: Bool = false


    var body: some View {
        HStack {
            IconView(iconImg: "moon.circle.fill", foregroundColor: .black)
            // TODO: Dark mode switch function
            Toggle("Dark Mode", isOn: $isDarkModeOn)
        }
    }
}


