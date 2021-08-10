//
//  QuickSort.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/9/21.
//

import Foundation
class QuickSort: Algorithm {
    
    private func partition(lowIndex: Int, highIndex: Int) -> Int{
        let pivot: Double = self.data![highIndex]
        
        var i = lowIndex - 1
        var j = lowIndex
        
        while j <= highIndex - 1 {
            
            // If current element is smaller than or
            // equal to pivot
            if self.data![j] <= pivot {
                i += 1
                
                // swap arr[i] and arr[j]
                let temp = self.data![i]
                self.data![i] = self.data![j]
                self.data![j] = temp
            }
            j += 1
        }
        
        // swap arr[i+1] and arr[high] (or pivot)
        let temp = self.data![i + 1]
        self.data![i + 1] = self.data![highIndex]
        self.data![highIndex] = temp
        
        return i + 1
    }
    
    override func run() -> [AlgorithmStep] {
        /// Array to contain each iteration (steps) of the sort.
        var steps: [AlgorithmStep] = [
            // Store the initial array contents as step 0.
            AlgorithmStep(
                id: 0,
                data: self.data!
            )
        ]
        
        var leftIndex: Int = 0
        var rightIndex: Int = self.data!.count - 1
        
        var stack: Stack = Stack<Int>()
        
        stack.push(leftIndex)
        stack.push(rightIndex)
        
        // Keep popping the stack while it is not empty
        while !stack.isEmpty() {
            
            // pop both the starting and end indices
            rightIndex = stack.pop()!
            leftIndex = stack.pop()!
            
            // set the pivot element at its correct position within the sorted array
            let p = partition(lowIndex: leftIndex, highIndex: rightIndex)
            
            // If there are elements on left side of pivot,
            // then push left side to stack
            if (p - 1) > leftIndex {
                stack.push(leftIndex)
                stack.push(p - 1)
            }
            
            // If there are elements on right side of pivot,
            // then push right side to stack
            if (p + 1) < rightIndex {
                stack.push(p + 1)
                stack.push(rightIndex)
            }
            
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
