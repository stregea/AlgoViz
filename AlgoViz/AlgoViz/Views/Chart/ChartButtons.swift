//
//  ChartButtons.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/12/21.
//

import SwiftUI

struct ChartButtons: View {
    
    /// The algorithm to use.
    let algorithm: Algorithm
    
    /// pointer to keep track of the current step of the array of algorithm steps
    @Binding var stepIndex: Int
    
    /// Boolean to determine if the pointer of the array has reached the start of the array
    @Binding var reachedStartOfArray: Bool
    
    /// Boolean to determine if the pointer of the array has reached the end of the array
    @Binding var reachedEndOfArray: Bool
    
    var body: some View {
        HStack(spacing: 100) {
            
            // Previous button
            Button(
                action: {
                    handlePreviousButton()
                }
            ) {
                Image(systemName: "chevron.left.circle")
            }
            .disabled(reachedStartOfArray)
            
            
            // Next button
            Button(action: {
                self.handleNextButton()
            }) {
                Image(systemName: "chevron.right.circle")
            }
            .disabled(reachedEndOfArray)
            
        }
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
            self.stepIndex -= 1
            
            
            // disable this button if at the beginning of the array.
            if self.stepIndex == 0 {
                self.disablePreviousButton()
            }
        }
    }
    
    /// Handle how the 'Next' button will funcition.
    private func handleNextButton(){
        if !reachedEndOfArray {
            reachedStartOfArray = false
            self.stepIndex += 1
            
            // disable this button if at the end of the array.
            if self.stepIndex == algorithm.steps!.count-1 {
                self.disableNextButton()
            }
        }
    }
}

//struct ChartButtons_Previews: PreviewProvider {
//    static var previews: some View {
//        ChartButtons()
//    }
//}
