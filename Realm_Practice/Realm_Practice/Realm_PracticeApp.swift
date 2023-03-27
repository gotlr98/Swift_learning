//
//  Realm_PracticeApp.swift
//  Realm_Practice
//
//  Created by HaeSik Jang on 2023/03/27.
//

import SwiftUI

@main
struct Realm_PracticeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
