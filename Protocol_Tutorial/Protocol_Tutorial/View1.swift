//
//  View1.swift
//  Protocol_Tutorial
//
//  Created by HaeSik Jang on 2023/03/21.
//

import Foundation
import SwiftUI

struct View1: View {
    @State var gotoView2 = false
    
    var body: some View {
        NavigationView {
            Button("Goto View 2") {
                gotoView2 = true
            }
            .navigationTitle("View 1")
            .background(
                NavigationLink(
                    destination: View2(gotoView1: $gotoView2),
                    isActive: $gotoView2,
                    label: {EmptyView()}
                )
                .isDetailLink(false)
            )
        }
    }
}


struct View1_Previews: PreviewProvider{
    static var previews: some View{
        View1()
    }
}
