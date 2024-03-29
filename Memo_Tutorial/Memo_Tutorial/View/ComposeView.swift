//
//  ComposeView.swift
//  Memo_Tutorial
//
//  Created by HaeSik Jang on 2023/03/23.
//

import SwiftUI

struct ComposeView: View {
    
    @EnvironmentObject var store: MemoStore
    var memo: Memo? = nil
    @Environment(\.dismiss) var dismiss
    @State private var content: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $content)
                    .padding()
                    .onAppear{
                        if let memo = memo{
                            content = memo.content
                        }
                    }
            }
            .navigationTitle(memo != nil ? "Edit Memo": "New Memo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarLeading){
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Cancel")
                    })
                }
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Button(action: {
                        
                        if let memo = memo{
                            store.update(memo: memo, content: content)
                        } else{
                            store.insert(memo: content)
                        }
                        
                        dismiss()
                    }, label: {
                        Text("Save")
                    })
                }
            }
        }
    }
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView()
            .environmentObject(MemoStore())
    }
}
