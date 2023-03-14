//
//  +View.swift
//  Google_Login_Test
//
//  Created by HaeSik Jang on 2023/03/14.
//

import SwiftUI

extension View{
    func getRootViewController() -> UIViewController{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else{
            return .init()
        }
        
        return root
    }
}
