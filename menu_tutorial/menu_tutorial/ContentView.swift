//
//  ContentView.swift
//  menu_tutorial
//
//  Created by HaeSik Jang on 2023/02/28.
//

import SwiftUI

struct ContentView: View {
    
    @State private var shouldShowAlert: Bool = false
    @State private var myText: String = ""
    
    var body: some View {
        
        NavigationView{
            
            Text("Hello")
            
        .navigationTitle("Hi")
        .toolbar(content: {
            ToolbarItem(placement: .primaryAction, content: {
                Menu(content: {
                    
                    Button(action: {
                        print("Clicked Button")
                        shouldShowAlert = true
                        myText = "Coding Day!"
                        
                    }, label: {
                        Label("Coding Day", systemImage: "flame.fill")
                    })
                    
                    Button(action: {
                        print("Clicked Button")
                        shouldShowAlert = true
                        myText = "HoliDay"
                        
                    }, label: {
                        Label("HoliDay", systemImage: "house.fill")
                    })
                    
                    Section{
                        Button(action: {
                            print("Clicked Button")
                            shouldShowAlert = true
                            myText = "HoliDay"
                            
                        }, label: {
                            Label("HoliDay", systemImage: "house.fill")
                        })
                    }
                    
                }, label: {
                    Circle()
                        .foregroundColor(Color.yellow)
                        .frame(width:50, height: 50)
                        .overlay(Label("See More", systemImage: "ellipsis").font(.system(size: 30))
                            .foregroundColor(.white))
                    
                }) // Menu
            })
        })
        .alert(isPresented: $shouldShowAlert, content:{
            Alert(title: Text("Alarm"), message: Text("\(myText)"), dismissButton: .default(Text("Check")))
        })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
