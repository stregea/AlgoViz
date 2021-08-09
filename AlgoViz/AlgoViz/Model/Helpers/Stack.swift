//
//  Stack.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/9/21.
//

import Foundation

struct Stack<T> {
    var array: [T] = []
    
    
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    mutating func pop() -> T? {
        if !array.isEmpty {
            let index = array.count - 1
            let poppedValue = array.remove(at: index)
            return poppedValue
        } else {
            return nil
        }
    }
    
    func peek() -> T? {
        if !array.isEmpty {
            return array.last
        } else {
            return nil
        }
    }
    
    func isEmpty() -> Bool{
        return array.count == 0
    }
    
    func size() -> Int {
        return array.count
    }
}

