//
//  InsertionSort.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/8/21.
//

import Foundation

/// Class that will be used to perform InsertionSort.
class InsertionSort: Algorithm {
    
    /// Perform Insertion Sort.
    /// - Returns: An array of steps InsertionSort performed.
    override func run() -> [AlgorithmStep] {
        
        /// Array to contain each iteration (steps) of the sort.
        var steps: [AlgorithmStep] = [
            // Store the initial array contents as step 0.
            AlgorithmStep(
                id: 0,
                data: self.data!
            )
        ]
        
        for i in 0..<self.data!.count {
            let key: Double = self.data![i]
            
            var j: Int = i - 1
            
            // if the selected key is less than the previous index,
            // shift all previous contents down the array.
            while j >= 0 && key < self.data![j] {
                self.data![j+1] = self.data![j]
                j -= 1
                
                // mini step -- store when able to get full animation working.
                //                steps.append(
                //                    AlgorithmStep(
                //                        id: steps.count + 1,
                //                        data: self.data!
                //                    )
                //                )
            }
            
            // place the key into the stop portion of the sorted sub array.
            self.data![j+1] = key
            
            // Store the initial array contents as step 0.
            steps.append(
                AlgorithmStep(
                    id: steps.count + 1,
                    data: self.data!
                )
            )
        }
        
        return self.removeDuplicateSteps(steps: steps)
    }
}
