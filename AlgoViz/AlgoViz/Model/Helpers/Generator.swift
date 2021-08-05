//
//  Generator.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/1/21.
//

import Foundation

func generateDataForAlgorithm(sizeOfData: Int) -> ([Double], Range<Double>) {

    // for now create random data..eventually pass this in from data being created by user.
    var data: [Double] = (0..<sizeOfData).map{ _ in Double.random(in: 0 ... 99) }
    
    for (index, value) in data.enumerated(){
        data[index] = round(value)
    }
    
    let temp_sorted_data: [Double] = data.sorted()
    let range: Range<Double> = temp_sorted_data[0]..<temp_sorted_data[temp_sorted_data.count - 1]
    
    return (data, range)
}
