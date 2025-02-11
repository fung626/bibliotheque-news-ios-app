//
//  SideMenuView.swift
//  bibliotheque-news-ios-app
//
//  Created by EthanTsang on 10/2/2025.
//

import SwiftUI

struct MySideMenuView<Content: View>: View {
    
    @Binding var isSideMenuActive: Bool
    let menuWidth: CGFloat = UIScreen.main.bounds.width
    let content: Content
    
    init(isSideMenuActive: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self._isSideMenuActive = isSideMenuActive
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                /*Color.black.opacity(isSideMenuActive ? 0.4 : 0)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            // isSideMenuActive.toggle()
                        }
                    }*/
                VStack {
                    content
                }
                .frame(width: menuWidth)
                .offset(x: isSideMenuActive ? 0 : -menuWidth)
                .animation(.easeInOut(duration: 0.2), value: isSideMenuActive)
            }.padding(.top, 55 + UIHelper().getSafeAreaInsets().top)
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
