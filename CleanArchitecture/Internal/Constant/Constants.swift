//
//  Constants.swift
//  CleanArchitecture
//
//  Created by Navneet on 14/05/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//


import Foundation
import UIKit

enum EnumType: String, Codable {
    /// - article: article
    case article = "article"

    /// - news: news
    case news = "news"

    /// - question: question
    case question = "question"
}

struct Constants {
 struct Path {
        static let documentPlaceHolder = "share_placeholder"
    }
    struct URL {
    }
    struct Color {
        
        static let dividerLine = UIColor(red: 232.0/255, green: 233.0/255, blue: 234/255, alpha: 0.5)
        static let yellowColor = UIColor.init(hexString: "#FFC107")
        
    }
}
