//
//  SideMenuView.swift
//  bibliotheque-news-ios-app
//
//  Created by EthanTsang on 10/2/2025.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack {
            Text("Menu Item 1")
                .padding()
            Text("Menu Item 2")
                .padding()
            Text("Menu Item 3")
                .padding()
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.black)
    }
}

#Preview {
    SideMenuView()
}
