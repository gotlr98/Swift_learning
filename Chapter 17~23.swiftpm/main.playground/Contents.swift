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
