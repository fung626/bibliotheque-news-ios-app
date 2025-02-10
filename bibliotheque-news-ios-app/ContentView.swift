//
//  ContentView.swift
//  bibliotheque-news-ios-app
//
//  Created by EthanTsang on 10/2/2025.
//

import SwiftUI
import SSSwiftUISideMenu

struct ContentView: View {
    
    @State private var isMenuOpen = false
    
    var body: some View {
        // SSSwiftUISideMenu(openSideMenu: isMenuOpen, selectedIndex: 0, menuItems: <#T##[MenuItem]#>)
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                ArticleView()
                    .padding(.vertical, 24)
                AppFooterView()
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 229 / 255, green: 231 / 255, blue: 235 / 255))
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
