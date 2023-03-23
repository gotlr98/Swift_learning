//
//  View4.swift
//  Protocol_Tutorial
//
//  Created by HaeSik Jang on 2023/03/21.
//

import Foundation
import SwiftUI

struct View4: View {
    @Binding var gotoView1: Bool
    
    var body: some View {
        Button("Go Back to View 1") {
            gotoView1 = false
        }
        .navigationTitle("View 4")
    }
}

