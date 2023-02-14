//
//  MyList.swift
//  UI_Practice
//
//  Created by HaeSik Jang on 2023/02/14.
//

import SwiftUI

struct MyList: View{
    
    @Binding var isNavigationBarHidden: Bool
    
    init(isNavigationBarHidden: Binding<Bool> = .constant(false)){
        if #available(iOS 16.0, *){
            
        }
        else{
            UITableView.appearance().tableFooterView = UIView()
        }
        
        UITableView.appearance().separatorStyle = .none
        
        _isNavigationBarHidden = isNavigationBarHidden
    }
    var body: some View{
        
//        List{
//            ForEach(1...10, id: \.self){
//                Text("MyList\($0)")
//            }
//        }
        
        List{
            
            Section(header: Text("To Do List").font(.headline).foregroundColor(Color.black),
                    footer: Text("footer")){
                ForEach(1...3, id: \.self){ itemList in
//                Text("MyList\(itemList)")
                    MyCard(icon: "book.fill", title: "Reading Book \(itemList)", startTime: "1PM", endTime: "2PM", backgroundColor: Color.red)
                }
            }
            .listRowInsets(EdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            
            Section(header: Text("Tomorrow List").font(.headline).foregroundColor(Color.black)){
                ForEach(1...10, id: \.self){ itemList in
                    MyCard(icon: "book.fill", title: "Reading Book \(itemList)", startTime: "1PM", endTime: "2PM", backgroundColor: Color.blue)
                }
            }
            .listRowInsets(EdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            .listRowBackground(Color.yellow)
            
            
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("My List")
        
//        .navigationBarHidden(self.isNavigationBarHidden)
        .onAppear{
            self.isNavigationBarHidden = false
        }
    }
}


struct MyList_Previews: PreviewProvider{
    static var previews: some View{
        MyList()
    }
}
