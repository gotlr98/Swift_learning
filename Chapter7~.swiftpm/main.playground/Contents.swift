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
