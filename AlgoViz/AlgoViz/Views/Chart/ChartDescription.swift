//
//  ChartDescription.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/12/21.
//

import SwiftUI

/// View that will display and handle the algorithm description  below the chart within the ChartView.
struct ChartDescription: View {
    
    /// The algorithm currently being used.
    let algorithm: Algorithm
    
    var body: some View {
        VStack {
            Text("Description")
                .font(.title2)
                .bold()
                .padding()
            
            Text("\( (algorithm.info == nil) ? "" : algorithm.info!.description )")
        }
        .padding()

    }
}

struct ChartDescription_Previews: PreviewProvider {
    static var previews: some View {
                let modelData: ModelData = ModelData()
                let algorithmData = generateDataForAlgorithm(sizeOfData: modelData.dataSetSize)
                let selectionSort: Algorithm = SelectionSort(
                    info: modelData.sortingAlgorithms[0],
                    data: algorithmData
                )
        ChartDescription(algorithm: selectionSort)
    }
}
