//
//  Image_tutorial.swift
//  UI_Practice
//
//  Created by HaeSik Jang on 2023/02/13.
//

import SwiftUI

struct Image_tutorial: View{
    var body: some View{
        NavigationView{
            VStack{
                CircleImageView()
                
                HStack{
                    NavigationLink(destination: MyWebview(urlToLoad: "https://youtu.be/h2pRBjrdDw8"))
                    {
                        Text("Go Watch")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                    }
                }
            }
        }
    }
}

struct Image_tutorial_Previews: PreviewProvider{
    static var previews: some View{
        Image_tutorial()
    }
}
