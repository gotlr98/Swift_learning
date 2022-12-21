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

let 새: Set<String> = ["비둘기", "닭", "기러기"]
let 포유류: Set<String> = ["사자", "호랑이", "곰"]
let 동물: Set<String> = 새.union(포유류)

새.isDisjoint(with: 포유류)
새.isSubset(of: 동물)
동물.isSuperset(of: 포유류)
동물.isSuperset(of: 새)

// randomElement(), shuffle()

var array: [Int] = [1,2,3,4,5]
var set: Set<Int> = [0,1,2,3,4,5]
var dictinary: [String: Int] = ["a": 1, "b": 2, "c": 3]

print(array.randomElement())
print(array.shuffled())

// 열거형 - 제한된 선택지를 주고 싶을 때, 정해진 값 외에는 입력받고 싶지 않을 때, 예상된 입력 값이 한정되어 있을 때

enum School{
    case primary
    case elementary
    case middle
    case high
    case college
    case university
    case graduate
    
}

enum School2{
    case primary, elementary, middle, high, college, university, graduate
}


var highestEducationLevel: School = School.university

var highestEducationLevel2: School = .university

highestEducationLevel = .graduate

enum School3: String{
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    case graduate = "대학원"
}

let highestEducationLevel3: School3 = School3.university

print("저의 최종학력은 \(highestEducationLevel3.rawValue) 졸업입니다.")

// 문자열 형식의 원시 값을 지정해줬다면 각 항목 이름을 그대로 원시 값으로 갖게 되고, 정수 타입이라면 첫 항목을 기준으로 0부터 1씩 늘어난 값을 갖게됨

enum School4: String{
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college
    case university
    case graduate
}

// School4.college.rawValue -> college

enum Numbers: Int{
    case zero
    case one
    case two
    case ten = 10
}

// Numbers.zero -> 0, Numbers.one -> 1 ....

let primary = School4(rawValue: "유치원") // primary
let graduate = School4(rawValue: "석박사") // nil


// 연관 값을 갖는 열거형

enum MainDish{
    case pasta(taste: String)
    case pizza(dough: String, topping: String)
    case chicken(withSauce: Bool)
    case rice
}

var dinner: MainDish = MainDish.pasta(taste: "크림")
dinner = .pizza(dough: "치즈크러스트", topping: "페퍼로니")
dinner = .chicken(withSauce: true)
dinner = .rice

// 만약 재료가 한정적이라 맛과 도우 토핑등을 한정적으로 선언하고 싶다면

enum PastaTaste: CaseIterable{
    case cream, tomato
}

enum PizzaDough: CaseIterable{
    case cheeseCrust, thin, original
}

enum PizzaTopping: CaseIterable{
    case pepperoni, cheese, bacon
}

enum MainDish2: CaseIterable{
    case pasta(taste: PastaTaste)
    case pizza(dough: PizzaDough, topping: PizzaTopping)
    case chicken(withSauce: Bool)
    case rice
    
    static var allCases: [MainDish2]{
        return PastaTaste.allCases.map(MainDish.pasta) + PizzaDough.allCases.reduce([]) {
            (result, dough) -> [MainDish2] in result + PizzaTopping.allCases.map {
                (topping) -> MainDish2 in MainDish2.pizza(dough: dough, topping: topping)
                
            }
        }
        + [true, false].map(MainDish.chiken) + [MainDish.rice]
    }
}

var dinner2: MainDish2 = MainDish2.pasta(taste: PastaTaste.tomato)
dinner2 = MainDish2.pizza(dough: PizzaDough.cheeseCrust, topping: PizzaTopping.pepperoni)

// 항목 순회

enum Schools: CaseIterable{
    case primary
    case elementary
    case middle
    case high
    case college
    case university
    case graduate
}

let allCases: [Schools] = Schools.allCases
print(allCases)
// Schools.primary, Schools.elementary....

enum Schools2: String, CaseIterable{
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    case graduate = "대학원"
}


