//
//  text_tutorial.swift
//  UI_Practice
//
//  Created by HaeSik Jang on 2023/02/12.
//

import SwiftUI

struct Text_Tutorial: View{
    
    static let dateFormat: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-DD"
        return formatter
    }()
    
    var today = Date()
    
    var trueOrFalse: Bool = false
    
    var body: some View{
        VStack{
            Text("orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                .tracking(2)
                .font(.system(.body, design:.rounded))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .lineSpacing(10)
                .truncationMode(.middle)
                .shadow(color: Color.red, radius: 1.5, x: 10, y: 10)
            
                .padding(.vertical, 20)
                .background(Color.yellow)
                .cornerRadius(20)
                .padding(.all)
                .background(Color.green)
                .cornerRadius(20)
            
            Text("Hello There!")
                .background(Color.gray)
                .foregroundColor(Color.white)
            
            Text("Today's : \(today, formatter: Text_Tutorial.dateFormat)")
            
            Text("True or False : \(String(trueOrFalse))")
        }
        
    }
}

struct Text_Tutorial_Previews: PreviewProvider{
    static var previews: some View{
        Text_Tutorial()
    }
}
