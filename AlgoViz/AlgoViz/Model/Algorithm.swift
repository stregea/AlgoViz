//
//  Algorithm.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/1/21.
//

import Foundation

// todo: allow for interpreting superscripts to change n2 to n^2, and interpret other time complexities.
//enum TimeComplexity: String, CaseIterable, Codable {
//
//}

/// Enumerated type for the different types of algorithms used within this project.
enum AlgorithmType: String, CaseIterable, Codable {
    case sorting = "Sorting"
    case pathfinding = "Pathfinding"
} // this breaks for some reastion.

/// Model that is used to create a struct that withholds information about an algorithm.
struct AlgorithmInformation: Hashable, Codable, Identifiable{
    
    /// The given id of the algorithm.
    var id: Int
    
    /// The name of the alorgrithm.
    var name: String
    
    /// The time complexity (Big-0) of the algorithm.
    var timeComplexity: String
    
    /// The space complexity (memory usage) of the algorithm.
    var spaceComplexity: String
    
    /// The best-case timple complexity for the algorithm.
    var bestCase: String
    
    /// The worst-case time complexity for the algorithm.
    var worstCase: String
    
    /// The algorithm type.
    var type: String
    
    var isSortingAlgorithm: Bool
    
    var isPathfindingAlgorithm: Bool
    
    /// The description of the algorithm.
    var description: String
}

/// Model that is used to create an object instance of an Algorithm.
class Algorithm {
    var info: AlgorithmInformation
    var data: [Double]?
    
    init(info: AlgorithmInformation, data: [Double]){
        self.info = info
        self.data = data
    }
    
    func run() -> [AlgorithmStep]{
        return []
    }
}
