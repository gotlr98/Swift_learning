import Foundation


//var greeting = "Hello, playground"
//
//struct BasicInformation{
//    let name: String
//    var age: Int
//}
//
//var yagomInfo: BasicInformation = BasicInformation(name: "yagom", age: 99)
//
//class Person{
//    var height: Float = 0.0
//    var weight: Float = 0.0
//}
//
//let yagom: Person = Person()
//yagom.height = 182.5
//yagom.weight = 78.5
//
//print(yagomInfo)
//dump(yagomInfo)
//
//let name: String = "Haesik"
//print("My name is \(name)")

// var [변수명]: [데이터 타입] = [값]
//var name: String = "yagom"
//var age: Int = 100
//var job = "iOS Programmer"
//var height = 181.5

//age = 99
//
//// let -> 상수 let [상수명]: [데이터 타입] = [값]
//
//let name: String = "yagom"
//name = "야곰"

//print(name)

// typealias 타입에 별칭을 붙여서 사용

typealias MyInt = Int
typealias YourInt = Int

let age: MyInt = 100
var year: YourInt = 2080

year = age

//Tuple 지정된 데이터의 묶음

var person: (String, Int, Double) = ("yagom", 100, 182.5)

print("name: \(person.0)")

var person2: (name: String, age: Int, height: Double) = ("yagom", 100, 162.5)
print("age: \(person2.age)")

// Tuple alias

typealias PersonTuple = (name: String, age: Int, height: Double)

let haesik: PersonTuple = ("haesik", 25, 160)

// Array


