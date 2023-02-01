import UIKit

var greeting = "Hello, playground"

// Chapter 24 타입 중첩

/*
 타입 내부에 새로운 타입을 선언해준 것을 중첩 타입이라고 부른다.
 */

class Person{
    enum Job{
        case jobless, programmer, student
    }
    
    var job: Job = .jobless
}

class Student: Person{
    enum School{
        case elementary, middle, high, university
    }
    
    var school: School
    
    init(school: School){
        self.school = school
        super.init()
        self.job = .student
    }
}

let personJob: Person.Job = .jobless
let studentJob: Student.Job = .student

let student: Student = Student(school: .middle)


// 같은 이름의 중첩 데이터 타입 구현

struct Sports{
    enum GameType{
        case football, basketball
    }
    
    var gameType: GameType
    
    struct GameInfo{
        var time: Int
        var player: Int
    }
    
    var gameInfo: GameInfo{
        switch self.gameType{
        case .basketball:
            return GameInfo(time: 40, player: 5)
        case .football:
            return GameInfo(time: 90, player: 11)
        }
    }
}

struct ESports{
    enum GameType{
        case online, offline
    }
    
    var gameType: GameType
    
    struct GameInfo{
        var location: String
        var pakage: String
    }
    
    var gameInfo: GameInfo{
        switch self.gameType{
        case .online:
            return GameInfo(location: "www.liveonline.co.kr", pakage: "LOL")
        case .offline:
            return GameInfo(location: "제주", pakage: "SA")
        }
    }
}

var basketball: Sports = Sports(gameType: .basketball)
print(basketball.gameInfo)

let someGameType: Sports.GameType = .football
let anotherGameType: ESports.GameType = .online

//let errorIfYouWantIt: Sports.GameType = .online // 같은 이름이더라도 다른 구조체에 선언되어있기 때문에 사용불가



// Chapter 25 패턴
/*
 패턴은 '단독 또는 복합 값의 구조를 나타내는 것'이고, 패턴 매칭은 '코드에서 어떤 패턴의 형태를 찾아내는 행위'
 쉽게 말해서 이러이러한 것을 표현하고 싶다면 이러이러한 패턴을 통해 표현하면 된다 라는 뜻이다.
 
 1. 값을 해체(추출)하거나 무시하는 패턴 - 와일드카드 패턴, 식별자 패턴, 값 바인딩 패턴, 튜플 패턴
 2. 패턴 매칭을 위한 패턴 - 열거형 케이스 패턴, 옵셔널 패턴, 표현 패턴, 타입캐스팅 패턴
 */


// 와일드카드 패턴 -> '_' 이 자리에 올 것이 무엇이든간에 상관하지 마라 라는 뜻

let dummyString: String = "ABC"

switch dummyString{
case _: print(dummyString) // 어떤 값이 와도 상관없기에 항상 실행
}

let optionalString: String? = "ABC"

switch optionalString{
case "ABC"?: print(optionalString) // Optional("ABC")일 때만 실행
case _?: print("Has value, but not ABC") // Optional("ABC") 외의 값이 일을 때 실행
case nil: print("nil")
}

let yagom = ("yagom", 99, "male")

switch yagom{
case("yagom", _, _): print("Hello yagom!!!") // 첫 번째 요소가 "yagom"일 때만 실행
case(_, _, _): print("Who cares~") // 그 외 언제든지 실행
}

for _ in 0..<2{
    print("Hello")
}


// 튜플 패턴

let name: String = "Jang"
let age: Int = 26
let gender: String? = "Male"

switch (name, age, gender){
case ("Jang", _, _): print("Hello Jang")
case (_, _, "Male"?): print("Who are you man")
default: print("I don't know who you are")
}

let points: [(Int, Int)] = [(0, 0), (1, 0), (1, 1), (2, 0), (2, 1)]

for (x, _) in points{
    print(x)
}


// 열거형 케이스 패턴

let someValue: Int = 30

if case 0...100 = someValue{
    print("0 <= \(someValue) <= 100")
}

let anotherValue: String = "ABC"

if case "ABC" = anotherValue{
    print(anotherValue)
}

enum MainDish{
    case pasta(taste: String)
    case pizza(dough: String, topping: String)
    case chicken(withSauce: Bool)
    case rice
}

var dishes: [MainDish] = []

var dinner: MainDish = .pasta(taste: "cream")
dishes.append(dinner)

if case .pasta(let taste) = dinner{
    print("\(taste) pasta")
}

dinner = .pizza(dough: "cheese crust", topping: "bulgogi")
dishes.append(dinner)

func whatIsThis(dish: MainDish){
    guard case .pizza(let dough, let topping) = dinner else{
        print("It's not a Pizza")
        return
    }
    
    print("\(dough) \(topping) pizza")
}

whatIsThis(dish: dinner)

dinner = .chicken(withSauce: true)
dishes.append(dinner)

while case .chicken(let sauced) = dinner{
    print("\(sauced ? "양념" : "후라이드") 통닭")
    break
}

dinner = .rice
dishes.append(dinner)

if case .rice = dinner{
    print("Today dinner is rice")
}

for dish in dishes{
    switch dish{
    case let .pasta(taste): print(taste)
    case let .pizza(dough, topping): print(dough, topping)
    case let .chicken(sauced): print(sauced ? "양념" : "후라이드")
    case .rice: print("Just 쌀")
    }
}


var optionalValue: Int? = 100

if case .some(let value) = optionalValue{
    print(value)
}

if case let value? = optionalValue{
    print(value)
}

func isItHasValue(_ optionalValue: Int?){
    guard case .some(let value) = optionalValue else{
        print("none")
        return
    }
    
    print(value)
}

isItHasValue(optionalValue)

while case .some(let value) = optionalValue{ // 값이 있을때 까지 루프 돌다가 값이 있으면 출력하고 값을 nil로 초기화
    print(value)
    optionalValue = nil
}

print(optionalValue)


let arrayOfOptionalInts: [Int?] = [nil, 2, 3, nil, 5]

for case let number? in arrayOfOptionalInts{
    print("Found a \(number)")
}


// 타입캐스팅 패턴
/*
 is 패턴 - is (TYPE_NAME) -> 우측에 쓰여진 타입 또는 그 타입의 자식클래스 타입이면 값과 매치
 as 패턴 - SomePattern as (TYPE_NAME)
 */

let dummy: Any = 100

switch dummy{
case is String: print("It's String")
case let value as Int: print(value + 1)
default: print("None")
}


// 표현 패턴

switch 3{
case 0...5: print("between 0 and 5")
default: print("less than 0 or bigger than 5")
}

var point: (Int, Int) = (1, 2)

switch point{
case (0, 0): print("zero point")
case (-2...2, -2...2): print("(\(point.0), \(point.1)) is near by zero point.")
default: print("point (\(point.0), \(point.1))")
}

func ~= (pattern: String, value: Int) -> Bool{
    return pattern == "\(value)"
}

point = (0, 0)

switch point{
case ("0", "0"): print("zero point")
default: print("point (\(point.0), \(point.1))")
}

struct Human{
    var name: String
    var age: Int
}

let lingo: Human = Human(name: "Lingo", age: 99)

func ~= (patter: String, value: Human) -> Bool{
    return patter == value.name
}


// 제네릭을 사용한 표현 패턴 활용

protocol Personalize{
    var name: String{get}
    var age: Int{get}
}

struct Person2: Personalize{
    var name: String
    var age: Int
}

let star: Person2 = Person2(name: "Star", age: 99)

func ~= <T: Personalize>(pattern: String, value: T) -> Bool{
    return pattern == value.name
}

func ~= <T: Personalize>(pattern: T, value: T) -> Bool{
    return pattern.name == value.name && pattern.age == value.age
}

switch star{
case Person2(name: "Star", age: 99): print("Same Person!!")
case "Star": print("Hello Star!!")
default: print("I don't know who you are")
}

func ~= <T: Personalize>(pattern: (T) -> Bool, value: T) -> Bool{
    return pattern(value)
}

func young<T: Personalize>(value: T) -> Bool{
    return value.age < 50
}

switch star{
case young: print("\(star.name) is young")
default: print("\(star.name) is old")
}

func isNamed<T: Personalize>(_ pattern: String) -> ((T) -> Bool){
    return { (value: T) -> Bool in value.name == pattern}
}

switch star{
case isNamed("Jung"): print("He is Jung")
default: print("Another person")
}



// Chapter 26 where 절
/*
 1. 패턴과 결합하여 조건 추가
 2. 타입에 대한 제약 추가
 
 특정 패턴에 Bool 타입 조건을 지정하거나 어떤 타입의 특정 프로토콜 준수 조건을 추가하는 등의 기능
 */

let tuples: [(Int, Int)] = [(1, 2), (1, -1), (1, 0), (0, 2)]

for tuple in tuples{
    switch tuple{
    case let (x, y) where x == y: print("x == y")
    case let (x, y) where x == -y: print("x == -y")
    case let (x, y) where x > y: print("x > y")
    case let (1, _): print("x == 1")
    case let (_, 2): print("y == 2")
    default: print("\(tuple.0), \(tuple.1)")
    }
}

var repeatCount: Int = 0

for tuple in tuples{
    switch tuple{
    case let (x, y) where x == y && repeatCount > 2: print("x == y")
    case let (x, y) where repeatCount < 2: print("\(x), \(y)")
    default: print("Nothing")
    }
    
    repeatCount += 1
}

let firstValue: Int = 50
let secondValue: Int = 30

switch firstValue + secondValue{
case let total where total > 100: print("total > 100")
case let total where total < 0: print("wrong value")
case let total where total == 0: print("zero")
case let total: print(total)
}


for case let number? in arrayOfOptionalInts where number > 2{
    print("Found a \(number)")
}

let anyValue: Any = "ABC"

switch anyValue{
case let value where value is Int: print("value is Int")
case let value where value is String: print("value is String")
case let value where value is Double: print("value is Double")
default: print("Unknown type")
}

var things: [Any] = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append({(name: String) -> String in "Hello, \(name)"})

for thing in things{
    switch thing{
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}


var point2: (Int, Int) = (1, 2)

switch point2{
case (0, 0): print("원점")
case (-2...2, -2...2) where point2.0 != 1: print("\(point2.0), \(point2.1)")
default: print("point (\(point2.0), \(point2.1))")
}


// where 절을 활용한 타입 매개변수와 연관 타입의 타입 제약 추가

func doubled<T>(integerValue: T) -> T where T: BinaryInteger{
    return integerValue * 2
}

//func doubled<T: BinaryInteger>(integerValue: T) -> T{ // 위와 같은 표현
//    return integerValue * 2
//}

func compareTwoSequences<S1, S2>(a: S1, b: S2) where S1: Sequence, S1.Element: Equatable, S2: Sequence, S2.Element: Equatable{
    
}

protocol Container{
    associatedtype ItemType where ItemType: BinaryInteger
    var count: Int{get}
    mutating func append(_ item: ItemType)
    subscript(i: Int) -> ItemType{get}
}


// where 절을 활용한 제네릭 타입의 연관 타입 제약 추가

protocol Talkable{}
protocol CallToAll{
    func callToAll()
}

struct PersonW: Talkable{}
struct Animal{}

extension Array: CallToAll where Element: Talkable{
    func callToAll(){}
}


