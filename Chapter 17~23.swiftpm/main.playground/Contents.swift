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
 
 편의 이니셜라이저 -> 초기화를 좀 더 쉽게 도와주는 역할
 */

