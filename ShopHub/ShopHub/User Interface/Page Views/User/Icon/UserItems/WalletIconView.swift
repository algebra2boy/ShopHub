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
            IconView(iconLabel: "Wallet", systemName: "wallet.pass.fill")
        }
    }
}

#Preview {
    WalletIconView()
}
