//
//  ContentView.swift
//  My_Project_App
//
//  Created by HaeSik Jang on 2023/03/05.
//

import SwiftUI
import WebKit

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
                    
                    NavigationLink(destination:{
                        MyWebView(urlToLoad: "www.naver.com")
                        
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
                        .position(x: geo.size.width / 2, y: geo.size.height / 1.7)
                        
                    })
                
                    NavigationLink(destination:{
                        MyWebView(urlToLoad: "www.google.com")
                    
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
                        .position(x: geo.size.width / 2, y: geo.size.height / 1.5)
 
                    })
                }
               
            }
            .padding()
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
