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

var dict: [Int:Int] = [:]

for _ in 1..<11{
    let num = Int(readLine()!)!
    dict[num%42] = 1
}

print(dict.keys.count)
