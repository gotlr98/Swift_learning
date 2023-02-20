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
                        Color(red: 52 / 255, green: 152 / 255, blue: 219 / 255).ignoresSafeArea()
                    }
                .tabItem{
                    Image(systemName: "airplane")
                    Text("No.1")
                }
                .tag(1)
            ZStack{
                        Color(red: 52 / 255, green: 20 / 255, blue: 219 / 255).ignoresSafeArea()
                    }
                .tabItem{
                    Image(systemName: "flame.fill")
                    Text("No.2")
                }
                    
            ZStack{
                        Color(red: 52 / 255, green: 152 / 255, blue: 219 / 255).ignoresSafeArea()
                    }
                .tabItem{
                    Image(systemName: "doc.fill")
                    Text("No.3")
                }
        }
    }
}

struct MyTabView_Previews: PreviewProvider{
    static var previews: some View{
        MyTabView()
    }
}
