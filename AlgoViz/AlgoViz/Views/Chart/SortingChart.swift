//
//  SortingChart.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/1/21.
//

import SwiftUI


struct SortingChart: View {
    
    let selectionSortSteps: [AlgorithmStep]
    let algorithmData: ([Double], Range<Double>)
    
    /// pointer to keep track of the current step of the array of algorithm steps
    @State private var currentStepIndex: Int = 0

    /// Boolean to determine if the pointer of the array is located at the start of the array
    @State private var reachedStartOfArray: Bool = true
    @State private var reachedEndOfArray: Bool = false
    


    
    var body: some View {

        ScrollView {
            VStack {
                
                // Display the Chart
                ChartBars(
                    step: selectionSortSteps[currentStepIndex],
                    range: algorithmData.1,
                    color: .gray
                )
                .padding()
                .offset(x: 0, y: 58)
                
                // Step counter
                Text("Step \(currentStepIndex)/\(selectionSortSteps.count - 1)")
                    .font(.headline)
                
                
                // Buttons to proceed either forwards or backwards in the array
                HStack(alignment: .bottom) {
                    
                    // Previous button
                    Button(
                        action: {

                            if !reachedStartOfArray {
                                reachedEndOfArray = false
                                self.currentStepIndex -= 1
                                
                                
                                //
                                if self.currentStepIndex == 0 {
                                    reachedStartOfArray = true
                                }
                            }
                        }
                    ) {
                        Text("Previous Step")
                    }
                    .padding()
                    .disabled(reachedStartOfArray)
                    
                    // Next button
                    Button(action: {
                        if !reachedEndOfArray {
                            reachedStartOfArray = false
                            self.currentStepIndex += 1
                            
                            // disable the button if at the end of the array
                            if self.currentStepIndex == selectionSortSteps.count-1 {
                                reachedEndOfArray = true
                            }
                        }
                    }) {
                        Text("Next Step")
                    }.padding()
                    .disabled(reachedEndOfArray)

                }.offset(x: 0, y: 205)

            }
        }
        
    }
}

struct SortingChart_Previews: PreviewProvider {
    static var previews: some View {
        let modelData: ModelData = ModelData()
        
        let algorithmData: ([Double], Range<Double>) = generateDataForAlgorithm(sizeOfData: 15)
        
        let selectionSort: Algorithm = SelectionSort(
            info: modelData.sortingAlgorithms[0],
            data: algorithmData.0
        )
        
        SortingChart(selectionSortSteps: selectionSort.run(), algorithmData: generateDataForAlgorithm(sizeOfData: 15))
    }
}
