//
//  View2.swift
//  Protocol_Tutorial
//
//  Created by HaeSik Jang on 2023/03/21.
//

import Foundation
import SwiftUI

struct View2: View {
    @State var gotoView3 = false
    @Binding var gotoView1: Bool
    
    var body: some View {
        Button("Goto View 3") {
            gotoView3 = true
        }
        .navigationTitle("View 2")
        .background(
            NavigationLink(
                destination: View3(gotoView1: $gotoView1),
                isActive: $gotoView3,
                label: {EmptyView()}
            )
            .isDetailLink(false)
        )
    }
}
