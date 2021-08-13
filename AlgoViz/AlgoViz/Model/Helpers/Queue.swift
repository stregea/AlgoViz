//
//  Queue.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/13/21.
//

import Foundation

struct Queue<T> {
    var array: [T] = []
    
    /// Push an element into the queue.
    /// - Parameter element: The element to place into the queue.
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    /// Pop an element from the queue and remove it.
    /// - Returns: The first element from the array, nil if there are no elements to pop.
    mutating func pop() -> T? {
        if !array.isEmpty {
            return array.removeFirst()
        } else {
            return nil
        }
    }
    
    /// Peek an element from the queue.
    /// - Returns: The first element from the array, nil if there are no elements to pop.
    func peek() -> T? {
        if !array.isEmpty {
            return array.last
        } else {
            return nil
        }
    }
    
    /// Determine the size of the queue.
    /// - Returns: The number of elements existing within the queue.
    func size() -> Int {
        return array.count
    }
    
    /// Determine if the queue is empty.
    /// - Returns: True if the queue is empty, false otherwise.
    func isEmpty() -> Bool{
        return self.size() == 0
    }
    
}

