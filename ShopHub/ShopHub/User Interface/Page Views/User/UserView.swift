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
    @State private var isLogin: Bool = false
    
    // EnvironmentObjects
    @EnvironmentObject var auth0Manager: Auth0Manager
    
    
    var body: some View {
        NavigationStack {
            Form {
                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.blue)
                    VStack (alignment: .leading) {
                        Text(auth0Manager.user?.name ?? "Sign In to Access Account")
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
                        if isLogin {
                            self.logout()
                        } else {
                            self.login()
                        }
                    } label: {
                        Text(isLogin ? "Log out" : "Sign up")
                    }
                    .font(.system(size: 22))
                    .offset(CGSize(width: -6, height: 0))
                }
            }
            .searchable(text: $searchText, prompt: "Search")
        }
    }
}


// Sign and Login function
extension UserView {
    func login() {
        Auth0
            .webAuth()
            .start { result in
                switch result {
                case .success(let credentials):
                    self.auth0Manager.user = User(from: credentials.idToken)
                    isLogin = true
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
                    isLogin = false
                case .failure(let error):
                    print("Failed with: \(error)")
                }
            }
    }
}


#Preview {
    UserView()
}
