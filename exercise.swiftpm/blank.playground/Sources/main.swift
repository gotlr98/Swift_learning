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

var names: Array<String> = ["yagom", "chulsoo", "haesik"]
var names2: [String] = ["yagom", "chulsoo", "haesik"] // 두개는 같은 표현

var emptyArray: [Any] = [Any]() // Any 데이터 요소로 갖는 빈 배열을 생성합니다.
var emptyArray2: [Any] = Array<Any>()

var empty: [Any] = []

names.append(contentsOf: ["john", "max"])
names.insert("happy", at: 2)

print(names.first) // yagom
print(names.last) // haesik

let firstItem: String = names.removeFirst() // yagom
let lastItem: String = names.removeLast() // haesik
let indexZeroItem: String = names.remove(at: 0)  //chulsoo

// Dictionary

var numberForName: Dictionary<String, Int> = Dictionary<String, Int>()
var numberForName2: [String: Int] = [String: Int]()
var numberForName3: [String: Int] = [:]
var numberForName4: [String: Int] = ["yagom": 100, "chulsoo": 200, "haesik": 400]

numberForName["chulsoo"] = 150
numberForName["max"] = 999
numberForName.removeValue(forKey: "chulsoo")
numberForName["chulsoo", default: 0]

// Set

let englishClassStudents: Set<String> = ["john", "chulsoo", "haesik"]
let koreanClassStudents: Set<String> = ["jenny", "haesik", "chulsoo", "hana", "minsoo"]

let intersectSet: Set<String> = englishClassStudents.intersection(koreanClassStudents)
let symmetricDiffSet: Set<String> = englishClassStudents.symmetricDifference(koreanClassStudents) // 여집합의 합
let unionSet: Set<String> = englishClassStudents.union(koreanClassStudents)
let subtractSet: Set<String> = englishClassStudents.subtracting(koreanClassStudents)
