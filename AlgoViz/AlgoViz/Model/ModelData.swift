//
//  ModelData.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/1/21.
//

import Foundation

final class ModelData: ObservableObject {
    
    /// Array that holds all of the contents found within 'algorithms.json'
    @Published var algorithmInformation: [AlgorithmInformation] = load("algorithms.json")
    
    /// Array that holds information about all of the included sorting algorithms.
    var sortingAlgorithms: [AlgorithmInformation] {
        algorithmInformation.filter { $0.isSortingAlgorithm }
    }
    
    /// Array that holds information about all of the included pathfinding algorithms.
    var pathfindingAlgorithms: [AlgorithmInformation] {
        algorithmInformation.filter { $0.isSortingAlgorithm }
    }
}
