//
//  Google_Login_TestApp.swift
//  Google_Login_Test
//
//  Created by HaeSik Jang on 2023/03/14.
//

import SwiftUI

@main
struct Google_Login_TestApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            LoginScreen()
        }
    }
}
