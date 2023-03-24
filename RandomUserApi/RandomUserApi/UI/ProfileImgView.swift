//
//  ProfileImgView.swift
//  RandomUserApi
//
//  Created by HaeSik Jang on 2023/03/24.
//

import SwiftUI
import URLImage

struct ProfileImgView: View {
    
    var imageUrl: URL
    
    var body: some View {
        URLImage(imageUrl, content: { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        })
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.yellow, lineWidth: 2))
    }
}

struct ProfileImgView_Previews: PreviewProvider {
    static var previews: some View {
        
        let url = URL(string:
                        "https://randomuser.me/api/portraits/women/26.jpg")!
        ProfileImgView(imageUrl: url)
    }
}
