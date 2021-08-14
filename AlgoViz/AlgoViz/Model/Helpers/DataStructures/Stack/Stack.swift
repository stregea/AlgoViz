//
//  Stack.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/9/21.
//

import Foundation

struct Stack<T> {
    /// Array to store contents within the Stack.
    var contents: [T] = []
    
    /// Push an element onto the stack.
    /// - Parameter element: The element to place onto the stack.
    mutating func push(_ element: T) {
        self.contents.append(element)
    }
    
    /// Pop an element from the stack and remove it.
    /// - Returns: The last element from the array, nil if there are no elements to pop.
    mutating func pop() -> T? {
        if !self.contents.isEmpty {
            return self.contents.removeLast()
        } else {
            return nil
        }
    }
    
    /// Peek an element from the stack.
    /// - Returns: The last element from the array, nil if there are no elements to pop.
    func peek() -> T? {
        if !self.contents.isEmpty {
            return self.contents.last
        } else {
            return nil
        }
    }
    
    /// Determine the size of the stack.
    /// - Returns: The number of elements existing within the stack.
    func size() -> Int {
        return contents.count
    }
    
    /// Determine if the stack is empty.
    /// - Returns: True if the stack is empty, false otherwise.
    func isEmpty() -> Bool{
        return self.size() == 0
    }
    
}
