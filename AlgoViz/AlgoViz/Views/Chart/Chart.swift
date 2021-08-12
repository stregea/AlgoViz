//
//  Chart.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/12/21.
//

import SwiftUI

/// View that will allow the user to view sorting algorithms.
struct Chart: View {
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
        let title: String = (algorithm.info == nil) ? "Unknown Algorithm" : algorithm.info!.name
        
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
                
                ChartButtons(algorithm: algorithm,
                             stepIndex: $currentStepIndex,
                             reachedStartOfArray: $reachedStartOfArray,
                             reachedEndOfArray: $reachedEndOfArray
                )
                .padding()
                
                Divider()
                
                ChartDescription(
                    algorithm: algorithm
                )
                
            } // VStack
            .toolbar(content: {
                // randomize button -- move to navbar.
                Button(action: {
                    randomizeData()
                }){
                    Image(systemName: "shuffle")
                }
                
            })
        } // ScrollView
        .navigationBarTitle(title)
        .navigationBarTitleDisplayMode(.inline)
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
}

struct Chart_Previews: PreviewProvider {
    static var previews: some View {
        let _: ModelData = ModelData()
    }
}
