//
//  MyTabView.swift
//  UI_Practice
//
//  Created by HaeSik Jang on 2023/02/20.
//

import SwiftUI

struct MyTabView: View{
    var body: some View{
        TabView{
            ZStack{
                
                Color.yellow.ignoresSafeArea()
                Text("장바구니")
                }
                
                .tabItem{
                    Image(systemName: "airplane")
                    Text("No.1")
                }
                .tag(1)
            ZStack{
                Color.blue.ignoresSafeArea()
                    }
                .tabItem{
                    Image(systemName: "flame.fill")
                    Text("No.2")
                }
                    
            ZStack{
                Color.green.ignoresSafeArea()
                    }
                .tabItem{
                    Image(systemName: "doc.fill")
                    Text("No.3")
                }
        }
//        .withAnimation()
    }
}

struct MyTabView_Previews: PreviewProvider{
    static var previews: some View{
        MyTabView()
    }
}
