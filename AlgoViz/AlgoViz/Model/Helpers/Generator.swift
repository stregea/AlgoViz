//
//  Generator.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/1/21.
//

import Foundation

/// Generate random data for an algorithm.
/// - Parameter sizeOfData: The wanted size of the returned data.
/// - Returns: A tuple containing the randomly generated data and it's range.
func generateDataForAlgorithm(sizeOfData: Int) -> AlgorithmData {

    // for now create random data..eventually pass this in from data being created by user.
    var data: [Double] = (0..<sizeOfData).map{ _ in Double.random(in: 0 ... 99) }
    
    // round each of the values.
    for (index, value) in data.enumerated(){
        data[index] = round(value)
    }
    
    // determine the range.
    let temp_sorted_data: [Double] = data.sorted()
    let range: Range<Double> = temp_sorted_data[0]..<temp_sorted_data[temp_sorted_data.count - 1]
    
    return AlgorithmData(contents: data, dataRange: range)
}
