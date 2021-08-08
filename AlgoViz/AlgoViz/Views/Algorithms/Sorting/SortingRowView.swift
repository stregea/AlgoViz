//
//  SortingRowView.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/8/21.
//

import SwiftUI

struct SortingRowView: View {
    var algorithm: AlgorithmInformation
    
    
    var body: some View {
        
        // Modify the description to contain only a certain number of characters..
        let endOffset:Int = algorithm.description.count < 100 ? algorithm.description.count : 100
        
        let start = algorithm.description.index(algorithm.description.startIndex, offsetBy: 0)
        let end = algorithm.description.index(algorithm.description.startIndex, offsetBy: endOffset)
        let range = start..<end
        let description: String = algorithm.description[range] + "..."
        
        HStack {
            // place image here eventually?
            
            VStack(alignment: .leading) {
                Text(algorithm.name)
                    .bold()
                
                Text(description)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

struct SortingRowView_Previews: PreviewProvider {
    static var previews: some View {
        SortingRowView(algorithm: ModelData().sortingAlgorithms[0])
            .previewLayout(.fixed(width: 300, height: 70))

    }
}
