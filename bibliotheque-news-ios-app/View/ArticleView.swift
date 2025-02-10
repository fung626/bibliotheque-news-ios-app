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
            VStack(alignment: .leading) {
                if let a = data?.article {
                    Text(a.title)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(a.subTitle)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }.background(.white)
    }
}

#Preview {
    ArticleView()
}
