//
//  DataLoader.swift
//  bibliotheque-news-ios-app
//
//  Created by EthanTsang on 10/2/2025.
//

import Foundation

func loadData() -> MyDemoData? {
    guard let url = Bundle.main.url(forResource: "demo-data", withExtension: "json") else {
        print("JSON file not found")
        return nil
    }
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(MyDemoData.self, from: data)
        return decoded
    } catch {
        print("Error decoding JSON: \(error)")
        return nil
    }
}

