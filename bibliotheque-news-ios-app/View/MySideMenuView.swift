//
//  SideMenuView.swift
//  bibliotheque-news-ios-app
//
//  Created by EthanTsang on 10/2/2025.
//

import SwiftUI

struct MySideMenuView<Content: View>: View {
    
    @Binding var isSideMenuActive: Bool
    let menuWidth: CGFloat = UIScreen.main.bounds.width * 0.75
    let content: Content
    
    init(isSideMenuActive: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self._isSideMenuActive = isSideMenuActive
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Color.black.opacity(isSideMenuActive ? 0.4 : 0)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            isSideMenuActive.toggle()
                        }
                    }
                VStack {
                    content
                }
                .frame(width: menuWidth)
                .background(Color.white)
                .offset(x: isSideMenuActive ? 0 : -menuWidth)
                .animation(.easeInOut(duration: 0.2))
            }
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MySideMenuView(isSideMenuActive: .constant(true)) {
            MyMenuView()
        }
    }
}
