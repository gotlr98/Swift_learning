import UIKit

var greeting = "Hello, playground"


// Chapter 17 Subscript


struct Student{
    var name: String
    var number: Int
}

class School{
    var number: Int = 0
    var students: [Student] = [Student]()
    
    func addStudent(name: String){
        let student: Student = Student(name: name, number: self.number)
        self.students.append(student)
        self.number += 1
    }
    
    func addStudents(names: String...){
        for name in names{
            self.addStudent(name: name)
        }
    }
    
    subscript(index: Int) -> Student?{
        if index < self.number{
            return self.students[index]
        }
        return nil
    }
}

//let highSchool: School = School()
//highSchool.addStudents(names: "Mijeong", "JuHyun", "JiYoung", "SeongUk", "MoonDuk")
//
//let aStudent: Student? = highSchool[1]
//print("\(aStudent?.number) \(aStudent?.name)")

// 위를 복수개의 서브스크립트 구현 해보기


struct Student2{
    var name: String
    var number: Int
}

class School2{
    var number: Int = 0
    var students: [Student2] = [Student2]()
    
    func addStudent(name: String){
        let student: Student2 = Student2(name: name, number: self.number)
        self.students.append(student)
        self.number += 1
    }
    
    func addStudents(names: String...){
        for name in names{
            self.addStudent(name: name)
        }
    }
    
    subscript(index: Int) -> Student2?{
        get{
            if index < self.number{
                return self.students[index]
            }
            return nil
        }
        set{
            guard var newStudent: Student2 = newValue else{
                return
            }
            
            var number: Int = index
            
            if index > self.number{
                number = self.number
                self.number += 1
            }
            
            newStudent.number = number
            self.students[number] = newStudent
        }
    }
    
    subscript(name: String) -> Int?{
        get{
            return self.students.filter{$0.name == name}.first?.number
        }
        
        set{
            guard var number: Int = newValue else{
                return
            }
            
            if number > self.number{
                number = self.number
                self.number += 1
            }
            
            let newStudent: Student2 = Student2(name: name, number: number)
            self.students[number] = newStudent
        }
    }
    
    subscript(name: String, number: Int) -> Student2?{
        return self.students.filter{$0.name == name && $0.number == number}.first
    }
}

let highSchool: School2 = School2()
highSchool.addStudents(names: "MiJeong", "JuHyun", "JiYoung", "SeongUk", "MoonDuk")

let aStudent: Student2? = highSchool[1]
print("\(aStudent?.number) \(aStudent?.name)")

print(highSchool["MiJeong"])
print(highSchool["DongJin"])

highSchool[0] = Student2(name: "HongEui", number: 0)
highSchool["MangGu"] = 1

print(highSchool[1])


// 타입 서브스크립트 -> 인스턴스가 아니라 타입 자체에서 사용할 수 있는 서브스크립트

enum School3: Int{
    case elementary = 1, middle, high, university
    
    static subscript(level: Int) -> School3?{
        return Self(rawValue: level) // == School3(rawValue: level)
    }
}

let school2: School3? = School3[2]
print(school2)


// Chapter 18 상속

/*
 다른 클래스로부터 상속을 받지 않은 클래스를 기반클래스
*/

class Person{
    var name: String = ""
    var age: Int = 0
    
    var introduction: String{
        return "이름 : \(name), 나이 : \(age)"
    }
    
    func speak(){
        print("가나다라마바사")
    }
    
    class func introduceClass() -> String{
        return "인류의 소원은 평화입니다."
    }
}

let haesik: Person = Person()
haesik.name = "haesik"
haesik.age = 26
print(haesik.introduction)
haesik.speak()

class inStudent: Person{
    var grade: String = "F"
    
    func study(){
        print("Study hard...")
    }
    
    override func speak(){
        print("저는 학생입니다.")
    }
}

let jay: inStudent = inStudent()
jay.name = "jay"
jay.age = 10
jay.grade = "A"
print(jay.introduction)


// 재정의

class UniversityStudent: inStudent{
    var major: String = ""
    
    class func introduceClass(){
        print(super.introduceClass())
    }
    
    override class func introduceClass() -> String {
        return "대학생의 소원은 A+입니다."
    }
    
    override func speak(){
        super.speak()
        print("대학생이죠.")
    }
}

let jenny: UniversityStudent = UniversityStudent()
jenny.speak()

print(UniversityStudent.introduceClass() as String)


// 프로퍼티 재정의
/*
 프로퍼티를 재정의한다는 것은 프로퍼티 자체가 아니라 프로퍼티의 접근자, 설정자, 프로퍼티 감시자등을 재정의하는 것을 의미
 조상클래스에서 읽기 전용 프로퍼티였더라도 자식클래스에서 읽고 쓰기가 가능한 프로퍼티로 재정의 가능, 그러나 읽기 쓰기 모두 가능했던 프로퍼티를 읽기 전용으로 재정의는 불가능
*/

// 프로퍼티 감시자 재정의 -> 상수 프로퍼티는 재정의 불가 && 프로퍼티 감시자를 재정의해도 조상클래스에 정의한 프로퍼티 감시자도 동작
// 서브스크립트 재정의

class Person2{
    var students: [abStudent] = [abStudent]()
    var name: String = ""
    var age: Int = 0{
        didSet{
            print("person age : \(self.age)")
        }
    }
    var koreanAge: Int{
        return self.age + 1
    }
    
    var fullName: String{
        get{
            return self.name
        }
        set{
            self.name = newValue
        }
    }
    
    subscript(number: Int) -> abStudent{
        print("School subscript")
        return students[number]
    }
    
    var introduction: String{
        return "이름: \(name), 나이 : \(age)"
    }
}

class abStudent: Person2{
    var grade: String = "F"
    
    override var age: Int{
        didSet{
            print("Student age : \(self.age)")
        }
    }
    
    override var introduction: String{
        return super.introduction + " " + "학점 : \(self.grade)"
    }
    
    override var koreanAge: Int{
        get{
            return super.koreanAge
        }
        
        set{
            self.age = newValue - 1
        }
    }
    
    override var fullName: String{
        didSet{
            print("Full Name : \(self.fullName)")
        }
    }
}

let taehyi: abStudent = abStudent()
taehyi.age = 14
taehyi.koreanAge = 15
taehyi.fullName = "Lee taehyi"


// 재정의 방지 -> 방지하고 싶은 특성 앞에 final 키워드 명시


// 클래스의 이니셜라이저 - 상속과 재정의
// 지정 이니셜라이저와 편의 이니셜라이저
/*
 지정 이니셜라이저 -> 필요에 따라 부모클래스의 이니셜라이저를 호출할 수 있으며, 이니셜라이저가 정의된 클래스의 모든 프로퍼티를 초기화
 모든 클래스는 하나 이상의 지정 이니셜라이저를 갖는다. 만약 조상클래스에서 지정 이니셜라이저가 자손클래스의 지정 이니셜라이저 역할을 충분히 한다면 자손클래스는 지정 이니셜라이저가 없어도 된다
 
 편의 이니셜라이저 -> 초기화를 좀 더 쉽게 도와주는 역할 -> convenience init()
 
 클래스 초기화의 세 가지 규칙
 1. 자식클래스의 지정 이니셜라이저는 부모클래스의 지정 이니셜라이저를 반드시 호출
 2. 편의 이니셜라이저는 자신을 정의한 클래스의 다른 이니셜라이저를 반드시 호출
 3. 편의 이니셜라이저는 궁극적으로는 지정 이니셜라이저를 반드시 호출
 
 */

// 이니셜라이저 상속 및 재정의
/*
 기본적으로 스위프트의 이니셜라이저는 부모클래스의 이니셜라이저를 상속받지 않는다.
 부모클래스의 이니셜라이저와 똑같은 이니셜라이저를 자식클래스에서 사용하고 싶다면 override를 통해 재정의하면 된다.
 반대로 부모클래스의 편의 이니셜라이저와 동일한 이니셜라이저를 자식클래스에 구현할 때는 override 수식어를 붙이지 않습니다. 자식클래스에서 부모클래스의 편의 이니셜라이저는 절대로 호출할 수 없기 때문
*/

class Person8 {
    var name: String
    var age: Int
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    
    convenience init(name: String) {
        self.init(name: name, age: 0)
    }
}

class Student8: Person8{
    var major: String
    
    override init(name: String, age: Int){
        self.major = "Swift"
        super.init(name: name, age: age)
    }
    
    convenience init(name: String) {
        self.init(name: name, age: 7)
    }
}

// 이니셜라이저 자동 상속
/*
 자식클래스에서 프로퍼티 기본값을 모두 제공한다고 가정할 때, 다음 두 가지 규칙에 따라 이니셜라이저가 자동으로 상속
 1. 자식클래스에서 별도의 지정 이니셜라이저를 구현하지 않는다면, 부모클래스의 지정 이니셜라이저가 자동으로 상속
 2. 규칙1에 따라 자식클래스에서 부모클래스의 지정 이니셜라이저를 자동으로 상속받은 경우 또는 부모클래스의 지정 이니셜라이저를 모두 재정의하여 부모클래스와 동일한 지정 이니셜라이저를
    모두 사용할 수 있는 상황이라면 부모클래스의 편의 이니셜라이저가 모두 자동으로 상속
 */

// 요구 이니셜라이저 -> required 수식어를 클래스 이니셜라이저 앞에 명시해주면 이 클래스를 상속받은 자식클래스에서 반드시 해당 이니셜라이저 구현
// 다만 자식클래스에서 요구 이니셜라이저를 재정의할 때는 override 수식어 대신에 required 수식어 사용
// 이니셜라이저 자동 상속의 규칙에 부합하지 않는 한, 요구 이니셜라이저는 반드시 구현해주어야 한다.

class Ps{
    var name: String
    
    init() {
        self.name = "Unknown"
    }
}

class Sd: Ps{
    var major: String = "Unknown"
    
    init(major: String){
        self.major = major
        super.init()
    }
    
    // 부모클래스의 이니셜라이저를 재정의함과 동시에 요구 이니셜라이저로 변경
    required override init() {
        super.init()
    }
}

class Us: Sd{
    var grade: String
    
    init(grade: String) {
        self.grade = grade
        super.init()
    }
    
    required init(){
        self.grade = "F"
        super.init()
    }
}

let jiSoo: Sd = Sd()
print(jiSoo.major)

let yagom: Sd = Sd(major: "Swift")
print(yagom.major)

let juHyun: Us = Us(grade:"A+")
print(juHyun.grade)


// Chapter 19 타입캐스팅
// Swift의 타입캐스팅은 인스턴스의 타입을 확인하거나 자신을 다른 타입의 인스턴스인양 행세할 수 있는 방법으로 사용

class Coffee{
    let name: String
    let shot: Int
    
    var description: String{
        return "\(shot) shot(s) \(name)"
    }
    
    init(shot: Int){
        self.shot = shot
        self.name = "coffee"
    }
}

class Latte: Coffee{
    var flavor: String
    
    override var description: String{
        return "\(shot) shot(s) \(flavor) latte"
    }
    
    init(flavor: String, shot: Int){
        self.flavor = flavor
        super.init(shot: shot)
    }
}

class Americano: Coffee{
    var iced: Bool
    
    override var description: String{
        return "\(shot) shot(s) \(iced ? "iced" : "hot") americano"
    }
    
    init(shot: Int, iced: Bool){
        self.iced = iced
        super.init(shot: shot)
    }
}

// is 연산자는 인스턴스가 해당 클래스의 인스턴스거나 그 자식클래스의 인스턴스라면 true를 반환, 그렇지 않다면 false를 반환

let coffee: Coffee = Coffee(shot: 1)
print(coffee.description)

let myCoffee: Americano = Americano(shot: 2, iced: false)
print(myCoffee.description)

let yourCoffee: Latte = Latte(flavor: "green tea", shot: 3)
print(yourCoffee.description)

print(coffee is Coffee)
print(coffee is Americano)
print(coffee is Latte)

print(myCoffee is Coffee)
print(yourCoffee is Coffee)

print(myCoffee is Latte)
print(yourCoffee is Latte)


protocol someProtocol {}
class SomeClass: someProtocol{}

let intType: Int.Type = Int.self
let classType: SomeClass.Type = SomeClass.self

var someType: Any.Type

someType = intType
print(someType)

print(type(of: coffee) == Coffee.self)


// 다운캐스팅
/*
 
 타입캐스트 연산자에는 as?, as! 두 가지가 있다. as? 연산자는 다운캐스팅이 실패했을 경우 nil을 반환하고 다운캐스팅을 강제하는 as! 연산자는 실패할 경우 런타임 오류가 발생.
 as? 연산자의 반환 타입은 옵셔널이며, as! 연산자의 반환 타입은 옵셔널이 아니다.
 */

// actingConstant 상수는 Coffee 인스턴스를 참조하도록 선언했지만, 실제로는 Coffee 타입인 척 하는 Latte 타입의 인스턴스를 참조하고 있다.
// Latte 타입에 정의되어 있는 메서드를 사용하거나 프로퍼티에 접근해야 할 때 Latte 타입으로 변수의 타입을 변환해주어야 한다.

let actingConstant: Coffee = Latte(flavor: "vanilla", shot: 2)
print(actingConstant.description)

if let actingOne: Americano = coffee as? Americano{ // 만약 coffee가 참조하는 인스턴스가 Americano 타입의 인스턴스라면 actingOne이라는 상수에 할당하라
    print("This is Americano")
}else{
    print(coffee.description)
}


// Any, AnyObject의 타입캐스팅 -> Any는 함수 타입을 포함한 모든 타입, AnyObject는 클래스 타입만

func checkType(of item: AnyObject){
    if item is Latte{
        print("item is Latte")
    }else if item is Americano{
        print("item is Americano")
    }else if item is Coffee{
        print("item is Coffee")
    }else{
        print("Unknown Type")
    }
}

checkType(of: coffee)

func checkAnyType(of item: Any){
    switch item{
    case 0 as Int:
        print("zero as an Int")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case let (x,y) as (Double,Double):
        print("an (x, y) point at \(x), \(y)")
    case let stringConverter as (String) -> String:
        print(stringConverter("haesik"))
    default:
        print("something else: \(type(of: item))")
    }
}

checkAnyType(of: {(name: String) -> String in "Hello, \(name)"})


// Chapter 20 프로토콜
/*
 프로토콜은 특정 역할을 하기 위한 메서드, 프로퍼티, 기타 요구사항 등의 청사진. 프로토콜은 정의를 하고 제시를 할 뿐이지 스스로 기능을 구현하지는 않는다.
 구조체, 클래스, 열거형 등에서 프로토콜을 채택하려면 타입 이름 뒤에 콜론을 붙여준 후 채택할 프로토콜 이름을 쉼표로 구분하여 명시
 프로토콜은 타입이 특정 기능을 실행하기 위해 필요한 기능을 요구한다.
 
 1. 프로퍼티 요구
 프로토콜은 자신을 채택한 타입이 어떤 프로퍼티를 구현해야 하는지 요구할 수 있다 -> 종류는 중요하지 않고 프로토콜이 요구하는 프로퍼티 이름과 타입만 맞도록 구현하면 된다.
 다만 프로퍼티를 읽기 전용으로 할지 읽고 쓰기가 모두 가능하게 할지는 프로토콜이 정한다.
 프로퍼티 요구사항은 항상 var 키워드 사용. 읽기 쓰기 모두 가능한 프로퍼티는  {get set}, 읽기 전용은 {get}
 
*/

//protocol Sendable{
//    var from: String{get}
//    var to: String{get}
//}
//
//class Message: Sendable{
//    var sender: String
//    var from: String{
//        return self.sender
//    }
//
//    var to: String
//
//    init(sender: String, receiver: String){
//        self.sender = sender
//        self.to = receiver
//    }
//}

protocol Receiveable{
    func received(data: Any, from: Sendable)
}

protocol Sendable{
    var from: Sendable {get}
    var to: Receiveable? {get}
    
    func send(data: Any)
    
    static func isSendableInstance(_ instance: Any) -> Bool
}

class Message: Sendable, Receiveable{
    var from: Sendable{
        return self
    }
    
    var to: Receiveable?
    
    func send(data: Any){
        guard let receiver: Receiveable = self.to else{
            print("Message has no receiver")
            return
        }
        
        receiver.received(data: data, from: self.from)
    }
    
    func received(data: Any, from: Sendable){
        print("Message received \(data) from \(from)")
    }
    
    class func isSendableInstance(_ instance: Any) -> Bool{
        if let sendableInstance: Sendable = instance as? Sendable{
            return sendableInstance.to != nil
        }
        return false
    }
}

class Mail: Sendable, Receiveable{
    var from: Sendable{
        return self
    }
    
    var to: Receiveable?
    
    func send(data: Any){
        guard let receiver: Receiveable = self.to else{
            print("Mail has no receiver")
            return
        }
        receiver.received(data: data, from: self.from)
    }
    
    func received(data: Any, from: Sendable){
        print("Mail received \(data) from \(from)")
    }
    
    static func isSendableInstance(_ instance: Any) -> Bool{
        if let sendableInstance: Sendable = instance as? Sendable{
            return sendableInstance.to != nil
        }
        return false
    }
}

let myPhoneMessage: Message = Message()
let yourPhoneMessage: Message = Message()

myPhoneMessage.send(data: "Hello")

myPhoneMessage.to = yourPhoneMessage
myPhoneMessage.send(data: "Hello")


// 가변 메서드 요구
// 프로토콜에 mutating 키워드를 사용한 메서드 요구가 있다고 하더라고 클래스 구현에서는 mutating 키워드를 써주지 않아도 된다.

protocol Resettable{
    mutating func reset()
}

class rsPerson: Resettable{
    var name: String?
    var age: Int?
    
    func reset(){
        self.name = nil
        self.age = nil
    }
}


// 이니셜라이저 요구

protocol Named{
    var name: String{get}
    
    init(name: String)
}

struct Pet: Named{
    var name: String
    
    init(name: String){
        self.name = name
    }
}

// 클래스 타입에서 프로토콜의 이니셜라이저 요구에 부합하는 이니셜라이저를 구현할 때는 required 식별자를 붙인 요구 이니셜라이저로 구현해야 한다.
// 이는 nPerson 클래스를 상속받는 모든 클래스는 Named 프로토콜을 준수해야 하며, 이는 곧 상속받는 클래스에 해당 이니셜라이저를 모두 구현해야 한다는 뜻.
// 만약 클래스 자체가 상속받을 수 없는 final 클래스라면 required 식별자를 붙여줄 필요가 없다.

class nPerson: Named{
    var name: String
    
    required init(name: String){
        self.name = name
    }
}

// 만약 틀정 클래스에 프로토콜이 요구하는 이니셜라이저가 이미 구현되어 있는 상황에서 그 클래스를 상속받은 클래스가 있다면, required와 override 식별자를 모두 명시하여야 한다.

class sSchool{
    var name: String
    
    init(name: String){ // Named 프로토콜의 이니셜라이저를 구현해놓았다
        self.name = name
    }
}

class MiddleSchool: sSchool, Named{
    required override init(name: String){
        super.init(name: name)
    }
}

// 프로토콜의 상속

protocol Readable{
    func read()
}

protocol Writeable{
    func write()
}

protocol ReadSpeakable: Readable{
    func speak()
}

protocol ReadWriteSpeakable: Readable, Writeable{
    func speak()
}

class SomeClass2: ReadWriteSpeakable{
    func read(){
        print("Read")
    }
    
    func write(){
        print("Write")
    }
    
    func speak(){
        print("Speak")
    }
}


// 프로토콜 조합과 프로토콜 준수 확인

protocol Named2{
    var name: String{get}
}

protocol Aged2{
    var age: Int{get}
}

struct naPerson: Named2, Aged2{
    var name: String
    var age: Int
}

class Car: Named2{
    var name: String
    
    init(name: String){
        self.name = name
    }
}

class Truck: Car, Aged2{
    var age: Int
    
    init(name: String, age: Int){
        self.age = age
        super.init(name: name)
    }
}

func celebrateBirthday(to celebrator: Named2 & Aged2){
    print("Happy birthday \(celebrator.name) !! Now you are \(celebrator.age)")
}

let siksik: naPerson = naPerson(name: "haesik", age: 26)
celebrateBirthday(to: siksik)



print(siksik is Named2)
print(siksik is Aged2)

if let castedInstance: Named2 = siksik as? Named2{
    print("\(castedInstance) is Named2")
}


// 프로토콜의 선택적 요구
// 프로토콜의 요구사항 중 일부를 선택적 요구사항으로 지정할 수 있다. 석택적 요구사항을 정의하고 싶은 프로토콜은 objc 속성이 부여된 프로토콜(Objective-C코드)

import Foundation

@objc protocol Moveable{
    func walk()
    @objc optional func fly()
}

class Tiger: NSObject, Moveable{
    func walk(){
        print("Tiger walks")
    }
}

class Bird: NSObject, Moveable{
    func walk(){
        print("Bird walks")
    }
    
    func fly(){
        print("Bird flys")
    }
}

// 위임을 위한 프로토콜
/*
 위임은 클래스나 구조체가 자신의 책임이나 임무를 다른 타입의 인스턴스에게 위임하는 디자인 패턴
 위임 패턴은 애플의 프레임워크에서 사용하는 주요한 패턴 중 하나. 예를 들어 UITableView타입의 인스턴스가 해야 하는 일을 위임받아 처리하는 인스턴스는 UITableViewDelegate 프로토콜을 준수
 어떤 인스턴스 + Delegate로 명명
 */


// Chapter 21 Extension
/*
 익스텐션은 스위프트의 강력한 기능 중 하나로 구조체, 클래스, 열거형, 프로토콜 타입에 새로운 기능을 추가할 수 있다.
 익스텐션은 타입에 새로운 기능을 추가할 수는 있지만, 기존에 존재하는 기능을 재정의할 수는 없다.
 */

extension Int{
    var isEven: Bool{
        return self % 2 == 0
    }
    
    var isOdd: Bool{
        return self % 2 == 1
    }
}

print(1.isEven)

var number: Int = 3
print(number.isOdd)

extension Int{
    func multiply(by n: Int) -> Int{
        return self * n
    }
    
    mutating func multiplySelf(by n: Int){
        self = self.multiply(by: n)
    }
    
    static func isIntTypeInstance(_ instance: Any) -> Bool{
        return instance is Int
    }
}

print(3.multiply(by:2))
print(number.multiplySelf(by: 3))

prefix operator ++

struct Position{
    var x: Int
    var y: Int
}

extension Position{
    static func + (left: Position, right: Position) -> Position{
        return Position(x: left.x + right.x, y: left.y + right.y)
    }
    
    static prefix func - (vector: Position) -> Position{
        return Position(x: -vector.x, y: -vector.y)
    }
    
    static func += (left: inout Position, right: Position){
        left = left + right
    }
    
    static func == (left: Position, right: Position) -> Bool{
        return (left.x == right.y) && (left.y == right.y)
    }
    
}

var myPosition: Position = Position(x: 3, y: 2)
var yourPosition: Position = Position(x: 2, y: 1)

myPosition == yourPosition

//print(-myPosition)


// 이니셜라이저 -> 익스텐션으로 편의 이니셜라이저는 추가할 수 있지만, 지정 이니셜라이저는 추가할 수 없다.

extension String{
    init(intTypeNumber: Int){
        self = "\(intTypeNumber)"
    }
    
    init(doubleTypeNumber: Double){
        self = "\(doubleTypeNumber)"
    }
}

let stringFromInt: String = String(intTypeNumber: 100)

class kkPerson{
    var name: String
    
    init(name: String){
        self.name = name
    }
}

extension kkPerson{
    convenience init(){
        self.init(name: "unknown")
    }
}

let someOne: kkPerson = kkPerson()
print(someOne.name)


// 서브스크립트

extension String{
    subscript(appedValue: String) -> String{
        return self + appedValue
    }
    
    subscript(repeatCount: UInt) -> String{
        var str: String = ""
        
        for _ in 0..<repeatCount{
            str += self
        }
        
        return str
    }
}

print("abd"["def"])
print("abc"[3])

extension Int{
    enum Kind{
        case negative, zero, positive
    }
    
    var kind: Kind{
        switch self{
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

func printIntegerKinds(numbers: [Int]){
    for number in numbers{
        switch number.kind{
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}

printIntegerKinds(numbers: [3,19,-27,0,-6,0,7])


// Chatper 22 제네릭
/*
 제네릭으로 구현한 기능과 타입은 재사용하기도 쉽고, 코드의 중복을 줄일 수 있기에 깔끔하고 추상적인 표현 가능
 
 제네릭을 사용하고자 하는 타입 이름 <타입 매개변수>
 제네릭을 사용하고자 하는 함수 이름 <타입 매개변수> (함수의 매개변수...)
 */

prefix operator **

prefix func ** <T: BinaryInteger> (value: T) -> T{ // T다음에 오는 BinaryInteger는 타입 제약이다
    return value * value
}

let minusFive: Int = -5
let five: UInt = 5

let sqrtMinusFive: Int = **minusFive
let sqrtFive: UInt = **five

print(sqrtMinusFive)
print(sqrtFive)


func swapTwoInts(_ a: inout Int, _ b: inout Int){
    let temporaryA: Int = a
    a = b
    b = temporaryA
}

var numberOne: Int = 5
var numberTwo : Int = 10

swapTwoInts(&numberOne, &numberTwo)
print(numberOne, numberTwo)


// 위의 함수를 제네릭으로 구현

func swapTwoValues<T> (_ a: inout T, _ b: inout T){
    let temporaryA: T = a
    a = b
    b = temporaryA
}

swapTwoValues(&numberOne, &numberTwo)

var stringOne: String = "One"
var stringTwo: String = "Two"

swapTwoValues(&stringOne, &stringTwo)

print(stringOne, stringTwo)


// 제네릭 타입

struct Stack<Element>{
    var items = [Element]()
    
    mutating func push(_ item: Element){
        items.append(item)
    }
    
    mutating func pop() -> Element{
        items.removeLast()
    }
}

//var doubleStack: Stack<Double> = Stack<Double>()
//
//doubleStack.push(1.0)
//print(doubleStack.items)
//
//doubleStack.pop()
//print(doubleStack.items)


//var anyStack: Stack<Any> = Stack<Any>()
//
//anyStack.push("eoeo")
//anyStack.push(1)
//print(anyStack.items)


// 제네릭 타입 확장 -> 익스텐션 정의에 타입 매개변수를 명시하지 않는다. 대신 원래의 제네릭 정의에 명시한 타입 매개변수 사용

//extension Stack{
//    var topElement: Element?{
//        return self.items.last
//    }
//}

print(anyStack.topElement)


// 프로토콜의 연관타입
/*
 연관 타입은 프로토콜에서 사용할 수 있는 플레이스홀더 이름이다. 제네릭에서는 어떤 타입이 들어올지 모를 때, 타입 매개변수를 통해 종류는 알 수 없지만, 어떤 타입이 여기에 쓰일것이다
 라고 표현해주었다면 연관 타입은 타입 매개변수의 그 역할을 프로토콜에서 수행할 수 있도록 만들어진 기능
 */

protocol Container{
    associatedtype ItemType
    var count: Int {get}
    mutating func append(_ item: ItemType)
    subscript(i: Int) -> ItemType {get}
}


class MyContainer: Container{
    var items: Array<Int> = Array<Int>()
    
    var count: Int{
        return items.count
    }
    
    func append(_ item: Int){
        items.append(item)
    }
    
    subscript(i: Int) -> Int{
        return items[i]
    }
}

struct IntStack: Container{
    
    typealias ItemType = Int
    
    var items = [ItemType]()
    mutating func push(_ item: ItemType){
        items.append(item)
    }
    
    mutating func pop() -> ItemType{
        return items.removeLast()
    }
    
    mutating func append(_ item: ItemType){
        self.push(item)
    }
    
    var count: ItemType{
        return items.count
    }
    
    subscript(i: ItemType) -> ItemType{
        return items[i]
    }
}

struct Stack<Element>:Container{
    var items = [Element]()
    
    mutating func push(_ item: Element){
        items.append(item)
    }
    
    mutating func pop() -> Element{
        return items.removeFirst()
    }
    
    mutating func append(_ item: Element){
        self.push(item)
    }
    var count: Int{
        return items.count
    }
    
    subscript(i: Int) -> Element{
        return items[i]
    }
}


// 제네릭 서브스크립트

extension Stack{
    subscript<Indices: Sequence>(indices: Indices) -> [ItemType]
    where Indices.Iterator.Element == Int{
        var result = [ItemType]()
        for index in indices{
            result.append(self[index])
        }
        return result
    }
}

var integerStack: Stack<Int> = Stack<Int>()

integerStack.append(1)
integerStack.append(2)
integerStack.append(3)
integerStack.append(4)
integerStack.append(5)

print(integerStack[0...2])



// Chapter 23 프로토콜 지향 프로그래밍
/*
 익스텐션은 기존 타입의 기능을 확장하며, 프로토콜은 프로토콜을 채택한 타입이 원하는 기능을 강제로 구현한다.
 그런데 특정 프로토콜을 정의하고 여러 타입에서 이 프로토콜을 준수하게 만들어 타입마다 똑같은 메서드, 프로퍼티, 서브스크립트 등을 구현해야 한다면
 코드가 중복되고 유지보수가 힘들 것이다. -> 익스텐션과 프로토콜의 결합으로 해결
 */

protocol Receiveable{
    func received(data: Any, from: Sendable)
}
extension Receiveable{
    func received(data: Any, from: Sendable){
        print("\(self) received \(data) from \(from)")
    }
}

protocol Sendable2{
    var from: Sendable2{get}
    var to: Receiveable?{get}
    
    func send(data: Any)
    
    static func isSendableInstance(_ instance: Any) -> Bool
}

extension Sendable2{
    var from: Sendable2{
        return self
    }
    
    func send(data: Any){
        guard let receiver: Receiveable = self.to else{
            print("Message has no receiver")
            return
        }
        
        receiver.received(data: data, from: self.from)
    }
    
    static func isSendableInstance(_ instance: Any ) -> Bool{
        if let sendableInstance: Sendable2 = instance as? Sendable2{
            return sendableInstance.to != nil
        }
        
        return false
    }
}

class Message: Sendable2, Receivable
