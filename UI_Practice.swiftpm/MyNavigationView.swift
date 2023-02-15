//
//  MyNavigationView.swift
//  UI_Practice
//
//  Created by HaeSik Jang on 2023/02/15.
//

import SwiftUI

struct MyNavigationView: View{
    var body: some View{
        
        NavigationView{
            
//            Text("MyNavigationView")
                
            
            MyList()
                .navigationBarTitle("Hello")
                .navigationBarItems(leading: Button(action: {
                    print("haha")
                }){
                    Text("hoho")
                }, trailing: NavigationLink(destination: Text("Next Screen")){
                    Image(systemName: "bookmark.fill")
                }
            )

        }
        
    }
}


struct MyNavigationView_Previews: PreviewProvider{
    static var previews: some View{
        
        MyNavigationView()
    }
}
