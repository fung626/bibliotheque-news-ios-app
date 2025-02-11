//
//  AppFooterView.swift
//  bibliotheque-news-ios-app
//
//  Created by EthanTsang on 10/2/2025.
//

import SwiftUI

struct AppFooterView: View {
    
    @State private var expandeds: Set<String> = []
    
    let links: [(id: Int, title: String, childs: [String])] = [
        (1, "NBA Organization", ["NBA ID", "NBA Official", "NBA Careers", "NBA Fan Code of Conduct"]),
        (2, "NBA Initiatives", ["NBA Cares", "Jr. NBA / Jr. WNBA", "NBA Foundation", "Social Justice Coalition"]),
        (3, "Across The League", ["NBA Communications", "Lockervision", "NBA Transactions"]),
        (4, "SHOP", ["Global Stores", "NYC Store", "NBA Auctions", "NBA Photostore" ]),
    ]
    
    let policies = [
        "Privacy Policy",
        "EEA/UK Privacy Statement",
        "Brazil Privacy Statement",
        "Colorado Consumer Privacy Statement",
        "California Consumer Privacy Statement",
        "Terms of Use",
        "Cookie Policy",
        "Accessibility and Closed Captions",
        "Customer Support",
        "Your Privacy Choices"
    ]
    
    let socials = [
        "facebook",
        "instagram",
        "snapchat",
        "ticktok",
        "twitter",
        "youtube",
        "twitch"
    ]
    
    var body: some View {
        VStack {
            ForEach(links, id: \.id) { x in
                Section(header: FooterSectionHeader(
                    title: x.title,
                    isExpanded: expandeds.contains(x.title)) {
                        toggle(x.title)
                    }) {
                        if expandeds.contains(x.title) {
                            ForEach(x.childs, id: \.self) { link in
                                HStack {
                                    Text(link)
                                        .font(.footnote)
                                        .foregroundColor(.white)
                                    Spacer()
                                }.padding(.horizontal, 32)
                                    .padding(.vertical, 4)
                            }
                        }
                        Divider().background(.white)
                    }
            }
            HStack {
                ForEach(socials, id: \.self) { x in
                    Image(x)
                        .frame(width: 22, height: 22)
                }.padding(.trailing, 12)
                Spacer()
            }.padding(.horizontal, 16)
                .padding(.vertical, 24)
            VStack(alignment: .leading) {
                Text("© 2025 NBA Media Ventures, LLC. All rights reserved.")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 8)
                WrappingHStack(horizontalSpacing: 4) {
                    ForEach(policies, id: \.self) { x in
                        Text(x)
                            .foregroundColor(.white)
                            .font(.system(size: 12))
                            .padding(.vertical, 2)
                    }
                }
                Text("If you are having difficulty accessing any content on this website, please visit our")
                    .font(.footnote)
                    .foregroundColor(.white)
                Text("NBA.com is part of Warner Media, LLC’s Turner Sports & Entertainment Digital Network")
                    .font(.footnote)
                    .foregroundColor(.white)
                HStack {
                    Image("logo-warnermedia")
                        .resizable()
                        .frame(width: 96, height: 12)
                    Spacer()
                }.padding(.top, 8)
            }.padding(.horizontal, 16)
                .padding(.bottom, 16)
        }.padding(.bottom, UIHelper().getSafeAreaInsets().bottom)
            .background(.black)
    }
    
    private func toggle(_ section: String) {
        if expandeds.contains(section) {
            expandeds.remove(section)
        } else {
            expandeds.insert(section)
        }
    }
}

struct FooterSectionHeader: View {
    
    let title: String
    
    let isExpanded: Bool
    
    let action: () -> Void
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    action()
                }
            }) {
                HStack {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .rotationEffect(.degrees(isExpanded ? 180 : 0))
                        .foregroundColor(.white)
                }
                .padding(.init(top: 16, leading: 32, bottom: 16, trailing: 32))
            }
        }
    }
}

#Preview {
    AppFooterView()
}
