//
//  MergeSort.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/8/21.
//

import Foundation

/// Class that will be used to perform MergeSort.
class MergeSort: Algorithm {
    
    /// Iterative function to oerform a merge between the sorted array and the buffer array.
    /// - Parameter size: The size of the sorted array.
    /// - Parameter leftIndex: The index to start at on the left half of the sorted sub array.
    /// - Parameter sortedArray: The array to hold all sorted contents.
    /// - Parameter buffer: Subarray that temporarily holds values to help iteratively sort the sortedArray.
    private func merge(size: Int, leftIndex: Int, sortedArray: inout [Double], buffer: inout [Double]){
        var left: Int = leftIndex
        var right: Int = min(left+size, self.data!.count)
        
        let leftLimit: Int = right
        let rightLimit: Int = min(right+size, self.data!.count)
        
        var i = left
        
        // Compare the two sub arrays and merge them in the sorted order
        while left < leftLimit && right < rightLimit {
            if sortedArray[left] <= sortedArray[right] {
                buffer[i] = sortedArray[left];
                i += 1
                left += 1
            }
            else {
                buffer[i] = sortedArray[right];
                i += 1
                right += 1
            }
        }
        
        // If there are elements in the left sub array, add it to the result.
        while left < leftLimit {
            buffer[i] = sortedArray[left];
            i += 1
            left += 1
        }
        
        // If there are elements in the right sub array, add it to the result.
        while right < rightLimit {
            buffer[i] = sortedArray[right];
            
            i += 1
            right += 1
        }
    }
    
    /// Perform the iterative approach (top-down) to merge sort.
    /// - Parameter data: The data to sort.
    /// - Returns: An array of steps MergeSort performed.
    private func mergeSort(data: [Double]) -> [AlgorithmStep]{
        
        // two sub arrays that will be used for sorting.
        var sortedArray: [Double] = data
        var buffer: [Double] = [Double](repeating: -1, count: data.count)
        
        // Store the initial array contents as step 0.
        var steps: [AlgorithmStep] = [
            AlgorithmStep(
                id: 0,
                data: self.data!
            )
        ]
        
        var currentSize = 1
        while currentSize < data.count {
            var leftIndex = 0
            
            while leftIndex < data.count {
                
                // Merge the sub arrays
                merge(size: currentSize, leftIndex: leftIndex, sortedArray: &sortedArray, buffer: &buffer)
                
                leftIndex += (currentSize * 2)
            }
            
            // Swap the sub arrays, then merge them in the next iteration..
            swap(&sortedArray, &buffer)
            
            steps.append(
                AlgorithmStep(
                    id: steps.count + 1,
                    data: sortedArray
                )
            )
            
            currentSize *= 2
        }
        
        return steps
    }
    
    /// Run Iterative Merge Sort (Bottom-up approach)
    /// - Returns: An array of steps MergeSort performed.
    override func run() -> [AlgorithmStep] {
        return mergeSort(data: self.data!)
    }
}
