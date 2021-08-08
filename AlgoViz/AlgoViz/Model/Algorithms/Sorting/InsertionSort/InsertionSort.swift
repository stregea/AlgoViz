//
//  InsertionSort.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/8/21.
//

import Foundation

class InsertionSort: Algorithm {
    

    
    override func run() -> [AlgorithmStep] {
        /// Array to contain each iteration (steps) of the sort.
        var steps: [AlgorithmStep] = []
        
        /// Counter to keep track how many iterations have been performed.
        var iterations: Int = 0

        // Store the initial array contents as step 0.
        steps.append(
            AlgorithmStep(
                id: iterations,
                data: self.data!
            )
        )
        
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
//                        id: iterations,
//                        data: self.data!
//                    )
//                )
//
//                iterations += 1
            }
            
            // place the key into the stop portion of the sorted sub array.
            self.data![j+1] = key
            
            // Store the step.
            steps.append(
                AlgorithmStep(
                    id: iterations,
                    data: self.data!
                )
            )
            
            iterations += 1
        }
        
        return removeDuplicateSteps(steps: steps)
    }
}
