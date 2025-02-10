//
//  ContentView.swift
//  bibliotheque-news-ios-app
//
//  Created by EthanTsang on 10/2/2025.
//

import SwiftUI
import SSSwiftUISideMenu

struct ContentView: View {
    
    @Binding var openSideMenu: Bool
    @State private var selectedIndex: Int = 0
    @State private var menuConfig = SSMenuConfig()
        
    private var menuItems = [
        MenuItem(title: "Home", icon: "home"),
        MenuItem(title: "My Friends", icon: "friends"),
        MenuItem(title: "Settings", icon: "setting"),
        MenuItem(title: "Logout", icon: "logout")
    ]
    
    var body: some View {
        ZStack {
            SSSwiftUISideMenu(openSideMenu: $openSideMenu, selectedIndex: $selectedIndex, menuItems: menuItems, menuConfig: menuConfig)
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
}

#Preview {
    ContentView(openSideMenu: .constant(false))
}
