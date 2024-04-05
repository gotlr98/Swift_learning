//
//  ContentView.swift
//  algorithm
//
//  Created by HaeSik Jang on 4/5/24.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: algorithmDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

#Preview {
    ContentView(document: .constant(algorithmDocument()))
}
