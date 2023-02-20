//
//  MyView.swift
//  UI_Practice
//
//  Created by HaeSik Jang on 2023/02/20.
//

import SwiftUI

struct MyView: View{
    
    var title: String
    var bgColor: Color
    
    var body: some View{
        ZStack{
            bgColor
//                .edgesIgnoringSafeArea(.all)
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(Color.white)
        }
    }
}


struct MyView_Previews: PreviewProvider{
    static var previews: some View{
        MyView(title: "MyView", bgColor: Color.orange)
    }
}
