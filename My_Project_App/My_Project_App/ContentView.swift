//
//  ContentView.swift
//  My_Project_App
//
//  Created by HaeSik Jang on 2023/03/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                
            }, label: {
                Rectangle()
                    .frame(width:50, height: 50)
                    .font(.system(size: 25))
                    .foregroundColor(Color.black)
            })
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
