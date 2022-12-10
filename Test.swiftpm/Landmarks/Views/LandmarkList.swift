//
//  SwiftUIView.swift
//  
//
//  Created by HaeSik Jang on 2022/12/10.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        List(landmarks){landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}

struct LandmarkList_Preivews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
