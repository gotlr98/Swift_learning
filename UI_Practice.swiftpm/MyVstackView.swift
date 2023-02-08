//
//  MyVstackView.swift
//  UI_Practice
//
//  Created by HaeSik Jang on 2023/02/08.
//

import Foundation
import SwiftUI

struct MyVstackView: View{
    var body: some View{
        VStack {
            Text("1")
                .fontWeight(.bold)
                .font(.system(size: 30))
            Text("2")
                .fontWeight(.bold)
                .font(.system(size: 30))
            Text("3")
                .fontWeight(.bold)
                .font(.system(size: 30))
        }
    }
}

struct MyVstackView_Previews: PreviewProvider{
    static var previews: some View{
        MyVstackView()
    }
}
