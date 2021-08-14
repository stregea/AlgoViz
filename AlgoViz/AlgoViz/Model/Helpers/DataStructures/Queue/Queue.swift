//
//  Queue.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/13/21.
//

import Foundation

struct Queue<T> {
    /// Array to store contents within the Queue.
    var contents: [T] = []
    
    /// Push an element into the queue.
    /// - Parameter element: The element to place into the queue.
    mutating func push(_ element: T) {
        self.contents.append(element)
    }
    
    /// Pop an element from the queue and remove it.
    /// - Returns: The first element from the array, nil if there are no elements to pop.
    mutating func pop() -> T? {
        if !self.contents.isEmpty {
            return self.contents.removeFirst()
        } else {
            return nil
        }
    }
    
    /// Peek an element from the queue.
    /// - Returns: The first element from the array, nil if there are no elements to pop.
    func peek() -> T? {
        if !self.contents.isEmpty {
            return self.contents.last
        } else {
            return nil
        }
    }
    
    /// Determine the size of the queue.
    /// - Returns: The number of elements existing within the queue.
    func size() -> Int {
        return self.contents.count
    }
    
    /// Determine if the queue is empty.
    /// - Returns: True if the queue is empty, false otherwise.
    func isEmpty() -> Bool{
        return self.size() == 0
    }
    
}

