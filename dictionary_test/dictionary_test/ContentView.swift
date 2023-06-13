//
//  ContentView.swift
//  dictionary_test
//
//  Created by HaeSik Jang on 2023/05/25.
//

import SwiftUI
import WebView

struct ContentView: View {
    
    @State var webviewStore = WebViewStore()
    
    
    var body: some View {
        NavigationView{
            WebView(webView: webviewStore.webView)
                .navigationTitle("술사기")
                .navigationBarItems(trailing: HStack{
                    Button(action: goBack){
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 32, height: 32)
                    }
                    .disabled(!webviewStore.canGoBack)
                    Button(action: goForward){
                        Image(systemName: "chevron.right")
                            .imageScale(.large)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 32, height: 32)
                    }.disabled(!webviewStore.canGoForward)
                })
        }
    }
    func goBack() {
        webviewStore.webView.goBack()
      }
      
      func goForward() {
          webviewStore.webView.goForward()
      }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(user())
    }
}
