//
//  MyGeometryReader.swift
//  UI_Practice
//
//  Created by HaeSik Jang on 2023/02/16.
//

import SwiftUI

struct MyGeometryReader: View{
    
    let centerPosition: (GeometryProxy) -> CGPoint = {  proxy in
        return CGPoint(x: proxy.frame(in: .local).midX,
                       y: proxy.frame(in: .local).midY)
    }
    
    var body: some View{
        
        
        GeometryReader{ geometryReader in
            
            HStack(spacing: 0){
                Text("1")
                    .frame(width: geometryReader.size.width / 4)
                    .foregroundColor(.white)
                    .background(Color.red)
                Text("2")
                    .frame(width: geometryReader.size.width / 4)
                    .foregroundColor(.white)
                    .background(Color.blue)
                Text("3")
                    .frame(width: geometryReader.size.width / 4)
                    .foregroundColor(.white)
                    .background(Color.green)
                Text("4")
                    .frame(width: geometryReader.size.width / 4)
                    .background(Color.purple)
                
            }
            .frame(width : geometryReader.size.width,
                             height : geometryReader.size.height,
                             alignment : .center)
            
            VStack{
                Text("1")
                    .frame(height: geometryReader.size.width / 2)
                    .foregroundColor(.white)
                    .background(Color.red)
            }
            .background(Color.yellow)
//            .position(x: geometryReader.frame(in: .local).midX, y: geometryReader.frame(in: .local).midY)
            .frame(width : geometryReader.size.width,
                             height : geometryReader.size.height,
                   alignment : .top)
        }
        

    }
}

struct MyGeometryReader_Previews: PreviewProvider{
    static var previews: some View{
        MyGeometryReader()
    }
}
