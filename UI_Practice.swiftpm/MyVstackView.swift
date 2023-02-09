//
//  MyVstackView.swift
//  UI_Practice
//
//  Created by HaeSik Jang on 2023/02/08.
//

import Foundation
import SwiftUI

struct MyVstackView: View{
    
    // 데이터를 연동시킨다.
    @Binding
    var isActivated: Bool
    
    init(isActivated: Binding<Bool> = .constant(false)){
        _isActivated = isActivated
    }
    
    
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
        }.background(self.isActivated ? Color.green : Color.red)
            .padding(self.isActivated ? 10 : 0)
    }
}

struct MyVstackView_Previews: PreviewProvider{
    static var previews: some View{
        MyVstackView()
    }
}
