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
        return PastaTaste.allCases.map(MainDish2.pasta) + PizzaDough.allCases.reduce([]) {
            (result, dough) -> [MainDish2] in result + PizzaTopping.allCases.map {
                (topping) -> MainDish2 in MainDish2.pizza(dough: dough, topping: topping)
                
            }
        }
        + [true, false].map(MainDish2.chicken) + [MainDish2.rice]
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


// 순환 열거형 -> 열거형 항목의 연관 값이 열서형 자신의 값이고자 할 때 사용

//enum ArithmeticExpression{
//    case number(Int)
//    indirect case addition(ArithmeticExpression, ArithmeticExpression)
//    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
//}

indirect enum ArithmeticExpression{
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let final = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int{
    switch expression{
    case .number(let value):
        return value
        
    case .addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}

let result: Int = evaluate(final)

// Chapter5 연산자

// A === B -> A와 B가 참조 타입일 때 A와 B가 같은 인스턴스를 가치키는지 비교하여 불리언 값을 반환
// A ~= B -> A와 B가 패턴이 매치되는지 확인하여 불리언 값을 반환합니다

var valueA: Int = 3
var valueB: Int = 5
var valueC: Int = 5

let isSameValueAB: Bool = valueA == valueB // False
let isSameValueBC: Bool = valueB == valueC // True

//let referenceA: SomeClass = SomeClass()
//let referenceB: SomeClass = SomeClass()
//let referenceC: SomeClass = referenceA

// let isSameReferenceAB: Bool = referenceA == referenceB // False
// let isSameReferenceAC: Bool = referenceB == reference  // True

var biggerValue: Int = valueA > valueB ? valueA : valueB // 5

valueA = 0
valueB = -3
biggerValue = valueA > valueB ? valueA : valueB // 0

var stringA: String = ""
var stringB: String = "String"
var resultValue: Double = stringA.isEmpty ? 1.0 : 0.0 // 1.0
resultValue = stringB.isEmpty ? 1.0 : 0.0 // 0.0


// 범위 연산자
// 폐쇄 범위 연산자 -> A...B -> A부터 B까지의 수를 묶어 범위를 표현, A와 B를 포함한다
// 반폐쇄 범위 연산자 -> A..<B -> A부터 B미만까지의 수를 묶어 범위를 표현합니다. A를 포함하고 B를 포함하지 않습니다
// 단방향 범위 연산자 -> A... -> A이상의 수를 묶어 범위를 표현, A를 포함한다
// ...A -> A이하의 수를 묶어 범위를 표현, A를 포함
// ..<A -> A미만의 수를 묶어 범위를 표현, A를 포함하지 않음

// 오버플로 연산자

var unsignedInteger: UInt8 = 0
let errorUnderflowResult: UInt8 = unsignedInteger - 1 // error
let underflowedValue: UInt8 = unsignedInteger &- 1 // 255

unsignedInteger = UInt8.max // 255
let errorOverflowResult: UInt8 = unsignedInteger + 1 // error
let overflowedValue: UInt8 = unsignedInteger &+ 1 // 0

// A ?? B -> A가 nil이 아니면 A를 반환하고, A가 nil이면 B를 반환
// -A -> A의 부호를 변경
// O! -> O의 값을 강제로 추출
// V? -> V를 안전하게 추출하거나, V가 옵셔녈임을 표현
// 사용자 지정 연산자는 뒤에 챕터 공부하고 다시와서 하기

// Chapter6 흐름 제어

// swift에서 if 구문은 조건의 값이 꼭 Bool 타입이어야 한다

let first: Int = 5
let second: Int = 7

if first > second{
    print("first > second")
}

// case -> switch 구문의 case를 연속 실행하려면 fallthrough 키워드 사용

let integerValue : Int = 5

switch integerValue{
case 0:
    print("Value == zero")
case 1...10:
    print("value == 1~10")
    fallthrough
case Int.min..<0, 101..<Int.max:
    print("Value < 0 or Value > 100")
    break
default:
    print("10 < Value <= 100")
}

// Value == 1~10
// Value < 0 or Value > 100
// case 1...10에서 fallthrought 키워드를 사용했기 때문에 아래 케이스도 실행

let stringValue: String = "Liam Neeson"

switch stringValue{
case "yagom":
    print("He is yagom")
case "Jay":
    print("He is Jay")
case "Jenny", "Joker", "Nova":
    print("He or She is \(stringValue)")
default:
    print("\(stringValue) said 'I dont't know who you are'")
}

// Liam Neeson said 'I don't know who you are'

typealias NameAge = (name: String, age: Int)

let tupleValue: NameAge = ("yagom", 99)

switch tupleValue {
case("yagom", 99):
    print("정확히 맞췄습니다!")
default:
    print("누굴 찾나요?")
}

// 정확히 맞췄습니다!

switch tupleValue{
case ("yagom", 50):
    print("정확히 맞췄습니다!")
case("yagom", _):
    print("이름만 맞았습니다. 나이는 \(tupleValue.age)입니다.")
case(_, 99):
    print("나이만 맞았습니다. 이름은 \(tupleValue.name)입니다.")
default:
    print("Who you are looking for")
}

let 직급: String = "사원"
let 연차: Int = 1
let 인턴인가: Bool = false

switch 직급{
case "사원" where 인턴인가 == true:
    print("인턴입니다.")
case "사원" where 연차 < 2 && 인턴인가 == false:
    print("신입사원입니다.")
case "사원" where 연차 > 5:
    print("연식 좀 된 사원입니다.")
case "사원":
    print("사원입니다.")
case "대리":
    print("대리입니다.")
default:
    print("사장입니까?")
}

// 열거형에 case가 있는 경우 switch

enum Menu{
    case chicken
    case pizza
    case hamburger
}

let lunchMenu: Menu = .hamburger

switch lunchMenu{
case .chicken:
    print("치킨")
case .pizza:
    print("피자")
@unknown case _: // case default, case _ 와 같은 표현
    print("what's today menu")
}

// 반복문

for i in 0...2{
    print(i)
}

for i in 0...5{
    if i.isMultiple(of:2){
        print(i)
        continue
    }
    print("\(i) == 홀수")
}

let helloSwift: String = "Hello Swift!"

for char in helloSwift{
    print(char)
}

var result2: Int = 1

for _ in 1...3{ // for 뒤에 변수가 필요없을 시 _ 사용
    result2 += 10
}

// dictionary
let friends: [String: Int] = ["Jay":15, "Joe":16, "Jenny":17]

for tuple in friends{
    print(tuple)
}

let address: [String: String] = ["도" :"충청북도", "시군구":"청주시 청원구", "동읍면":"율량동"]

for (key, value) in address{
    print("\(key) : \(value)")
}

var names3: [String] = ["Joker","Jenny","Nova","Yagom"]

while names3.isEmpty == false{
    print("Good bye\(names3.removeFirst())")
}

// repeat-while -> do-while과 같다

repeat {
    print("Good bye \(names3.removeFirst())")
}while names3.isEmpty == false
        
// 구문 이름표 -> 원하는 반복문을 종료시키고 싶을 때 사용

var numbers3: [Int] = [3, 2342, 6, 3252]

numberLoop: for num in numbers3{
    if num > 5 || num < 1{
        continue numberLoop
    }
    
    var count: Int = 0
    
    printLoop: while true{
        
        print(num)
        count += 1
        
        if count == num{
            break printLoop
        }
    }
    
    removeLoop: while true{
        if numbers3.first != num{
            break numberLoop
            }
        }
        numbers3.removeFirst()
    }

