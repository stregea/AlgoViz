//
//  SortingChart.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/1/21.
//

import SwiftUI


struct SortingChart: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        let algorithmData: ([Double], Range<Double>) = generateDataForAlgorithm(sizeOfData: 15)
        
        let selectionSort: Algorithm = SelectionSort(
            info: modelData.sortingAlgorithms[0],
            data: algorithmData.0
        )
        
        let selectionSortSteps: [AlgorithmStep] = selectionSort.run()
        
        //        Text("here")
        
        //            ForEach(selectionSortSteps, id: \.id) { step in
        ChartBars (
            steps: selectionSortSteps,
            range: algorithmData.1,
            color: .gray
        ).padding()
        
        //                .animation(nil)
        //            Text(String(step.id))
        //            }
        //        self.removeFromSuperView()
        //            .onAppear()
        
        
    }
}

struct SortingChart_Previews: PreviewProvider {
    static var previews: some View {
        SortingChart()
            .environmentObject(ModelData())
    }
}
