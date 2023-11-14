//
//  UserView.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/12/23.
//

import SwiftUI
import Auth0

struct UserView: View {
    
    // Internal State
    @State private var searchText: String = ""
    @State private var isLogoPressed: Bool = false
    
    // EnvironmentObjects
    @EnvironmentObject var auth0Manager: Auth0Manager

    
    var body: some View {
        NavigationStack {
            Form {
                HStack {
                    CustomAsyncImage(
                        imageUrl: auth0Manager.user?.picture,
                        width: 50,
                        height: 50,
                        clipShape: { Circle() }
                    )
                    VStack (alignment: .leading) {
                        Text(auth0Manager.user?.name ?? "Sign In to AccessAccount")
                            .font(.title2)
                        Text(auth0Manager.user?.email ?? "Sign In to View Your Email")
                    }
                }
                
                Section {
                    DayNightToggleView()
                }
                
                Section {
                    UserComponentsView()
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Image(systemName: "gearshape.fill") // titleImage
                        Text("Setting") // title
                    }
                    .font(.system(size: 22))
                    .foregroundStyle(.darkBackground)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        if isLogoPressed {
                            self.logout()
                        } else {
                            self.login()
                        }
                    } label: {
                        Text(isLogoPressed ? "Log out" : "Sign up")
                    }
                    .font(.system(size: 22))
                    .offset(CGSize(width: -6, height: 0))
                }
            }
            .searchable(text: $searchText, prompt: "Search")
        }
    }
}



extension UserView {
    func login() {
        Auth0
            .webAuth()
            .start { result in
                switch result {
                case .success(let credentials):
                    self.auth0Manager.user = User(from: credentials.idToken)
                    isLogoPressed.toggle()
                case .failure(let error):
                    print("Failed with: \(error)")
                }
            }
    }
    
    func logout() {
        Auth0
            .webAuth()
            .clearSession { result in
                switch result {
                case .success:
                    self.auth0Manager.user = nil
                case .failure(let error):
                    print("Failed with: \(error)")
                }
            }
        
    }
}


#Preview {
    UserView()
}
