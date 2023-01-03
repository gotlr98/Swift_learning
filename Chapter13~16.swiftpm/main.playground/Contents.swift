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

// Chaprer 14 옵셔널 체이닝과 빠른 종료
/*
 옵셔널 체이닝은 옵셔널에 속해 있는 nil일지도 모르는 프로퍼티, 메서드, 서브스크립션 등을 가져오거나 호출할 때 사용할 수 있는 일련의 과정
 옵셔널에 값이 있다면 프로퍼티, 메서드, 서브스크립트 등을 호출할 수 있고, 옵셔널이 nil이라면 프로퍼티, 메서드, 서브스크립트 등은 nil을 반환
*/

class Room{
    var number: Int
    
    init(number: Int){
        self.number = number
    }
}

class Building{
    var name: String
    var room: Room?
    
    init(name: String){
        self.name = name
    }
}

struct Address{
    var province: String
    var city: String
    var street: String
    var building: Building?
    var detailAddress: String?
    
    init(province: String, city: String, street: String){
        self.province = province
        self.city = city
        self.street = street
    }
    
    func fullAddress() -> String?{
        var restAddress: String? = nil
        
        if let buildingInfo: Building = self.building{
            restAddress = buildingInfo.name
        }else if let detail = self.detailAddress{
            restAddress = detail
        }
        
        if let rest: String = restAddress{
            var fullAddress: String = self.province
            
            fullAddress += " " + self.city
            fullAddress += " " + self.street
            fullAddress += " " + rest
            
            return fullAddress
        }else{
            return nil
        }
    }
    func printAddress(){
        if let address: String = self.fullAddress(){
            print(address)
        }
    }
}

class Person{
    var name: String
    var address: Address?
    
    init(name: String){
        self.name = name
    }
}

let haesik: Person = Person(name: "haesik")
//var roomNumber: Int? = nil
//if let haesikAddress: Address = haesik.address{
//    if let haesikBuilding: Building = haesikAddress.building{
//        if let haesikRoom: Room = haesikBuilding.room{
//            roomNumber = haesikRoom.number
//        }
//    }
//}
//
//if let number: Int = roomNumber{
//    print(number)
//}else{
//    print("Can not find room number")
//}

// 위를 옵셔널 체이닝으로 표현

if let roomNumber: Int = haesik.address?.building?.room?.number{
    print(roomNumber)
}else{
    print("Can not find room number")
}

haesik.address = Address(province: "인천광역시", city: "중구", street: "흰바위로")
haesik.address?.building = Building(name: "운서 sk뷰")
haesik.address?.building?.room = Room(number:1105)
haesik.address?.building?.room?.number = 1

print(haesik.address?.building?.room?.number)

haesik.address?.printAddress()

// 옵셔널 체이닝을 통한 서브스크립트 호출

let optionalArray: [Int]? = [1,2,3]
print(optionalArray?[1])

var optionalDictionary: [String: [Int]]? = [String: [Int]]()

optionalDictionary?["numberArray"] = optionalArray
optionalDictionary?["numberArray"]?[2]

// 빠른 종료
/*
 guard Bool 타입 값 else{
    예외사항 실행문
    제어문 전환 명령어
 }
 if 구문을 사용하면 예외사항을 else 블록으로 처리해야 하지만 예외사항만을 처리하고 싶다면 guard구문을 사용하는 것이 훨씬 간편하다
 */

for i in 0...3{
    guard i % 2 == 0 else{
        continue
    }
    print(i)
}

// guard 구문의 옵셔널 바인딩 활용

func greet(_ person: [String: String]){
    guard let name: String = person["name"] else{
        return
    }
    
    print("Hello \(name)")
    
    guard let location: String = person["location"] else{
        print("I hope the weather is nice near you")
        return
    }
    
    print("I hope the weather is nice in \(location)")
}

var personInfo: [String: String] = [String: String]()
personInfo["name"] = "Jenny"

greet(personInfo)

personInfo["location"] = "Korea"
greet(personInfo)

func enterClub(name: String?, age: Int?){
    guard let name: String = name, let age: Int = age, age > 19, name.isEmpty == false else{
        print("You are too young to enter the club")
        return
    }
    print("Welcome \(name)!")
}

enterClub(name: "Haesik", age: 20)

// guard 구문의 한계는 자신을 감싸는 코드 블록, 즉 return, break, continue, throw 등의 제어문 전환 명령어를 쓸 수 없는 상황이라면 사용이 불가


// Chapter 15 맵, 필터, 리듀스

// 맵 -> 자신을 호출할 때 매개변수로 전달된 함수를 실행하여 그 결과를 다시 반환해주는 함수. 기존 데이터를 변형하는 데 많이 사용


//let numbers2: [Int] = [0,1,2,3,4]
//
//var doubledNumbers: [Int] = [Int]()
//var strings2: [String] = [String]()
//
//for number in numbers{
//    doubledNumbers.append(number*2)
//    strings2.append("\(number)")
//}
//print(doubledNumbers)
//print(strings2)
//
//doubledNumbers = numbers2.map({(number: Int) -> Int in
//    return number * 2})
//strings2 = numbers2.map({(number: Int) -> String in
//    return "\(number)"
//})
//
//print(doubledNumbers)
//print(strings2)

// 위의 코드를 클로저 간소화로 표현

let numbers2: [Int] = [0,1,2,3,4]

var doubledNumbers = numbers2.map({$0 * 2})
print(doubledNumbers)

let evenNumbers: [Int] = [0,2,4,6,8]
let oddNumbers: [Int] = [1,3,5,7,9]

let multiplyTwo: (Int) -> Int = {$0*2}

let doubledEvenNumbers = evenNumbers.map(multiplyTwo)
let doubledOddNumbers = oddNumbers.map(multiplyTwo)

print(doubledEvenNumbers)
print(doubledOddNumbers)


let alphabetDictionary: [String: String] = ["a": "A", "b": "B"]

var keys: [String] = alphabetDictionary.map{$0.0}

keys = alphabetDictionary.map{$0.0}

let values: [String] = alphabetDictionary.map{$0.1}
print(keys)
print(values)

var numberSet: Set<Int> = [1,2,3,4,5]
let resultSet = numberSet.map{ $0 * 2}
print(resultSet)

let optionalInt: Int? = 3
let resultInt: Int? = optionalInt.map{$0*2}
print(resultInt)

let range: CountableClosedRange = (0...3)
let resultRange: [Int] = range.map{$0*2}
print(resultRange)

// 필터
// 컨테이너 내부의 값을 걸러서 추출하는 역할, 맵은 기존 콘텐츠를 변형하지만 필터는 특정 조건에 맞게 걸러내는 역할

var oddNumbers2: [Int] = numbers2.filter{$0 % 2 == 1}
print(oddNumbers2)

oddNumbers2 = numbers.map{$0 + 3}.filter{$0 % 2 == 1}

// 리듀스
// 컨테이너 내부의 콘텐츠를 하나로 합하는 기능

let numbers3: [Int] = [1,2,3]

var sum: Int = numbers3.reduce(0, {(result: Int, next: Int) -> Int in // result로는 처음엔 초기값이 전달되고 그 후엔 결과가 전달, next는 컨테이너 요소
    print("\(result) + \(next)")
    return result + next
})
print(sum)

// 값 반환이 아니라 내부에서 직접 이전 값을 변경한다

sum = numbers3.reduce(into: 0, {(result: inout Int, next: Int) in
    print("\(result) + \(next)")
    result += next
})

var doubledNumbers2: [Int] = numbers3.reduce(into: [1,2]) {(result: inout [Int], next: Int) in
    print("result: \(result), next: \(next)")
    
    guard result.contains(next) else{
        return
    }
    
    print("\(result) append \(next)")
    
    result.append(next*2)
}
print(doubledNumbers2)

doubledNumbers2 = [1,2] + numbers3.filter{$0.isMultiple(of: 2)}.map{$0*2}
print(doubledNumbers2)

let numbers4: [Int] = [1,2,3,4,5,6,7]

var result2: Int = numbers4.filter{$0.isMultiple(of: 2)}.map{$0 * 3}.reduce(0){$0+$1}
print(result2)


enum Gender{
    case male, female, unknown
}

struct Friend{
    let name: String
    let gender: Gender
    let location: String
    var age: UInt
}

var friends: [Friend] = [Friend]()

friends.append(Friend(name: "haesik", gender: .male, location: "인천", age: 26))
friends.append(Friend(name: "taehyi", gender: .male, location: "서울", age: 26))
friends.append(Friend(name: "kihyun", gender: .male, location: "서울", age: 26))
friends.append(Friend(name: "yoorim", gender: .male, location: "서울", age: 26))

var result3: [Friend] = friends.map{ Friend(name: $0.name, gender: $0.gender, location: $0.location, age: $0.age + 1)}

result3 = result3.filter{$0.location != "서울" && $0.age >= 25}

let string3: String = result3.reduce("서울 외의 지역에 거주하며 25세 이상인 친구"){ $0 + "\n" + "\($1.name)  \($1.gender) \($1.location) \($1.age)세"}
print(string3)


// Chapter 16 모나드
// 모나드는 닫힌 함수객체이다 -> 자신의 컨텍스트와 같은 컨텍스트의 형태로 맵핑할 수 있는 함수객체

// flatmap -> 컨텍스트 내부의 컨텍스트를 모두 같은 위상으로 평평하게 펼쳐준다 -> 포장된 값 내부의 포장된 값의 포장을 풀어서 같은 위상으로 펼쳐준다

// map과 flatmap(compactmap)의 차이
let optionals: [Int?] = [1,2,nil,5]

let mapped: [Int?] = optionals.map{$0}
let compactMapped: [Int] = optionals.compactMap{$0}

print(mapped)
print(compactMapped)

// 중첩된 컨테이너에서 map, flatmap차이

let multipleContainer = [[1,2,Optional.none], [3, Optional.none], [4,5,Optional.none]]

let mappedMultipleContainer = multipleContainer.map{$0.map{$0}}
let flatmappedMultipleContainer = multipleContainer.flatMap{$0.flatMap{$0}}

print(mappedMultipleContainer)
print(flatmappedMultipleContainer)


// 플랫맵의 활용

func stringToInteger(_ string: String) -> Int?{
    return Int(string)
}

func integerToString(_ integer: Int) -> String?{
    return "\(integer)"
}

var optionalString: String? = "2"

let flattenResult = optionalString.flatMap(stringToInteger)
    .flatMap(integerToString)
    .flatMap(stringToInteger)

print(flattenResult)

let mappedResult = optionalString.map(stringToInteger)
print(mappedResult)


