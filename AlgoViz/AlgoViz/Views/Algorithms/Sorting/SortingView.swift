//
//  SortingView.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 7/25/21.
//

import SwiftUI

/// Construct an algorithm based on its information.
/// - Parameter info: The information pertaining to the algorithm.
/// - Parameter data: The data the algorithm will use.
/// - Returns: An algorithm instance.
func getAlgorithmFromInfo(info: AlgorithmInformation, data: [Double]) -> Algorithm {
    
    switch info.name {
    case "Selection Sort":
        return SelectionSort(info: info, data: data)
    case "Insertion Sort":
        return InsertionSort(info: info, data: data)
    case "Bubble Sort":
        return BubbleSort(info: info, data: data)
    case "Merge Sort":
        return MergeSort(info: info, data: data)
    case "Quick Sort":
        return QuickSort(info: info, data: data)
    default:
        return SelectionSort(info: info, data: data) // change to algorithm eventually
    }
}

/// View that will contain the main view for the sorting algorithms.
struct SortingView: View{
    @EnvironmentObject var modelData: ModelData
    @State private var selectedSort: AlgorithmInformation?

    
    var body: some View {
        
        // generate random data for the view.
        let algorithmData: AlgorithmData = generateDataForAlgorithm(sizeOfData: 15)
        
        NavigationView {
            List(selection: $selectedSort) {
                ForEach(modelData.sortingAlgorithms){ sortingAlgorithmInfo in
                    let selectedAlgorithm: Algorithm = getAlgorithmFromInfo(info: sortingAlgorithmInfo, data: algorithmData.data)
                    
                    NavigationLink(
                        destination: SortingChart(selectionSortSteps: selectedAlgorithm.run(), algorithmData: algorithmData)){
                        SortingRowView(algorithm: sortingAlgorithmInfo)
                    }
                    .tag(sortingAlgorithmInfo.name)
                }
            }
            .navigationTitle("Sorting Algorithms")
            .frame(minWidth: 300)
        }
    }
}

struct SortingView_Previews: PreviewProvider {
    static var previews: some View {
        SortingView()
            .environmentObject(ModelData())
    }
}
