//
//  CartSubmissionView.swift
//  ShopHub
//
//  Created by Yongye Tan on 8/27/23.
//

import SwiftUI

struct CartSubmissionView: View {
    
    /// show the submission view when `Continue` is pressed.
    @Binding var showSubmission: Bool
    
    // Internal State
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.blue, lineWidth: 4)
                .foregroundColor(.clear)
            
            VStack(alignment: .center) {
                HStack {
                    Circle()
                        .frame(width: 80)
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
                
                
                Text("Your order has been submitted!")
                    .font(.system(size: 18))
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                
            }
        }
        .frame(maxWidth: 150, maxHeight: 150) // make the view to be a square
        .padding()
        .onAppear {
            withAnimation(.linear(duration: 0.5)) {
                isAnimating.toggle()
            }
        }
        .onTapGesture {
            showSubmission.toggle()
        }
        
    }
}


#Preview {
    CartSubmissionView(showSubmission: .constant(false))
}
