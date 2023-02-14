//
//  MyLayoutView.swift
//  UI_Practice
//
//  Created by HaeSik Jang on 2023/02/14.
//

import SwiftUI

struct MyLayoutView: View{
    var body: some View{
        
        ZStack(alignment: .bottomTrailing){
            
            VStack(alignment: .leading, spacing: 0){
                
                HStack{
                    Image(systemName: "line.horizontal.3")
                        .font(.largeTitle)
                        .padding()
                    Spacer()
                    
                    Image(systemName: "person.crop.circle.fill")
                        .font(.largeTitle)
                }
                Text("Haesik's To Do List")
                    .font(.system(size: 30))
                    .fontWeight(.black)
                    .padding()
                
                ScrollView{
                    
                    VStack{
                        MyProjectCard()
                        MyBasicCard()
                        MyCard(icon: "tray.fill", title: "Cleaning", startTime: "15:00 PM", endTime: "15:30 PM", backgroundColor: Color.blue)
                        MyCard(icon: "pencil.line", title: "Note", startTime: "17:00 PM", endTime: "18:00 PM", backgroundColor: Color.gray)
                        MyCard(icon: "play.display", title: "Youtube", startTime: "19:00 PM", endTime: "20:00 PM", backgroundColor: Color.red)
                        
                    }
                    .padding()
                    
                    
                }
            }
            
            Circle()
                .foregroundColor(Color.yellow)
                .frame(width:60, height: 60)
                .overlay{
                    Image(systemName: "plus")
                        .font(.system(size: 30))
                        .foregroundColor(Color.white)
                }
                .padding(.trailing, 10)
                .shadow(radius: 20)
            
        }
        
        
        
        
    }
}

struct MyLayoutView_Previews: PreviewProvider{
    static var previews: some View{
        
        MyLayoutView()
    }
}
