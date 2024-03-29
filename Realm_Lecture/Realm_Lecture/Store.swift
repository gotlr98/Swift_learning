//
//  Store.swift
//  Realm_Lecture
//
//  Created by HaeSik Jang on 2023/03/29.
//

import Foundation
import RealmSwift

class Store: Object{
    @Persisted var name: String
    
    @Persisted(primaryKey: true) var _id: ObjectId
}



func setId(){
    let myStore = Store()
    myStore.name = "sik"
    
    let realm = try! Realm()
    try! realm.write(){
        realm.add(myStore)
    }
    print(Realm.Configuration.defaultConfiguration.fileURL!)
}

func read(){
    let realm = try! Realm()
    print(realm.objects(Store.self))
}



