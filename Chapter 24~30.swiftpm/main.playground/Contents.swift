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
