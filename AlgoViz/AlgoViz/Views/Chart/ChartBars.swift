//
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


struct ChartBars: View {
    var steps: [AlgorithmStep]
    var range: Range<Double>
    var color: Color
    
    var body: some View {
        let maxMagnitude = steps[0].data.map{_ in magnitude(of: range)}.max()!
        
        let heightRatio = 1 - CGFloat(maxMagnitude / magnitude(of: range))

        return GeometryReader { proxy in
            HStack(alignment: .bottom, spacing: proxy.size.width / 120) {
                
                
                ForEach(steps[0].data.indices) { index in
                    ChartCapsule(
                        height: CGFloat(steps[0].data[index] * 2),
                        range: range,
                        overallRange: range,
                        text: String(Int(steps[0].data[index]))
                    )
                        .colorMultiply(color)
                        .transition(.slide)
                        .animation(.ripple(index: index))
                }
                .offset(x: 0, y: proxy.size.height * heightRatio)
                
            }
        }
    }
}

func rangeOfRanges<C: Collection>(_ ranges: C) -> Range<Double>
    where C.Element == Range<Double> {
    guard !ranges.isEmpty else { return 0..<0 }
    let low = ranges.lazy.map { $0.lowerBound }.min()!
    let high = ranges.lazy.map { $0.upperBound }.max()!
    return low..<high
}

func magnitude(of range: Range<Double>) -> Double {
    return range.upperBound - range.lowerBound
}

struct ChartBars_Previews: PreviewProvider {
    static var previews: some View {
        let modelData: ModelData = ModelData()
        let algorithmData = generateDataForAlgorithm(sizeOfData: 15)
        let selectionSort: Algorithm = SelectionSort(
            info: modelData.sortingAlgorithms[0],
            data: algorithmData.0
        )
        
        let selectionSortSteps: [AlgorithmStep] = selectionSort.run()
        
        
        ChartBars(
            steps: selectionSortSteps,
            range: algorithmData.1,
            color: .gray
        )
    }
}
