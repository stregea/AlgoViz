//
//  ContentView.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 7/25/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
//            Text("AlgoViz")
            
            NavigationView{
                VStack{
                    NavigationLink(destination: PathfinderView()) {
                        Text("Pathfinding Algorithms")
                    }
                    .padding()
                    
                    NavigationLink(destination: SortingView()) {
                        Text("Sorting Algorithms")
                    }
                    .navigationTitle("Home")

                }
            }
            .navigationViewStyle(StackNavigationViewStyle())

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
