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

//print(quickSort([3,2,6,1,8,4]))



func mergeSort(_ array: [Int]) -> [Int] {
   if array.count <= 1 { return array }
   let center = array.count / 2
   let left = Array(array[0..<center])
   let right = Array(array[center..<array.count])
   
   func merge(_ left: [Int],_ right: [Int]) -> [Int] {
       var left = left
       var right = right
       var result: [Int] = []
       
       while !left.isEmpty && !right.isEmpty {
           if left[0] < right[0] {
               result.append(left.removeFirst())
           } else {
               result.append(right.removeFirst())
           }
       }
       
       // 왼쪽 배열의 요소가 남은 경우
       if !left.isEmpty {
           result.append(contentsOf: left)
       }
       
       // 오른쪽 배열의 요소가 남은 경우
       if !right.isEmpty {
           result.append(contentsOf: right)
       }
       
       return result
   }
   
   return merge(mergeSort(left), mergeSort(right))
}


//print(mergeSort([3,2,6,1,8,4]))

struct stack<T>{
    
    var items = [T]()
    
    mutating func push(_ item: T){
        items.append(item)
    }
    
    mutating func pop(){
        items.removeLast()
    }
}

struct queue<T>{
    
    var items = [T]()
    
    mutating func push(_ item: T){
        items.append(item)
    }
    
    mutating func pop() -> T?{
        
        return items.isEmpty ? nil : items.removeFirst()
    }
}

func dfs(_ graph: [[Int]], _ startNode: Int, _ visited: inout [Bool]){
    visited[startNode] = true
    
    print(startNode, terminator: " ")
    
    for next in graph[startNode]{
        if !visited[next]{
            dfs(graph, next, &visited)
        }
    }
}
var graph = [
    [],
    [2, 3, 8],
    [1, 7],
    [1, 4, 5],
    [3, 5],
    [3, 4],
    [7],
    [2, 6, 8],
    [1, 7]
]
var visited = [Bool](repeating: false, count: graph.count)
print(dfs(graph, 1, &visited))
