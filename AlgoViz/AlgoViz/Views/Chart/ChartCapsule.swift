//
//  ChartCapsule.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/1/21.
//

import SwiftUI

struct ChartCapsule: View {
    var height: CGFloat
    var range: Range<Double>
    var overallRange: Range<Double>
    var text: String
    var heightRatio: CGFloat {
        max(CGFloat(magnitude(of: range) / magnitude(of: overallRange)), 0.15)
    }

    var offsetRatio: CGFloat {
        CGFloat((range.lowerBound - overallRange.lowerBound) / magnitude(of: overallRange))
    }

    var body: some View {
        VStack {
            Capsule()
                .fill(Color.white)
                .frame(height: height * heightRatio)
                .offset(x: 0, y: height * -offsetRatio)
            Text(text)
                .font(.headline)
        }
    }
}

struct ChartCapsule_Previews: PreviewProvider {
    static var previews: some View {
        // The graph that uses the capsule tints it by multiplying against its
        // base color of white. Emulate that behavior here in the preview.
        ChartCapsule(height: 150, range: 10..<50, overallRange: 0..<100, text: "Hello, world")
            .colorMultiply(.blue)
    }
}
