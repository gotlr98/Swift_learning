//
//  MemoCell.swift
//  Memo_Tutorial
//
//  Created by HaeSik Jang on 2023/03/23.
//

import SwiftUI

struct MemoCell: View {
    
    @ObservedObject var memo: Memo
    @EnvironmentObject var store: MemoStore
    let data = MemoStore().getMemo()
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(memo.content)
                .font(.body)
                .lineLimit(1)
            
//            Text(data.list.content)
//                .font(.body)
//                .lineLimit(1)
            

            
            
            Text(memo.insertDate, style: .date)
                .font(.caption)
                .foregroundColor(.secondary)
            
        }
    }
}


struct MemoCell_Previews: PreviewProvider {
    static var previews: some View {
        MemoCell(memo: Memo(content: "Test"))
            .environmentObject(MemoStore())
    }
}
