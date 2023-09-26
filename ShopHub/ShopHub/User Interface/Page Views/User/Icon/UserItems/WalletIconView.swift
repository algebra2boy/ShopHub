//
//  WalletIconView.swift
//  ShopHub
//
//  Created by CHENGTAO on 9/26/23.
//

import SwiftUI

struct WalletIconView: View {
    var body: some View {
        HStack{
            IconView(iconImg: "wallet.pass.fill")
            Text("Wallet").font(.title2)
        }
    }
}

#Preview {
    WalletIconView()
}
