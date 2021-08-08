//
//  SelectionSort.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/1/21.
//

import Foundation

/// Selection Sort
class SelectionSort:Algorithm {
    
    /// Perform Selection Sort.
    /// - Returns: An array of algorithm steps.
    override func run() -> [AlgorithmStep]{
        
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

        for i in 0..<self.data!.count-1 {
            
            // Assume the smallest element is the current element's index.
            var smallestElementIndex: Int = i
            
            // Search through the rest of the array to find the next smallest element.
            for j in (i + 1)..<self.data!.count {
                
                // If the new element is less than the current smallest element,
                // update the smallestElement value's index.
                if self.data![j] < self.data![smallestElementIndex] {
                    smallestElementIndex = j
                }
            }
            
            if smallestElementIndex != i {
                self.data!.swapAt(smallestElementIndex, i)
            }
            
            iterations += 1
            
            // Add the latest step of the algorithm to the list of steps.
            steps.append(
                AlgorithmStep(
                    id: iterations,
                    data: self.data!
                )
            )
        }
        
        // remove any potential duplicate steps. -- may just be a selection sort issue.
        steps = removeDuplicateSteps(steps: steps)
        return steps
    }
}
