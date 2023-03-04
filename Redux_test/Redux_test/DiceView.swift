//
//  DiceView.swift
//  Redux_test
//
//  Created by HaeSik Jang on 2023/03/04.
//

import Foundation
import SwiftUI

struct DiceView: View{
    var body: some View{
        
        VStack{
            Text("🀲")
                .font(.system(size: 300, weight: .bold, design: .monospaced))
            
            Button(action: {
                print("Roll the dice")
            }, label: {
                Text("Roll Random Dice")
                    .fontWeight(.black)
                    .buttonStyle(.borderedProminent)
            })
        }
        
    }
}

struct DiceView_Previews: PreviewProvider{
    static var previews: some View{
        DiceView()
    }
}
