//
//  algorithmApp.swift
//  algorithm
//
//  Created by HaeSik Jang on 4/5/24.
//

import SwiftUI

//@main
struct algorithmApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: algorithmDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
