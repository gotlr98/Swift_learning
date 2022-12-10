//
//  SwiftUIView.swift
//  
//
//  Created by HaeSik Jang on 2022/12/10.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView{
            List(landmarks){landmark in
                NavigationLink{
                    LandmarkDetail()
                } label:{
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
        
    }
}

struct LandmarkList_Preivews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
