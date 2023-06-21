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

