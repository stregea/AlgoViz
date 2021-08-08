//
//  SelectionSort.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/1/21.
//

import Foundation

/// Selection Sort
class SelectionSort:Algorithm {
    
    /// Remove any duplicated potential duplicated steps of an algorithm.
    /// - Parameter steps: The steps performed by an algorithm.
    /// - Returns: An array of steps without any duplicates.
    func removeDuplicateSteps(steps: [AlgorithmStep]) -> [AlgorithmStep]{
        
        /// Set that is used to store unique values.
        var encountered = Set<[Double]>()
        
        /// The array that contains no-duplicated steps of the algorithm.
        var noDuplicatedSteps: [AlgorithmStep] = []
        
        // iterathe through all of the steps of the algorithm to find any potential duplicates.
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
