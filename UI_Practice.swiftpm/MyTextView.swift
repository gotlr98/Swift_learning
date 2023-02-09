//
//  MyTextView.swift
//  UI_Practice
//
//  Created by HaeSik Jang on 2023/02/09.
//

import Foundation
import SwiftUI

struct MyTextView: View{
    
    // @State 값의 변화를 감지 -> 뷰에 적용
    @State
    private var index: Int = 0
    
    // Background Color Array
    
    private let backgroundColors = [
        Color.red,
        Color.yellow,
        Color.blue,
        Color.green,
        Color.orange
    ]
    
    var body: some View{
        VStack{
            Spacer()
            Text("Background Item Index \(self.index)")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .frame(minWidth: 0, maxWidth: .infinity,
                       minHeight: 0, maxHeight: .infinity)
            
            Spacer()
        }
        .background(backgroundColors[index])
        .onTapGesture {
            print("background item clicked")
            
            if self.index == self.backgroundColors.count - 1 {
                self.index = 0
            }
            else{
                index += 1
            }
        }
    }
}


struct MyTextView_Previews: PreviewProvider{
    static var previews: some View{
        MyTextView()
    }
}
