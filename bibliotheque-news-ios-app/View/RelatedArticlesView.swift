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
                    Spacer()
                }
                Divider()
                    .frame(height: 0.5)
                ForEach(a.related, id: \.id) { x in
                    HStack {
                        AsyncImage(url: URL(string: x.image)) { image in
                            image
                                .resizable()
                                .aspectRatio(16 / 9, contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
                        VStack(alignment: .leading) {
                            Text(x.title.uppercased())
                                .font(.subheadline)
                            Text(x.details)
                                .font(.subheadline)
                            Text(x.time)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    RelatedArticlesView()
}
