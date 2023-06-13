//
//  review.swift
//  dictionary_test
//
//  Created by HaeSik Jang on 2023/05/25.
//

import Foundation

struct review_s: Codable, Identifiable, Hashable{
    
    var id: String
    var user_name: String
    var drink_name: String
    var comment: String
    var drink_type: String
    var rating: Int8

}

