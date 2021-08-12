//
//  ModelData.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/1/21.
//

import Foundation

/// Model that will serve as the observable object for the application
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
    
    /// The size of the data set each algorithm will use.
    var dataSetSize: Int = 20
}
