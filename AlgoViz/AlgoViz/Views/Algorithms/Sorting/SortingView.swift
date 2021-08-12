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
    
    return alg
}

/// View that will contain the main view for the sorting algorithms.
struct SortingView: View{
    
    /// The environment object,
    @EnvironmentObject var modelData: ModelData
    
    /// The data the algorithms will be using.
    @State private var algorithmData: AlgorithmData = generateDataForAlgorithm(sizeOfData: 15)
    
    var body: some View {
        
        NavigationView {
            List {
                
                ForEach(modelData.sortingAlgorithms){ algorithmInformation in
                    
                    let algorithm = getAlgorithmFromInfo(info: algorithmInformation, data: algorithmData)
                    
                    NavigationLink(destination: Chart(algorithmData: $algorithmData, algorithm: algorithm))
                    {
                        SortingRowView(algorithmInfo: algorithmInformation)
                    }
                    .tag(algorithmInformation.name)
                }
                
            }
            .navigationTitle("Sorting Algorithms")
            .frame(minWidth: 300)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SortingView_Previews: PreviewProvider {
    static var previews: some View {
        SortingView()
            .environmentObject(ModelData())
    }
}
