//
//  MyProjectCard.swift
//  UI_Practice
//
//  Created by HaeSik Jang on 2023/02/14.
//

import SwiftUI

struct MyProjectCard: View{
    
    @State var showAlert: Bool = false
    
    var body: some View{
        
        VStack(alignment: .leading, spacing: 0){
            Rectangle()
                .frame(height: 0)
            
            Text("Haesik's Project")
                .font(.system(size: 20))
                .fontWeight(.black)
                .padding(.bottom, 10)
            Text("10:00 AM ~ 11:00 AM")
                .foregroundColor(.secondary)
                .padding(.bottom, 20)
            
            HStack{
                Image("1")
                    .resizable()
                    .frame(width:50, height: 50)
                    .clipShape(Circle())
                Image("2")
                    .resizable()
                    .frame(width:50, height: 50)
                    .clipShape(Circle())
                Image("3")
                    .resizable()
                    .frame(width:50, height: 50)
                    .clipShape(Circle())
                
                Spacer()
                
                Button(action: {
                    print("Cliked Check Button")
                    
                    self.showAlert = true
                }){
                    Text("Check")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 90)
                        .background(Color.blue)
                        .cornerRadius(20)
                }.alert(isPresented: $showAlert){
                    Alert(title: Text("Alert"))
                }
            
            }
        }
        .padding()
        .background(Color.yellow)
        .cornerRadius(20)
    }
}

struct MyProjectCard_Preveiws: PreviewProvider{
    static var previews: some View{
        MyProjectCard()
    }
}
