//
//  ContentView.swift
//  Realm_Lecture
//
//  Created by HaeSik Jang on 2023/03/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                setId()
                
                read()
            }, label: {
                Rectangle()
                    .frame(width: 50, height: 50)
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
