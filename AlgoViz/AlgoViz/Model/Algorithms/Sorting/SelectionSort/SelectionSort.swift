//
//  SelectionSort.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/1/21.
//

import Foundation

class SelectionSort:Algorithm {
    
    /// Perform selection sort.
    override func run() -> [AlgorithmStep]{
        var sortingSteps: [AlgorithmStep] = []
        var iterations: Int = 0
        
        for i in 0..<self.data!.count {
            
            var minIndex: Int = i
            
            for j in (i + 1)..<self.data!.count {
                if self.data![j] < self.data![minIndex] {
                    minIndex = j
                }
            }
            
            self.data!.swapAt(minIndex, i)
//            swap(&self.data![minIndex], &self.data![i])
            
            sortingSteps.append(
                AlgorithmStep(
                    id: iterations,
                    data: self.data!
                )
            )
            
            print(self.data!)
            iterations += 1
        }
        
        return sortingSteps
    }
}
