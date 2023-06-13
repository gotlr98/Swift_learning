//
//  dictionary_testApp.swift
//  dictionary_test
//
//  Created by HaeSik Jang on 2023/05/25.
//

import SwiftUI

@main
struct dictionary_testApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(user())
        }
    }
}
