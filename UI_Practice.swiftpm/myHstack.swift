//
//  myHstack.swift
//  UI_Practice
//
//  Created by HaeSik Jang on 2023/02/13.
//

import SwiftUI

struct myHstack: View{
    var body: some View{
        
        HStack(alignment: .center){
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
            
            Image(systemName: "flame.fill")
                .foregroundColor(.white)
                .font(.system(size: 70))
            Rectangle()
                .frame(width: 100, height:100)
                .foregroundColor(.yellow)
            Rectangle()
                .frame(width: 100, height:100)
                .foregroundColor(.blue)
        }
        .padding()
        .background(Color.green)
    }
}

struct myHstack_Previews: PreviewProvider{
    static var previews: some View{
        myHstack()
    }
}
