//
//  ContentView.swift
//  Test_WebView
//
//  Created by HaeSik Jang on 2023/05/03.
//

import SwiftUI

struct ContentView: View {
    @State var isToolBarItemHidden: Bool = false
    var body: some View {
        NavigationView{
            NavigationLink(destination: {
                Shop(isToolBarItemHidden: $isToolBarItemHidden, webview: Store_WebView(web: nil, req: URLRequest(url: URL(string: "https://msearch.shopping.naver.com/search/all?query=알밤막걸리&frm=NVSHSRC&vertical=home".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!)))
            }, label: {
                Text("가기")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
