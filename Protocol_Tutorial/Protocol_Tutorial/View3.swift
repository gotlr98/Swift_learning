//
//  View3.swift
//  Protocol_Tutorial
//
//  Created by HaeSik Jang on 2023/03/21.
//

import Foundation
import SwiftUI

struct View3: View {
    @State var gotoView4 = false
    @Binding var gotoView1: Bool
    
    var body: some View {
        Button("Goto View 4") {
            gotoView4 = true
        }
        .navigationTitle("View 3")
        .background(
            NavigationLink(
                destination: View4(
                    gotoView1: $gotoView1
                ),
                isActive: $gotoView4,
                label: {EmptyView()}
            )
            .isDetailLink(false)
        )
    }
}
