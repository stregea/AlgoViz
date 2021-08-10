//
//  SortingChart.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/1/21.
//

import SwiftUI

/// View that will allow the user to view sorting algorithms.
struct SortingChart: View {
            
    let algorithm: Algorithm
    
    /// Array to hold each step that an algorithm performs.
    let algorithmSteps: [AlgorithmStep]
    
    /// pointer to keep track of the current step of the array of algorithm steps
    @State private var currentStepIndex: Int = 0
    
    /// Boolean to determine if the pointer of the array has reached the start of the array
    @State private var reachedStartOfArray: Bool = true
    
    /// Boolean to determine if the pointer of the array has reached the end of the array
    @State private var reachedEndOfArray: Bool = false
    
    var body: some View {
        
        ScrollView {
            VStack {
                
                // Step counter
                Text("Step \(currentStepIndex)/\(algorithmSteps.count - 1)")
                    .font(.headline)
                    .padding()
                
                // Display the Chart
                ChartBars(
                    step: algorithmSteps[currentStepIndex], // this prevents an array out of bounds error.
                    range: algorithm.data!.dataRange,
                    color: .gray
                )
                .frame(height: 240)
                
                // Buttons to proceed either forwards or backwards in the array
                HStack(alignment: .bottom) {
                    
                    // Previous button
                    Button(
                        action: {
                            if !reachedStartOfArray {
                                reachedEndOfArray = false
                                self.currentStepIndex -= 1
                                
                                
                                // disable this button if at the beginning of the array.
                                if self.currentStepIndex == 0 {
                                    reachedStartOfArray = true
                                }
                            }
                        }
                    ) {
                        Text("Previous Step")
                    }
                    .disabled(reachedStartOfArray)
                    
                    Spacer()
                    
                    // Next button
                    Button(action: {
                        if !reachedEndOfArray {
                            reachedStartOfArray = false
                            self.currentStepIndex += 1
                            
                            // disable this button if at the end of the array.
                            if self.currentStepIndex == algorithmSteps.count-1 {
                                reachedEndOfArray = true
                            }
                        }
                    }) {
                        Text("Next Step")
                    }
                    .disabled(reachedEndOfArray)
                    
                }
                .padding()
            }
        }
    }
}

struct SortingChart_Previews: PreviewProvider {
    static var previews: some View {
        let modelData: ModelData = ModelData()
        
        let algorithmData: AlgorithmData = generateDataForAlgorithm(sizeOfData: 15)
        
        let selectionSort: Algorithm = SelectionSort(
            info: modelData.sortingAlgorithms[0],
            data: algorithmData
        )
        
        SortingChart(algorithm: selectionSort, algorithmSteps: selectionSort.run())
    }
}
