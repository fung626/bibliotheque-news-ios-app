//
//  MyMenuView.swift
//  bibliotheque-news-ios-app
//
//  Created by Ethan Tsang on 11/2/2025.
//

import SwiftUI

struct MyMenuView: View {
    var body: some View {
        VStack(alignment: .leading) {
        }.padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor.systemGray6))
    }
}

struct MenuItemView: View {
    var title: String
    var icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .frame(width: 24, height: 24)
            Text(title)
                .font(.system(size: 18, weight: .medium, design: .default))
            Spacer()
        }
        .padding(.vertical, 10)
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: .gray.opacity(0.3), radius: 4, x: 0, y: 2)
    }
}

struct MyMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MyMenuView()
    }
}

