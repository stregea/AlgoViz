//
//  SelectionSort.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/1/21.
//

import Foundation

/// Class that will be used to perform SelectionSort.
class SelectionSort:Algorithm {
    
    /// Perform Selection Sort.
    /// - Returns: An array of steps SelectionSort performed.
    override func run() -> [AlgorithmStep]{
        
        /// Array to contain each iteration (steps) of the sort.
        var steps: [AlgorithmStep] = [
            // Store the initial array contents as step 0.
            AlgorithmStep(
                id: 0,
                data: self.data!.contents
            )
        ]
        
        for i in 0..<self.data!.contents.count-1 {
            
            // Assume the smallest element is the current element's index.
            var smallestElementIndex: Int = i
            
            // Search through the rest of the array to find the next smallest element.
            for j in (i + 1)..<self.data!.contents.count {
                
                // If the new element is less than the current smallest element,
                // update the smallestElement value's index.
                if self.data!.contents[j] < self.data!.contents[smallestElementIndex] {
                    smallestElementIndex = j
                }
            }
            
            if smallestElementIndex != i {
                self.data!.contents.swapAt(smallestElementIndex, i)
                
                // Add the latest step of the algorithm to the list of steps.
                steps.append(
                    AlgorithmStep(
                        id: steps.count + 1,
                        data: self.data!.contents
                    )
                )
            }
            
        }
        
        // remove any potential duplicate steps. -- may just be a selection sort issue.
        steps = self.removeDuplicateSteps(steps: steps)
        return steps
    }
}
