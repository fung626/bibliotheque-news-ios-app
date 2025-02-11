//
//  ArticleView.swift
//  bibliotheque-news-ios-app
//
//  Created by EthanTsang on 10/2/2025.
//

import SwiftUI

struct ArticleView: View {
    
    let data: MyDemoData? = loadData()
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                if let a = data?.article {
                    Text("TOP STORIES")
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
                    Text("From \(a.from)")
                        .padding(.top)
                        .font(.subheadline)
                    Text(a.updatedOn)
                        .padding(.bottom)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }.padding()
                .background(.white)
        }.background(.white)
    }
}

#Preview {
    ArticleView()
}
