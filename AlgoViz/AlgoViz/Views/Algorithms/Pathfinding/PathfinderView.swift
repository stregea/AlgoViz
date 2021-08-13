//
//  PathfinderView.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 7/25/21.
//

import SwiftUI

struct PathfinderView: View{
    @State var maze: Maze = generateMaze(rows: 20, columns: 20, sparcityOfWalls: 0.2)
    var body: some View {
        
        ScrollView {
            MazeGrid(maze: $maze)
        }
    }
}

struct Pathfinder_Previews: PreviewProvider {
    static var previews: some View {
        PathfinderView()
    }
}
