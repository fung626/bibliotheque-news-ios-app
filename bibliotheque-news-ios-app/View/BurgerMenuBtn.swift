//
//  BurgerMenuBtn.swift
//  bibliotheque-news-ios-app
//
//  Created by Ethan Tsang on 11/2/2025.
//

import SwiftUI

import SwiftUI

struct BurgerMenuBtn: View {
    
    @Binding var isOpen: Bool
    
    var body: some View {
        VStack(spacing: 5) {
            Rectangle()
                .fill(.white)
                .frame(width: 22, height: 2.5)
                .rotationEffect(isOpen ? .degrees(45) : .degrees(0))
                .offset(y: isOpen ? 8 : 0)
            
            Rectangle()
                .fill(.white)
                .frame(width: 22, height: 2.5)
                .opacity(isOpen ? 0 : 1)
            
            Rectangle()
                .fill(.white)
                .frame(width: 22, height: isOpen ? 2.5 : 0.5)
                .rotationEffect(isOpen ? .degrees(-45) : .degrees(0))
                .offset(y: isOpen ? -7 : 0)
        }
        .animation(.easeInOut(duration: 0.1), value: isOpen)
    }
}

struct BurgerMenuButton_Previews: PreviewProvider {
    static var previews: some View {
        BurgerMenuBtn(isOpen: .constant(false))
            .padding()
            .background(Color.black)
            .previewLayout(.sizeThatFits)
    }
}

