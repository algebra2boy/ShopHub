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
        // since we pass value and focusState as binding variable, we need to get the wrapped value of these binding variable, therefore having the underscore "opens" the Binding for you to change its wrapped value. More to find: https://stackoverflow.com/a/71237371/22303588
        self._value = value
        self._focusState = focusState
    }
    
    var body: some View {
        TextField("1", value: $value, format: .number)
            .frame(width: 55)
            .focused($focusState)
            .multilineTextAlignment(.center)
            .textFieldStyle(.roundedBorder)
            .keyboardType(.numberPad) // super weird log: unable to simultaneously satisfy constraints, seems like a bug in swiftui, more to find: https://stackoverflow.com/questions/66082340/swiftui-unable-to-simultaneously-satisfy-constraints-when-focus-on-textfield-a
            .onChange(of: value) { oldValue, newValue in
                if value > 999 {
                    value = oldValue
                }
            } // onChange only accepts 2 parameter or 0, more to find: https://useyourloaf.com/blog/swiftui-onchange-deprecation/
    }
    
}
