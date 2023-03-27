//
//  MemoStore.swift
//  Memo_Tutorial
//
//  Created by HaeSik Jang on 2023/03/23.
//

import Foundation
import RealmSwift

class RealmData: Object {
    dynamic var list: [Memo] = [
        Memo(content: "Hello", insertDate: Date.now),
        Memo(content: "Awesome", insertDate: Date.now.addingTimeInterval(3600 * -24)),
        Memo(content: "Hello", insertDate: Date.now.addingTimeInterval(3600 * -48))
        
    ]
}

class MemoStore: ObservableObject{
    @Published var list: [Memo]
    
    init(){
        list = RealmData().list
    }
    
    func insert(memo: String){
        let realmData = RealmData()
        list.insert(Memo(content: memo), at: 0)
        realmData.list.insert(Memo(content: memo), at: 0) 
        
        let realm = try! Realm()
          try! realm.write {
            realm.add(realmData)
          }
    }
    
    func getMemo() -> Results<RealmData> {
      let realm = try! Realm()
      let filteredData = realm.objects(RealmData.self)
//      let arrData = Array(filteredData)
//      guard let resultData = arrData else { return }
//
      return filteredData
    }
    
    func update(memo: Memo?, content: String){
        guard let memo = memo else{
            return
        }
        
        memo.content = content
        let realmData = RealmData()
        
        let realm = try! Realm()
        try! realm.write{
            if let found = realmData.list.firstIndex(where: {$0.content == content}){
                realmData.list[found].content = content
            }
        }
    }
    
    func delete(memo: Memo){
        list.removeAll{ $0.id == memo.id}
    }
    
    func delete(set: IndexSet){
        for index in set{
            list.remove(at: index)
        }
    }
}
