//
//  MyNavigationView.swift
//  bibliotheque-news-ios-app
//
//  Created by EthanTsang on 10/2/2025.
//

import SwiftUI

struct MyNavigationView<Content: View>: View {
    
    @Binding var isSideMenuActive: Bool
    
    let content: Content

    init(isSideMenuActive: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self._isSideMenuActive = isSideMenuActive
        self.content = content()
    }

    var body: some View {
        VStack(spacing: 0) {
            AppHeaderView(isSideMenuActive: $isSideMenuActive)
            content
                .navigationBarHidden(true)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct MyNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationView(isSideMenuActive: .constant(false)) {
            
        }
    }
}
