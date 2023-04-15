//
//  Image.swift
//  document_save_tutorial
//
//  Created by HaeSik Jang on 2023/04/10.
//

import SwiftUI



struct Image: View {
    
    private let imageName: String = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fqg3j2%2FbtrMnmQkloe%2F3NKRixtOvVDNRKQgrWNGg0%2Fimg.jpg"

    var body: some View {
        
        GeometryReader{ geo in
            VStack(alignment: .center){
                AsyncImage(url:URL(string: imageName)){image in
                    image
                        .resizable()
                        .frame(width: 50, height: 50)
                } placeholder: {
                    Color.gray
                }
                    
                    
            }
            
        }
        
            
            
    }
}

struct Image_Previews: PreviewProvider {
    static var previews: some View {
        Image()
    }
}
