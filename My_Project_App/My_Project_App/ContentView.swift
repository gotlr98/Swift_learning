//
//  ContentView.swift
//  My_Project_App
//
//  Created by HaeSik Jang on 2023/03/05.
//

import SwiftUI
import WebKit
import UIKit


// 1095324878590-kjepqj4u0nnb4a03p4nsdok1apoq6049.apps.googleusercontent.com

struct MyWebView: UIViewRepresentable {
   
    
    var urlToLoad: String
    
    //ui view 만들기
    func makeUIView(context: Context) -> WKWebView {
        
        //unwrapping
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
        //웹뷰 인스턴스 생성
        let webView = WKWebView()
        
        //웹뷰를 로드한다
        webView.load(URLRequest(url: url))
        return webView
    }
    
    //업데이트 ui view
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<MyWebView>) {
        
    }
}

struct ContentView: View {
    var body: some View {
        
        NavigationView{
            VStack {
                
                GeometryReader{ geo in
                    
                    Text("Korean Traditional Wine \n             Community")
                        .frame(alignment: .center)
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .position(x: geo.size.width / 2, y: geo.size.height / 5)
                    
//                    Image("AppIcon")
                        
                    
                    NavigationLink(destination:{
                        MyWebView(urlToLoad: "https://www.naver.com")
                        
                    }
                    , label: {
                        VStack{
                            Rectangle()
                                .foregroundColor(Color.gray)
                                .frame(width: 130, height: 50)
                                .cornerRadius(15)
                                .overlay{
                                    Text("Naver Login")
                                        .foregroundColor(Color.white)
                                        .fontWeight(.black)
                                }
                            
                        }
                    })
                    .position(x: geo.size.width / 2, y: geo.size.height / 1.7)
                
                    NavigationLink(destination:{
                        MyWebView(urlToLoad: "https://www.google.com")
                    
                    }
                    , label: {
                        VStack{
                            
                            Rectangle()
                                .foregroundColor(Color.gray)
                                .frame(width: 130, height: 50)
                                .cornerRadius(15)
                                .overlay{
                                    Text("Google Login")
                                        .foregroundColor(Color.white)
                                        .fontWeight(.black)
                                }
                        }
                    })
                    .position(x: geo.size.width / 2, y: geo.size.height / 1.5)
                }
                
            }
            .background(Color.indigo)
        }
        
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        MyWebView(urlToLoad: "https://www.naver.com")
    }
}
