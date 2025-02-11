//
//  AttributedString+html.swift
//  bibliotheque-news-ios-app
//
//  Created by EthanTsang on 11/2/2025.
//

import UIKit

extension NSAttributedString {
    
    static func html(withBody body: String, css: String) -> NSAttributedString {
        let bundle = Bundle.main
        let lang = bundle.preferredLocalizations.first ?? bundle.developmentLocalization ?? "en"
        
        let htmlData = """
        <!doctype html>
        <html lang="\(lang)">
        <head>
            <meta charset="utf-8">
            <style type="text/css">
            body {
                font: -apple-system-body;
                color: \(UIColor.black.hex);
            }
            h1, h2, h3, h4, h5, h6 {
                color: \(UIColor.label.hex);
            }
            a {
                color: \(UIColor.systemBlue.hex);
            }
            li:last-child {
                margin-bottom: 1em;
            }
            .wp-caption-text {
                font-family: Roboto, arial, sans-serif;
                font-weight: 400;
                line-height: 1.2;
                font-size: 0.875rem;
                padding-right: 0.5rem;
                margin: 0.5rem 0 2rem;
                color: #8e9196;
            }
            \(css)
        </style>
        </head>
        <body>
            \(body)
        </body>
        </html>
        """.data(using: .utf8)!
        
        return (try? NSAttributedString(data: htmlData, options: [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue,
        ], documentAttributes: nil)) ?? NSAttributedString(string: body)
    }
    
}

private extension UIColor {
    var hex: String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return String(
            format: "#%02lX%02lX%02lX%02lX",
            lroundf(Float(red * 255)),
            lroundf(Float(green * 255)),
            lroundf(Float(blue * 255)),
            lroundf(Float(alpha * 255))
        )
    }
}
