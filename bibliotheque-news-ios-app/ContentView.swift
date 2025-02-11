//
//  ContentView.swift
//  bibliotheque-news-ios-app
//
//  Created by EthanTsang on 10/2/2025.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var isSideMenuActive: Bool
    
    init(isSideMenuActive: Binding<Bool>) {
        self._isSideMenuActive = isSideMenuActive
    }
    
    var body: some View {
        ZStack {
            MyNavigationView(isSideMenuActive: $isSideMenuActive) {
                VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        ArticleView()
                            .padding(.vertical, 24)
                        AppFooterView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 229 / 255, green: 231 / 255, blue: 235 / 255))
                .edgesIgnoringSafeArea(.all)
            }
            
            MySideMenuView(isSideMenuActive: $isSideMenuActive) {
                MyMenuView()
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    ContentView(isSideMenuActive: .constant(false))
}
