//
//  MockCartView.swift
//  ShopHub
//
//  Created by CHENGTAO on 8/28/23.
//

import SwiftUI

// 1. Define your models
//struct MProduct: Identifiable, Equatable {
//    let id: Int
//    let name: String
//    let type: String
//    // Add more properties as needed
//}

// 1. Modify the MProduct struct to conform to Hashable
struct MProduct: Identifiable, Equatable, Hashable {
    let id: Int
    let name: String
    let type: String
    // Add more properties as needed
}

class MockCartViewModel: ObservableObject {
    
    // MARK: List
//    @Published var products: [MProduct] = [
//        MProduct(id: 1, name: "SteamDeck", type: "Electronics"),
//        MProduct(id: 2, name: "Clothing1", type: "Clothing"),
//        MProduct(id: 3, name: "House1", type: "House"),
//        MProduct(id: 4, name: "Art1", type: "Art"),
//        MProduct(id: 5, name: "Food1", type: "Food")
//    ]
//    
//    var sectionHeaders: [String] {
//        Set(products.map { $0.type }).sorted()
//    }
//    
//    func sectionContent(for type: String) -> [MProduct] {
//        products.filter { $0.type == type }
//    }
//    
//    func delete(product: MProduct) {
//        if let index = products.firstIndex(of: product) {
//            products.remove(at: index)
//        }
//    }
    
    // MARK: Dictionary
    // 2. Initialize the products dictionary
//        @Published var products: [MProduct: Int] = [
//            MProduct(id: 1, name: "SteamDeck", type: "Electronics"): 1,
//            MProduct(id: 2, name: "Clothing1", type: "Clothing"): 2,
//            MProduct(id: 3, name: "House1", type: "House"): 3,
//            MProduct(id: 4, name: "Art1", type: "Art"): 4,
//            MProduct(id: 5, name: "Food1", type: "Food"): 5
//        ]
    @Published var products: [Product: Int] = [:]

        
        var sectionHeaders: [String] {
            Set(products.keys.map { $0.type }).sorted()
        }
        
        func sectionContent(for type: String) -> [Product] {
            products.keys.filter { $0.type == type }
        }
        
        func delete(product: Product) {
            products.removeValue(forKey: product)
        }
    
    init() {
        let products: [Product] = Bundle.main.decode("ProductList.json")
        self.products = [
            products[0]: 1,
            products[1]: 2,
            products[2]: 3,
            products[3]: 4,
            ]
    }
    
}

struct MockCartListView: View {
    
    @ObservedObject var cart: MockCartViewModel
    
    var body: some View {
        HStack {
            List {
                ForEach(cart.sectionHeaders, id: \.self) { type in
                    Section(header: Text(type)) {
                        ForEach(cart.sectionContent(for: type)) { product in
                            ExtractedView(product: product, cart: cart)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    @StateObject var cart: MockCartViewModel = MockCartViewModel()
    return MockCartListView(cart: cart)
}

//@main
//struct CartApp: App {
//    @StateObject private var cart = CartViewModel()
//    
//    var body: some Scene {
//        WindowGroup {
//            NavigationView {
//                CartListView()
//                    .environmentObject(cart)
//            }
//        }
//    }
//}


struct ExtractedView: View {
    let product: Product
    @ObservedObject var cart = MockCartViewModel()
    var body: some View {
        HStack {
            Image(systemName: "trash.fill")
            Text(product.name)
            HStack {
                Button {
                    buttonFunc()
                } label: {
                    Image(systemName: "minus.square")
                }
            }
            .buttonStyle(.borderless)
        }
        .padding([.leading, .trailing, .top], 10)
        .background(Color(.systemBackground))
        .cornerRadius(20)
        .swipeActions(edge: .leading, allowsFullSwipe: false) {
            Button(role: .destructive) {
                cart.delete(product: product)
            } label: {
                Label("Delete", systemImage: "trash")
            }
            .tint(.red)
            .labelStyle(.titleAndIcon)
        }
    }
    
    func buttonFunc() {
        print("Button is pressed.")
    }
}
