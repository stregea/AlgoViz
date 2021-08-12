//
//  SortingRowView.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/8/21.
//

import SwiftUI

struct SortingRowView: View {
    
    var algorithmInfo: AlgorithmInformation
    
    
    var body: some View {
        
        // Modify the description to contain only a certain number of characters..
        let endOffset:Int = algorithmInfo.description.count < 100 ? algorithmInfo.description.count : 100
        
        // Build the string preview to display
        let start = algorithmInfo.description.index(algorithmInfo.description.startIndex, offsetBy: 0)
        let end = algorithmInfo.description.index(algorithmInfo.description.startIndex, offsetBy: endOffset)
        let range = start..<end
        
        let previewDescription: String = algorithmInfo.description[range] + "..."
        
        HStack {
            // place image here eventually?
            
            VStack(alignment: .leading) {
                Text(algorithmInfo.name)
                    .bold()
                
                Text(previewDescription)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

struct SortingRowView_Previews: PreviewProvider {
    static var previews: some View {
        SortingRowView(algorithmInfo: ModelData().sortingAlgorithms[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
