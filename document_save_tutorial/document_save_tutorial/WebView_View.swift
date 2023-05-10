//
//  WebView_View.swift
//  document_save_tutorial
//
//  Created by HaeSik Jang on 2023/05/03.
//

import SwiftUI

struct WebView_View: View {
    
    @State var isToolBarItemHidden: Bool = false
    var body: some View {
        NavigationView{
            NavigationLink(destination: {
                Store(isToolBarItemHidden: $isToolBarItemHidden, webview: Store_WebView(web: nil, req: URLRequest(url: URL(string: "https://msearch.shopping.naver.com/search/all?query=알밤막걸리&frm=NVSHSRC&vertical=home".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!)))
            }, label: {
                Text("Go")
            })
        }
    }
}

struct WebView_View_Previews: PreviewProvider {
    static var previews: some View {
        WebView_View()
    }
}
