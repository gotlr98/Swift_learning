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



// Chapter 27 ARC
/*
 자동으로 메모리를 관리해주는 방식
 컴파일 당시 이미 인스턴스의 해제 시점이 정해져 있어서 인스턴스가 언제 메모리에서 해제될지 예측할 수 있다.
 ARC의 작동 규칙을 모르고 사용하면 인스턴스가 메모리에서 영원히 해제되지 않을 가능성이 있다.
 
 강한참조는 인스턴스가 계속해서 메모리에 남아있어야 하는 명분을 만들어 준다.
 인스턴스는 참조 횟수가 0이 되는 순간 메모리에서 해제되는데, 인스턴스를 다른 인스턴스의 프로퍼티나 변수, 상수 등에 할당할 때 강한참조를 사용하면
 참조 횟수가 1 증가한다. 또 강한참조를 사용하는 변수, 상수 등에 nil을 할당해주면 원래 자신에게 할당되어 있던 인스턴스의 참조 횟수가 1 감소한다.
 */


var globalReference: Person2?

func foo(){
    let haesik: Person2 = Person2(name: "haesik", age: 26) // haesik is being initialized & 인스턴스의 참조 횟수 : 1
    
    globalReference = haesik // 인스턴스의 참조 횟수 : 2
    
    // 함수 종료 시점 -> 참조 횟수 -1
    // 인스턴스의 참조 횟수 : 1
}

foo() // 참조 횟수가 1이기 때문에 메모리 해제 안됨


// 강한참조 순환 문제 -> 인스턴스끼리 서로가 서로를 강한참조할 때

class Person3{
    let name: String
    
    init(name: String){
        self.name = name
    }
    
    var room: Room?
    
    deinit{
        print("\(name) is being deinitialized")
    }
}


class Room{
    let number: String
    
    init(number: String){
        self.number = number
    }
    
    var host: Person3?
    
    deinit{
        print("Room \(number) is being deinitialized")
    }
}

var person3: Person3? = Person3(name: "haesik") // Person3 인스턴스 참조 횟수 : 1
var room: Room? = Room(number: "505") // Room 인스턴스 참조 횟수 : 1

room?.host = person3 // Person3 인스턴스 참조 횟수 : 2
person3?.room = room // Room 인스턴스 참조 횟수 : 2

person3 = nil // Person3 인스턴스 참조 횟수 : 1
room = nil // Room 인스턴스 참조 횟수 : 1

// Person3, Room 인스턴스를 참조할 방법 상실, 그러나 메모리에는 잔존

/*
 room에 nil을 할당하는 순간 person3 변수가 참조하던 Person3 클래스의 인스턴스에 접근할 방법도, room 변수가 참조하던 Room클래스의 인스턴스에 접근할 방법도 사라졌다.
 이 경우 두 인스턴스 모두 메모리에 남아 있게 된다.
 */


// 약한참조
/*
 자신이 참조하는 인스턴스의 참조 횟수를 증가시키지 않는다. 참조 타입의 프로퍼티나 변수의 선언 앞에 weak 키워드를 써주면 그 프로퍼티나 변수는 자신이 참조하는 인스턴스를 약한참조 한다.
 상수에는 사용할 수 없다. 만약 자신이 참조하던 인스턴스가 메모리에서 해제된다면 nil이 할당될 수 있어야 하기 때문. 따라서 약한참조는 항상 옵셔널이어야 한다.
 */


class Room2{
    let number: String
    
    init(number: String){
        self.number = number
    }
    
    weak var host: Person3?
    
    deinit{
        print("Room \(number) is being deinitialized")
    }
}

var sik: Person3? = Person3(name: "haesik") // Person3 인스턴스의 참조 횟수 : 1
var room2: Room2? = Room2(number: "505") // Room2 인스턴스의 참조 횟수 : 1

room2?.host = sik // Person3 인스턴스의 참조 횟수 : 1
sik?.room = room // Room2 인스턴스의 참조 횟수 : 2

sik = nil // Person3 인스턴스의 참조 횟수 : 0, Room2 인스턴스의 참조 횟수 : 1 -> 자신의 프로퍼티가 강한참조를 하면 인스턴스의 참조 횟수를 1 감소시킨다.
print(room2?.host)

room2 = nil // Room2 인스턴스의 참조 횟수 : 0


// 미소유참조
/*
 미소유참조는 약한참조와 다르게 자신이 참조하는 인스턴스가 항상 메모리에 존재할 것이라는 전제를 기반을 동작 -> 자신이 참조하는 인스턴스가 메모리에서 해제되더라도 스스로 nil을 할당해주지 않는다.
 미소유참조는 참조하는 동안 해당 인스턴스가 메모리에서 해제되지 않으리나는 확신이 있을 때만 사용
 참조 타입의 변수나 프로퍼티의 정의 앞에 unowned 키워드를 써주면 미소유참조
 강한참조를 피해야 하는데 약한참조를 사용할 수 없는 경우(옵셔널이 아니어야 하거나 상수로 지정해야 하는 경우)에 사용
 */

class Person4{
    let name: String
    
    // 카드를 소지할 수도, 소지하지 않을 수도 있기 때문에 옵셔널로 정의
    // 또, 카드를 한 번 가진 후 잃어버리면 안 되기 때문에 강한참조를 해야 한다.
    
    var card: CreditCard?
    
    init(name: String){
        self.name = name
    }
    
    deinit{
        print("\(name) is being deinitialized")
    }
}

class CreditCard{
    let number: UInt
    
    unowned let owner: Person4 // 카드의 소유자가 분명히 존재해야 한다.
    
    init(number: UInt, owner: Person4){
        self.number = number
        self.owner = owner
    }
    
    deinit{
        print("Card #\(number) is being deinitialized")
    }
}

var jisoo: Person4? = Person4(name: "jisoo") // Person4 인스턴스의 참조 횟수 : 1

if let person: Person4 = jisoo{
    // Creditcard 인스턴스의 참조 횟수 : 1
    person.card = CreditCard(number: 1004, owner: person)
    // Person4 인스턴스의 참조 횟수 : 1 -> 참조 하였지만 미소유참조라 늘어나지 않았다.
}

jisoo = nil


// 미소유참조와 암시적 추출 옵셔널 프로퍼티 -> 서로 참조해야 하는 프로퍼티에 값이 꼭 있어야 하면서도 한번 초기화되면 그 이후에는 nil을 할당할 수 없는 조건을 갖추어야 하는 경우

class Company{
    let name: String
    
    var ceo: CEO! // 암시적 추출 옵셔널 프로퍼티(강한참조)
    
    init(name: String, ceoName: String){
        self.name = name
        self.ceo = CEO(name: ceoName, company: self)
    }
    
    func introduce(){
        print("\(name)의 CEO는 \(ceo.name)입니다.")
    }
}

class CEO{
    let name: String
    
    unowned let company: Company // 미소유참조 상수 프로퍼티(미소유참조)
    
    init(name: String, company: Company){
        self.name = name
        self.company = company
    }
    
    func introduce(){
        print("\(name)는 \(company.name)의 CEO입니다.")
    }
}

let company: Company = Company(name: "무한상사", ceoName: "김태호")
company.introduce()
company.ceo.introduce()


// 획득목록
/*
 획득목록은 클로저 내부에서 참조 타입을 획득하는 규칙을 제시해줄 수 있는 기능.
 획득목록은 클로저 내부의 매개변수 목록 이전 위치에 작성해준다. 획득목록은 참조 방식과 참조할 대상을 ([])로 둘러싼 목록 형식으로 작성하며
 획득목록 뒤에는 in 키워드를 써준다
 */

// 획득목록을 통한 값 획득
var a = 0
var b = 0
let closure = { [a] in
    print(a,b)
    b = 20
}

a = 10
b = 10

closure()
// a 변수는 클로저가 생성됨과 동시에 획득목록 내에서 다시 a라는 이름의 상수로 초기화된 것이다. -> 외부에서 a의 값을 변경하더라도 클로저의 획득목록을 통한 a와는 별개


// 참조 타입의 획득목록 동작

class SimpleClass{
    var value: Int = 0
}

var x = SimpleClass()
var y = SimpleClass()

let closure2 = {[x] in
    print(x.value, y.value)
}

x.value = 10
y.value = 10

closure2()

class SimpleClass2{
    var value: Int = 0
}

var z: SimpleClass2? = SimpleClass2()
var k = SimpleClass2()

let closure3 = { [weak z, unowned k] in
    print(z?.value, k.value)
}

z = nil
k.value = 10

closure3()


// 획득목록을 통한 클로저의 강한참조 순환 문제 해결
class PersonWho{
    let name: String
    let hobby: String?
    
    lazy var introduce: () -> String = { [unowned self] in
        var introduction: String = "My name is \(self.name)."
        
        guard let hobby = self.hobby else{
            return introduction
        }
        
        introduction += " "
        introduction += "My hobby is \(hobby)."
        return introduction
    }
    
    init(name: String, hobby: String? = nil){
        self.name = name
        self.hobby = hobby
    }
    
    deinit{
        print("\(name) is being deinitialized")
    }
}

var haesik: PersonWho? = PersonWho(name: "haesik", hobby: "drink")
print(haesik?.introduce())
haesik = nil

// 미소유참조로 인한 문제상황이 발생할 수 있다면 약한참조로 변경하여 옵셔널로 사용해도 무방하다.

// Chapter28 오류처리
/*
 오류처리는 프로그램이 오류를 일으켰을 때 이것을 감지하고 회복시키는 일련의 과정
 스위프트에서 오류는 Error라는 프로토콜을 준수하는 타입의 값을 통해 표현. Error 프로토콜은 사실상 요구사항이 없는 빈 프로토콜이지만 오류를 표현하기 위한 타입으로 채택
 오류를 던져즐 때는 throw 구문을 사용한다.
 
 오류를 처리하기 위한 네 가지 방법
 1. 함수에서 발생한 오류를 해당 함수를 호출한 코드에 알리는 방법
 2. do-catch 구문을 이용하여 오류를 처리하는 방법
 3. 옵셔널 값으로 오류를 처리하는 방법
 4. 오류가 발생하지 않을 것이라고 확신하는 방법
 */


// 자판기 동작 오류의 종류를 표현한 열거형

enum VendingMachineError: Error{
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

/*
 1. 함수에서 발생한 오류 알리기
 
 try 키워드로 던져진 오류를 받을 수 있다. try 키워드는 try, try? try!등으로 표현
 */

// 자판기 동작 도중 발생한 오류 던지기

struct Item{
    var price: Int
    var count: Int
}

class VendingMachine{
    var inventory = [
        "Candy Bar" : Item(price: 12, count: 7),
        "Chips" : Item(price: 10, count: 4),
        "Biscuit" : Item(price: 7, count: 11)
    ]
    
    var coinsDeposited = 0
    
    func dispense(snack: String){
        print("\(snack) 제공")
    }
    
    func vend(itemNamed name: String) throws{
        
        guard let item = self.inventory[name] else{
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else{
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= self.coinsDeposited else{
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - self.coinsDeposited)
        }
        
        self.coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        self.inventory[name] = newItem
        
        self.dispense(snack:name)
    }
}

let favoriteSnacks = [
    "haesik": "Chips",
    "jinsung" : "Biscuit",
    "heejin" : "Chocolate"
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine){
    let snackName = favoriteSnacks[person] ?? "Candy bar"
//    try vendingMachine.vend(itemNamed: snackName)
    tryingVend(itemNamed: snackName, vendingMachine: vendingMachine)
}

struct PurchasedSnack{
    let name: String
    init(name: String, vendingMachine: VendingMachine){
//        try vendingMachine.vend(itemNamed: name)
        tryingVend(itemNamed: name, vendingMachine: vendingMachine)
        self.name = name
    }
}

func tryingVend(itemNamed: String, vendingMachine: VendingMachine){
    do{
        try vendingMachine.vend(itemNamed: itemNamed)
    }catch VendingMachineError.invalidSelection{
        print("유효하지 않은 선택")
    }catch VendingMachineError.outOfStock{
        print("품절")
    }catch VendingMachineError.insufficientFunds(let coinsNeeded){
        print("자금 부족 - 동전 \(coinsNeeded)개를 추가로 지급해주세요.")
    }catch{
        print("그 외 오류 발생 : ", error)
    }
}

let machine: VendingMachine = VendingMachine()
machine.coinsDeposited = 30

var purchase: PurchasedSnack = try PurchasedSnack(name: "Biscuit", vendingMachine: machine)

print(purchase.name)

for (person, favoriteSnack) in favoriteSnacks{
    print(person, favoriteSnack)
    try buyFavoriteSnack(person: person, vendingMachine: machine)
}


// 2. do-catch 구문을 이용하여 오류처리
let machine2: VendingMachine = VendingMachine()
machine2.coinsDeposited = 20

var purchase2: PurchasedSnack = PurchasedSnack(name: "Biscuit", vendingMachine: machine2)

print(purchase.name)

purchase2 = PurchasedSnack(name: "Ice Cream", vendingMachine: machine2)
print(purchase2.name)

for (person, favoriteSnack) in favoriteSnacks{
    print(person, favoriteSnack)
    try buyFavoriteSnack(person: person, vendingMachine: machine2)
}

// 코드가 중단되지 않고 끝까지 정상 동작한다


// 3. 옵셔널 값으로 오류처리 -> try?를 사용하여 오류 처리. 오류를 던지면 그 코드의 반환 값은 nil


func someThrowingFunction(shouldThrowError: Bool) throws -> Int{ // 반환타입이 Int지만 옵셔널로 반환된다
    if shouldThrowError{
        enum SomeError: Error{
            case justSomeError
        }
        throw SomeError.justSomeError
    }
    
    return 100
}

let w: Optional = try? someThrowingFunction(shouldThrowError: true)
print(w)

let e: Optional = try? someThrowingFunction(shouldThrowError: false)
print(e)


// 4. 오류가 발생하지 않을 것이라고 확신하는 방법

let aa: Int = try! someThrowingFunction(shouldThrowError: false)
print(aa)

//let xx: Int = try! someThrowingFunction(shouldThrowError: true)// -> 오류가 발생하지 않는다는 가정하에 암시적 추출 옵셔널을 사용했기 때문에 오류가 난다


// 5. 다시 던지기 -> 함수나 메서드는 rethrows 키워드를 사용하여 자신의 매개변수로 전달받은 함수가 오류를 던진다는 것을 나타낼 수 있다.
// 다시 던지기가 가능하게 하려면 최소 하나 이상의 오류 발생 가능한 함수를 매개변수로 전달받아야 한다.

func someThrowingFunction2() throws{
    enum SomeError: Error{
        case justSomeError
    }
    
    throw SomeError.justSomeError
}

func someFunction2(callback: () throws -> Void) rethrows{
    enum AnotherError: Error{
        case justAnotherError
    }
    
    do{
        try callback() // 매개변수로 전달한 오류 던지기 함수이므로 catch 절에서 제어할 수 있다.
    }catch{
        throw AnotherError.justAnotherError
    }
    
    do{
        try someThrowingFunction2()
    }catch{
//        throw AnotherError.justAnotherError // 매개변수로 전달한 오류 던지기 함수가 아니므로 오류
    }
    
//    throw AnotherError.justAnotherError // 매개변수로 전달한 오류 던지기 함수가 아니므로 오류

}

// 던지기 메서드를 상속받으면 다시 던지기 메서드로 상속해야한다.


// 후처리 defer -> 코드가 어떤 식으로 빠져나가든 간에 꼭 실행해야 하는 마무리 작업을 할 수 있도록 도와준다.
// 현재 코드 범위를 벗어나기 전까지 실행을 미루고 있다가 프로그램 실행 흐름이 코드 범위를 벗어나기 직전 실행
// defer 구문 내부에는 break, return 등과 같이 구문을 빠져나갈 수 있는 코드 또는 오류를 던지는 코드는 작성하면 안된다.
// 여러 개의 defer 구문이 하나의 블록 내부에 속해 있으면 맨 마지막부터 역순으로 실행

for i in 0...2{
    defer{
        print("A", terminator: " ")
    }
    
    print(i, terminator: " ")
    
    if i % 2 == 0{
        defer{
            print("", terminator: "\n")
        }
        
        print("It's even", terminator: " ")
    }
}

