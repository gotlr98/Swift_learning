//
//  ContentView.swift
//  Kakao_Login_Tutorial
//
//  Created by HaeSik Jang on 2023/03/15.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var kakaoAuthVM: Kakao_AuthVM = Kakao_AuthVM()
    
    let loginStatusInfo : (Bool) -> String = { isLoggedIn in
        return isLoggedIn ? "Login" : "Logout"
    }
    
    var body: some View {
        VStack {
            Text(loginStatusInfo(kakaoAuthVM.isLoggedIn))
            
            Button("Kakao Login", action: {
                kakaoAuthVM.handleKakaoLogin()
            })
            
            Button("Kakao Logout", action: {
                kakaoAuthVM.kakaoLogout()
            })
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
