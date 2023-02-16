//
//  MyGeometryReader.swift
//  UI_Practice
//
//  Created by HaeSik Jang on 2023/02/16.
//

import SwiftUI

struct MyGeometryReader: View{
    var body: some View{
        
        
        GeometryReader{ geometryReader in
            
            HStack(spacing: 0){
                Text("1")
                    .frame(width: geometryReader.size.width / 3)
                    .foregroundColor(.white)
                    .background(Color.red)
                Text("2")
                    .frame(width: geometryReader.size.width / 3)
                    .foregroundColor(.white)
                    .background(Color.blue)
                Text("3")
                    .frame(width: geometryReader.size.width / 3)
                    .foregroundColor(.white)
                    .background(Color.green)
//                Text("4")
//                    .frame(width: 50)
//                    .background(Color.purple)
            }
            .background(Color.yellow)
//            .position(x: geometryReader.frame(in: .local).midX, y: geometryReader.frame(in: .local).midY)
            .frame(width : geometryReader.size.width,
                             height : geometryReader.size.height,
                             alignment : .center)
        }
        

    }
}

struct MyGeometryReader_Previews: PreviewProvider{
    static var previews: some View{
        MyGeometryReader()
    }
}
