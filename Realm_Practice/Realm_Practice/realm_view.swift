//
//  realm_view.swift
//  Realm_Practice
//
//  Created by HaeSik Jang on 2023/03/27.
//

import SwiftUI
import RealmSwift

class RealmData: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
}

private func setRealmData() {
    let realmData = RealmData()
    realmData.name = "그린"
    realmData.age = 100

    let realm = try! Realm()
    try! realm.write {
    realm.add(realmData)
  }
}

private func getRealmData() -> RealmData {
    let realm = try! Realm()
    let filteredData = realm.objects(RealmData.self)
    .filter("age > 50")
    let arrData = Array(filteredData)
    guard let resultData = arrData.first else { return RealmData() }

    return resultData
}

private func removeRealmData() {
    let realm = try! Realm()
    try! realm.write {
    realm.delete(realm.objects(RealmData.self))
    }
}

struct realm_view: View {
    @State var name: String = "이름 데이터를 가져와주세요."
    @State var age: String = "나이 데이터를 가져와주세요."
    
    var body: some View {
        VStack{
            
            Button("Set Realm Data") {
                setRealmData()
            }
            Button("Get Realm Data") {
                let realmData = getRealmData()
                name = realmData.name
                age = String(realmData.age)
            }
            Button("Remove Realm Data") {
                removeRealmData()
            }
            Text(name)
            Text(age)
        }
        
    }
}

struct realm_view_Previews: PreviewProvider {
    static var previews: some View {
        realm_view()
    }
}
