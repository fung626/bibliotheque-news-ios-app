//
//  MyMenuView.swift
//  bibliotheque-news-ios-app
//
//  Created by Ethan Tsang on 11/2/2025.
//

import SwiftUI

struct MyMenuView: View {
    
    let menuWidth: CGFloat = UIScreen.main.bounds.width * 0.35
    
    let links: [(id: Int, title: String, childs: [String])] = [
        (1, "All-Star", []),
        (2, "League Pass", []),
        (3, "Games", []),
        (4, "Schedule", []),
        (5, "Watch", []),
        (6, "News", []),
        (7, "Stats", []),
        (8, "Standings", []),
        (9, "Teams", []),
        (10, "Players", []),
        (11, "NBA Play", []),
        (12, "NBA Bet", []),
        (13, "Fanfasy", []),
        (14, "Store", []),
        (15, "Tickets", []),
    ]
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                ScrollView(.vertical) {
                    ForEach(links, id: \.id) { x in
                        MenuItemView(title: x.title)
                    }
                }
            }.frame(maxWidth: menuWidth, maxHeight: .infinity)
                .background(.black)
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.bottom, UIHelper().getSafeAreaInsets().bottom)
            .background(.white)
    }
}

struct MenuItemView: View {
    
    var title: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundColor(.white)
                    .font(.headline)
                Spacer()
            }.padding(.horizontal)
            Divider()
                .frame(maxWidth: .infinity, maxHeight: 0.5)
                .background(.white)
                .padding(.top, 6)
        }.padding(.top, 12)
           
    }
}

struct MyMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MyMenuView()
    }
}

