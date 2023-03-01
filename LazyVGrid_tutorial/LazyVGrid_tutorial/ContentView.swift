//
//  ContentView.swift
//  LazyVGrid_tutorial
//
//  Created by HaeSik Jang on 2023/03/01.
//

import SwiftUI

struct MyModel: Identifiable{
    let id = UUID()
    let title: String
    let content: String
}

extension MyModel{
    static var dummyDataArray: [MyModel]{
        (1...2000).map{(number: Int) in
            MyModel(title: "Title: \(number)", content: "Content: \(number)")
        }
    }
}

struct ContentView: View {
    
    var dummyDataArray = MyModel.dummyDataArray
    
    var body: some View {
        ScrollView{
            
            // columns: Horizental Item Layout 설정
            // .fix 고정
            // .adaptive 여러개 채우기 - 계산해서 분할로
            // .flexible 하나만 채우기
            LazyVGrid(columns: [GridItem(.fixed(100)), GridItem(.adaptive(minimum: 200))], content: {
                
                ForEach(dummyDataArray, content: { (dataItem: MyModel) in
                    Rectangle()
                        .foregroundColor(Color.blue)
                        .frame(width: 100,height: 130)
                        .overlay(
                            Text("\(dataItem.title)")
                        )
                })
                
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
