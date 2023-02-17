//
//  MyGeometryReaderVStack.swift
//  UI_Practice
//
//  Created by HaeSik Jang on 2023/02/16.
//

import SwiftUI

enum Index{
    case one, two, three
}

struct MyGeometryReaderVStack: View{
    
    @State var index: Index = .one
    
    var body: some View{
        GeometryReader{ geometryReader in
            VStack{
                
                Button(action: {
                    print("Number 1 Cliked")
                    
                    withAnimation{
                        self.index = .one
                    }
                }){
                    Text("1")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(width: 50, height: geometryReader.size.height / 3)
                        .padding(.horizontal, self.index == .one ? 50 : 0)
                        .foregroundColor(Color.white)
                        .background(Color.red)
                }
                
                Button(action: {
                    print("Number 2 Cliked")
                    
                    withAnimation{
                        
                        self.index = .two
                    }
                }){
                    Text("2")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(width: 50, height: geometryReader.size.height / 3)
                        .padding(.horizontal, self.index == .two ? 50 : 0)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                }
                Button(action: {
                    print("Number 3 Cliked")
                    
                    withAnimation{
                        self.index = .three
                        
                    }
                }){
                    Text("3")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(width: 50, height: geometryReader.size.height / 3)
                        .padding(.horizontal, self.index == .three ? 50 : 0)
                        .foregroundColor(Color.white)
                        .background(Color.green)
                }
            }
            .frame(width : geometryReader.size.width,
                             height : geometryReader.size.height,
                             alignment : .center)
        }
        .background(Color.yellow)
        
        
    }
}


struct MyGeometryReaderVStack_Previews: PreviewProvider{
    static var previews: some View{
        MyGeometryReaderVStack()
    }
}
