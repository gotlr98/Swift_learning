//
//  main.swift
//  Algorithm
//
//  Created by HaeSik Jang on 2023/06/19.
//

import Foundation

// # 1157
//let read = readLine()!.lowercased()
//
//var dict = [Character:Int]()
//
//for i in read{
//    if dict[i] != nil{
//        dict[i]! += 1
//    }
//    else{
//        dict[i] = 1
//    }
//}
//
//let sorted = dict.sorted{$0.1 > $1.1}
//
//if sorted.count != 1{
//    if sorted[0].value == sorted[1].value{
//        print("?")
//    }
//    else{
//        print(sorted[0].key.uppercased())
//    }
//}
//else{
//    print(sorted[0].key.uppercased())
//}



// # 1330

//let read = readLine()!.split(separator: " ").map{Int(String($0))!}
//
//if read[0] > read[1]{
//    print(">")
//}
//
//else if read[0] < read[1]{
//    print("<")
//}
//
//else{
//    print("==")
//}

// # 2438

//let num = Int(readLine()!)!
//
//for i in 1..<num+1{
//    print(String(repeating: "*", count: i))
//}

// # 2439

//let num = Int(readLine()!)!
//
//for i in 1..<num+1{
//    for j in stride(from: num, to: 0, by: -1){
//        if j > i{
//            print(" ", terminator: "")
//        }
//        else{
//            print("*", terminator: "")
//        }
//
//    }
//    print("\n", terminator: "")
//}

// # 2475

//let num = readLine()!.split(separator: " ").map{Int(String($0))!}
//var sum = 0
//for i in num{
//    sum += i*i
//}
//
//print(sum % 10)

// # 2562

//var num: [Int] = []
//var max = -1
//var index = 0
//for _ in 0..<9{
//    num.append(Int(readLine()!)!)
//}
//
//for i in 0..<9{
//    if num[i] > max{
//        max = num[i]
//        index = i+1
//    }
//}
//print(max)
//print(index)


// #2577

//var num: [Int] = []
//var sum = 0
//
//var dict: [Int: Int] = [:]
//
//for _ in 0..<3{
//    num.append(Int(readLine()!)!)
//}
//
//sum = num[0] * num[1] * num[2]
//
//for i in 0..<10{
//    dict[i] = 0
//}
//
//while sum > 0{
//    let rem = sum % 10
//    dict[rem]! += 1
//    sum /= 10
//}
//
//let sort = dict.sorted{ (first, second) in
//    return first.key < second.key
//}
//
//for (_, value) in sort{
//    print(value)
//}


// # 2675

//let num = Int(readLine()!)!
//
//var count: [Int] = []
//var word: [String] = []
//
//for _ in 0..<num{
//    let a = readLine()!.split(separator: " ")
//    count.append(Int(a[0])!)
//    word.append(String(a[1]))
//}
//
//for i in 0..<count.count{
//    for j in word[i]{
//        print(String(repeating: j, count: count[i]), terminator: "")
//    }
//    print("\n", terminator: "")
//}

// # 2739

//let num = Int(readLine()!)!
//
//for i in 1..<10{
//    print("\(num) * \(i) = \(num * i)")
//}


// # 2741

//let num = Int(readLine()!)!
//
//if (num % 4 == 0) && ((num % 100 != 0) || (num % 400 == 0)){
//    print(1)
//}
//else{
//    print(0)
//}


// # 2884

//let num = readLine()!.split(separator: " ").map{Int(String($0))!}
//var conv = num[0] * 60 + num[1]
//
//if conv - 45 < 0{
//    conv += 24 * 60
//}
//
//
//let hour = (conv - 45) / 60
//let min = (conv - 45) % 60
//
//print("\(hour) \(min)")

// # 2920

//let num = readLine()!.split(separator: " ").map{Int(String($0))!}
//
//if num[0] == 1 && (num.sorted() == num){
//    print("ascending")
//}
//
//else if num[0] == 8 && (num.sorted(by: {$0 > $1}) == num){
//    print("descending")
//}
//
//else{
//    print("mixed")
//}


// # 3052

//var dict: [Int:Int] = [:]
//
//for _ in 1..<11{
//    let num = Int(readLine()!)!
//    dict[num%42] = 1
//}
//
//print(dict.keys.count)

// #8958

//let count = Int(readLine()!)!
//var question: [String] = []
//var sum = 0
//var num = 0
//
//for _ in 0..<count{
//    let a = readLine()!
//    question.append(a)
//}
//
//for i in question{
//    for j in i{
//        if j == "O"{
//            num += 1
//            sum += num
//
//        }
//        else{
//            num = 0
//        }
//    }
//    print(sum)
//    sum = 0
//    num = 0
//}

// # 10809


//let alpha = "abcdefghijklmnopqrstuvwxyz"
//var count = 0
//var dict: [Character: Int] = [:]
//
//for i in alpha{
//    dict[i] = -1
//}
//
//
//let word = readLine()!
//
//for i in word{
//
//    if dict[i] == -1{
//        dict[i] = count
//    }
//    count += 1
//}
//
//let sort_dict = dict.sorted{$0.0 < $1.0}
//
//for (key,value) in sort_dict.enumerated(){
//    print(value.value, terminator: " ")
//}

// # 10818


//let num = Int(readLine()!)!
//
//let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
//
//print("\(arr.min()!) \(arr.max()!)")


// # 10869

//let num = readLine()!.split(separator: " ").map{Int(String($0))!}
//
//print(num[0]+num[1])
//print(num[0]-num[1])
//print(num[0]*num[1])
//print(num[0]/num[1])
//print(num[0]%num[1])

// # 10871

//let num = readLine()!.split(separator: " ").map{Int(String($0))!}
//
//let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
//
//for i in arr{
//    if num[1] > i{
//        print(i, terminator: " ")
//    }
//}

// # 10950

//let count = Int(readLine()!)!
//
//for _ in 0..<count{
//    let num = readLine()!.split(separator: " ").map{Int(String($0))!}
//
//    print(num[0] + num[1])
//}


// # 10951

//while let input = readLine(){
//    let num = input.split(separator: " ").map{Int(String($0))!}
//
//    print(num[0] + num[1])
//
//}


// # 11654

//print(Character(readLine()!).unicodeScalars.first!.value)


// # 11720

//let count = Int(readLine()!)!
//var sum = 0
//
//let arr = readLine()!
//
//for i in arr{
//    sum += Int(String(i))!
//}
//print(sum)

// # 1181

//let count = Int(readLine()!)!
//
//var words: [String: [String]] = [:]
//var conv: [String] = []
//
//for _ in 0..<count{
//    let a = readLine()!
//
//    words[String(a), default: [String]()].append(a)
//}
//
//
//
//for (key, value) in words{
//    for i in 1..<value.count{
//
//        if conv.contains(value[i-1]) {
//            continue
//        }
//
//        if value[i-1] < value[i]{
//            conv.append(value[i-1])
//            conv.append(value[i])
//
//        }
//        else{
//            conv.append(value[i])
//            conv.append(value[i-1])
//        }
//    }
//}
//print(conv)

// # 약수의 합

//func solution(_ n: Int) -> Int{
//    var sum = 0
//
//    for i in 1..<n+1{
//        if n % i == 0{
//            sum += i
//        }
//    }
//
//    return sum
//}

// # 최댓값과 최솟값

//func solution(_ s:String) -> String {
//
//    let str = s.split(separator: " ").map{Int(String($0))!}
//
//    var max = str[0]
//    var min = str[0]
//
//    for i in str{
//        if i >= max{
//            max = i
//        }
//
//        if i <= min{
//            min = i
//        }
//    }
//
//    return "\(min) \(max)"
//}
//
//print(solution("1 2 3 4"))


//func solution(_ s: String) -> String{
//
//    let str = s.split(separator: " ").map{String($0)}
//    var answer = ""
//    var count = 0
//
//
//    for j in s{
//        if j.isNumber{
//            answer.append(j)
//            count = 1
//        }
//        else if !j.isNumber && count == 0{
//            answer += j.uppercased()
//            count = 1
//
//        else if j == " "{
//            count = 0
//            answer.append(j)
//        }
//        else{
//            answer += j.lowercased()
//        }
//    }
//
//
//    return answer.trimmingCharacters(in: .whitespaces)
//}
//
//print(solution("A "))


//func solution(_ s:String) -> Bool
//{
//    var ans: Bool = true
//
//    if s[s.startIndex] == ")" || s.suffix(1) == "("{
//        ans = false
//    }
//
//    var count = 0
//    var count2 = 0
//
//    for i in s{
//        if i == "("{
//            count += 1
//        }
//        else{
//            count2 += 1
//        }
//
//        if count < count2{
//            ans = false
//        }
//    }
//
//    if count != count2{
//        ans = false
//    }
//
//
//    return ans
//}
//
//print(solution("())(()"))

//func solution(_ n:Int) -> Int
//{
//
//    var answer = 0
//
//    var count = 0
//
//    let conv = String(n, radix: 2)
//
//    for i in conv{
//
//        if i == "1"{
//            count += 1
//        }
//    }
//
//    var sum = n+1
//
//    while true{
//
//
//        var count_ = 0
//
//        let temp = String(sum, radix: 2)
//
//        for i in temp{
//
//            if i == "1"{
//                count_ += 1
//            }
//        }
//
//        if count == count_{
//            answer = sum
//            break
//        }
//
//        sum += 1
//
//    }
//
//    return answer
//}

//print(solution(78))

//func solution(_ A:[Int], _ B:[Int]) -> Int
//{
//    var ans = 0
//
//    let a = A.sorted(by: { (one, two) in
//        return one < two
//    })
//
//    let b = B.sorted(by: { (one, two) in
//        return one > two
//    })
//
//    for i in 0..<a.count{
//
//        ans += a[i] * b[i]
//    }
//
//    return ans
//}
//
//print(solution([1,2], [3,4]))

//func solution(_ n:Int) -> Int {
//
//    var num: [Int] = [Int](repeating: 0, count: n+1)
//
//    num[0] = 0
//    num[1] = 1
//    num[2] = 1
//
//    for i in 3..<n+1{
//        num[i] = (num[i-1] + num[i-2]) % 1234567
//    }
//
//
//    return num[n] % 1234567
//}
//
//print(solution(12414124))


//func BFS(graph: [String: [String]], start: String) -> [String]{
//
//
//    var neededVisit: [String] = [start]
//    var visited: [String] = []
//
//    while !neededVisit.isEmpty{
//
//        // First In First Out
//        let node: String = neededVisit.removeFirst()
//        if visited.contains(node){continue}
//
//        visited.append(node)
//        neededVisit += graph[node] ?? []
//    }
//
//    return visited
//
//}
//
//
//let graph: [String: [String]] = [
//    "A" : ["B", "C"],
//    "B" : ["A", "D", "E"],
//    "C" : ["A", "F"],
//    "D" : ["B"],
//    "E" : ["B"],
//    "F" : ["C"],
//]
//
//print(BFS(graph: graph, start: "A"))
//
//func DFS(graph: [String: [String]], start: String) -> [String]{
//
//
//    var neededVisit: [String] = [start]
//    var visited: [String] = []
//
//    while !neededVisit.isEmpty{
//
//        let node: String = neededVisit.removeLast()
//        if visited.contains(node){continue}
//
//        visited.append(node)
//        neededVisit += graph[node] ?? []
//    }
//
//
//    return visited
//}
//
//print(DFS(graph: graph, start: "A"))
//
//var array: [Int] = [3,2,5,6,1,4]
//
//func BubbleSort(array: inout [Int]){
//
//    var isSort: Bool = false
//
//    for i in 0..<array.count - 1{
//
//        for j in 0..<(array.count - i) - 1{
//
//            if array[j] > array[j+1]{
//                array.swapAt(j, j+1)
//                isSort = true
//            }
//        }
//
//        if isSort == false{return}
//    }
//}
//BubbleSort(array: &array)
//print(array)
//
//func SelectSort(array: inout [Int]){
//
//    for i in 0..<array.count-1{
//
//        var minIndex = i
//        for j in i+1..<array.count{
//
//            if array[j] < array[minIndex]{
//                minIndex = j
//            }
//        }
//
//        array.swapAt(minIndex, i)
//    }
//}
//
//SelectSort(array: &array)
//print(array)

//func InsertionSort(array: inout [Int]){
//
//    for i in 1..<array.count{
//        for j in stride(from: i, to: 0, by: -1){
//
//            if array[j] < array[j-1]{
//                array.swapAt(j, j-1)
//            }
//        }
//    }
//}
//
//var array = [5,3,8,1,2]
//
//InsertionSort(array: &array)
//print(array)

func solution(_ s: String) -> [Int]{
    
    var temp = s
    
    var count = 0
    var removeCount = 0
    
    var a: String = ""
    
    while true{

        
        for i in temp{
            if i == "0"{
                removeCount += 1
            }
            else{
                a.append(i)
            }
        }
        
        temp = String(a.count, radix: 2)
        
        
        
        
        count += 1
        a = ""
        if temp == "1"{
            break
        }
    }
    
    return [count, removeCount]
}

print(solution("110010101001"))
