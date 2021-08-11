//
//  SortingChart.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/1/21.
//

import SwiftUI

/// View that will allow the user to view sorting algorithms.
struct SortingChart: View {
    
    /// The data for the algorithm.
    @Binding var algorithmData: AlgorithmData
    
    /// The algorithm to use.
    let algorithm: Algorithm
    
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
                Text("Step \(self.currentStepIndex)/\(self.algorithm.steps!.count - 1)")
                    .font(.headline)
                    .padding()
                
                // Display the Chart
                ChartBars(
                    step: self.algorithm.steps![self.currentStepIndex], // this prevents an array out of bounds error.
                    range: self.algorithm.data!.dataRange,
                    color: .gray
                )
                .frame(height: 240)
                
                // Buttons to proceed either forwards or backwards in the array
                HStack(alignment: .bottom) {
                    
                    // Previous button
                    Button(
                        action: {
                            self.handlePreviousButton()
                        }
                    ) {
                        Text("Previous Step")
                    }
                    .disabled(reachedStartOfArray)
                    
                    Spacer()
                    
                    // randomize button -- move to navbar.
                    Button(action: {
                        randomizeData()
                    }){
                        Text("Randomize")
                    }
                    
                    Spacer()
                    
                    // Next button
                    Button(action: {
                        self.handleNextButton()
                    }) {
                        Text("Next Step")
                    }
                    .disabled(reachedEndOfArray)
                    
                }
                .padding()
            }
        }.onAppear(){
            randomizeData()
        }
    }

    /// Randomize the data being used within each view.
    private func randomizeData() {
        // change the data used for the algorithm
        self.algorithmData = generateDataForAlgorithm(sizeOfData: 15)
        
        // update the data and the steps used for the new data.
        self.algorithm.updateData(data: algorithmData)
        
        // change the current step index to 0 to prevent array out of bounds errors.
        self.currentStepIndex = 0
        
        if self.currentStepIndex <= 0 {
            // Prevent UI mistakes by resetting the buttons.
            self.resetButtons()
        }
    }
    
    /// Reset the buttons on the SortingChart View.
    private func resetButtons() {
        self.reachedStartOfArray = true
        self.reachedEndOfArray = false
    }
    
    /// Disable the 'Previous' button.
    private func disablePreviousButton() {
        // update the state variable to disable the button.
        self.reachedStartOfArray = true
    }
    
    /// Disable the 'Next' button.
    private func disableNextButton() {
        // update the state variable to disable the button.
        self.reachedEndOfArray = true
    }
    
    /// Handle how the 'Previous' button will function.
    private func handlePreviousButton(){
        if !self.reachedStartOfArray {
            self.reachedEndOfArray = false
            self.currentStepIndex -= 1
            
            
            // disable this button if at the beginning of the array.
            if self.currentStepIndex == 0 {
                self.disablePreviousButton()
            }
        }
    }
    
    /// Handle how the 'Next' button will funcition.
    private func handleNextButton(){
        if !reachedEndOfArray {
            reachedStartOfArray = false
            self.currentStepIndex += 1
            
            // disable this button if at the end of the array.
            if self.currentStepIndex == algorithm.steps!.count-1 {
                self.disableNextButton()
            }
        }
    }
}

struct SortingChart_Previews: PreviewProvider {
    static var previews: some View {
        let _: ModelData = ModelData()
        
//        var algorithmData: AlgorithmData = generateDataForAlgorithm(sizeOfData: 15)
//
//        let selectionSort: Algorithm = SelectionSort(
//            info: modelData.sortingAlgorithms[0],
//            data: algorithmData
//        )
        
        //        SortingChart(algorithmData: algorithmData, algorithm: selectionSort)
    }
}
