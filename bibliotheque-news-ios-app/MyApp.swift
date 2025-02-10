//
//  MyApp.swift
//  bibliotheque-news-ios-app
//
//  Created by EthanTsang on 10/2/2025.
//

import SwiftUI

@main
struct MyApp: App {
    
    @State private var isSideMenuActive = false
    
    var body: some Scene {
        WindowGroup {
            ContentView(isSideMenuActive: $isSideMenuActive)
        }
    }
}
