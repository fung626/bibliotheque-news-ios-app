//
//  HeaderView.swift
//  bibliotheque-news-ios-app
//
//  Created by EthanTsang on 10/2/2025.
//

import SwiftUI

struct AppHeaderView: View {
    
    @Binding var isSideMenuActive: Bool
    
    let array1 = [
        "Game",
        "Schedule",
        "Watch",
        "News",
        "All-Star",
        "Stats",
        "Standings",
        "Teams",
        "Players",
      ]
    
    let array2: [(id: Int, title: String, expandable: Bool)] = [
        (1, "Home", false),
        (2, "Top Stories", false),
        (3, "Trade Deadline", false),
        (4, "Power Rankings", false),
        (5, "MVP Ladder", false),
        (6, "Transactions", false),
        (7, "Features", true),
        (8, "Events", true),
        (9, "Key Dates", false),
        (10, "Future Starts Now", false),
        (11, "More", true)
    ];
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation {
                        isSideMenuActive.toggle()
                    }
                } label: {
                    BurgerMenuBtn(isOpen: $isSideMenuActive)
                }.frame(width: 32, height: 32)
                    .padding(.leading, 8)
                Image("logo-nba")
                    .frame(alignment: .leading)
                Spacer()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(array1, id: \.self) { item in
                            Text(item)
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .semibold))
                        }
                    }
                }
                Button {
                    
                } label: {
                    Text("Sign In")
                        .foregroundColor(.white)
                }.padding(.trailing, 8)
            }.frame(maxWidth: .infinity, maxHeight: 55)
                .background(Color.black)
            HStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Button {
                            
                        } label: {
                            Text("NEWS")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .bold))
                        }.padding(.leading, 8)
                        ForEach(array2, id: \.id) { x in
                            Button {
                                // Handle expandable action
                            } label: {
                                HStack(spacing: 4) {
                                    Text(x.title)
                                        .foregroundColor(.black)
                                        .font(.system(size: 14, weight: .light))
                                    if x.expandable {
                                        Image(systemName: "arrow-down-black")
                                            .frame(width: 14, height: 14)
                                    }
                                }
                            }
                        }
                    }
                }
            }.frame(maxWidth: .infinity, maxHeight: 48)
                .background(.white)
                .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 5)
        }.padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
    }
}

#Preview {
    AppHeaderView(isSideMenuActive: .constant(false))
}
