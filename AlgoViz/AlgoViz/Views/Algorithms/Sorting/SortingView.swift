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
func getAlgorithmFromInfo(info: AlgorithmInformation, data: AlgorithmData) -> Algorithm {
    var alg: Algorithm
    
    switch info.name {
    case "Selection Sort":
        alg = SelectionSort(info: info, data: data)
    case "Insertion Sort":
        alg = InsertionSort(info: info, data: data)
    case "Bubble Sort":
        alg = BubbleSort(info: info, data: data)
    case "Merge Sort":
        alg = MergeSort(info: info, data: data)
    case "Quick Sort":
        alg = QuickSort(info: info, data: data)
    default:
        alg = Algorithm(info: info, data: data)
    }
    
    alg.steps = alg.run()
    return alg
}

/// View that will contain the main view for the sorting algorithms.
struct SortingView: View{
    
    /// The environment object,
    @EnvironmentObject var modelData: ModelData
    
    @State private var algorithmData: AlgorithmData = generateDataForAlgorithm(sizeOfData: 15)
    
    @State private var selectedAlgorithm: Algorithm? = nil
    
    var body: some View {
    
        NavigationView {
            List {

                ForEach(modelData.sortingAlgorithms){ algorithmInformation in
                    
                    let algorithm = (selectedAlgorithm == nil) ? getAlgorithmFromInfo(info: algorithmInformation, data: algorithmData) : selectedAlgorithm!
                                        
                    NavigationLink(
                        destination: SortingChart(algorithm: algorithm, algorithmSteps: algorithm.steps!))
                    {
                        SortingRowView(algorithm: algorithmInformation)
                    }
                    
                    // update the data when the user goes back to the main screen.
                    .onDisappear(){
                        algorithmData = generateDataForAlgorithm(sizeOfData: 15)

                        
                        // want to eventually be able to get this to work with .onAppear to have view already updated before
                        // moving into the selected algorithm view.
                        selectedAlgorithm = getAlgorithmFromInfo(info: algorithmInformation, data: algorithmData)
                    }
                    .onAppear(){
//                        selectedAlgorithm = getAlgorithmFromInfo(info: algorithmInformation, data: algorithmData)
                    }
                    .tag(algorithmInformation.name)
                    
                }
                
            }
            .navigationTitle("Sorting Algorithms")
            .frame(minWidth: 300)
        }
//        .focusedValue(\.selectedAlgorithm, $modelData.sortingAlgorithms[index ?? 0])

    }
}

struct SortingView_Previews: PreviewProvider {
    static var previews: some View {
        SortingView()
            .environmentObject(ModelData())
    }
}
