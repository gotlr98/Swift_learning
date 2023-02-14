//
//  MyBasicCard.swift
//  UI_Practice
//
//  Created by HaeSik Jang on 2023/02/14.
//

import SwiftUI

struct MyBasicCard: View{
    
    var body: some View{
        
        HStack(spacing: 20){
            
            Image(systemName: "flame.fill")
                .font(.system(size: 40))
            
            VStack(alignment: .leading, spacing: 0){
                Divider()
                    .opacity(0)
                Text("Have Breakfast")
                    .fontWeight(.bold)
                    .font(.system(size: 23))
                    .foregroundColor(Color.white)
                
                Text("8:00 AM ~ 9:00 AM")
                    .foregroundColor(Color.white)
            }
        }
        .padding(20)
        .background(Color.purple)
        .cornerRadius(20)
    }
}

struct MyBasicCard_Preview: PreviewProvider{
    static var previews: some View{
        
        MyBasicCard()
    }
}
