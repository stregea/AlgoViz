//
//  Node.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/14/21.
//

import Foundation

class Node<T>: Comparable, Hashable {
    /// The data to store in the Node.
    let data: T
    
    /// The 'Parent' Node used for backtracking.
    let parent: Node?
    
    /// The cost value for a Node.
    let cost: Float
    
    /// The heuristic value for a Node.
    let heuristic: Float

    /// Initialize a Node.
    /// - Parameter data: The data to store within the Node.
    /// - Parameter parent: The 'Parent' node.
    /// - Parameter cost: The optional cost of the node.
    /// - Parameter heuristic: The optional heuristic.
    init(data: T, parent: Node?, cost: Float = 0.0, heuristic: Float = 0.0) {
        self.data = data
        self.parent = parent
        self.cost = cost
        self.heuristic = heuristic
    }
    
    /// The Node's hash.
    /// - Parameter hasher: Object used to hash the Coordinate.
    func hash(into hasher: inout Hasher) {
        // Make the hash dependant upon adding the Node's cost and heuristic together.
        hasher.combine( (Int) ( self.cost + self.heuristic ) )
    }
    
    /// Compare each Node's cost and heuristic.
    /// - Parameter lhs: The first Node used for comparison.
    /// - Parameter rhs: The second Node used for comparison.
    static func < (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return ( lhs.cost + lhs.heuristic ) < ( rhs.cost + rhs.heuristic )
    }
    
    /// Determine if two Coordinates are equal.
    /// - Parameter lhs: The first Node used for comparison.
    /// - Parameter rhs: The second Node used for comparison.
    /// - Returns: True if the lhs parameter is the same Node as the rhs parameter.
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        // Check to see if lhs and rhs point to the same memory location.
        return lhs === rhs
    }
    
}
