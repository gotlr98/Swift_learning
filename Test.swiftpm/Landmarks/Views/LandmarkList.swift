//
//  SwiftUIView.swift
//  
//
//  Created by HaeSik Jang on 2022/12/10.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly = true
    
    var filteredLandmarks: [Landmark]{
        landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView{
            List(filteredLandmarks){landmark in
                NavigationLink{
                    LandmarkDetail(landmark: landmark)
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
        //        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self){ deviceName in
        //            LandmarkList()
        //                .previewDevice(PreviewDevice(rawValue: deviceName))
        //                .previewDisplayName(deviceName)
//    }
        LandmarkList()
        }
            
    }

