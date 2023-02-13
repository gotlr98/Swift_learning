//
//  myZstack.swift
//  UI_Practice
//
//  Created by HaeSik Jang on 2023/02/13.
//

import SwiftUI

struct myZstack: View{
    var body: some View{
        
        ZStack{
            Rectangle()
                .frame(width: 50, height: 50)
                .foregroundColor(Color.yellow)
                .zIndex(3)
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.red)
                .zIndex(2)
            Rectangle()
                .frame(width: 150, height: 150)
                .foregroundColor(Color.blue)
                .zIndex(1)
        }
    }
}

struct myZstack_previews: PreviewProvider{
    static var previews: some View{
        myZstack()
    }
}
