//
//  AttributedStringView.swift
//  bibliotheque-news-ios-app
//
//  Created by EthanTsang on 11/2/2025.
//
import SwiftUI

struct AttributedStringView: UIViewRepresentable {
    
    let padding: CGFloat = 32
    let width = UIScreen.main.bounds.width
    let attributedString: NSAttributedString

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.widthAnchor.constraint(equalToConstant: width - padding).isActive = true
        textView.isSelectable = false
        textView.isUserInteractionEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.attributedText = attributedString
    }
}
