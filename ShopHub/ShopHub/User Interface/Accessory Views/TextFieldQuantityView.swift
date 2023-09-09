//
//  TextFieldQuantityView.swift
//  ShopHub
//
//  Created by Yongye Tan on 9/9/23.
//

import SwiftUI

struct TextFieldQuantityView: View {
    
    @Binding var value: Int
    @FocusState var focusState: Bool
    
    init(value: Binding<Int>, focusState: FocusState<Bool>) {
        _value = value
        _focusState = focusState
    }
    
    var body: some View {
        TextField("1", value: $value, format: .number)
            .focused($focusState)
            .multilineTextAlignment(.center)
            .textFieldStyle(.roundedBorder)
            .frame(width: 55)
            .keyboardType(.numberPad) // super weird log: unable to simultaneously satisfy constraints, seems like a bug in swiftui, more to find: https://stackoverflow.com/questions/66082340/swiftui-unable-to-simultaneously-satisfy-constraints-when-focus-on-textfield-a
            .onChange(of: value) { oldValue, newValue in
                if value > 999 {
                    value = oldValue
                }
            } // onChange only accepts 2 parameter or 0, more to find: https://useyourloaf.com/blog/swiftui-onchange-deprecation/
    }
    
}
