//
//  user.swift
//  dictionary_test
//
//  Created by HaeSik Jang on 2023/05/25.
//

import Foundation


struct user_s: Codable, Identifiable, Hashable{
    
    var id: String
    var name: String
    var email: String
}

class user: ObservableObject{
    
    @Published var user: [user_s: [review_s]] = [:]
    
    
}

