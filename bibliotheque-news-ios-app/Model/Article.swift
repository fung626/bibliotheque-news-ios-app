//
//  Article.swift
//  bibliotheque-news-ios-app
//
//  Created by EthanTsang on 10/2/2025.
//

import Foundation

struct Article: Codable {
    let title: String
    let subTitle: String
    let from: String
    let updatedOn: String
    let author: Author
    let image: String
    let content: [String]
    let related: [RelatedArticle]
    
    enum CodingKeys: String, CodingKey {
        case title
        case subTitle = "sub_title"
        case from
        case updatedOn = "updated_on"
        case author
        case image
        case content
        case related
    }
}

struct Author: Codable {
    let name: String
    let avatar: String
    let link: String
}

struct RelatedArticle: Codable {
    let id: Int
    let image: String
    let title: String
    let details: String
    let time: String
}

struct MyDemoData: Codable {
    let article: Article
}
