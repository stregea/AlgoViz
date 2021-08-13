//
//  MazeGrid.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/13/21.
//

import SwiftUI

struct MazeGrid: View {
    @Binding var maze: Maze
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible())], spacing: 0, content: {
            ForEach((0..<maze.maze.count), id: \.self) { row in
                LazyHGrid(rows: [GridItem(.flexible())], alignment: .center, spacing: 0, content: {
                        ForEach((0..<maze.maze[row].count), id: \.self) { column in
                            MazeCell(cell: maze.maze[row][column])
                        }
                    })
            }
        })
    }
}

struct MazeGrid_Previews: PreviewProvider {
    static var previews: some View {
        
        let maze = generateMaze(rows: 20, columns: 20, sparcityOfWalls: 0.2)
        MazeGrid(maze: .constant(maze))
    }
}
