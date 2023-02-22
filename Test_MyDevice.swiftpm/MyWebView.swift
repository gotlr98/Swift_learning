//
//  MyWebview.swift
//  UI_Practice
//
//  Created by HaeSik Jang on 2023/02/09.
//

import Foundation
import SwiftUI
import WebKit


// UIKit의 UIView를 사용할 수 있도록 한다.
struct MyWebview: UIViewRepresentable{
    
    var urlToLoad: String
    
    // UI View 만들기
    
    func makeUIView(context: Context) -> WKWebView {
        
        // UnWrapping
        guard let url = URL(string: self.urlToLoad) else{
            return WKWebView()
        }
        
        // WebView Instance 생성
        
        let webview = WKWebView()
        
        webview.load(URLRequest(url: url))
        
        return webview
    }
    
    // Update UI View
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<MyWebview>) {

        }
}

struct MyWebview_previews: PreviewProvider{
    static var previews: some View{
        MyWebview(urlToLoad: "https://www.naver.com")
    }
}
