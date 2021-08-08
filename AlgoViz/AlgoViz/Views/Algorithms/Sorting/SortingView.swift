//
//  SortingView.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 7/25/21.
//

import SwiftUI

/// View that will contain the main view for the sorting algorithms.
struct SortingView: View{
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        VStack {
            
            // generate random data for the view.
            let algorithmData: ([Double], Range<Double>) = generateDataForAlgorithm(sizeOfData: 15)
            
            // todo: add picker to select wanted algorithm
            // create algorithm object.
            // send into the Sorting Chart view.
            
            let selectionSort: Algorithm = SelectionSort(
                info: modelData.sortingAlgorithms[0], // change this to a dynamic index later.
                data: algorithmData.0
            )
            
            // Display the Bar Chart View to perform the sort.
            SortingChart(selectionSortSteps: selectionSort.run(), algorithmData: algorithmData)
            
            // move the step and previous/next buttons here?
        }
    }
}

struct SortingView_Previews: PreviewProvider {
    static var previews: some View {
        SortingView()
            .environmentObject(ModelData())
    }
}
