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
let sik: Student = Student(school: .university)
