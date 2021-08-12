//
//  ContentView.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 7/25/21.
//

import SwiftUI

enum Tab {
    case sorting
    case pathfinding
}

struct ContentView: View {
    @State private var selection: Tab = .sorting

    var body: some View {
        
        TabView(selection: $selection) {
            SortingView()
            .tabItem {
                Label("Sorting Algorithms", systemImage: "chart.bar")
            }
            .tag(Tab.sorting)

            PathfinderView()
            .tabItem {
                Label("Pathfinding", systemImage: "arrowshape.zigzag.forward")
            }
            .tag(Tab.pathfinding)
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .environmentObject(ModelData())
//    }
//}
