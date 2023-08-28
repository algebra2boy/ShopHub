//
//  CartSubmissionView.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/27/23.
//

import SwiftUI

struct CartSubmissionView: View {
    
    @Binding var showSubmissionView: Bool
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.blue, lineWidth: 4)
                .foregroundColor(.clear)
            
            VStack(alignment: .center) {
                HStack(alignment: .top) {
                    Circle()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.gray)
                        .overlay {
                            Image(systemName: "checkmark")
                                .fontWeight(.bold)
                                .font(.system(size: 40))
                                .foregroundColor(.green)
                                .blur(radius: isAnimating ? 0 : 3.0)
                                .scaleEffect(isAnimating ? 1 : 0.25)
                                .opacity(isAnimating ? 1 : 0)
                        }
                }
                
                Divider()
                
                Text("Your order has been submitted!")
                
            }
        }
        .frame(maxWidth: 150, maxHeight: 150)
        .padding()
        .onTapGesture {
            showSubmissionView.toggle()
        }
        .onAppear {
            withAnimation(.linear(duration: 0.5)) {
                isAnimating.toggle()
            }
        }
        
    }
}


#Preview {
    CartSubmissionView(showSubmissionView: .constant(false))
}
