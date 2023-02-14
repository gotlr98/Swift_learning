//
//  MyBasicCard.swift
//  UI_Practice
//
//  Created by HaeSik Jang on 2023/02/14.
//

import SwiftUI

struct MyCard: View{
    
    var icon: String
    var title: String
    var startTime: String
    var endTime: String
    var backgroundColor: Color
    
    var body: some View{
        
        
        
        HStack(spacing: 20){
            
            Image(systemName: icon)
                .font(.system(size: 40))
            
            VStack(alignment: .leading, spacing: 0){
                Divider()
                    .opacity(0)
                Text(title)
                    .fontWeight(.bold)
                    .font(.system(size: 23))
                    .foregroundColor(Color.white)
                
                Text("\(startTime) - \(endTime)")
                    .foregroundColor(Color.white)
            }
        }
        .padding(20)
        .background(backgroundColor)
        .cornerRadius(20)
    }
}

struct MyCard_Preview: PreviewProvider{
    static var previews: some View{
        
        MyCard(icon: "book.fill", title: "Reading", startTime: "12:00 AM",
               endTime: "13:00 PM", backgroundColor: Color.green)
    }
}
