//
//  CircleImageView.swift
//  UI_Practice
//
//  Created by HaeSik Jang on 2023/02/13.
//

import SwiftUI

struct CircleImageView: View{
    var body: some View{
//        Image(systemName: "bolt.circle")
//            .font(.system(size: 200))
//            .foregroundColor(Color.blue)
        Image("myImage")
            .resizable()
//            .scaledToFit()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 300)
            .clipShape(Circle())
            .overlay(Circle().foregroundColor(Color.black).opacity(0.3))
            .overlay(Circle().stroke(Color.blue))
//            .edgesIgnoringSafeArea(.all)
    }
}

struct CircleImageView_Previews: PreviewProvider{
    static var previews: some View{
        CircleImageView()
    }
}
