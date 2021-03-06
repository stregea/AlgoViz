//
//  BubbleSort.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/8/21.
//

import Foundation

/// Class that will be used to perform BubbleSort.
class BubbleSort: Algorithm {
    
    /// Perform BubbleSort.
    /// - Returns: An array of steps BubbleSort performed.
    override func run() -> [AlgorithmStep] {
        /// The size of the array
        let size = self.data!.contents.count-1
        
        /// Array to contain each iteration (steps) of the sort.
        var steps: [AlgorithmStep] = [
            // Store the initial array contents as step 0.
            AlgorithmStep(
                id: 0,
                data: self.data!.contents
            )
        ]
        
        for i in 0..<size {
            var swapped: Bool = true
            
            for j in 0..<size-i {
                if self.data!.contents[j] > self.data!.contents[j+1] {
                    self.data!.contents.swapAt(j, j+1)
                    swapped = true
                    
                    // mini step -- store when able to get full animation working.
                    //                steps.append(
                    //                    AlgorithmStep(
                    //                        id: steps.count + 1,
                    //                        data: self.data!
                    //                    )
                    //                )
                }
            }
            
            // Add the latest step of the algorithm to the list of steps.
            steps.append(
                AlgorithmStep(
                    id: steps.count + 1,
                    data: self.data!.contents
                )
            )
            
            if !swapped {
                break
            }
        }
        
        return self.removeDuplicateSteps(steps: steps)
    }
}
