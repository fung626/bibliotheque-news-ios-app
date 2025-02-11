//
//  DataLoader.swift
//  bibliotheque-news-ios-app
//
//  Created by EthanTsang on 10/2/2025.
//
import SwiftUI

struct UIHelper {
    
    func getSafeAreaInsets() -> UIEdgeInsets {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        guard let window = windowScene.windows.first else {
            return .zero
        }
        return window.safeAreaInsets
    }
    
}

