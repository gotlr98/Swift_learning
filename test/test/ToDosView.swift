//
//  ToDosView.swift
//  test
//
//  Created by HaeSik Jang on 2023/02/27.
//

import Foundation
import SwiftUI

struct ToDoItem: Identifiable, Hashable{
    var id: UUID
    var title: String
}

func prepareData() -> [ToDoItem]{
    print("prepareData() called")
    
    var newList = [ToDoItem]()
    
    for i in 0...20{
        let newTodo = ToDoItem(id: UUID(), title: "My To Do List \(i)")
        print("newToDo.id : \(newTodo.id) / title: \(newTodo.title)")
        newList.append(newTodo)
    }
    
    return newList
}


struct ToDosView: View{
    
    @State var todoItems = [ToDoItem]()
    @State var activeUUID: UUID?
    
    init(){
        _todoItems = State(initialValue: prepareData())
    }
    
    var body: some View{
        
        NavigationView{
            List(todoItems){ todoItem in
                
                NavigationLink(destination: Text("\(todoItem.title)"), tag: todoItem.id,
                               // activeUUID 값이 변경되면 해당 하는 링크로 이동
                               selection: $activeUUID, label: {
                    Text("\(todoItem.title)")
                })
                
            }
            .navigationTitle(Text("To Do List"))
            .onOpenURL(perform: { url in
                if case .todoItem(let id) = url.detailPage{
                    print("ID: \(id)")
                    activeUUID = id
                }
            })
        }
        
    }
}

struct ToDosView_Previews: PreviewProvider{
    static var previews: some View{
        ToDosView()
    }
}
