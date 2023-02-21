//
//  MyQRScanner.swift
//  UI_Practice
//
//  Created by HaeSik Jang on 2023/02/20.
//

import SwiftUI

struct MyQRScanner: View {
    @State private var isPresentingScanner = false
    @State private var scannedCode: String?

    var body: some View {
        
        ZStack{
            if self.scannedCode != nil {
                MyWebview(urlToLoad: self.scannedCode!)
            }else{
                MyWebview(urlToLoad: "https://www.naver.com")
            }
            
            VStack{
                
                Spacer()
                
                Button(action:{
                    self.isPresentingScanner = true
                }){
                    Text("Check Lottery Number")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(12)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 10))
                }
                
//                Button("Check Lottery Number") {
//                    isPresentingScanner = true
//                }
                
                .sheet(isPresented: $isPresentingScanner) {
                    CodeScannerView(codeTypes: [.qr]) { response in
                        if case let .success(result) = response {
                            scannedCode = result.string
                            isPresentingScanner = false
                        }
                    }
                }

            }
        }
        
        
    }
}


struct MyQRScanner_Previews: PreviewProvider{
    static var previews: some View{
        MyQRScanner()
    }
}
