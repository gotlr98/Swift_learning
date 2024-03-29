//
//  Memo.swift
//  Memo_Tutorial
//
//  Created by HaeSik Jang on 2023/03/23.
//

import Foundation
import SwiftUI

class Memo: Identifiable, ObservableObject{
    
    let id: UUID
    @Published var content: String
    let insertDate: Date
    
    init(content: String, insertDate: Date = Date.now){
        id = UUID()
        self.content = content
        self.insertDate = insertDate
    }
}
