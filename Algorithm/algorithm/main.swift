//
//  main.swift
//  algorithm
//
//  Created by HaeSik Jang on 4/5/24.
//

import Foundation

func quickSort(_ array: [Int]) -> [Int]{
    guard let first = array.first, array.count > 1 else {return array}
    
    let pivot = first
    let left = array.filter{$0 < pivot}
    let right = array.filter{$0 > pivot}
    
    return quickSort(left) + [pivot] + quickSort(right)
}

print(quickSort([3,2,6,1,8,4]))
