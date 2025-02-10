//
//  MyNavigationView.swift
//  bibliotheque-news-ios-app
//
//  Created by EthanTsang on 10/2/2025.
//

import SwiftUI

struct MyNavigationView<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack(spacing: 0) {
            AppHeaderView()
            content
                .navigationBarHidden(true)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct MyNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationView {
        }
    }
}
