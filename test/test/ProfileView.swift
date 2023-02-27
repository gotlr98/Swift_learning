//
//  ProfileView.swift
//  test
//
//  Created by HaeSik Jang on 2023/02/27.
//

import Foundation
import SwiftUI

struct ProfileView: View{
    var body: some View{
        
        Rectangle()
            .foregroundColor(Color.purple)
            .frame(width: 100, height: 100)
            .cornerRadius(15)
            .overlay{
                Text("Profile")
                    .font(.system(size: 23))
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
            }
    }
}

struct ProfileView_Previews: PreviewProvider{
    static var previews: some View{
        ProfileView()
    }
}
