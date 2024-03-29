//
//  MainListView.swift
//  Memo_Tutorial
//
//  Created by HaeSik Jang on 2023/03/23.
//

import SwiftUI

struct MainListView: View {
    
    // 하나의 데이터를 여러 뷰에서 공유
    @EnvironmentObject var store: MemoStore
    
    @State private var showComposer: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.list) { memo in
                    NavigationLink(destination: {
                        
                        DetailView(memo: memo)
                    }, label: {
                        MemoCell(memo: memo)
                    })
                    
                }
                .onDelete(perform: store.delete)
            }
            .listStyle(.plain)
            .navigationTitle("My Memo")
            .toolbar{
                Button(action: {
                    
                    showComposer = true
                }, label: {
                    
                    Image(systemName: "plus")
                        .foregroundColor(Color.black)
                })
            }
            .sheet(isPresented: $showComposer){
                ComposeView()
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(MemoStore())
    }
}

