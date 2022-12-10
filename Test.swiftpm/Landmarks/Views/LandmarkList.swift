//
//  SwiftUIView.swift
//  
//
//  Created by HaeSik Jang on 2022/12/10.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        List{
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
    }
}

struct LandmarkList_Preivews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
