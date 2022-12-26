import UIKit

var greeting = "Hello, playground"

// 함수


func hello(name: String) -> String{
    return "Hello \(name)!"
}

let helloJenny: String = hello(name: "Jenny")
print(helloJenny)

func introduce(name: String) -> String{
    "제 이름은" + name + "입니다" // return은 반환 타입만 일치하면 생략 가능
}

let introduceJenny: String = introduce(name: "Jenny")
print(introduceJenny)



// 매개변수 이름과 전달인자 레이블

func sayHello(from myName:String, to name:String) -> String{
    return "Hello \(name)! I'm \(myName)"
}

print(sayHello(from: "Haesik", to: "Son"))


func sayHello(_ name: String, _ times: Int) -> String{
    var result: String = ""
    
    for _ in 0..<times{
        result += "Hello \(name)!" + " "
    }
    
    return result
}

print(sayHello("Chope", 2))

func sayHello(_ name: String, times: Int = 3) -> String{
    var result: String = ""
    
    for _ in 0..<times{
        result += "Hello \(name)!" + " "
    }
    return result
}

print(sayHello("Hana"))

// 가변 매개변수와 입출력 매개변수

func sayHelloToFriends(me: String, friends names: String...) -> String { // 가변 매개변수는 0개이상 가능하다
    var result: String = ""
    
    for friend in names {
        result += "Hello \(friend)!" + " "
    }
    
    result += "I'm " + me + "!"
    return result
}

print(sayHelloToFriends(me: "Haesik", friends: "Taehyi", "Yongjin", "Yoorim"))
print(sayHelloToFriends(me: "Haesik"))

// 반환이 없는 함수

func sayHelloWorld() -> Void { // void는 생략가능
    print("Hello, world")
}

// 함수 타입의 사용

typealias CalculateTwoInts = (Int, Int) -> Int

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int{
    return a * b
}

var mathFunction: CalculateTwoInts = addTwoInts // == var mathFunction: (Int, Int) -> Int = addTwoInts

print(mathFunction(2,5))

mathFunction = multiplyTwoInts
print(mathFunction(2,5))


func printMathResult(_ mathFunction: CalculateTwoInts, _ a: Int, _ b:Int){
    print("Result: \(mathFunction(a,b))")
}

printMathResult(addTwoInts, 3, 5)

func chooseMathFunction(_ toAdd: Bool) -> CalculateTwoInts {
    return toAdd ? addTwoInts : multiplyTwoInts
}

printMathResult(chooseMathFunction(true), 3, 5)


// 중첩 함수

//typealias MoveFunc = (Int) -> Int
//
//func goRight(_ currentPosition: Int) -> Int{
//    return currentPosition + 1
//}
//
//func goLeft(_ currentPosition: Int) -> Int{
//    return currentPosition - 1
//}
//
//func functionForMove(_ shouldGoLeft: Bool) -> MoveFunc{
//    return shouldGoLeft ? goLeft : goRight
//}
//
//var position: Int = 3
//
//let moveToZero: MoveFunc = functionForMove(position > 0)
//print("Let's Go to zero point")
//
//while position != 0{
//    print("\(position)...")
//    position = moveToZero(position)
//}
//
//print("Here is zero point")

// 위의 함수를 중첩 함수로 구현하기

typealias MoveFunc = (Int) -> Int

func functionForMove(_ shouldGoLeft: Bool) -> MoveFunc{
    
    func goRight(_ currentPosition: Int) -> Int{
        return currentPosition + 1
    }
    
    func goLeft(_ currentPosition: Int) -> Int{
        return currentPosition - 1
    }
    
    return shouldGoLeft ? goLeft : goRight
}

var position: Int = -4

let moveToZero: MoveFunc = functionForMove(position > 0)

while position != 0{
    print("\(position)...")
    position = moveToZero(position)
}

print("Here is zero point")

// 종료되지 않는 함수

func crashAndBurn() -> Never{
    fatalError("Something very, very bad happend")
}

//crashAndBurn()

func someFunction(isAllIsWell: Bool){
    guard isAllIsWell else{
        print("마을에 도둑이 들었습니다!")
        crashAndBurn()
    }
    print("All is well")
}


// 반환 값을 무시할 수 있는 함수

func say(_ something: String) -> String{
    print(something)
    return something
}

@discardableResult func discadableResultSay(_ something: String) -> String{
    print(something)
    return something
}

discadableResultSay("Hello")

// 옵셔널 -> 안전성을 문법으로 담보하는 기능
// 옵셔널 변수 or 상수에만 nil을 할당할 수 있다.

var myName: String? = "yagom" // 데이터 타입 뒤에 '?'를 붙여주면 옵셔널 변수


// switch를 통한 옵셔널 값의 확인

func checkOptionalValue(value optionalValue: Any?){
    switch optionalValue{
    case .none:
        print("This Optional variable is nil")
    case .some(let value):
        print("Value is \(value)")
    }
}

checkOptionalValue(value: myName)
myName = nil
checkOptionalValue(value: myName)

let numbers: [Int?] = [2, nil, -4, nil, 100]

for number in numbers{
    switch number{
    case .some(let value) where value < 0:
        print("Negative value!! \(value)")
    case .some(let value) where value > 10:
        print("Large value!! \(value)")
    case .some(let value):
        print("Value \(value)")
        
    case .none:
        print("nil")
    }
}


// 옵셔널 추출
// 옵셔널 강제 추출 -> 옵셔널 값의 뒤에 느낌표 붙이기


//var haesik: String = myName2!
//
//myName2 = nil
//haesik = myName2!
//
//if myName2 != nil{
//    print("My name is \(myName2!)")
//}
//else{
//    print("myName == nil")
//}

// 옵셔널 바인딩

var myName2: String? = "Haesik"

if let name = myName2{
    print("My name is \(name)")
}
else{
    print("myName == nil")
}

if var name = myName2{
    name = "haesik"
    print("My name is \(name)")
}
else{
    print("myName == nil")
}

// 옵셔널 바인딩을 사용한 여러 개의 옵셔널 값 추출

var myName3: String? = "haesik"
var yourName: String? = nil

// yourName이 nil이기 때문에 실행안됨
if let name = myName3, let friend = yourName{
    print("We are friend! \(name) & \(friend)")
}

yourName = "eric"

if let name = myName3, let friend = yourName{
    print("We are friend! \(name) & \(friend)")
}

// 암시적 추출 옵셔널 -> 타입 뒤에 느낌표 사용

var myName4 : String! = "haesik"
myName4 = nil

if let name = myName4{
    print("My name is \(name)")
}
else{
    print("myName == nil")
}

//myName.isEmpty



