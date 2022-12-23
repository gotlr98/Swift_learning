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

print(sayHello(from: "Haesik", to: "Yoorim"))


