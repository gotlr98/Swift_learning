//
//  DetailView.swift
//  Memo_Tutorial
//
//  Created by HaeSik Jang on 2023/03/23.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var memo: Memo
    @EnvironmentObject var store: MemoStore
    
    var body: some View {
        
        VStack{
            ScrollView{
                VStack{
                    
                    HStack {
                        Text(memo.content)
                            .padding()
                        
                        Spacer(minLength: 0)
                    }
                        
                    
                    Text(memo.insertDate, style: .date)
                        .padding()
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("Show Memo")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(memo: Memo(content: "Test"))
            .environmentObject(MemoStore())
    }
}
