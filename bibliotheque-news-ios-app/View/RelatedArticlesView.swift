//
//  RelatedArticlesView.swift
//  bibliotheque-news-ios-app
//
//  Created by EthanTsang on 11/2/2025.
//

import SwiftUI

struct RelatedArticlesView: View {
    
    let data: MyDemoData? = loadData()
    
    var body: some View {
        if let a = data?.article {
            VStack {
                HStack {
                    Text("RELATED")
                        .font(.subheadline)
                        .bold()
                    Spacer()
                }
                Divider()
                    .frame(height: 0.5)
                VStack {
                    ForEach(a.related, id: \.id) { x in
                        HStack(spacing: 2) {
                            GeometryReader { geometry in
                                AsyncImage(url: URL(string: x.image)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: geometry.size.width, height: geometry.size.height)
                                        .clipped()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: geometry.size.width, height: geometry.size.height)
                            }
                            .frame(width: 117)
                            VStack(alignment: .leading) {
                                Text(x.title.uppercased())
                                    .font(.subheadline)
                                    .bold()
                                Text(x.details)
                                    .padding(.vertical, 4)
                                    .font(.footnote)
                                    .lineLimit(2)
                                Text(x.time)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }.padding(.leading, 4)
                        }
                        .frame(height: 117)
                    }
                }.padding(.vertical)
            }
        }
        
    }
}

#Preview {
    RelatedArticlesView()
}
