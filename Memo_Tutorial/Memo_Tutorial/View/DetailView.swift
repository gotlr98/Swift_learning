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
    @State private var showComposer = false
    @State private var showDeleteAlert = false
    
    @Environment(\.dismiss) var dismiss
    
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
        .toolbar{
            ToolbarItemGroup(placement: .bottomBar){
                Button(action: {
                    showDeleteAlert = true
                }, label: {
                    Image(systemName: "trash")
                        .foregroundColor(Color.red)
                })
                .alert("Delete Check", isPresented: $showDeleteAlert, actions: {
                    Button(role: .destructive, action: {
                        store.delete(memo: memo)
                        dismiss()
                    }, label: {
                        Text("Delete")
                    })
                }, message: {
                    Text("Delete the Memo?")
                })
                
                Button(action: {
                    showComposer = true
                }, label: {
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(Color.black)
                })
            }
        }
        .sheet(isPresented: $showComposer){
            ComposeView(memo: memo)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DetailView(memo: Memo(content: "Test"))
                .environmentObject(MemoStore())
        }
        
    }
}
