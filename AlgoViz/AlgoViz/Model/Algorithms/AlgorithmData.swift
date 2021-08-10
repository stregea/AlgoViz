//
//  AlgorithmData.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/9/21.
//

import Foundation

/// Struct that will withhold data an algorithm will be using.
struct AlgorithmData {
    
    /// The data the algorithm will be using.
    var data: [Double]
    
    /// The overall range of the data,
    var dataRange: Range<Double>
}
