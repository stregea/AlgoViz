//
//  SortingView.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 7/25/21.
//

import SwiftUI

struct SortingView: View{
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        VStack {
            
            let algorithmData: ([Double], Range<Double>) = generateDataForAlgorithm(sizeOfData: 15)
            
            let selectionSort: Algorithm = SelectionSort(
                info: modelData.sortingAlgorithms[0],
                data: algorithmData.0
            )
            
            SortingChart(selectionSortSteps: selectionSort.run(), algorithmData: algorithmData)
        }
    }
}

struct SortingView_Previews: PreviewProvider {
    static var previews: some View {
        SortingView()
            .environmentObject(ModelData())
    }
}
