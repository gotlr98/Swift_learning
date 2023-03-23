//
//  Kakao_Login_TutorialApp.swift
//  Kakao_Login_Tutorial
//
//  Created by HaeSik Jang on 2023/03/15.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct Kakao_Login_TutorialApp: App {
    
    @UIApplicationDelegateAdaptor var appDelegate: AppDelegate

//    init() {
//            let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] ?? ""
//            // Kakao SDK 초기화
//            KakaoSDK.initSDK(appKey: kakaoAppKey as! String)
//        }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

