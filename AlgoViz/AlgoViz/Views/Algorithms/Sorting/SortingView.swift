//
//  SortingView.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 7/25/21.
//

import SwiftUI

struct SortingView: View{
    var body: some View {
        VStack {
            Text("Sorting View")
                .padding()
            SortingChart()
        }
    }
}

struct SortingView_Previews: PreviewProvider {
    static var previews: some View {
        SortingView()
    }
}
