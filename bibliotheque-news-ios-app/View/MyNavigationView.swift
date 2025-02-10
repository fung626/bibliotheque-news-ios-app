//
//  MyNavigationView.swift
//  bibliotheque-news-ios-app
//
//  Created by EthanTsang on 10/2/2025.
//

import SwiftUI

struct MyNavigationView<Content: View>: View {
    
    @Binding var openSideMenu: Bool
    
    let content: Content

    init(openSideMenu: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self._openSideMenu = openSideMenu
        self.content = content()
    }

    var body: some View {
        VStack(spacing: 0) {
            AppHeaderView(openSideMenu: $openSideMenu)
            content
                .navigationBarHidden(true)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct MyNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationView(openSideMenu: .constant(false)) {
            
        }
    }
}
