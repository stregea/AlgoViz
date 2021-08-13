//
//  PathStep.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/13/21.
//

import Foundation

/**
     This struct will represent one step within a pathfinding algorithm.
     The implementation will contain a list of PathStep's which will allow for the UI
     to display every iteration of the selected algorithm.
 */
struct PathStep: Identifiable, CustomStringConvertible {
    /// The id (iteration #) of the current step of the algorithm.
    let id: Int
    
    /// The array that will withhold copies of a Maze with each step performed within searching a mazed.
    let mazeSteps: [Maze]
    
    /// The string representation of the current step of the maze. This returns a textual image of the current path in the maze.
    var description: String { return mazeSteps[id].maze.description }
}
