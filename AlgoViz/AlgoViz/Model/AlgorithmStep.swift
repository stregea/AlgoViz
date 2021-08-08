//
//  AlgorithmStep.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/5/21.
//

import Foundation

/// This struct will represent one step within an Algorithm.
/// The implementation will contain a list of AlgorithmStep's which will allow for the UI
/// to display every iteration of the selected algorithm to search or sort.
struct AlgorithmStep: Identifiable, Codable, Hashable, CustomStringConvertible {
    /// The id (iteration #) of the current step of the algorithm.
    let id: Int
    
    /// The array that will withold the sorted information at the current step of the algoritm.
    let data: [Double]
    
    /// The description of the step. This allows for a String conversion of this struct.
    var description: String { return "step:\(self.id): \(self.data)"}
}
