//  ChartBars.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/5/21.
//

import SwiftUI

extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
            .delay(0.03 * Double(index))
    }
}

/// Determine the magnitude of a range.
/// - Parameter range: The range to determine the magnitude of.
/// - Returns: The magnitude of a specified range.
func magnitude(of range: Range<Double>) -> Double {
    return range.upperBound - range.lowerBound
}

/// Subview to be called within SortingView that will display a chart of several bars.
struct ChartBars: View {
    /// The current step of the algorithm.
    var step: AlgorithmStep
    
    /// The overall range of the data.
    var range: Range<Double>
    
    /// The color of the capsules within the chart.
    var color: Color
    
    var body: some View {
        
        return GeometryReader { proxy in
            HStack(alignment: .bottom, spacing: proxy.size.width / 120) {
                
                ForEach(step.data.indices) { index in
                    
                    ChartCapsule(
                        height: CGFloat(step.data[index] * 2),
                        range: range,
                        overallRange: range,
                        text: String(Int(step.data[index]))
                    )
                    .colorMultiply(color)
                    .transition(.slide)
                    .animation(.ripple(index: index))
                }
            }
            .padding()
        }
    }
}

struct ChartBars_Previews: PreviewProvider {
    static var previews: some View {
        let modelData: ModelData = ModelData()
        let algorithmData = generateDataForAlgorithm(sizeOfData: modelData.dataSetSize)
        let selectionSort: Algorithm = SelectionSort(
            info: modelData.sortingAlgorithms[0],
            data: algorithmData
        )
            
        
        ChartBars(
            step: selectionSort.steps![selectionSort.steps!.count-1],
            range: algorithmData.dataRange,
            color: .gray
        )
    }
}
