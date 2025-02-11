//
//  MyMenuView.swift
//  bibliotheque-news-ios-app
//
//  Created by Ethan Tsang on 11/2/2025.
//

import SwiftUI

struct MyMenuView: View {
    
    @State private var selectedItemId: Int? = nil
    
    let menuWidth: CGFloat = UIScreen.main.bounds.width * 0.35
    
    let subMenuWidth: CGFloat = UIScreen.main.bounds.width * 0.65
    
    let links: [(id: Int, title: String, childs: [String])] = [
        (1, "All-Star", []),
        (2, "League Pass", []),
        (3, "Games", ["Home", "Tickets"]),
        (4, "Schedule", ["Key Dates", "2024-25 Regular Season", "League Pass Schedule", "2024-25 NBA CrunchTime", "VR Schedule", "National TV Games"]),
        (5, "Watch", ["Featured", "NBA TV"]),
        (6, "News", ["Home", "Top Stories", "Trade Deadline", "Power Rankings", "MVP Ladder", "Transactions", "Features", "Events", "Key Dates", "Future Starts", "More"]),
        (7, "Stats", ["Stats Home", "Dunk Score", "Players", "Teams", "Leaders", "Stats 101", "Cume Stats", "Lineups Tool", "Media Central Game Stats", "Draft", "Quick Links", "Contact Us"]),
        (8, "Standings", []),
        (9, "Teams", []),
        (10, "Players", ["Players Home", "2024-25 Audio Prounication Guide", "Startung Lineups", "Free Agents Trackers", "Transactions"]),
        (11, "NBA Play", ["Home", "Full Court Guess", "Rank", "IQ", "Player Path", "Trivia", "Hoop Connect"]),
        (12, "NBA Bet", ["NBA Bet Home", "Authoized Gaming Operations"]),
        (13, "Fanfasy", ["Fanfasy Home", "Fanfasy News", "NBA Pick'Em", "Play Yahoo Fanfasy", "Play Sorare NBA", "FanfasyPros Tools", "FanDuel DFS", "Draft Kings DFS"]),
        (14, "Store", ["Jerseys", "Men", "Women", "Kids", "Custom Shop", "Hardwood Classics", "Hats", "Footwear", "Auctions", "NBA Game Worn", "NYC Store", "NBA Photo Store"]),
        (15, "Tickets", ["NBATickets.com", "Offical Tickets by Ticketmaster", "NBA Experiences"]),
        (16, "Affiliates", ["NBA G League", "WNBA", "NBA 2K League", "Basketball Africa League"]),
    ]
    
    var childs: [String] = []
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                ScrollView(.vertical) {
                    ForEach(links, id: \.id) { x in
                        MenuItemView(selectedItemId: $selectedItemId, id: x.id, title: x.title) {
                            if x.childs.count > 0 {
                                if selectedItemId == x.id {
                                    selectedItemId = nil
                                } else {
                                    selectedItemId = x.id
                                }
                            }
                        }
                    }
                }
            }.frame(maxWidth: menuWidth, maxHeight: .infinity)
                .background(.black)
            if let id = selectedItemId,
               let selected = links.first(where: { $0.id == id }) {
                VStack(alignment: .leading) {
                    ScrollView(.vertical) {
                        ForEach(selected.childs, id: \.self) { x in
                            SubMenuItemView(title: x)
                        }
                    }
                }
                .frame(maxWidth: subMenuWidth, maxHeight: .infinity)
                .background(Color.white)
            }
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.bottom, UIHelper().getSafeAreaInsets().bottom)
            .background(.white)
    }
}

struct MenuItemView: View {
    
    @Binding var selectedItemId: Int?
    
    var id: Int
    
    var title: String
    
    let action: () -> Void
    
    var isSelected: Bool {
        selectedItemId == id
    }
    
    var body: some View {
        VStack {
            Button(action: {
                action()
            }) {
                HStack(spacing: 0) {
                    Text(title)
                        .foregroundColor(.white)
                        .font(.headline)
                    Spacer()
                    if isSelected {
                        Image("triangle")
                            .resizable()
                            .frame(width: 14, height: 14)
                            .offset(x: 4)
                    }
                }.padding(.leading)
            }
            Divider()
                .frame(maxWidth: .infinity, maxHeight: 0.5)
                .background(.white)
                .padding(.top, 6)
        }.padding(.top, 12)
        
    }
}

struct SubMenuItemView: View {
    
    var title: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundColor(.black)
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

