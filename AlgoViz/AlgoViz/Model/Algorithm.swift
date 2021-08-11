//
//  Algorithm.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/1/21.
//

import Foundation

// todo: allow for interpreting superscripts to change n2 to n^2, and interpret other time complexities.
/// Enumerated type for the different Space and Time complexitys for the algorithms.
enum TimeComplexity: String, CaseIterable, Codable {
    case constant = "O(1)"
    case n = "O(n)"
    case n2 = "O(n^2)"
    case logn = "O(log(n))"
    case nlogn = "O(nlog(n))"
}

/// Enumerated type for the different types of algorithms used within this project.
enum AlgorithmType: String, CaseIterable, Codable {
    case sorting = "Sorting"
    case pathfinding = "Pathfinding"
} // this breaks the conversion from json for some reason.

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
    
    /// Boolean to determine if the algorithm is of the sorting type.
    var isSortingAlgorithm: Bool
    
    /// Boolean to determine if the algorithm is of the pathfinding type.
    var isPathfindingAlgorithm: Bool
    
    /// The description of the algorithm.
    var description: String
}

/// Model that is used to create an object instance of an Algorithm.
class Algorithm {
    /// Object that contains all of the information pertaining to this algorithm.
    var info: AlgorithmInformation?
    
    /// Object that contains the information to be used for  the sorting algorithms.
    var data: AlgorithmData?
    
    var steps: [AlgorithmStep]? = nil
    
    /// Initialize an instance of an Algorithm.
    /// - Parameter info: The information that pertains to this Algorithm.
    /// - Parameter data: The data that this algorithm will use to search/sort.
    init(info: AlgorithmInformation?, data: AlgorithmData?){
        self.info = info
        self.data = data
    }
    
    /// Remove any duplicated potential duplicated steps of an algorithm.
    /// - Parameter steps: The steps performed by an algorithm.
    /// - Returns: An array of steps without any duplicates.
    func removeDuplicateSteps(steps: [AlgorithmStep]) -> [AlgorithmStep]{
        
        /// Set that is used to store unique values.
        var encountered = Set<[Double]>()
        
        /// The array that contains no-duplicated steps of the algorithm.
        var noDuplicatedSteps: [AlgorithmStep] = []
        
        // iterate through all of the steps of the algorithm to find any potential duplicates.
        for step in steps {
            
            if !encountered.contains(step.data) {
                // Add the step to the set.
                encountered.insert(step.data)
                
                // Append the step.
                noDuplicatedSteps.append(step)
            }
        }
        return noDuplicatedSteps
    }
    
    /// Update the data used for the algorithm as well as updating it's steps.
    func updateData(data: AlgorithmData) {
        self.data = data
        self.steps = self.run()
    }
    
    /// Perform the algorithm.
    /// - Returns: An array of algorithm steps.
    func run() -> [AlgorithmStep]{
        return []
    }
}
