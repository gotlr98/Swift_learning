import UIKit

var greeting = "Hello, playground"

// Chapter13 클로저

/*
 클로저는 일정 기능을 하는 코드를 하나의 블록으로 모아놓은 것
 클로저는 변수나 상수가 선언된 위치에서 참조를 획득하고 저장할 수 있다.
 1. 이름이 있으면서 어떤 값도 획득하지 않는 전역함수의 형태
 2. 이름이 있으면서 다른 함수 내부의 값을 획득할 수 있는 중첩된 함수의 형태
 3. 이름이 없고 주변 문맥에 따라 값을 획득할 수 있는 축약 문법으로 작성한 형태
*/

// 기본 클로저

let names: [String] = ["wizplan", "eric", "yagom", "jenny"]

func backwards(first: String, second: String) -> Bool{
    print("\(first), \(second) 비교중")
    return first > second
}

let reversed: [String] = names.sorted(by: backwards) // true인 경우 첫 번째 전달인자가 두 번째 전달인자보다 앞에온다.
print(reversed)

// 위의 함수를 클로저로 구현

let reversed2: [String] = names.sorted (by: {(first: String, second: String) -> Bool in
    return first > second
})

// 후행 클로저 -> 괄호 생략 가능하지만, 맨 마지막 전달인자로 전달되는 클로저에만 해당되므로 전달인자로 클로저 여러 개를 전달할 때는 맨 마지막 클로저만 사용 가능

let reversed3: [String] = names.sorted(){(first: String, second: String) -> Bool in
    return first > second
}

let reversed4: [String] = names.sorted{(first: String, second: String) -> Bool in
    return first > second
}


// 클로저 표현 간소화

// 1. 문맥을 이용한 타입 유추 -> 매개변수 타입이나 개수, 반환 타입 등이 같아야 전달인자로서 전달할 수 있다 -> 이미 적한한 타입을 준수하고 있다고 유추 -> 매개변수의 타입이나 반환 값 생략 가능

let reversed5: [String] = names.sorted{(first, second) in
    return first > second
}

// 2. 단축 인자 이름 -> 매개변수 이름, in 키워드 생략 가능

let reversed6: [String] = names.sorted{
    return $0 > $1
}

// 3. 암시적 반환 표현 -> return 생략 가능

let reversed7: [String] = names.sorted{$0 > $1}

// 4. 연산자 함수

//public func ><T: Comparable>(lhs: T, rhs: T) -> Bool

//let reversed8: [String] = names.sorted(by: >)


// 탈출 클로저
/*
 함수의 전달인자로 전달한 클로저가 함수 종료 후에 호출될 때 클로저가 함수를 탈출한다고 표현한다.
 클로저를 매개변수로 갖는 함수를 선언할 때 매개변수 이름의 콜론 뒤에 @escaping 키워드를 사용하여 클로저가 탈출하는 것을 허용한다고 명시해줄 수 있다.
*/

typealias VoidVoidClosure = () -> Void
let firstClosure: VoidVoidClosure = {
    print("Closure A")
}

let secondClosure: VoidVoidClosure = {
    print("Closure B")
}

func returnOneClosure(first: @escaping VoidVoidClosure, second: @escaping VoidVoidClosure, shouldReturnFirstClosure: Bool) -> VoidVoidClosure{
    return shouldReturnFirstClosure ? first : second
} // 전달인자로 전달받은 클로저를 함수 외부로 다시 반환하기 때문에 함수를 탈출하는 클로저이다.

// 함수에서 반환한 클로저가 함수 외부의 상수에 저장되었다.
let returnedClosure: VoidVoidClosure = returnOneClosure(first: firstClosure, second: secondClosure, shouldReturnFirstClosure: true)

returnedClosure()

var closures: [VoidVoidClosure] = []

// closure 매개변수 클로저는 함수 외부의 변수에 저장될 수 있으므로 탈출 클로저이다.
func appendClosure(closure: @escaping VoidVoidClosure){
    closures.append(closure)
}

// 비탈출 클로저에서는 인스턴스의 프로퍼티인 x를 사용하기 위해 self를 생략해도 무관하지만, 탈출하는 클로저에서는 값 획들을 하기 위해 self 키워드를 사용해야 한다.

func functionWithNoescapeClosure(closure: VoidVoidClosure){
    closure()
}

func functionWithEscapingClosure(completionHandler : @escaping VoidVoidClosure) -> VoidVoidClosure{
    return completionHandler
}

class SomeClass{
    var x = 10
    
    func runNoescapeClosure(){
        functionWithNoescapeClosure{
            x=200
        }
    }
    
    func runEscapingClosure() -> VoidVoidClosure{
        return functionWithEscapingClosure{
            self.x = 100
        }
    }
}

let instance: SomeClass = SomeClass()
instance.runNoescapeClosure()
print(instance.x)

let returnedClosure2: VoidVoidClosure = instance.runEscapingClosure()
returnedClosure2()
print(instance.x)

// withoutActuallyEscaping
// 비탈출 클로저로 전달한 클로저가 탈출 클로저인 척 해야 하는 경우 -> 실제로는 탈출하지 않는데 다른 삼수에서 탈출 클로저를 요구하는 상황

//func hasElements(in array: [Int], match predicate: (Int) -> Bool) -> Bool{
//    return (array.lazy.filter {predicate($0)}.isEmpty == false) -> lazy 컬렉션은 비동기 작업이기 때문에 탈출 클로저를 사용해야 한다
//}

let numbers: [Int] = [2,4,6,8]

let evenNumberPredicate = {(number: Int) -> Bool in
    return number % 2 == 0
}

let oddNumberPredicate = {(number: Int) -> Bool in
    return number % 2 == 1
}

func hasElements(in array: [Int], match predicate: (Int) -> Bool) -> Bool{
    return withoutActuallyEscaping(predicate, do: {escapablePredicate in
        return (array.lazy.filter {escapablePredicate($0)}.isEmpty == false)
    })
}

// 자동 클로저
// 함수의 전달인자로 전달하는 표현을 자동으로 변환해주는 클로저 -> 전달인자를 갖지 않는다 -> 클로저가 호출되기 전까지 내부 코드가 동작하지 않는다 -> 연산 지연

var customersInLine: [String] = ["YoangWha", "SangYong", "SungHun", "HaMi"]
print(customersInLine.count)

let customerProvider: () -> String = { // 클로저를 만들어두면 클로저 내부의 코드를 미리 연산하지 않고 가지고만 있다
    return customersInLine.removeFirst()
}

print(customersInLine.count)

print("Now serving \(customerProvider())!")
print(customersInLine.count)

//func serveCustomer(_ customerProvider: () -> String){
//    print("Now serving \(customerProvider())!")
//}

//serveCustomer({customersInLine.removeFirst()})

// 위를 자동 클로저로 구현

func serveCustomer(_ customerProvider: @autoclosure () -> String){
    print("Now serving \(customerProvider())!")
}

serveCustomer(customersInLine.removeFirst())
