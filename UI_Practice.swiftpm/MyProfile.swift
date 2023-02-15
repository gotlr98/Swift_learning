//
//  MyProfile.swift
//  UI_Practice
//
//  Created by HaeSik Jang on 2023/02/15.
//

import SwiftUI

struct MyProfile: View{
    
    @Binding var isNavigationBarHidden: Bool
    
    init(isNavigationBarHidden: Binding<Bool> = .constant(false)){

        _isNavigationBarHidden = isNavigationBarHidden
    }
    
    var body: some View{
        
        
        ScrollView{
            
            VStack{
                Image("photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .frame(width: 300, height: 300)
                
                Text("HaeSik Jang")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .padding()
                Text("I'm a iOS Developer")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                
                HStack{

                    Text("Instagram")
                        .font(.system(size: 20))
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .frame(width: 120, height: 50)
                        .background(Color.red)
                        .cornerRadius(15)
                        
                    Text("Facebook")
                        .font(.system(size: 20))
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .frame(width: 120, height: 50)
                        .background(Color.blue)
                        .cornerRadius(15)
                }
                
            }
        }
        
        // 외부에서 navigationview를 사용하기 때문에 navigationview로 안감싸도 된다
        .navigationBarTitle("Haesik's Profile")
        .onAppear{
            self.isNavigationBarHidden = false
        }
        .navigationBarItems(trailing: NavigationLink(destination: Text("Setting")){
            Image(systemName: "gear")
                .foregroundColor(Color.black)
                .font(.system(size: 30))
        })
    }
}

struct MyProfile_Previews: PreviewProvider{
    static var previews: some View{
        
        MyProfile()
    }
}
