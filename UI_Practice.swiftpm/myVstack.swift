//
//  UI_Stack.swift
//  UI_Practice
//
//  Created by HaeSik Jang on 2023/02/13.
//

import SwiftUI

struct myVstack: View{
    var body: some View{
        
        VStack(alignment: .trailing, spacing: 50){
            Text("Letter")
                .font(.system(size: 30))
                .fontWeight(.heavy)
            
            Divider() // 나눔선이 생김
                .opacity(0)
            
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.red)
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.yellow)
            
            Spacer()
                .frame(height: 30)
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.blue)
//                .edgesIgnoringSafeArea(.all)
            
            Spacer()
        }
        .frame(width: 300)
        .background(Color.green)
    }
}


struct myVstack_Previews: PreviewProvider{
    static var previews: some View{
        myVstack()
    }
}
