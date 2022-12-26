import UIKit

var greeting = "Hello, playground"

// Chapter9 구조체와 클래스

//struct BasicInformation{
//    var name: String
//    var age: Int
//}
//
//var haesikInfo: BasicInformation = BasicInformation(name: "haesik", age:25)
//
//haesikInfo.name
//
//let sebaInfo : BasicInformation = BasicInformation(name: "Seba", age: 99)
//// sebaInfo.age = 100 -> 상수로 선언했기 때문에 변경 불가
//
//class Person {
//    var height: Float = 0.0
//    var weight: Float = 0.0
//
//    deinit{
//        print("Person Class Instance가 소멸")
//    }
//}
//
//var haesik: Person = Person()
//
//haesik.height = 123.4
//haesik.weight = 123.4
//
//let jenny: Person = Person()
//
//jenny.height = 123.4
//jenny.weight = 123.4
//
//var abc: Person? = Person()
//abc = nil


/*
    구조체는 값 타입이고 클래스는 참조 타입이다
    값 타입은 전달될 값이 복사, 참조 타입은 값을 보사하지 않고 주소가 전달
*/

struct BasicInformation{
    let name: String
    var age: Int
}

var haesikInfo: BasicInformation = BasicInformation(name: "haesik", age: 25)
haesikInfo.age = 100

var friendInfo: BasicInformation = haesikInfo

print("haeik's age: \(haesikInfo.age)")
print("friend's age : \(friendInfo.age)")

friendInfo.age = 999

print("haesik's age: \(haesikInfo.age)")
print("friend's age: \(friendInfo.age)")

class Person{
    var height: Float = 0.0
    var weight: Float = 0.0
}

var haesik: Person = Person()
var friend: Person = haesik

print("haesik's height: \(haesik.height)")
print("friend's height: \(friend.height)")

// friend는 haesik을 참조하기 때문에 값이 변동됩니다
friend.height = 185.5
print("haesik's height: \(haesik.height)")


func changeBasicInfo(_ info: BasicInformation){
    
    var copiedInfo: BasicInformation = info
    copiedInfo.age = 1
}

func changePersonInfo(_ info: Person){
    info.height = 155.3
}

changeBasicInfo(haesikInfo)
print("haesik's age: \(haesikInfo.age)")

changePersonInfo(haesik)
print("haesik's height: \(haesik.height)")


