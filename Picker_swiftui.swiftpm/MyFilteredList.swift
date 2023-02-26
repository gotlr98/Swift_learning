//
//  MyFilteredList.swift
//  Picker_swiftui
//
//  Created by HaeSik Jang on 2023/02/26.
//

import Foundation
import SwiftUI

enum School: String, CaseIterable{
    case elementary = "Elementary School"
    case middle = "Middle School"
    case high = "High School"
}

struct MyFriend: Identifiable, Hashable{
    var id = UUID()
    var name: String
    var school: School
    
    
}

struct MyFilteredList: View{
    
    @State private var filteredValue = School.elementary
    @State private var myFriendList = [MyFriend]()
    
    // State에 값을 추가할땐 init으로
    
    init(){
        var newList = [MyFriend]()
        
        for i in 0...20{
            let newFriend = MyFriend(name: "My Friend \(i+1)", school: School.allCases.randomElement()!)
            newList.append(newFriend)
        }
        _myFriendList = State(initialValue: newList)
    }
    
    var body: some View{
        VStack{
            
            Text("Choiced Filter : \(filteredValue.rawValue)")
            
            Picker("", selection: $filteredValue, content: {
                Text("Elementary School").tag(School.elementary)
                Text("Middle School").tag(School.middle)
                Text("High School").tag(School.high)
            }).pickerStyle(SegmentedPickerStyle())
            
            List{
                ForEach(myFriendList.filter{ filterTerm in
//                    $0.school == filteredValue
                    filterTerm.school == filteredValue
                }){
                    friendItem in
                        GeometryReader{ geometryProxy in
                            HStack{
                                Text("name: \(friendItem.name)")
                                    .frame(width: geometryProxy.size.width / 3)
    
                                Divider()
    
                                Text("school: \(friendItem.school.rawValue)")
                                    .frame(width: geometryProxy.size.width / 2)
                            }
                        }
                }
            }
            
//            List{
//                ForEach(myFriendList, id: \.self){ friendItem in
//                    GeometryReader{ geometryProxy in
//                        HStack{
//                            Text("name: \(friendItem.name)")
//                                .frame(width: geometryProxy.size.width / 3)
//
//                            Divider()
//
//                            Text("school: \(friendItem.school.rawValue)")
//                                .frame(width: geometryProxy.size.width / 2)
//                        }
//                    }
//
//
//                }
//            }
        }
    }
}


struct MyFilteredList_Previews: PreviewProvider{
    static var previews: some View{
        MyFilteredList()
    }
}
