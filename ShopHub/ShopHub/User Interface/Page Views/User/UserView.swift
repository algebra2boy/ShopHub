//
//  UserView.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/12/23.
//

import SwiftUI

struct UserView: View {
    
    // Internal State
    
    @State private var searchText: String = ""
    @State private var isLogoPressed: Bool = false
    
    var body: some View {
        NavigationStack {
            Form {
                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.blue)
                    VStack (alignment: .leading) {
                        Text("User name")
                            .font(.title2)
                        Text("other info about user")
                    }
                }
                
                Section {
                    DayNightToggleView()
                }
                
                Section {
                    UserComponentsView()
                }
                
            }
            .toolBarStyle(title: "Settings", titleImage: "gearshape.fill", isLogoPressed: $isLogoPressed)
            .searchable(text: $searchText, prompt: "Search")
        }
    }
}



#Preview {
    UserView()
}
