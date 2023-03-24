//
//  RandomUserRowView.swift
//  RandomUserApi
//
//  Created by HaeSik Jang on 2023/03/24.
//

import SwiftUI

struct RandomUserRowView: View {
    var body: some View {
        HStack{
            ProfileImgView(imageUrl: URL(string: "https://randomuser.me/api/portraits/women/26.jpg")!)
            Text("2")
                .fontWeight(.heavy)
                .font(.system(size: 20))
                .lineLimit(1)
                .minimumScaleFactor(0.5)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .leading)
        .padding(.vertical)
        .background(.secondary)
        
    }
}

struct RandomUserRowView_Previews: PreviewProvider {
    static var previews: some View {
        RandomUserRowView()
    }
}
