//
//  main.swift
//  Algorithm
//
//  Created by HaeSik Jang on 2023/06/19.
//

import Foundation

let read = readLine()!.lowercased()

var dict = [Character:Int]()

for i in read{
    if dict[i] != nil{
        dict[i]! += 1
    }
    else{
        dict[i] = 1
    }
}

let sorted = dict.sorted{$0.1 > $1.1}

if sorted.count != 1{
    if sorted[0].value == sorted[1].value{
        print("?")
    }
    else{
        print(sorted[0].key.uppercased())
    }
}
else{
    print(sorted[0].key.uppercased())
}



