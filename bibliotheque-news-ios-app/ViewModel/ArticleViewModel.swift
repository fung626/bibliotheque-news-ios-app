//
//  ArticleViewModel.swift
//  bibliotheque-news-ios-app
//
//  Created by EthanTsang on 10/2/2025.
//
import SwiftUI

class ArticleViewModel: ObservableObject {
    
    @Published var article: Article?
    
    init() {
        setup()
    }
    
    func setup() {
        if let url = Bundle.main.url(forResource: "demo-data", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            do {
                let article = try decoder.decode(Article.self, from: data)
                self.article = article
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
}
