//
//  ChartCapsule.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/1/21.
//

import SwiftUI

/// Subview that will be used to create a single bar within the ChartBars view.
struct ChartCapsule: View {
    
    /// The height of the capsule.
    var height: CGFloat
    
    /// The range of the capsule.
    var range: Range<Double>
    
    /// The overall range of the capsule.
    var overallRange: Range<Double>
    
    /// The text to display below the capsule.
    var text: String
    
    /// The ratio to determine the height of the capsule.
    var heightRatio: CGFloat {
        max(CGFloat(magnitude(of: range) / magnitude(of: overallRange)), 0.15)
    }

    /// The ration to help determine the offset the of capsule.
    var offsetRatio: CGFloat {
        CGFloat((range.lowerBound - overallRange.lowerBound) / magnitude(of: overallRange))
    }

    var body: some View {
        VStack {
            Spacer()
            
            Capsule()
                .fill(Color.white)
                .frame(height: height * heightRatio)
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
