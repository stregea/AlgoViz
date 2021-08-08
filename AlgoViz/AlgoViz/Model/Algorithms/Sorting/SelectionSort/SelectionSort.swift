//
//  SelectionSort.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/1/21.
//

import Foundation

class SelectionSort:Algorithm {
    func remove_duplicates(steps: [AlgorithmStep]) -> [AlgorithmStep]{
        var encountered = Set<[Double]>()
        var result: [AlgorithmStep] = []
        
        for step in steps {
            if encountered.contains(step.data) {
                // Do not add a duplicate element.
            }
            else {
                // Add value to the set.
                encountered.insert(step.data)
                // ... Append the value.
                result.append(step)
            }
        }
        for step in result {
            print(step)
        }
        return result
    }
    /// Perform selection sort.
    override func run() -> [AlgorithmStep]{
        var sortingSteps: [AlgorithmStep] = []
        var iterations: Int = 0
        
        sortingSteps.append(
            AlgorithmStep(
                id: iterations,
                data: self.data!
            )
        )

        for i in 0..<self.data!.count-1 {
            
            var minIndex: Int = i
            
            for j in (i + 1)..<self.data!.count {
                if self.data![j] < self.data![minIndex] {
                    minIndex = j
                }
            }
            
            let temp = self.data![minIndex]
            self.data![minIndex] = self.data![i]
            self.data![i] = temp
            
//            self.data!.swapAt(minIndex, i)
            
            iterations += 1
            
            sortingSteps.append(
                AlgorithmStep(
                    id: iterations,
                    data: self.data!
                )
            )
        }
        print(iterations)
        sortingSteps = remove_duplicates(steps: sortingSteps)
        return sortingSteps
    }
}
