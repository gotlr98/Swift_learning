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

let num = Int(readLine()!)!
let count = num-1

for i in 1..<num+1{
    print(String(repeating: "*", count: num))
}
