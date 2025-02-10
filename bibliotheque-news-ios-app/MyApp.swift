//
//  MyApp.swift
//  bibliotheque-news-ios-app
//
//  Created by EthanTsang on 10/2/2025.
//

import SwiftUI

@main
struct MyApp: App {
    
    @State private var openSideMenu = false
    
    var body: some Scene {
        WindowGroup {
            MyNavigationView(openSideMenu: $openSideMenu) {
                ContentView()
            }
        }
    }
}
