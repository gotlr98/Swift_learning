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


// Chapter10 프로퍼티와 메서드

/*
 
 Property는 클래스, 구조체 또는 열거형 등에 관련된 값
 Method 는 특정 타입에 관련된 함수
 
 저장 프로퍼티 - 인스턴스의 변수 또는 상수
 연산 프로퍼티 - 값을 저장한 것이 아니라 특정 연산을 실행한 결괏값
 타입 프로퍼티 - 특정 타입에 사용되는 프로퍼티
 프로퍼티 감시자 - 프로퍼티의 값이 변하는 것을 감시
 
*/

//struct CoordinatePoint{
//    var x: Int
//    var y: Int
//}
//
//let haesikPoint: CoordinatePoint = CoordinatePoint(x: 10, y: 5)
//
//class Position{
//    var point: CoordinatePoint? // 위치를 모를 수도 있기 때문에 옵셔널 저장 프로퍼티를 이용
//
//    let name: String
//
//    init(name: String){
//        self.name = name
//    }
//}

let haesikPosition: Position = Position(name: "Haesik")
haesikPosition.point = CoordinatePoint(x: 20, y: 10)

/*

 지연 저장 프로퍼티
 
 상수는 지연 저장은 안되고 var 키워드를 사용하여 변수를 선언해야 한다.
 
*/


struct CoordinatePoint{
    var x: Int = 0
    var y: Int = 0
    
    func oppositePoint() -> Self{ // 접근자
        return CoordinatePoint(x: -x, y: -y)
    }
    
    mutating func setOppositePoint(_ opposite: CoordinatePoint){ // 설정자
        x = -opposite.x
        y = -opposite.y
    }
}

let haesikPoint: CoordinatePoint = CoordinatePoint(x: 10, y: 5)

class Position{
    lazy var point: CoordinatePoint = CoordinatePoint() // lazy 키워드를 사용하여 지연 저장 프로퍼티 선언
    
    let name: String
    
    init(name: String){
        self.name = name
    }
}

var haesikPosition2: CoordinatePoint = CoordinatePoint(x: 10, y:20)
print(haesikPosition2.oppositePoint())

haesikPosition2.setOppositePoint(CoordinatePoint(x: 15, y: 10))
print(haesikPosition2)

// 연산 프로퍼티의 정의와 사용

struct CoordinatePoint2{
    var x: Int
    var y: Int
    
    var oppositePoint: CoordinatePoint2{
        get{
            return CoordinatePoint2(x: -x, y: -y)
        }
        
        set{
            x = -newValue.x
            y = -newValue.y
        }
    }
}

var haesikPosition3: CoordinatePoint2 = CoordinatePoint2(x: 10, y: 20)

print(haesikPosition3)
print(haesikPosition3.oppositePoint)

haesikPosition3.oppositePoint = CoordinatePoint2(x: 15, y: 10)
print(haesikPosition3)


// 프로퍼티 감시자
// willSet -> 변경될 값이 전달, didSet -> 변경되기 전의 값이 전달

class Account{
    var credit: Int = 0{
        willSet{
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
        }
        didSet{
            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
        }
    }
    
    var dollarValue: Double{
        get{
            return Double(credit)
        }
        set{
            credit = Int(newValue * 1300)
            print("잔액을 \(newValue)달러로 변경 중입니다.")
        }
    }
}

class ForeignAccount: Account{
    override var dollarValue: Double{
        willSet{
            print("잔액이 \(dollarValue)달러에서 \(newValue)달러로 변경될 예정입니다.")
        }
        didSet{
            print("잔액이 \(oldValue)달러에서 \(dollarValue)달러로 변경되었습니다.")
        }
    }
}

let myAccount: Account = Account()

myAccount.credit = 1000

let myForeignAccount: ForeignAccount = ForeignAccount()
myForeignAccount.credit = 1000
myForeignAccount.dollarValue = 2

// 저장변수의 감시자와 연산변수

var wonInPocket: Int = 2000{
    willSet{
        print("주머니의 돈이 \(wonInPocket)원에서 \(newValue)원으로 변경될 예정입니다.")
    }
    didSet{
        print("주머니의 돈이 \(oldValue)원에서 \(wonInPocket)원으로 변경되었습니다.")
    }
}

var dollarInPocket: Double{
    get{
        return Double(wonInPocket)
    }
    
    set{
        wonInPocket = Int(newValue * 1000.0)
        print("주머니의 달러를 \(newValue)달러로 변경 중입니다.")
    }
}

dollarInPocket = 3.5

// 타입 프로퍼티

/*
 각각의 인스턴스가 아닌 타입 자체에 속하는 프로퍼티(c언어 static constant와 유사)
 인스턴스의 생성 여부와 상관없이 타입 프로퍼티의 값은 하나, 그 타입의 모든 인스턴스가 공통으로 사용하는 값
 모든 인스턴스에서 공용으로 접근하고 값을 변경할 수 있는 변수 등을 정의할 때 유용
*/

class AClass{
    
    // 저장 타입 프로퍼티
    static var typeProperty: Int = 0
    
    // 저장 인스턴스 프로퍼티
    var instanceProperty: Int = 0{
        didSet{
            Self.typeProperty = instanceProperty + 100
        }
    }
    
    static var typeComputedProperty: Int{
        get{
            return typeProperty
        }
        set{
            typeProperty = newValue
        }
    }
}

AClass.typeProperty = 123

let classInstance: AClass = AClass()
classInstance.instanceProperty = 100

print(AClass.typeProperty)
print(AClass.typeComputedProperty)


class Account2{
    
    static let dollarExchangeRate: Double = 1350.0 // 타입 상수
    
    var credit: Int = 0
    var dollarValue: Double{
        get{
            return Double(credit) / Self.dollarExchangeRate
        }
        set{
            credit = Int(newValue * Account2.dollarExchangeRate)
            print("잔액을 \(newValue)달러로 변경 중입니다.")
        }
    }
}

// 키 경로
/*
 WritableKeyPath<Root, Value> -> 값 타입에 키 경로 타입으로 읽고 쓸 수 있는 경우
 ReferenceWritableKeyPath<Root, Value> -> 참조 타입, 클래스 타입에 키 경로 타입으로 읽고 쓸 수 있는 경우
*/

class Person2{
    var name: String
    
    init(name: String){
        self.name = name
    }
}

struct Stuff{
    var name: String
    var owner: Person2
}

print(type(of: \Person2.name))
print(type(of: \Stuff.name))

let keyPath = \Stuff.owner
let nameKeyPath = keyPath.appending(path: \.name)

let yagom = Person2(name: "yagom")
let hana = Person2(name: "hana")
let macbook = Stuff(name: "MacBook Pro", owner: yagom)
var iMac = Stuff(name: "iMac", owner: yagom)
let iPhone = Stuff(name: "iPhone", owner: hana)

let stuffNameKeyPath = \Stuff.name
let ownerkeyPath = \Stuff.owner

let ownerNameKeyPath = ownerkeyPath.appending(path: \.name)

print(macbook[keyPath: stuffNameKeyPath])

iMac[keyPath: stuffNameKeyPath] = "iMac Pro"
print(iMac[keyPath: stuffNameKeyPath])

// Method
// 스위프트에서는 클래스, 구조체, 열서형 등 프로그래머가 정의하는 타입에서 자유롭게 메서드를 정의할 수 있다.

class LevelClass{
    var level: Int = 0{
        didSet{
            print("Level \(level)")
        }
    }
    
    func levelUp(){
        print("Level Up!")
        level += 1
    }
    
    func levelDown(){
        print("Level Down")
        level -= 1
        if level < 0{
            reset()
        }
    }
    
    func jumpLevel(to: Int){
        print("Jump to \(to)")
        level = to
    }
    
    func reset(){
        print("Reset!")
        level = 0
    }
}

var levelClassInstance: LevelClass = LevelClass()

levelClassInstance.levelUp()
levelClassInstance.levelDown()
levelClassInstance.levelDown()
levelClassInstance.jumpLevel(to: 3)

// 값 타입의 속성을 수정하려면 앞에 mutating키워드를 붙인다

struct LevelStruct{
    var level: Int = 0{
        didSet{
            print("Level \(level)")
        }
    }
    
    mutating func levelUp(){
        print("Level Up!")
        level+=1
    }
    
    mutating func levelDown(){
        print("Level Down!")
        level-=1
        if level < 0{
            reset()
        }
    }
    
    mutating func jumpLevel(to: Int){
        print("Jump to \(to)")
        level = to
    }
    
    mutating func reset(){
        print("Reset!")
        //level = 0
        self = LevelStruct()
        // 자기 자신을 치환
    }
}

var levelStructInstance: LevelStruct = LevelStruct()

levelStructInstance.levelUp()
levelStructInstance.levelDown()
levelStructInstance.levelDown()
levelStructInstance.jumpLevel(to: 3)

// Self Property

class LevelClass2{
    var level: Int = 0
    
    func jumpLevel(_ level: Int){
        print("Jump to \(level)")
        self.level = level
    }
    
    func Reset(){
        print("Reset!")
        // self = LevelClass2() -> 참조 클래스는 자기 자신 치환 불가
    }
}

enum OnOffSwitch{
    case on, off
    mutating func nextState(){
        self = self == .on ? .off : .on
    }
}

var toggle: OnOffSwitch = OnOffSwitch.off
toggle.nextState()
print(toggle)

// 타입 메서드
// 메서드 앞에 static 키워드를 사용하여 타입 메서드를 정의하면 상속 후 재정의가 불가능 하고 class로 정의하면 상속 후 메서드 재정의 가능

class AClass2{
    static func staticTypeMethod(){
        print("AClass static TypeMethod")
    }
    
    class func classTypeMethod(){
        print("ACLass classTypeMethod")
    }
}

class BClass2: AClass2{
//    override static func staticTypeMEthod(){ static키워드를 사용해서 정의되어있기 때문에 재정의 불가능
//
//    }
    
    override class func classTypeMethod() {
        print("BClass classTypeMethod")
    }
}

// 타입 프로퍼티와 타입 메서드의 사용


// 시스템 음량은 한 기기에서 유일한 값이어야 한다.

struct SystemVolume{
    // 타입 프로퍼티를 사용하면 언제나 유일한 값
    static var volume: Int = 5
    
    // 타입 프로퍼티를 제어하기 위해 static 메서드 사용
    static func mute(){
        self.volume = 0
    }
}

class Navigation{
    
    // 네비게이션 인스턴스마다 음량을 따로 설정 가능
    var volume: Int = 5
    
    func guideWay(){
        SystemVolume.mute()
    }
    
    func finishGuideWay(){
        SystemVolume.volume = self.volume
    }
}

SystemVolume.volume = 10

let myNavi: Navigation = Navigation()

myNavi.guideWay()
print(SystemVolume.volume)
print(myNavi.volume)


// Chapter11 인스턴스 생성 및 소멸

//struct Area{
//    var squareMeter: Double
//
//    init(){
//        print("init")
//        self.squareMeter = 0.0 // 프로퍼티 초기화를 꼭 해줘야 한다.
//    }
//}
//
//let room: Area = Area()
//print(room.squareMeter)

struct Area{
    var squareMeter: Double
    
    init(fromPy py: Double){
        squareMeter = py * 3.3058
    }
    
    init(fromSquareMeter squareMeter: Double){
        self.squareMeter = squareMeter
    }
    
    init(value: Double){
        squareMeter = value
    }
    
    init(_ value: Double){
        squareMeter = value
    }
}

let roomOne: Area = Area(fromPy: 15.0)
print(roomOne.squareMeter)

let roomTwo: Area = Area(fromSquareMeter: 33.06)
print(roomTwo.squareMeter)

let roomThree: Area = Area(value: 30.0)
let roomFour: Area = Area(55.0)


class Person3{
    var name: String
    var age: Int? // 옵셔널을 통해 초기값을 지정해주지 않아도 된다
    
    init(name: String){
        self.name = name
    }
}

let sik: Person3 = Person3(name: "Haesik")
print(sik.age)

// 상수 프로퍼티는 초기화할때 한번만 값을 할당할 수 있으며, 그 이후에는 값을 변경할 수 없다


// 사용자 정의 이니셜라이저를 구현하지 않는 경우 구조체는 멤버와이즈 이니셜라이저를 사용할 수 있다. 그러나 클래스는 지원하지 않는다.

struct Point2{
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Size{
    var width: Double = 0.0
    var height: Double = 0.0
}

let point: Point2 = Point2()
print(point.x)

enum Student{
    case elementary, middle, high
    case none
    
    init(){
        self = .none
    }
    
    init(koreanAge: Int){
        switch koreanAge{
        case 8...13:
            self = .elementary
        case 14...16:
            self = .middle
        case 17...19:
            self = .high
        default:
            self = .none
        }
    }
    
    init(bornAt: Int, currentYear: Int){
        self.init(koreanAge: currentYear - bornAt + 1)
    }
}

var younger: Student = Student(koreanAge: 16)

younger = Student(bornAt: 1998, currentYear: 2016)
print(younger)

// 실패 가능한 이니셜라이저
/*
 이니셜라이저의 전달인자로 잘못된 값이나 적절치 못한 값이 전달되었을 때 등 여러 이유로 인스턴스 초기화에 실패할 수 있는데
 이런 실패 가능성을 염두에 두기도 하는데, 이렇게 실패 가능성을 내포한 이니셜라이저
*/

class PersonK{
    let name: String
    var age: Int?
    
    init?(name: String){ // 이니셜라이저 init뒤에 물음표를 붙여서 실패 가능한 이니셜라이저를 구현한다.
        if name.isEmpty{
            return nil
        }
        self.name = name
    }
    
    init?(name: String, age: Int){
        if name.isEmpty || age < 0{
            return nil
        }
        self.name = name
        self.age = age
    }
}

let siksik: PersonK? = PersonK(name: "")

if let personK: PersonK = siksik{
    print(personK.name)
}else{
    print("Person wans't initialized")
}

// 열거형의 실패 가능한 이니셜라이저

enum Student2: String{
    case elementary = "초등학생", middle = "중학생", high = "고등학생"
    
    init?(koreanAge: Int){
        switch koreanAge{
        case 8...13:
            self = .elementary
        case 14...16:
            self = .middle
        case 17...19:
            self = .high
        default:
            return nil
        }
    }
    
    init?(bornAt: Int, currentYear: Int){
        self.init(koreanAge: currentYear - bornAt + 1)
    }
}

var age2: Student2? = Student2(koreanAge: 20)
print(age2)

age2 = Student2(bornAt: 2020, currentYear: 2016)
print(age2)

age2 = Student2(rawValue: "고등학생")
print(age2)

// 클로저를 통한 프로퍼티 기본값 설정

struct dummy{
    var name: String?
    var number: Int?
}
class dummyClass{
    var dummys: [dummy] = {
        var arr: [dummy] = [dummy]()
        
        for num in 1...15{
            var student: dummy = dummy(name: nil, number: num)
            arr.append(student)
        }
        
        return arr
    }()
}

// 인스턴스 소멸
// deinit 키워드 사용하여 구현, 클래스의 인스턴스에만 구현할 수 있다.

class FileManager{
    var fileName: String
    
    init(fileName: String){
        self.fileName = fileName
    }
    
    func openFile(){
        print("Open File: \(self.fileName)")
    }
    
    deinit{
        print("Deinit instance")
    }
}

var fileManager: FileManager? = FileManager(fileName: "abc.txt")

if let manager: FileManager = fileManager{
    manager.openFile()
}

fileManager = nil


// Chapter12 접근제어
