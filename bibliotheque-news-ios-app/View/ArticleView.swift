//
//  ArticleView.swift
//  bibliotheque-news-ios-app
//
//  Created by EthanTsang on 10/2/2025.
//

import SwiftUI
import MarkdownUI

struct ArticleView: View {
    
    @State private var contentHeights: [UUID: CGFloat] = [:]
    
    let data: MyDemoData? = loadData()
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                if let a = data?.article {
                    Text("2025 TRADE DEADLINE")
                        .padding(.bottom)
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(a.title)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(a.subTitle)
                        .padding(.vertical)
                        .font(.subheadline)
                    Divider()
                        .frame(height: 0.3)
                        .background(Color(.lightGray))
                    AuthorView(avatar: a.author.avatar, name: a.author.name)
                    Text("Updated on \(a.updatedOn)")
                        .padding(.bottom)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    AsyncImage(url: URL(string: a.image)) { image in
                        image
                            .resizable()
                            .aspectRatio(16 / 9, contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width)
                    let content = a.content.joined(separator: "<br>\n")
                    AttributedStringView(attributedString: NSAttributedString.html(withBody: content, css: ""))
                        .frame(maxWidth: UIScreen.main.bounds.width)
                        .padding(.vertical, 4)
                }
            }.padding()
                .frame(maxWidth: UIScreen.main.bounds.width)
                .background(.white)
        }.background(.white)
    }
}

struct AuthorView: View {
    
    var avatar: String
    var name: String
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: avatar))
                .aspectRatio(contentMode: .fit)
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(name)
                    .foregroundColor(.black)
                    .font(.headline)
                Text("Archive")
                    .foregroundColor(.blue)
                    .font(.headline)
            }.padding(.leading, 4)
                .padding(.trailing, 16)
        }.padding()
        
    }
}

#Preview {
    ArticleView()
}
